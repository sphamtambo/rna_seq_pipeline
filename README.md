# RNA Sequence Pipeline

This pipeline implements a comprehensive workflow for RNA sequencing (RNA-seq) data analysis. It provides a robust solution for processing raw sequencing data through various stages of quality control, alignment, and quantification, designed to ensure high-quality results for gene expression analysis.

The pipeline follows these key steps:

1. Quality Control of Raw Sequencing Data (FastQC)
2. Read Trimming (Trimmomatic)
3. Quality Control of Trimmed Reads (FastQC)
4. Mapping to Reference Genome (HISAT2)
5. Quantification (featureCounts)

This workflow is optimized for RNA-seq data analysis and incorporates best practices to maximize the accuracy and reliability of gene expression quantification.

## Prerequisites

- Bash shell
- Required bioinformatics tools:
  - FastQC
  - Trimmomatic
  - HISAT2
  - samtools
  - featureCounts

## Usage

Follow these steps to set up and run the RNA sequence pipeline:

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/rna_sequence_pipeline.git
   cd rna_sequence_pipeline
   ```

2. Set up the configuration files:

   - Navigate to the `configs` directory:
     ```bash
     cd configs
     ```
   - Edit the following configuration files according to your needs:
     - `config.sh`: Set general pipeline parameters
     - `paths.sh`: Define paths for input data, output directories, and reference files
     - `sample.sh`: Specify sample-specific details (e.g., sample name, FASTQ file names)
     - `reference.sh`: Provide information about the reference genome
     - `trim.sh`: Set parameters for read trimming
     - `download.sh`: Specify URLs or paths for downloading necessary data (if not providing your own)

3. Prepare your input data:
   You have two options for providing input data:

   a. Use your own data:

   - Place your FASTQ files in the input directory specified in `paths.sh`
   - Ensure your reference genome and other required files are in the locations specified in `reference.sh`

   b. Use downloaded data:

   - In `download.sh`, provide URLs for the input FASTQ files, reference genome, and any other required files
   - Run the download script to fetch the necessary data:
     ```bash
     bash scripts/download_data.sh
     ```

4. Run the pipeline steps:

   - Navigate to the `scripts` directory:
     ```bash
     cd ../scripts
     ```
   - Execute each script in the following order:

     a. Quality Control of Raw Reads:

     ```bash
     ./qc_raw_reads.sh
     ```

     b. Read Trimming:

     ```bash
     ./trimming.sh
     ```

     c. Quality Control of Trimmed Reads:

     ```bash
     ./qc_trimmed_reads.sh
     ```

     d. Alignment:

     ```bash
     ./alignment.sh
     ```

     e. Quantification:

     ```bash
     ./quantification.sh
     ```

   - Monitor the output of each script for progress updates and any error messages.
   - Ensure each step completes successfully before moving to the next one.

5. Retrieve results:
   - Once all steps are complete, find your results in the output directory specified in `paths.sh`
   - Key output files typically include:
     - FastQC reports for raw and trimmed reads
     - Trimmed FASTQ files
     - Aligned BAM files
     - Gene count matrices
     - Various quality control and metrics reports

## Logging

Each script logs its activities to a separate log file in the directory specified in `paths.sh`. Check these logs for detailed information about each step's execution.

## Contact

For any questions or issues, please open an issue in this repository.
