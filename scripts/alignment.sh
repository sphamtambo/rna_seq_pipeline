#!/usr/bin/env bash

# Load configurations
source ../configs/config.sh
source ../configs/paths.sh
source ../configs/sample.sh
source ../configs/reference.sh
source ../configs/download.sh

log_message() {
	echo "[$(date)] $1" >>"$LOG_DIR/.alignment.log"
}

# Check if trimmed data exists and choose the correct input
if [ -f "$TRIMMED_RNA_SEQ" ]; then
	log_message "Using trimmed reads for alignment: $TRIMMED_RNA_SEQ"
	INPUT_SEQ="$TRIMMED_RNA_SEQ"
else
	log_message "Using raw reads for alignment: $RAW_RNA_SEQ"
	INPUT_SEQ="$RAW_RNA_SEQ"
fi

echo "Running HISAT2 alignment for sample: $SAMPLE_NAME"
log_message "Running HISAT2 alignment for sample: $SAMPLE_NAME"

hisat2 -q --rna-strandness R -x "$HISAT2_INDEX" \
	-U "$INPUT_SEQ" | samtools sort -o "${ALIGN_DIR}/${SAMPLE_NAME}_aligned.sam"

if [ $? -eq 0 ]; then
	log_message "HISAT2 alignment completed successfully"
	echo "HISAT2 alignment completed"
else
	log_message "Error during HISAT2 alignment."
	echo "Error during HISAT2 alignment."
	exit 1
fi
