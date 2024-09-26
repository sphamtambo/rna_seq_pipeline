#!/usr/bin/env bash

# Directories
INPUT_DIR="../data"
QC_DIR="../qc"
ALIGN_DIR="../alignment"
METRICS_DIR="../metrics"
LOG_DIR="../logs"
REFERENCE_DIR="../reference"
TOOLS_DIR="../tools"
QUANT_DIR="../quantification"

# Ensure directories exist
mkdir -p $INPUT_DIR $QC_DIR $REFERENCE_DIR $ALIGN_DIR $METRICS_DIR $LOG_DIR $TOOLS_DIR

# Logging settings
LOG_LEVEL="INFO"
LOG_FILE="$LOG_DIR/pipeline_$(date +%Y%m%d_%H%M%S).log"

# Logging function
log_message() {
	local message="$1"
	echo "[$(date +'%Y-%m-%d %H:%M:%S')] [$LOG_LEVEL] $message" | tee -a $LOG_FILE
}
