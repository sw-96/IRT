## Program 3PL IRT (mirt)
## Sara @2023

## Menghitung durasi kalkulasi
mulai <- Sys.time()


## Library
library(mirt)
library(psych)
library(readxl)
library(writexl)

## Membaca data input
data_mentah <- read_excel(file.choose())
nama_peserta_tes <- subset(data_mentah, select = Student)
data_mentah <- subset(data_mentah, select = -c(Student))


## Statistik deskriptif
data_deskriptif <- data.frame(describe(data_mentah))


## Mengestimasi profil soal(tingkat kesulitan, daya beda, tebakan semu) menggunakan 3PL-IRT
profil_tes <- mirt(data_mentah, 1, itemtype = '3PL')
coef(profil_tes, simplify = TRUE)

plot(profil_tes, type = 'trace')

## Menghitung durasi kalkulasi
print(Sys.time() - mulai)