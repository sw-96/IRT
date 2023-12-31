## Program 3PL IRT
## Sara @2023


## Menghitung durasi kalkulasi
mulai <- Sys.time()

## Library
library(ltm)
library(mirt)
library(psych)
library(readxl)
library(writexl)

## Membaca data input
#data_mentah <- read.table("ouirt.dat", header = FALSE) # untuk membaca masukkan data, nama dan tipe file disesuaikan dengan kebutuhan.
data_mentah <- read_excel(file.choose())
nama_peserta_tes <- subset(data_mentah, select = Student) # membuat kolom berisi nama siswa.
data_mentah <- subset(data_mentah, select = -c(Student)) #menghilangkan kolom nama peserta (Students)

## Statistik deskriptif
data_deskriptif <- data.frame(describe(data_mentah)) # membuat data frame yang berisi data-data hasil pengolahan statistik deskriptif.

## Mengestimasi profil soal (tingkat kesulitan, daya beda, tebakan semu) menggunakan 3PL-IRT
profil_tes <- tpm(data_mentah, IRT.param = TRUE)
summary(profil_tes)


par(mfrow = c(2, 2)) # layout tabel

## Menampilkan kurva karakteristik butir (ICC)
plot(profil_tes, type = c("ICC"))

## Menampilkan kurva informasi butir (IIC)
plot(profil_tes, type = c("IIC"))

## Menampilkan kurva informasi tes
plot(profil_tes, type = c("IIC"), items = c(0))

## Mengestimasi kemampuan peserta tes (skor)
skor <- ltm::factor.scores(profil_tes) # menampilkan skor per kelompok
skor_lengkap <- ltm::factor.scores(profil_tes, resp.patterns = data_mentah) # menampilkan skor per individu
plot(skor)

## Uji Unidimensional (Jika nilai p > 0.05, maka model 3PL layak untuk digunakan)
#unidimTest(profil_tes, data_mentah)

nilai_akhir <- data.frame(skor_lengkap[["score.dat"]]) # membuat data frame nilai akhir.

## Transformasi nilai peserta tes
nilai_terbesar_lama <- max(subset(nilai_akhir, select = z1)) # nilai terbesar lama
nilai_terkecil_lama <- min(subset(nilai_akhir, select = z1)) # nilai terkecil lama

nilai_terbesar_baru <- 500 # bisa diatur sesuai kebutuhan
nilai_terkecil_baru <- 100 # bisa diatur sesuai kebutuhan

Delta_Lama <- (nilai_terbesar_lama - nilai_terkecil_lama)
Delta_Baru <- (nilai_terbesar_baru - nilai_terkecil_baru)

transformasi_nilai_akhir <- transform(nilai_akhir, z1 = Delta_Baru*(z1 - nilai_terkecil_lama)/Delta_Lama + nilai_terkecil_baru)


## Menghilangkan kolom Obs, Exp, dan se.z1 dari data.frame
transformasi_nilai_akhir <- subset(transformasi_nilai_akhir, select = -c(Obs, Exp, se.z1))


## Menggabungkan kolom nama siswa dengan pola jawaban dan skor akhirnya
transformasi_nilai_akhir <- cbind(nama_peserta_tes, transformasi_nilai_akhir)


## Ekspor data.frame ke format xlsx, direktori C:... diatur sesuai perangkat yang digunakan.
write_xlsx(transformasi_nilai_akhir, "C:\\Users\\wynwi\\Desktop\\nilai_tes_3PL.xlsx")


## Menghitung durasi kalkulasi
print(Sys.time() - mulai)


