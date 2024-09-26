#!/usr/bin/env bash

# Load configurations
source ../configs/config.sh
source ../configs/paths.sh
source ../configs/sample.sh
source ../configs/reference.sh
source ../configs/download.sh

log_message() {
	echo "[$(date)] $1" >>"$LOG_DIR/download.log"
}

echo "Checking for downloaded files..."
log_message "Checking for downloaded files..."

# Check if RNA-seq file is already downloaded
if [ -f "$INPUT_DIR/$RNA_SEQ" ]; then
	log_message "RNA-seq file already downloaded: $RNA_SEQ"
else
	echo "Downloading RNA-seq file..."
	log_message "Downloading RNA-seq file: $RNA_SEQ"
	wget -O "$INPUT_DIR/$RNA_SEQ" "$RNA_SEQ_URL"
	log_message "Downloaded RNA-seq file: $RNA_SEQ"
fi

# Check if reference genome is already downloaded
if [ -f "$REFERENCE_GENOME" ]; then
	log_message "Reference genome already downloaded: $REFERENCE_GENOME"
else
	echo "Downloading reference genome..."
	log_message "Downloading reference genome: ${REFERENCE_NAME}.fa.gz"
	wget -O "$REFERENCE_GENOME.gz" "$REFERENCE_GENOME_URL"
	log_message "Downloaded reference genome: ${REFERENCE_NAME}.fa.gz"
	echo "Unzipping reference genome..."
	gunzip "$REFERENCE_GENOME.gz"
	log_message "Unzipped reference genome: ${REFERENCE_NAME}.fa"
fi

# Check if HISAT2 index is already downloaded
if [ -d "$REFERENCE_DIR/$HISAT2_INDEX" ]; then
	log_message "HISAT2 index already downloaded: $HISAT2_INDEX"
else
	echo "Downloading HISAT2 index..."
	log_message "Downloading HISAT2 index: $HISAT2_INDEX.tar.gz"
	wget -O "$REFERENCE_DIR/$HISAT2_INDEX.tar.gz" "$HISAT2_INDEX_URL"
	tar -xvzf "$REFERENCE_DIR/$HISAT2_INDEX.tar.gz" -C "$REFERENCE_DIR"
	log_message "Downloaded and extracted HISAT2 index: $HISAT2_INDEX"
fi

# Check if gene annotation file is already downloaded
if [ -f "$REFERENCE_DIR/$GENE_ANNOTATION" ]; then
	log_message "Gene annotation file already downloaded: $GENE_ANNOTATION"
else
	echo "Downloading gene annotation file..."
	log_message "Downloading gene annotation file: $GENE_ANNOTATION.gz"
	wget -O "$REFERENCE_DIR/$GENE_ANNOTATION.gz" "$GENE_ANNOTATION_URL"
	gunzip "$REFERENCE_DIR/$GENE_ANNOTATION.gz"
	log_message "Downloaded and unzipped gene annotation file: $GENE_ANNOTATION"
fi

# Check if Trimmomatic is already downloaded
if [ -f "$TRIMMOMATIC_JAR" ]; then
	log_message "Trimmomatic already downloaded: $TRIMMOMATIC_JAR"
else
	echo "Downloading Trimmomatic..."
	log_message "Downloading Trimmomatic from: $TRIMMOMATIC_URL"
	wget -O "$TOOLS_DIR/Trimmomatic.zip" "$TRIMMOMATIC_URL"
	log_message "Downloaded Trimmomatic: Trimmomatic.zip"

	echo "Extracting Trimmomatic..."
	log_message "Extracting Trimmomatic..."
	unzip "$TOOLS_DIR/Trimmomatic.zip" -d "$TOOLS_DIR"

	log_message "Trimmomatic extracted to: $TRIMMOMATIC_DIR"
	rm "$TOOLS_DIR/Trimmomatic.zip"
fi

echo "All files are downloaded and ready to use."
log_message "All files are downloaded and ready to use."
