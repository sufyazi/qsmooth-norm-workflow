## Containerizing an R Script for HPC Deployment

This repository contains the code and instructions for containerizing an R script for deployment on a High Performance Computing (HPC) cluster. The R script used in this repository contains a function that uses `qsmooth` normalization R package to be applied to a specific input file. The goal is to demonstrate how to create a Docker container for an R script and run it on an HPC cluster using Singularity.

**1.** **Create a Dockerfile**

A Dockerfile is created to build a Docker image that contains a minimal R environment and install the `qsmooth` package. The Dockerfile is as follows:

```Dockerfile
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
```

We are using the base image `oliverstatworx/base-r-tidyverse:latest` which contains a minimal R environment and the `readr` package. The `qsmooth` package is installed using the `install_packages.R` script. All of these files are located in the `docker` directory.

**2.** **Build the Docker image**
We can now build the Docker image using the following command:

```bash
docker build -t YOUR-USERNAME/qsmooth-r .
```

Make sure to run this where the Dockerfile is located. Feel free to pick an image name as you wish. The `username` part is not compulsory unless you are planning to push the image to Docker Hub.

**3.** **Run the Docker image**
After the image is built, test the image by running the following command:

```bash 
docker run --platform linux/amd64 --rm -it YOUR-USERNAME/qsmooth-r
```

You should be presented with an active R prompt with no error.

**4.** **Push the Docker image to Docker Hub**
If you want to push the image to Docker Hub, you can do so by running the following commands:

```bash
docker login -u YOUR-USERNAME
```

If you did not name the image with your username, you can tag the image with your username using the following command:

```bash
docker tag [local image name] YOUR-USERNAME/qsmooth-r
```

Otherwise, you can directly push the image to Docker Hub:

```bash
docker push YOUR-USERNAME/qsmooth-r
```

