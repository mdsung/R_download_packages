FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y git \
    r-base \
    curl \
    libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/*
RUN R -e "install.packages('pkgdepends')" && mkdir R_download_packages

COPY code/download_github_libraries_with_dependency.R /R_download_packages

WORKDIR /R_download_packages

CMD ["Rscript", "download_github_libraries_with_dependency.R"]
