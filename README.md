# TS SAHA omics
Code used to analyze the ATAC-seq and RNA-seq datasets generated for the manuscript "HDAC inhibitor treatment restores transcriptome, chromatin accessibility and memory deficits in a mouse model for Down syndrome"

## ATAC-seq

- ```01_cutadapt.sh```: Trim sequencing adapters.
- ```02_fastqc.sh```: Quality Control of sequencing reads.
- ```03_bowtie2.sh```: Align sequencing reads to mouse reference genome.
- ```04_gatk_markduplicates.sh```: Locate and duplicate reads.
- ```05_qualimap.sh```: BAM QC reports information for the evaluation of the quality of the provided alignment data.
- ```06_filter_bam.sh```: Remove multi-mapped, unmapped, mate unmapped, not primary alignment, reads failing platform, duplicate reads.
- ```07_shift_9bp_bam.sh```: Shift reads to compensates for the 9 bp staggered cuts made by the Tn5 transposase.
- ```08_coverage.sh```: Quantify coverage of the trisomic region.
- ```09_correct_trisomic_bam.sh```: Divide by 1.5 the reads mapping to the trisomic region in trisomic samples to compensate for the supernumerary chromosome.
- ```10_bam2bw.sh```: Convert BAM to bedGraph
- ```11_macs2.sh```: Peak calling.
- ```12_dba_count.sh```: Counts and normalize reads.
- ```13_DiffBind.Rmd```: Differential accessibility analysis.

## RNA-seq

- ```0_STAR_index.sh```: create a Seurat objects from Cell Ranger ARC outputs of different samples.
- ```1_run_STAR_alignment.sh```: merge all samples into a single Seurat object
- ```2_run_qualimap.sh```: RNA and ATAC QC filtering. Dimensionality reduction and clustering. Labelling of engram+ cells. Save RNA and ATAC objects.
- ```3_run_gatk_markduplicates.sh```: ATAC data processing, dimensionality reduction and clustering.
- ```4_index_bam.sh```: ATAC peak calling for each annotated cell type and group using MACS2
- ```5_run_bam2bw_scale2.sh```: Differential Accessibility Analysis.
- ```6_run_featureCounts.sh```: Differential Accessibility Analysis plotting and downstream analyses
- ```7_DESeq2.Rmd```: ATAC footprinting.
  
The sequencing data analyzed here is deposited in the Gene Expression Omnibus repository, with the series record GSE276656.
