## Program 2PL IRT
## Sara @2023


## Menghitung durasi kalkulasi
mulai <- Sys.time()

## Library
library(ltm)
library(psych)
library(readxl)
library(writexl)

## Membaca data input
data_mentah <- read.table("ouirt.dat", header = FALSE) # untuk membaca masukkan data, nama dan tipe file disesuaikan dengan kebutuhan.
data_mentah <- read_excel(file.choose())
nama_peserta_tes <- subset(data_mentah, select = Student) # membuat kolom berisi nama siswa.
data_mentah <- subset(data_mentah, select = -c(Student)) #menghilangkan kolom nama peserta (Students)

## Statistik deskriptif
data_deskriptif <- data.frame(describe(data_mentah)) # membuat data frame yang berisi data-data hasil pengolahan statistik deskriptif.

## Mengestimasi profi soal (tingkat kesulitan, daya beda, tebakan semu) menggunakan 3PL-IRT
profil_tes <- tpm(data_mentah)
summary(profil_tes)