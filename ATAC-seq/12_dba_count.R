library(DiffBind)
setwd("/scratch/csierra/CRG/ATAC_N/")
data_peaks<- dba(sampleSheet="sample_table.csv")
data_peaks <- dba.blacklist(data_peaks, blacklist=DBA_BLACKLIST_MM10, greylist=FALSE)
data_count <- dba.count(data_peaks, bUseSummarizeOverlaps = F)
saveRDS(data_count, "diffbind_data_count.rds")

