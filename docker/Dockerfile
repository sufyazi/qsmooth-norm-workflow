FROM --platform=linux/amd64 oliverstatworx/base-r-tidyverse:latest

## create directories
RUN mkdir -p data/inputs
RUN mkdir -p data/outputs
RUN mkdir -p /scripts

COPY install_packages.R /scripts

## install dependencies during the build
RUN Rscript /scripts/install_packages.R

## specify the default command to run when the container starts
CMD ["R"]