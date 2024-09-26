#!/usr/bin/env bash

# Load configurations
source ../configs/config.sh
source ../configs/paths.sh
source ../configs/sample.sh
source ../configs/reference.sh
source ../configs/download.sh

log_message() {
	echo "[$(date)] $1" >>"$LOG_DIR/qc_trimmed_reads.log"
}

echo "Running FastQC on trimmed RNA-seq reads..."
log_message "Running FastQC on trimmed RNA-seq reads..."

# Check if FastQC analysis has already been performed on trimmed reads
if [ -f "$QC_DIR/${SAMPLE_NAME}_rna_seq_trimmed_fastqc.html" ]; then
	log_message "FastQC already performed on trimmed reads: ${SAMPLE_NAME}_rna_seq_trimmed_fastqc.html"
else
	fastqc -o $QC_DIR "$INPUT_DIR/${SAMPLE_NAME}_rna_seq_trimmed.fastq.gz"
	log_message "FastQC completed for trimmed reads: ${SAMPLE_NAME}_rna_seq_trimmed_fastqc.html"
fi
