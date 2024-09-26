#!/usr/bin/env bash

# Reference genome details
REFERENCE_NAME="hg38"
REFERENCE_GENOME="${REFERENCE_DIR}/${REFERENCE_NAME}.fa"

HISAT2_INDEX="${REFERENCE_NAME}_index"
GTF="${REFERENCE_NAME}_gene_annotation.gtf"
