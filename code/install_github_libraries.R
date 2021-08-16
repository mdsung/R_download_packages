# install.packages("rJava")
# devtools::install_github("OHDSI/OhdsiRTools")
# devtools::install_github("OHDSI/SqlRender")
# devtools::install_github("OHDSI/DatabaseConnector")
# devtools::install_github("OHDSI/OhdsiSharing")
# devtools::install_github("OHDSI/FeatureExtraction")
# devtools::install_github("OHDSI/CohortMethod")
# devtools::install_github("OHDSI/EmpiricalCalibration")
# devtools::install_github("OHDSI/MethodEvaluation")
# devtools::install_github("OHDSI/Achilles@v1.6.3")

package_path <- '/libraries/src/contrib'
cran_packages <- c('devtools', 'glue', 'here', 'pkgdepends', 'magnittr')
devtools_dependencies <- c('usethis', 'callr', 'cli', 'desc', 'ellipsis', 'fs', 'httr', 'lifecycle', 'memoise', 'pkgbuild', 'pkgload', 'rcmdcheck', 'remotes', 'rlang', 'roxygen2', 'rstudioapi', 'rversions', 'sessioninfo', 'testthat', 'withr')

install_cran_packages_from_local <- function(package_name){
    package_str_pattern <- paste0(package_name , '[a-zA-Z0-9_.]+gz$')
    package_file <- list.files(package_path, pattern = package_str_pattern, ignore.case=TRUE)
    for (pkg in package_file){
        install.packages(paste0(package_path , '/', pkg))
    }
}

for (package in devtools_dependencies){
    print(package)
    install_cran_packages_from_local(package)
}

install_cran_packages_from_local(cran_packages[1])
install_cran_packages_from_local(cran_packages[2])
install_cran_packages_from_local(cran_packages[3])
install_cran_packages_from_local(cran_packages[4])

library(here)
library(magnittr)
library(pkgdepends)
library(glue)
library(purrr)

package_path <- 'libraries/src/contrib'
ohdsi_github_packages <- c("Achilles",
                           "CohortMethod",
                           "DatabaseConnector",
                           "EmpiricalCalibration",
                           "FeatureExtraction",
                           "MethodEvaluation",
                           "OhdsiRTools",
                           "OhdsiSharing",
                           "SqlRender")

install_packages <- function(package_name, library_dir){
    print(package_name)
    pdi <- new_pkg_installation_proposal(
        glue("OHDSI/{package_name}"),
        config = list(library = here('libraries'))
    )
    pdi$solve()
    pdi$download()
    pdi$install()
}

ohdsi_github_packages %>% map(~install_packages(., here('libaries')))
