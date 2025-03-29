# Comparing malaria vector species composition trends in sites implementing Indoor Residual Spraying (IRS) and Long-Lasting Insecticidal Nets (LLINs) as core vector control interventions

## Introduction

Malaria remains one of the most significant global public health problems, particularly in Sub-
Saharan Africa (Oladipo, 2022). It is caused by Plasmodium parasites and transmitted to people
through the bites of infected female Anopheles mosquitoes. This illness leads to high mortality
rates and a substantial burden of disease (Aju-Ameh, 2020). Despite extensive control efforts,
malaria continues to affect millions of people, causing significant morbidity and mortality, espe-
cially among children under five and pregnant women. The World Health Organization (WHO)
estimates that in 2021, there were over 249 million cases of malaria and around 608,000 deaths
globally (WHO, 2022), with Sub-Saharan Africa bearing the brunt of this burden (WHO, 2021).

### Successes of Malaria Control

Global efforts to control malaria have led to substantial reductions in both disease prevalence and
incidence. These successes are largely attributed to the widespread implementation of vector con-
trol interventions, particularly Indoor Residual Spraying (IRS) and Long-Lasting Insecticidal Nets
(LLINs), which have been cornerstones in reducing transmission rates (World Health Organiza-
tion, 2020). IRS works by applying insecticides to the interior walls of homes, killing mosquitoes
when they rest after feeding, while LLINs provide a physical barrier and chemical protection during
sleep, the peak biting time for Anopheles mosquitoes (Pluess et al., 2010; Bayoh, 2014).

Over the past two decades, these interventions have been credited with preventing millions of
malaria cases and saving countless lives, especially in sub-Saharan Africa. According to the
World Health Organization (WHO), more than 1.5 billion insecticide-treated nets were distributed
globally between 2000 and 2020, contributing to a 60% reduction in malaria mortality rates
(WHO, 2021). IRS, when used in targeted areas with high transmission rates, has been shown
to further reduce the vector population and suppress malaria transmission (Kleinschmidt, 2015).

However, maintaining and building on these achievements requires addressing emerging chal-
lenges. The most pressing issue is the development of insecticide resistance among mosquito
populations. Studies have shown that mosquitoes are evolving resistance to the pyrethroids com-
monly used in LLINs and IRS, which threatens to undermine the effectiveness of these tools
(Ranson et al., 2011; Hemingway et al., 2016). Additionally, changes in mosquito behavior, such
as increased outdoor feeding and resting, are reducing the impact of indoor-focused interventions
(Gatton et al., 2013).

### Vector Control Interventions and Challenges

Controlling malaria transmission through vector control is a key strategy for reducing the burden
of the disease. Two primary interventions are Indoor Residual Spraying (IRS) and Long-Lasting
Insecticidal Nets (LLINs), both of which target mosquito populations, the primary vectors of
malaria transmission (Gatton, 2013). While these measures have proven effective in many settings,
their success is highly dependent on local environmental conditions, proper implementation, and
community compliance.

- **ndoor Residual Spraying (IRS)** involves the application of insecticides to the interior walls of homes. It works by killing mosquitoes that rest on treated surfaces after feeding. IRS is highly effective in reducing mosquito populations
within targeted areas, especially when high coverage is maintained (Pryce et al., 2022).
- **Long-Lasting Insecticidal Nets (LLINs)** are bed nets treated with insecticide, designed to
protect individuals while they sleep, when mosquitoes are most active. LLINs provide both a
physical barrier and a chemical deterrent, reducing the number of mosquito bites and, therefore,
the transmission of malaria (Ng’ang’a et al., 2021).

## Motivation

The urgency to fix the shortcomings of the existing strategies for the controlling of malaria caused
by the new types of vector populations is the one that directed our research. We propose to find
the factors that determine the success or the failure of these interventions by the analysis of
the effects of IRS and LLINs on the species composition of malaria vectors. The knowledge
that will be gained from this research will be used in the development of the most efficient and
adaptable control methods that address the particular ecological and evolutionary constraints that
mosquitoes in various geographic regions experience. The sustainability of the control methods
should be secured as, on one side, they involve substantial investment and, on the other, the
disease is of high prevalence. The study aims to make available the plan of actions or provide
the best predictions of the outcomes of IRS and LLINs usage for malarial vector control.

