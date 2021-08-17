#!/usr/bin/env Rscript

## Author: MinDong Sung.M.D
## Objective: github download with dependencies

library(pkgdepends)

# Constants
package_download_dir <- "/libraries"
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

# download dependencies from tar.gz file
download_dependencies <- function(package_name, target_dir){
    print(package_name)
    pdl <- new_pkg_download_proposal(package_name, config = list(cache_dir = target_dir))
    pdl$resolve()
    pdl$download()
    if (package_name == 'pkgdepends'){
        print(pdl$get_downloads())
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
    download_dependencies(package, package_download_dir)
}
for (package in ohdsi_github_packages){
    download_ohdsi_dependencies(package, package_download_dir)
}

