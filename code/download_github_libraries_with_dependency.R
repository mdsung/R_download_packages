## github download with dependencies
library(magrittr)
library(purrr)
library(pkgdepends)
library(here)
library(glue)

## One file example
# package_name <- 'Achilles'    
# pdl <- new_pkg_download_proposal(glue("OHDSI/{package_name}"), config = list(cache_dir = target_dir))
# pdl$resolve()
# pdl$download()
# gd <- pdl$get_downloads()

## List of archilles packages
# Achilles-Node is not a package, just a R code
cran_packages <- c('glue', 'here', 'pkgdepends')
ohdsi_github_packages <- c("Achilles",
                           # "Achilles-Node",
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
    pdl <- new_pkg_download_proposal(glue("{package_name}"), config = list(cache_dir = target_dir))
    pdl$resolve()
    pdl$download()
}


download_ohdsi_dependencies <- function(package_name, target_dir){
    print(package_name)
    pdl <- new_pkg_download_proposal(glue("OHDSI/{package_name}"), config = list(cache_dir = target_dir))
    pdl$resolve()
    pdl$download()
}

## execute
# ohdsi_github_packages %>% map(github_downloader)
cran_packages %>% map(~download_dependencies(., here("libraries")))
ohdsi_github_packages %>% map(~download_ohdsi_dependencies(., here("libraries")))
