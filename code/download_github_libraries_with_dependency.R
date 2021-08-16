#!/usr/bin/env Rscript

## Author: MinDong Sung.M.D
## Objective: github download with dependencies

library(pkgdepends)
library(here)

## One file example
# package_name <- 'Achilles'    
# pdl <- new_pkg_download_proposal(glue("OHDSI/{package_name}"), config = list(cache_dir = target_dir))
# pdl$resolve()
# pdl$download()
# gd <- pdl$get_downloads()

## List of archilles packages
# Achilles-Node is not a package, just a R code
cran_packages <- c('devtools', 
                    'glue', 
                    'here', 
                    'pkgdepends', 
                    'devtools', 
                    'tidyverse')
ohdsi_github_packages <- c("Achilles",
                           "CohortMethod",
                           "DatabaseConnector",
                           "EmpiricalCalibration",
                           "FeatureExtraction",
                           "MethodEvaluation",
                           "OhdsiRTools",
                           "OhdsiSharing",
                           "SqlRender")
## Functionalize
# github_downloader <- function(package_name){
#     utils::download.file(glue("https://api.github.com/repos/OHDSI/{package_name}/tarball"), 
#                          destfile = here(glue("libraries/{package_name}.tar.gz")))
# }

## download dependencies from tar.gz file
download_dependencies <- function(package_name, target_dir){
    print(package_name)
    pdl <- new_pkg_download_proposal(package_name, config = list(cache_dir = target_dir))
    pdl$resolve()
    pdl$download()
    if (package_name == 'pkgdepends'){
        write.csv(pdl$get_downloads(), 'pkgdepends_dependencies.csv')
    }
}

download_ohdsi_dependencies <- function(package_name, target_dir){
    print(package_name)
    pdl <- new_pkg_download_proposal(paste0("OHDSI","/", package_name), config = list(cache_dir = target_dir))
    pdl$resolve()
    pdl$download()
}

## execute
for (package in cran_packages){
    download_dependencies(package, here("libraries"))
}
for (package in ohdsi_github_packages){
    download_ohdsi_dependencies(package, here("libraries"))
}

