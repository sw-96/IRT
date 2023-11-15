# IRT
Skrip kode untuk menghitung atau mengestimasi profil soal dan kemampuan peserta tes berdasarkan teori respon butir.

 ---

## 1. [mirt_based_IRT_program.Rmd](https://github.com/sw-96/IRT/blob/05f3a477a84f45ffcdd9ce7f95d57820b4f45c67/mirt_based_IRT_program.Rmd)
Program ini dibuat untuk menghasilkan output atau keluaran yang komprehensif, seperti profil soal dan profil peserta tes.
#### Referensi:
- https://cran.r-project.org/web/packages/mirt/mirt.pdf
- https://rpubs.com/rochaya/889512
- https://rpubs.com/Mubarak/863076
- https://philippmasur.de/2022/05/13/how-to-run-irt-analyses-in-r/

## 2. Cara Penggunaan
Pengaplikasiaan [mirt_based_IRT_program.Rmd](https://github.com/sw-96/IRT/blob/05f3a477a84f45ffcdd9ce7f95d57820b4f45c67/mirt_based_IRT_program.Rmd) dapat dilakukan dengan mengikuti langkah-langkah yang digambarkan pada [flowchart.png](https://github.com/sw-96/IRT/blob/05f3a477a84f45ffcdd9ce7f95d57820b4f45c67/flowchart.png) dan [IRT Guide.pdf](https://github.com/sw-96/IRT/blob/365a97592160088a6f8f18781ac8abe20703d54d/IRT%20Guide.pdf).

## 3. Data Jawaban Siswa
Data jawaban yang dapat digunakan dalam simulasi analisis IRT tersedia pada file [full_dummy_data.xlsx](https://github.com/sw-96/IRT/blob/05f3a477a84f45ffcdd9ce7f95d57820b4f45c67/full_dummy_data.xlsx) (500 siswa) & [small_dummy_data](https://github.com/sw-96/IRT/blob/219f09a3aa2fdd2c39643b7e7fcd7534d51486d6/small_dummy_data.xlsx) (5 siswa).

## 4. Referensi untuk Pemilahan Butir Soal
Setiap soal memiliki karakterisitik tersendiri dan bersifat khas, yang membedakannya dari soal yang lain. Karakteristik atau profil dari soal dapat diwakilkan oleh parameter-parameter yang terlibat pada penggunaan model 1PL, 2PL, dan 3PL dalam analisis IRT. 

Pemilihan soal-soal yang dapat digunakan dalam penilaian atau asesmen tertentu didasarkan pada suatu nilai ambang tertentu. Standar nilai ambang tersebut tersedia pada [acuan_nilai_parameter.png](https://github.com/sw-96/IRT/blob/05f3a477a84f45ffcdd9ce7f95d57820b4f45c67/acuan_nilai_parameter.png), yang diperoleh dari [jurnal ini](https://eduimed.usm.my/EIMJ20170903/EIMJ20170903_08.pdf).

Untuk mempermudahkan analisis, parameter tebakan semu dapat digunakan sebagai acuan utama dalam memilah soal yang akan dipakai dalam prose penilaian atau asesmen. Misalkan pada sebuah soal tersedia pilihan jawaban sebanyak $n$ buah, maka soal-soal dengan nilai parameter tebakan semu $\geq \frac{1}{n}$ sebaiknya dihindari dan dihilangkan dari database yang akan digunakan untuk analisis nilai atau skor siswa. Cara tersebut diacu dari [sumber ini](https://rpubs.com/rochaya/889512).


## 5. Simulasi menggunakan data yang ukurannya kecil
Analisis nilai dari $<10$ siswa dilakukan menggunakan data buatan [small_dummy_data](https://github.com/sw-96/IRT/blob/219f09a3aa2fdd2c39643b7e7fcd7534d51486d6/small_dummy_data.xlsx). Perlu dilakukan penyesuaian lebih lanjut pada data mentah yang dianalisis menggunakan IRT. Berdasarkan percobaan awal, didapati bahwa Soal_1, Soal_10, Soal_11, Soal_20, Soal_21, Soal_30 tidak dapat dianalisis menggunakan IRT karena respon siswa sebagai peserta tes bersifat homogen (semua 0 atau semua 1). Oleh karena itu, diterapkan baris kode di bawah:
```
data_mentah <- subset(data_mentah, select = -c(No, Nama_Siswa, Asal_Sekolah, Soal_1, Soal_10, Soal_11, Soal_20, Soal_21, Soal_30, Total_Benar, Total_Salah))
```
untuk menghilangkan Soal_1, Soal_10, Soal_11, Soal_20, Soal_21, Soal_30 dari data yang akan dianalisis menggunakan IRT.

Sekilas, hasil yang diperoleh dari analisis data yang ukurannya kecil bersesuaian dengan jumlah jawaban benar yang dijawab oleh siswa. Oleh karena itu, [mirt_based_IRT_program.Rmd](https://github.com/sw-96/IRT/blob/219f09a3aa2fdd2c39643b7e7fcd7534d51486d6/mirt_based_IRT_program.Rmd) masih layak untuk digunakan.

---

## _For Exploration: Untuk 1PL, 2PL, 3PL_
Skrip R dari 1PL, 2PL, 3PL ini terdapat pada folder [Various library](https://github.com/sw-96/IRT/tree/05f3a477a84f45ffcdd9ce7f95d57820b4f45c67/Various%20library). Skrip ini merupakan prototipe kode yang digunakan dalam penyusunan [mirt_based_IRT_program.Rmd](https://github.com/sw-96/IRT/blob/05f3a477a84f45ffcdd9ce7f95d57820b4f45c67/mirt_based_IRT_program.Rmd).

Penggunaan dari 3PL pada yang terdapat pada [Various library](https://github.com/sw-96/IRT/tree/05f3a477a84f45ffcdd9ce7f95d57820b4f45c67/Various%20library) mungkin saja menghasilkan _error_ seperti berikut:
```
Error in solve.default(object$hessian) : 
  system is computationally singular: reciprocal condition number = 1.07419e-39

Penjelasan: https://community.rstudio.com/t/error-in-solve-default-object-hessian-system-is-computationally-singular-reciprocal-condition-number-2-53258e-20/100585

Solusi: ??? Menggunakan library mirt (mirt_based_IRT_program)
```




#### Referensi
- https://quantdev.ssri.psu.edu/sites/qdev/files/IRT_tutorial_FA17_2.html#parameter-logistic-irt-model


## Penggunaan 
Untuk melihat profil tiap soal dan hasil uji unidimensional, tempatkan kursor di akhir baris kode yang diawali dengan "summary(...)" atau "unidimTest(...)", selanjutnya  pilih _run the current line_.


## Kenapa memakai Rstudio (library mirt)?
- Karena _library(ltm, irtoys)_ tidak dapat menangani data yang besar (sebagai contoh, jawaban 30 soal dari 500 orang siswa).
- Karena jMetrik tidak memberikan support atau menyediakan fitur untuk menghitung dan menampilkan nilai AIC dan BIC yang nantinya digunakan sebagai pedoman dalam pemilihan model.

## Apakah pemilihan model dan aplikasi memengaruhi informasi yang diperoleh?
Ia, namun trend dari informasi yang diperoleh hampir sama. Lebih lanjut bisa membaca referensi ini: https://assess.com/docs/Which_IRT_Software.pdf.

## Error yang mungkin terjadi

### Error 1.
```
Problem:
Error in exists(cacheKey, where = .rs.WorkingDataEnv, inherits = FALSE) : 
  invalid first argument

Solusi: Session --> restart R
```

### Error 2.
```
- Problem:
Tidak menemukan file yang akan diinput

Solusi: Session --> Set Working Directory --> To Source File Location
Pastikan skrip kode dalam satu folder dengan file yang hendak diinput.
```