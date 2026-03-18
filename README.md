# TS SAHA omics
Code used to analyze the ATAC-seq and RNA-seq datasets generated for the manuscript "HDAC inhibitor treatment restores transcriptome, chromatin accessibility and memory deficits in a mouse model for Down syndrome"

## ATAC-seq

- ```01_cutadapt.sh```: Trim sequencing adapters.
- ```02_fastqc.sh```: Quality Control of sequencing reads.
- ```03_bowtie2.sh```: Align sequencing reads to mouse reference genome.
- ```04_gatk_markduplicates.sh```: Locate and tag duplicate reads.
- ```05_qualimap.sh```: BAM QC reports information for the evaluation of the quality of the provided alignment data.
- ```06_filter_bam.sh```: Remove multi-mapped, unmapped, mate unmapped, not primary alignment, reads failing platform, duplicate reads.
- ```07_shift_9bp_bam.sh```: Shift reads to compensates for the 9 bp staggered cuts made by the Tn5 transposase.
- ```08_coverage.sh```: Quantify coverage of the trisomic region.
- ```09_correct_trisomic_bam.sh```: Divide by 1.5 the reads mapping to the trisomic region in trisomic samples to compensate for the supernumerary chromosome.
- ```10_bam2bw.sh```: Convert BAM to bedGraph
- ```11_macs2.sh```: Peak calling.
- ```12_dba_count.R```: Counts and normalize reads.
- ```13_DiffBind.Rmd```: Differential accessibility analysis.

## RNA-seq

- ```0_STAR_index.sh```: create a reference genome for STAR alignment.
- ```1_run_STAR_alignment.sh```: Align reads to reference genome.
- ```2_run_qualimap.sh```: Quality control of sequencing reads alignment.
- ```3_run_gatk_markduplicates.sh```: Locate and tag duplicate reads.
- ```4_index_bam.sh```: Index bam file.
- ```5_run_bam2bw_scale2.sh```: Convert BAM to bedGraph.
- ```6_run_featureCounts.sh```: Count reads per gene.
- ```7_DESeq2.Rmd```: Differential expression analysis
  
The sequencing data analyzed here is deposited in the Gene Expression Omnibus repository, with the series record GSE276656.
