#!/usr/bin/env bash

# Load configurations
source ../configs/config.sh
source ../configs/paths.sh
source ../configs/sample.sh
source ../configs/reference.sh
source ../configs/download.sh

log_message() {
	echo "[$(date)] $1" >>"$LOG_DIR/trimming.log"
}

echo "Running Trimmomatic on RNA-seq reads..."
log_message "Running Trimmomatic on RNA-seq reads..."

# Check if trimming has already been performed
if [ -f "$INPUT_DIR/$TRIMMED_RNA_SEQ" ]; then
	log_message "Trimming already performed: $TRIMMED_RNA_SEQ"
else
	# Trimmomatic
	java -jar $TRIMMOMATIC_JAR SE \
		-threads $THREADS \
		-phred33 \
		"$INPUT_DIR/$RNA_SEQ" "$INPUT_DIR/$TRIMMED_RNA_SEQ" \
		ILLUMINACLIP:$ADAPTERS_FILE:2:30:10 \
		LEADING:$LEADING_QUALITY \
		TRAILING:$TRAILING_QUALITY \
		SLIDINGWINDOW:$SLIDING_WINDOW \
		MINLEN:$MINLEN

	log_message "Trimming completed for: $TRIMMED_RNA_SEQ"
fi
