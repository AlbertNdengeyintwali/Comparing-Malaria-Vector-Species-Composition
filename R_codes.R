library(tidyverse)
library(lme4)

file_url <- "https://www.dropbox.com/scl/fi/ijwppuf2sjrj4w01oaz36/intervention.csv?rlkey=9l92pdsypmis0d4m4kobj7sdn&dl=1"
filename <- tempfile()
download.file(url = file_url, destfile = filename)
data_raw <- read_csv(filename)
# data_raw <- read.csv("C:/.../intervention.csv")

strata <- c("TREAT_BASELINE",
            "CONTROL_BASELINE",
            "TREAT_POST",
            "CONTROL_POST")

data <- data_raw %>%
  # remove a redundant column
  select(-LONG_SPAT) %>%
  # remove a bunch of completely duplicated rows
  filter(
    !duplicated(.)
  ) %>%
  # add in record numbers for paired observations
  mutate(
    ID = row_number(),
    .after = PDF
  ) %>%
  # rename the estimates as such, so we can split on these
  rename_with(
    ~paste0(.x, "_ESTIMATE"),
    all_of(strata)
  ) %>%
  # split apart the Arm (Control or Treatment), PHASE (Baseline or
  # Post-intervention), and the Variable (Estimate or Number of samples)
  pivot_longer(
    cols = c(
      starts_with(strata[1]) |
        starts_with(strata[2]) |
        starts_with(strata[3]) |
        starts_with(strata[4])
    ),
    names_pattern = "(.*)_(.*)_(.*)",
    names_to = c("ARM", "PHASE", "VARIABLE"),
    values_to = "VALUE"
  ) %>%
  filter(
    # drop some missing values (either the estimate or number of samples)
    !is.na(VALUE),
    # drop those where the observation unit is not recorded
    !is.na(UNIT)
  ) %>%
  pivot_wider(
    names_from = "VARIABLE",
    values_from = "VALUE"
  ) %>%
  # put the data values for these in lower case, to be consistent with the others
  mutate(
    ARM = tolower(ARM),
    PHASE = tolower(PHASE),
  ) %>%
  # standardise the units into the total numbers of mosquitoes caught
  mutate(
    COUNT = case_when(
      # if it's a mean, multiply by number of samples to get the estimated count
      str_starts(UNIT, "mean") ~ round(ESTIMATE * NSAMP),
      # if it's n, n/day or count/month, it's a total count
      UNIT %in% c("n", "n/day", "count/month") ~ ESTIMATE
    ),
    .before = ESTIMATE
  ) %>%
  # for n/count data there's no NSAMP, it's just 1
  mutate(
    NSAMP = replace_na(NSAMP, 1)
  ) %>%
  # drop records with no count (means with unreported effort)
  filter(!is.na(COUNT)) %>%
  # drop the estimate column, now we have clean counts
  select(-ESTIMATE) %>%
  # combine some of the species information
  mutate(
    SPECIES = case_when(
      SPECIES == "gambiae ss (M)" ~ "gambiae",
      .default = SPECIES
    ),
    # tidy up mislabelled sampling method
    SAMPLING = case_when(
      SAMPLING == "winexit" ~ "WinExit",
      .default = SAMPLING
    )
  )

# prep data for modelling composition rates of dominant vectors before and after
# interventions
composition <- data %>%
  # flag whether a record is from samples taken after an intervention
  mutate(
    POST_INTERVENTION = ARM == "treat" & PHASE == "post"
  ) %>%
  # subset to the three (mutually-exclusive) dominant vector species, i.e. drop
  # gambiae complex, since it contains gambiae s.s. and arabiensis
  filter(
    SPECIES %in% c("funestus", "arabiensis", "gambiae")
  ) %>%
  # make these random levels factors
  mutate(
    PDF = factor(PDF),
    ID = factor(ID)
  )
  


# use a mixed-effects poisson regression model to model the catch rates, per
# sample, of different methods, whilst accounting for effort (number of samples)
# and variations in species abundance between different studies and clusters of records withing
m <- composition %>%
  lme4::glmer(COUNT ~
                -1 +
                # account for sampling effort in the numbers of each species
                # caught
                offset(log(NSAMP)) +
                # account for clusters (within studies) differing in average
                # abundance, and the two arms (nested within each cluster)
                # having slightly different abundances too
                (1|ID) + 
                # account for differences in catch sizes between sampling
                # methods
                (1|SAMPLING) +
                # account for how studies differ in the average abundance of
                # each species
                (SPECIES|PDF) +
                # model the average abundance of each species, pre-and post
                # interventions
                POST_INTERVENTION +
                SPECIES:POST_INTERVENTION,
              family = stats::poisson,
              data = .,
              control = glmerControl(optimizer = "bobyqa",
                                     optCtrl = list(maxfun = 2e5)))

 summary(m)

# compute the expected number of mosquitoes caught per sample using each method, pre-
# and post-intervention on average over all the studies and clusters
pred_data_overall <- expand_grid(
  SPECIES = unique(composition$SPECIES),
  POST_INTERVENTION = c(FALSE, TRUE),
  SAMPLING = "HRI",
  NSAMP = 1
) %>%
  mutate(
    PREDICTED_COUNT = predict(m, 
                              newdata = .,
                              re.form = ~ 0,
                              type = "response")
  ) %>%
  group_by(
    POST_INTERVENTION
  ) %>%
  mutate(
    TOTAL_COUNT =  sum(PREDICTED_COUNT),
    PREDICTED_COMPOSITON = PREDICTED_COUNT / TOTAL_COUNT,
    SPECIES = toupper(SPECIES)
  ) %>%
  ungroup() %>%
  select(
    -SAMPLING, -NSAMP, -PREDICTED_COUNT
  ) %>%
  # get composition predictions for the different PDFs, before and after
  # interventions
  pivot_wider(
    names_from = SPECIES,
    values_from = PREDICTED_COMPOSITON
  )

pred_data_overall

# make predictions for each study, pre-post intervention and compute predicted
# composition
pred_data_pdfs <- expand_grid(
    PDF = unique(composition$PDF),
    SPECIES = unique(composition$SPECIES),
    POST_INTERVENTION = c(FALSE, TRUE),
    SAMPLING = "HRI",
    NSAMP = 1
  ) %>%
  mutate(
    PREDICTED_COUNT = predict(m, 
                              newdata = .,
                              re.form = ~ (SPECIES|PDF),
                              type = "response")
  ) %>%
  group_by(
    PDF, POST_INTERVENTION
  ) %>%
  mutate(
    TOTAL_COUNT =  sum(PREDICTED_COUNT),
    PREDICTED_COMPOSITON = PREDICTED_COUNT / TOTAL_COUNT,
    SPECIES = toupper(SPECIES)
  ) %>%
  ungroup() %>%
  select(
    -SAMPLING, -NSAMP, -PREDICTED_COUNT
  ) %>%
  # get composition predictions for the different PDFs, before and after
  # interventions
  pivot_wider(
    names_from = SPECIES,
    values_from = PREDICTED_COMPOSITON
  )

print(pred_data_pdfs, n = Inf)




