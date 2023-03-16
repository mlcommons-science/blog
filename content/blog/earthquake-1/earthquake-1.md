---
title: Improving the Earthquake Nowcasting Code
description: Improving the Earthquake Nowcasting Code
date: 2023-03-16
author: G. C. Fox
tags:
  - erathquake
  - science
---

# Improving the Earthquake Nowcasting Code

*Comments by Geoffrey Fox, 15 March 2023*

The Earthquake forecasting code has been improved following the recent
studies of

- "Does the Catalog of California Earthquakes, With Aftershocks
  Included, Contain Information About Future Large Earthquakes?"  John
  B. Rundle, Andrea Donnellan, Geoffrey Fox, Lisa Grant Ludwig, James
  Crutchfield, 10 February 2023
  [https://doi.org/10.1029/2022EA002521](https://doi.org/10.1029/2022EA002521)

- "Optimizing Earthquake Nowcasting With Machine Learning: The Role of
  Strain Hardening in the Earthquake Cycle," John B. Rundle, Joe
  Yazbeck, Andrea Donnellan, Geoffrey Fox, Lisa Grant Ludwig, Michael
  Heflin, James Crutchfield, 17 October 2022
  [https://doi.org/10.1029/2022EA002343](https://doi.org/10.1029/2022EA002343)

These two papers identify that the occurrence rate of medium earthquakes
(m `>` 3.29) represented by smoothing in a time series of their number
reveals the hidden variables controlling large earthquakes with
magnitude `>=` 6.75. In particular, the rate of these medium earthquakes
decreases before a large quake; due to aftershocks, their number peaks
after a large earthquake.

We added this observable with 9 different smoothing methods to the
existing earthquake nowcasting code with the simplest LSTM model. This
gave for the earthquake activity in the next 4 years.

- Normalized Nash-Sutcliffe Efficiency NNSE with 9 "Physics Suggested"
  Data Training 0.948 Validation 0.866

- Normalized Nash-Sutcliffe Efficiency NNSE with Original code as in
  MLCommons Training 0.928 Validation 0.796

Which is a significant improvement. We used the Morris method to find
which physics observable was most significant and ran with just this
getting slightly better.

- Normalized Nash-Sutcliffe Efficiency NNSE with Best "Physics
  Suggested" Data Training 0.956 Validation 0.866

The time-dependent four-year predictions for the last fit is

![Image1](https://github.com/mlcommons-science/mlcommons-science.github.io/raw/main/docs/img/image1.png)

While the original code gives

![Image2](https://github.com/mlcommons-science/mlcommons-science.github.io/raw/main/docs/img/image2.png)

