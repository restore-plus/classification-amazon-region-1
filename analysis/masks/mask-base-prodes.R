library(sits)
library(restoreutils)

#
# Config: Connection timeout
#
options(timeout = max(720, getOption("timeout")))


#
# General definitions
#
memsize    <- 140
multicores <- 44

version <- "v2"

mask_years <- c(2002, 2003)


#
# 1) Download Prodes data
#
restoreutils::prepare_prodes(
  region_id = 1,
  years     = c(2002, 2003)
)


#
# 2) Generate forest mask
#
# Note: We start generating masks in 2023, as 2024 is the most recent data, and
#       all forest there is the current forest. So, there is no requirements for
#       extra data transformations
#
purrr::map(mask_years, function(mask_year) {
  restoreutils::prodes_generate_mask(
    target_year    = mask_year,
    version        = version,
    multicores     = multicores,
    memsize        = memsize,
    nonforest_mask = TRUE
  )
})
