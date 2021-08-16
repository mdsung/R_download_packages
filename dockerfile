FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y git \
    r-base \
    curl \
    libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/mdsung/R_download_packages && cd R_download_packages
RUN R -e "install.packages(c('renv', 'purrr', 'here', 'glue', 'pkgdepends', 'magrittr'))" 

WORKDIR /R_download_packages

CMD ["Rscript", "code/download_github_libraries_with_dependency.R"]
