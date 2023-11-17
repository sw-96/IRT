#DATA PREPARATION
#Library List
library(openxlsx)
library(readxl)
library(data.table)
library(writexl)
library(rio)

#DIREKTORI
#Tes Potensi Skolastik (Disesuaikan dengan kebutuhan)
dir_tps <- "/Users/windusara/Downloads/tryout_edisi_1/TPS"

#Tes Literasi (Disesuaikan dengan kebutuhan)
dir_tl <- "/Users/windusara/Downloads/tryout_edisi_1/TL"


#Program Untuk Menggabungkan Data Peserta
#1. Menggabungkan Data Tes Potensi Skolastik
setwd(dir_tps)
files <- list.files(pattern = "xlsx")
files

data <- setNames(lapply(files, read.xlsx), files)
write.xlsx(data, file = "merge.xlsx")

path <- paste(dir_tps, "merge.xlsx", sep = "/")
data <- import_list(path, rbind = TRUE)

write.xlsx(data, file = "All_TPS.xlsx")


#2. Menggabungkan Data Tes Literasi
setwd(dir_tl)
files <- list.files(pattern = "xlsx")
files

data <- setNames(lapply(files, read.xlsx), files)
write.xlsx(data, file = "merge.xlsx")

path <- paste(dir_tl, "merge.xlsx", sep = "/")
data <- import_list(path, rbind = TRUE)

write.xlsx(data, file = "All_TL.xlsx")


#Program Untuk Split Hasil Try Out menjadi 7 subtes

#Membaca File Excel
df <- read_excel(paste(dir_tps, "All_TPS.xlsx", sep = "/"))

#Mengurutkan Data Berdasarkan Nama
df <- data.frame(df)
colnames(df)[1] <- "Nama"
df <- df[order(df$Nama),] # nolint: commas_linter.

#Menambahkan ID baris
row_id <- seq(1, nrow(df))
df <- cbind(row_id, df)


#Data Frame Identitas Peserta
data_peserta <- subset(df, select = c(1:3))
colnames(data_peserta) <- c("No", "Nama_Siswa", "Asal_Sekolah")

#1. PU
#Data Frame PU
data_pu <- subset(df, select = c(4:33))
colnames(data_pu) <- c("pu_1", "pu_2", "pu_3", "pu_4", "pu_5", "pu_6", "pu_7", "pu_8", "pu_9", "pu_10", "pu_11", "pu_12", "pu_13", "pu_14", "pu_15", "pu_16", "pu_17", "pu_18", "pu_19", "pu_20", "pu_21", "pu_22", "pu_23", "pu_24", "pu_25", "pu_26", "pu_27", "pu_28", "pu_29", "pu_30") # nolint: line_length_linter.

#Data Frame Identitas Peserta & PU
data_pu <- cbind(data_peserta, data_pu)

#Ekspor Data Frame Identitas Peserta & PU ke format xlsx
write_xlsx(data_pu, paste(dir_tps, "data_pu.xlsx", sep = "/"))


#2. PPU
#Data Frame PPU
data_ppu <- subset(df, select = c(34:53))
colnames(data_ppu) <- c("ppu_1", "ppu_2", "ppu_3", "ppu_4", "ppu_5", "ppu_6", "ppu_7", "ppu_8", "ppu_9", "ppu_10", "ppu_11", "ppu_12", "ppu_13", "ppu_14", "ppu_15", "ppu_16", "ppu_17", "ppu_18", "ppu_19", "ppu_20") # nolint


#Data Frame Identitas Peserta & PPU
data_ppu <- cbind(data_peserta, data_ppu)

#Ekspor Data Frame Identitas Peserta & PPU ke format xlsx
write_xlsx(data_ppu, paste(dir_tps, "data_ppu.xlsx", sep = "/"))


#3. PBM
#Data Frame PBM
data_pbm <- subset(df, select = c(54:73))
colnames(data_pbm) <- c("pbm_1", "pbm_2", "pbm_3", "pbm_4", "pbm_5", "pbm_6", "pbm_7", "pbm_8", "pbm_9", "pbm_10", "pbm_11", "pbm_12", "pbm_13", "pbm_14", "pbm_15", "pbm_16", "pbm_17", "pbm_18", "pbm_19", "pbm_20") # nolint: line_length_linter.

