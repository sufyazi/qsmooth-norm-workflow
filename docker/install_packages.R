install.packages("readr")
# install BiocManager from CRAN (if not already installed)
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
# install qsmooth package
BiocManager::install("qsmooth")