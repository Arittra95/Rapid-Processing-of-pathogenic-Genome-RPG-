#!/bin/bash
echo "Please provide your forward read name"
read Forward_Read
echo "Please provide your reverse read name"
read Reverse_Read
#Now there will be reads for Trimming
echo "Using fastp, we will trim the reads"
fastp -i $Forward_Read -I $Reverse_Read -o out.R1.fastq -O out.R2.fastq|unicycler -1 out.R1.fastq -2 out.R2.fastq -o output_dir
cd output_dir
abricate assembly.fasta>Antibiotic_Resistance_Gene_List.xlsx
echo "Congratulations! We have assembled the genome and screened the virulent and antibiotic resistant genes."
