#!/usr/bin/env bash

# Load configurations
source ../configs/config.sh
source ../configs/paths.sh
source ../configs/sample.sh
source ../configs/reference.sh
source ../configs/download.sh

log_message() {
	echo "[$(date)] $1" >>"$LOG_DIR/quantification.log"
}

echo "Running featureCounts for quantification..."
log_message "Running featureCounts for quantification on sample: $SAMPLE_NAME"

featureCounts \
	-T $THREADS \
	-s $STRANDNESS \
	-a "$GTF" \
	-o "${QUANT_DIR}/${SAMPLE_NAME}_counts.txt" "${ALIGN_DIR}/${SAMPLE_NAME}_aligned.sam"

# Check if quantification was successful
if [ $? -eq 0 ]; then
	log_message "Quantification completed successfully"
	echo "Quantification completed"
else
	log_message "Error during quantification."
	echo "Error during quantification."
	exit 1
fi
