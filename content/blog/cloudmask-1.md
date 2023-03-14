---
title: Cloudmask Improvements for Parallel Executions
description: Improvements towards parallel cloudmask.
date: 2023-03-13
author: Gregor von Laszewski <laszewski@gmail.com>
tags:
  - cloudmask
  - science
---

The original cloudmask code contains a feature to save the training
model into a file that is later used for inference. However, at the
current time, the configuration file and the associated code save this
configuration file in a single location. If run in parallel the model
would be overwritten among parallel runs. To allow parallel execution
of cloudmask a mechanism to run the code on a permutation of different
parameters is used. For this we can reuse `cloudmesh-sbatch` which
allows the creation of a number of subdirectories that contain a
modified `config.yaml` file, as well as a custom-created batch
script. We also have modified the original python code to take into
consideration the new parameters in the YAML file.  This framework can
be adapted to various applications and HPC computers on which we
execute cloudmask.


For more information, please contact Gregor von Laszewski
<laszewski@gmail.com>

Code for cloudmesh-sbatch is available on
[GitHub and PyPi](https://pypi.org/project/cloudmesh-sbatch/).