## Project Objectives
The primary objective of this study is to investigate the patterns of malaria vector species compo-
sition in response to Indoor Residual Spraying (IRS) and Long-Lasting Insecticidal Nets (LLINs).
Specifically, the study aims to:

- **Understand Patterns in Vector Composition Before and After Interventions**.
To determine the patterns in vector species composition before and after the implementation
of IRS and LLIN interventions. Collate existing data on vector populations and interventions
from various sources. Perform exploratory data analysis (EDA) to compute summary statistics
and understand the relative proportions of the three major malaria vector species (Anopheles
gambiae, An. funestus, and An. arabiensis).

- **Develop a Statistical Model to Capture Changes in Species Composition**. To build
a model capable of capturing changes in the species composition of malaria vectors Based on the
intervention.

## Problem statement
Malaria is still a serious public health issue, even with the extensive use of Long-Lasting In-
secticidal Nets (LLINs) and Indoor Residual Spraying (IRS). These measures, which have been
widely adopted, are essential parts of malaria control programs around the world. Comprehending
and tackling this obstacle is essential to the sustained triumph of malaria prevention initiatives
(Ingabire, 2015).

The fact that mosquito vector populations are dynamic presents one of the biggest obstacles
to the control of malaria. Over time, a variety of reasons, including behavioral adaptations to
control measures, environmental changes, or the emergence of insecticide resistance, can cause
changes in the species makeup of mosquito populations. While environmental changes might
affect mosquito breeding sites and habitats, behavioral adjustments might involve shifting feeding
schedules or places to avoid coming into contact with pesticides. The effectiveness of IRS and
LLINs is seriously threatened by pesticide resistance, a phenomenon in which mosquitoes acquire
the capacity to survive exposure to insecticides (Ingabire, 2015).

This study aims to investigate the dynamics of vector species composition, focusing specifically
on the impact of IRS and LLINs. By examining how these interventions influence mosquito
populations, we can identify potential gaps in current control strategies. By understanding these
dynamics, we can recommend alternative or supplementary approaches to enhance malaria control
efforts, ensuring they remain effective in the face of evolving vector populations.

## Methodology

This chapter outlines the research design, methods, and analytical techniques employed to in-
vestigate the impact of Indoor Residual Spraying (IRS) and long-lasting insecticide-treated nets
(LLINs) on the dynamics of malaria vector species composition. The research methodology is
structured into several key components, beginning with a detailed examination of the study area,
which includes the selection criteria for specific sites based on ecological diversity and historical
data availability. Following this, the data collection section describes the sources of data, which
include Intervention Information and Vector Sampling Data. These data encompass IRS and
LLINs deployment records, entomological surveys, and environmental data pertinent to vector
distribution.The data analysis section elaborates on the statistical and computational methods
used to process and interpret the data, including the use of Poisson Generalised Linear Model
(GLM). The model development section details the construction and calibration of species dis-
tribution models, while the validation and interpretation section focuses on the methods used
to assess the accuracy and reliability of the models and interpret the results in the context of
vector control effectiveness. This comprehensive approach aims to provide a robust analysis of
the impact of IRS and LLINs on malaria vector species from other countries to inform decisions in
Rwanda, thereby informing future strategies for malaria control and contributing to the broader
goals of reducing malaria incidence and improving public health outcomes.

### Data collection

The data collection phase of this study involve compiling existing intervention information and
vector sampling data that are readily available. This includes gathering details on the types
and specifics of control measures already implemented, as well as accessing records related to
mosquito populations and their behaviors
These are columns in the dataset collated and published by (Massey, 2016)

### Data Processing

Data processing is a critical step in ensuring that the dataset is of high quality, clean, and ready for
analysis. This section outlines the key processes undertaken to clean and transform the dataset.

- **Cleaning.** The first step in data processing was cleaning the raw dataset. This involved
  several sub-tasks:
   - **Consistency in Data Formats:** The consistency of the variables’ recording was checked in
     the dataset. To avoid problems during analysis, for example, discrepancies in the recording
     of species names (e.g., different formats of gambiae ss) were standardized. To guarantee
     consistency across variables, inconsistent case usage (such as mixed lowercase and upper-
      case entries) was also fixed.
