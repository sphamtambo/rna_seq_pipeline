#!/usr/bin/env bash

# Load configurations
source ../configs/config.sh
source ../configs/paths.sh
source ../configs/sample.sh
source ../configs/reference.sh
source ../configs/download.sh

# Logging function
log_message() {
	echo "[$(date)] $1" >>"$LOG_DIR/qc_raw_reads.log"
}

echo "Running FastQC on raw RNA-seq reads..."
log_message "Running FastQC on raw RNA-seq reads..."

# Check if FastQC analysis has already been performed
if [ -f "$QC_DIR/${SAMPLE_NAME}_rna_seq_fastqc.html" ]; then
	log_message "FastQC already performed on raw reads: ${SAMPLE_NAME}_rna_seq_fastqc.html"
else
	# Run FastQC
	fastqc -o $QC_DIR "$INPUT_DIR/$RNA_SEQ"
	log_message "FastQC completed for raw reads: ${SAMPLE_NAME}_rna_seq_fastqc.html"
fi
