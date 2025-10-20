library(sits)
library(restoreutils)

#
# Config: Connection timeout
#
# options(timeout = max(720, getOption("timeout")))

#
# General definitions
#
memsize    <- 200
multicores <- 44

#
# 1) Download Terraclass data
#
restoreutils::prepare_terraclass(
  years            = c(2004, 2008, 2010, 2012, 2014, 2018, 2020, 2022),
  region_id        = 1,
  multicores       = multicores,
  memsize          = memsize,
  fix_other_uses   = TRUE,
  fix_urban_area   = TRUE,
  fix_non_forest   = TRUE,
  fix_non_observed = TRUE
)