#Data Frame Identitas Peserta & PBM
data_pbm <- cbind(data_peserta, data_pbm)

#Ekspor Data Frame Identitas Peserta & PBM ke format xlsx
write_xlsx(data_pbm, paste(dir_tps, "data_pbm.xlsx", sep = "/"))


#4. PK
#Data Frame PK
data_pk <- subset(df, select = c(74:88))
colnames(data_pk) <- c("pk_1", "pk_2", "pk_3", "pk_4", "pk_5", "pk_6", "pk_7", "pk_8", "pk_9", "pk_10", "pk_11", "pk_12", "pk_13", "pk_14", "pk_15") # nolint: line_length_linter.

#Data Frame Identitas Peserta & PK
data_pk <- cbind(data_peserta, data_pk)

#Ekspor Data Frame Identitas Peserta & PK ke format xlsx
write_xlsx(data_pk, paste(dir_tps, "data_pk.xlsx", sep = "/"))

#Membaca File Excel
df <- read_excel(paste(dir_tl, "All_TL.xlsx", sep = "/"))

#Mengurutkan Data Berdasarkan Nama
df <- data.frame(df)
colnames(df)[1] <- "Nama"
df <- df[order(df$Nama),] # nolint: commas_linter.

#Menambahkan ID baris
row_id <- seq(1, nrow(df))
df <- cbind(row_id, df)

#Data Frame Identitas Peserta
data_peserta <- subset(df, select = c(1:3))
colnames(data_peserta) <- c("No", "Nama_Siswa", "Asal_Sekolah")


#1. BI
#Data Frame BI
data_bi <- subset(df, select = c(4:33))
colnames(data_bi) <- c("bi_1", "bi_2", "bi_3", "bi_4", "bi_5", "bi_6", "bi_7", "bi_8", "bi_9", "bi_10", "bi_11", "bi_12", "bi_13", "bi_14", "bi_15", "bi_16", "bi_17", "bi_18", "bi_19", "bi_20", "bi_21", "bi_22", "bi_23", "bi_24", "bi_25", "bi_26", "bi_27", "bi_28", "bi_29", "bi_30") # nolint: line_length_linter.

#Data Frame Identitas Peserta & BI
data_bi <- cbind(data_peserta, data_bi)

#Ekspor Data Frame Identitas Peserta & BI ke format xlsx
write_xlsx(data_bi, paste(dir_tl, "data_bi.xlsx", sep = "/"))

#2. EN
#Data Frame EN
data_en <- subset(df, select = c(34:53))
colnames(data_en) <- c("en_1", "en_2", "en_3", "en_4", "en_5", "en_6", "en_7", "en_8", "en_9", "en_10", "en_11", "en_12", "en_13", "en_14", "en_15", "en_16", "en_17", "en_18", "en_19", "en_20") # nolint: line_length_linter.

#Data Frame Identitas Peserta & EN
data_en <- cbind(data_peserta, data_en)

#Ekspor Data Frame Identitas Peserta & EN ke format xlsx
write_xlsx(data_en, paste(dir_tl, "data_en.xlsx", sep = "/"))

#3. PM
#Data Frame PM
data_pm <- subset(df, select = c(54:73))
colnames(data_pm) <- c("pm_1", "pm_2", "pm_3", "pm_4", "pm_5", "pm_6", "pm_7", "pm_8", "pm_9", "pm_10", "pm_11", "pm_12", "pm_13", "pm_14", "pm_15", "pm_16", "pm_17", "pm_18", "pm_19", "pm_20") # nolint: line_length_linter.

##Data Frame Identitas Peserta & PM
data_pm <- cbind(data_peserta, data_pm)
#
#Ekspor Data Frame Identitas Peserta & PM ke format xlsx
write_xlsx(data_pm, paste(dir_tl, "data_pm.xlsx", sep = "/"))
