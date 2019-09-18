#!/bin/Rscript
required_packages <- c("tidyverse", "ggsci")
required_biopackages <- c("airway", "DESeq2", 
                          "Rsamtools", "GenomicFeatures",
                          "GenomicAlignments","BiocParallel")

tmp <- 
  lapply(required_packages, function(pkg) {
    if(!require(pkg, quietly = TRUE, 
                character.only = TRUE)) {
      print(paste0("WARNiNG! Installlig package ", 
                   pkg))
      install.packages(pkg)
    }
  })

bio_tmp <- 
  lapply(required_biopackages, function(pkg) {
    if(!require(pkg, quietly = TRUE, 
                character.only = TRUE)) {
      if (!requireNamespace("BiocManager", quietly = TRUE)) {
        print(paste0("WARNiNG! Installlig package ", 
                     pkg))
        install.packages("BiocManager")
      }
      BiocManager::install(pkg)
    }
  })
