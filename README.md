# TS SAHA omics
Code used to analyze the ATAC-seq and RNA-seq datasets generated for the manuscript "HDAC inhibitor treatment restores transcriptome, chromatin accessibility and memory deficits in a mouse model for Down syndrome"

## ATAC-seq

- ```01_cutadapt.sh```: create a Seurat objects from Cell Ranger ARC outputs of different samples.
- ```02_fastqc.sh```: merge all samples into a single Seurat object
- ```03_bowtie2.sh```: RNA and ATAC QC filtering. Dimensionality reduction and clustering. Labelling of engram+ cells. Save RNA and ATAC objects.
- ```04_gatk_markduplicates.sh```: ATAC data processing, dimensionality reduction and clustering.
- ```05_bam2bw.sh```: ATAC peak calling for each annotated cell type and group using MACS2
- ```06_qualimap.sh```: Differential Accessibility Analysis.
- ```07_filter_bam.sh```: Differential Accessibility Analysis plotting and downstream analyses
- ```08_shift_9bp_bam.sh```: ATAC footprinting.
- ```09_coverage.sh```: ATAC motif enrichment analysis and plotting.
- ```10_correct_trisomic_bam.sh```: Signac Peak linking to genes in the dataset
- ```11_bam2bw.sh```: cell types visualization and compositional analysis
- ```12_macs2.sh```: Differential expression analysis
- ```13_dba_count.sh```: Gene Set Enrichment Analysis
- ```14_DiffBind.Rmd```: Identity score comparison between groups

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