- **ransformation.** After cleaning, several transformations were applied to the dataset to
make it more suitable for analysis:
   - **Variable Standardization:** he dataset included a variety of variables that were recorded
in various units and formats. Measurements like mosquito numbers, for example, were
occasionally reported as means, totals per day, or totals per month. All estimations were
transformed into total counts as needed in order to standardize these units. In order to
determine the overall number of mosquitoes when the data was displayed as an average,
the number of samples had to be determined.
  - **Feature Creation:** New features were derived from existing ones to facilitate better anal-
ysis. For example, a flag was created to identify whether the data was collected after the
intervention was applied. This POST INTERVENTION flag helped in distinguishing baseline
data from post-intervention data, making it easier to analyze the impact of interventions.

## Statistical Modeling

### Generalized Linear Models (GLMs)

The core of this study is the development and implementation of a Poisson Generalized Linear
Model (GLM). This section outlines the theoretical foundation and practical implementation of
the model.

- **Generalized Linear Models (GLMs)**. Generalized Linear Models (GLMs) were intro-
duced by (Nelder and Wedderburn, 1972) as a framework that extends traditional linear regres-
sion to accommodate response variables that follow different distributions, including the Poisson
distribution for count data. The motivation behind GLMs was to allow for more flexible modeling
of various types of data while maintaining a unified approach to statistical modeling (McCullagh,
1999).
  
   A key advantage of GLMs is their ability to model the relationship between dependent and
independent variables through a linear predictor while allowing for the response variable to follow
a distribution other than normal. This flexibility is particularly important for count data, which
often exhibit properties such as overdispersion, making the Poisson distribution an appropriate
choice (Radam and Hameed, 2023).
The general structure of a GLM can be expressed as:

$$
g \left( E(Y) \right) = \alpha + \beta_1 x_1 + \beta_2 x_2 + \cdots + \beta_p x_p
$$

   where $Y$ is the dependent variable (i.e., the count we are trying to predict), $E(Y)$ denotes the expected value, $g(Y)$ is the link function that relates the expected value to the linear predictor, and $x_1, \ldots, x_p$ are the independent variables.

   For a Poisson GLM, the link function typically used is the logarithm, which models the log of the expected count as a linear combination of the predictors:
   
$$
\log(E(Y)) = \alpha + \beta_1 x_1 + \beta_2 x_2 + \cdots + \beta_p x_p
$$

   This formulation allows the expected counts to be expressed in terms of the independent variables, thereby providing a direct interpretation of the effects of predictors on the response variable. The coefficients $\beta_1, \ldots, \beta_p$ indicate the change in the log count of the response variable for a one-unit change in the corresponding predictor (Hilbe, 2009).

- **Model Components.**
  

$$
\begin{align*}
\log(COUNT_{ij}) &= \text{offset}(\log(NSAMP_{ij})) + u_{ID_i} + v_{SAMPLING_j} + w_{PDF_k}^{(SPECIES)} +\\
&\beta_1 \cdot POST\_INTERVENTION_{ij} + \beta_2 \cdot (SPECIES_{ij} \cdot POST\_INTERVENTION_{ij})  
\end{align*}
$$


Where:

 - $\log(\text{COUNT}_{ij})$ is the log of the expected mosquito count for study $i$ and sampling method $j$.
 - $\text{offset}( \log(\text{NSAMP}_{ij}))$ is the offset term that adjusts for the number of samples NSAMP in study $i$ 
  and method $j$.
 - $u_{ID_i}$ is the random intercept for the clusters to account for differences in average abundance across clusters.
 - $v_{SAMPLING_j}$ is the random intercept for the different sampling methods, accounting for differences in catch rates 
     due to the methods used.
 - $w_{PDF_k}^{(SPECIES)}$ is the random slope for species within each study, allowing the effect of species to vary 
    across studies $k$.
 - $\beta_1 \cdot \text{POST\_INTERVENTION}_{ij}$ is the fixed effect for the post-intervention period, modeling the 
     average effect of the intervention on mosquito catch rates.
 - $\beta_2 \cdot (SPECIES_{ij} \cdot POST\_INTERVENTION_{ij})$ is the interaction term between species 
     and the post-intervention period, capturing how the intervention affects different species differently.

