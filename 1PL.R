## Program 1PL IRT
## sara @2023


## Library
library(ltm)
library(psych)


## Membaca data input
data_mentah <- read.table("ouirt.dat", header = FALSE) # untuk membaca masukkan data, nama dan tipe file disesuaikan dengan kebutuhan.

## Statistik deskriptif
data_deskriptif <- data.frame(describe(data_mentah)) # membuat data frame yang berisi data-data hasil pengolahan statistik deskriptif.

## Mengestimasi profil soal (tingkat kesulitan) menggunakan 1PL-IRT
profil_tes <- rasch(data_mentah)
summary(profil_tes)

par(mfrow = c(2, 2))

## Menampilkan kurva karakteristik butir (ICC)
plot(profil_tes, type = c("ICC"))

## Menampilkan kurva informasi butir (IIC)
plot(profil_tes, type = c("IIC"))

## Menampilkan kurva informasi tes
plot(profil_tes, type = c("IIC"), items = c(0))

## Mengestimasi kemampuan peserta tes (skor)
skor <- ltm::factor.scores(profil_tes) # Menampilkan skor per kelompok
skor_lengkap <- ltm::factor.scores(profil_tes, resp.patterns = data_mentah) # Menampilkan skor per individu
plot(skor)

## Uji Unidimensional
# unidimTest(profil_tes, data_mentah)
