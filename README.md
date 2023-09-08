# IRT
 Skrip kode untuk menghitung atau mengestimasi profil soal dan kemampuan peserta tes berdasarkan teori respon butir

# Untuk mirt_based_IRT_program
Program ini dibuat untuk menghasilkan output atau keluaran yang komprehensif, seperti profil soal dan profil peserta tes
## Referensi:
- https://cran.r-project.org/web/packages/mirt/mirt.pdf
- https://rpubs.com/rochaya/889512
- https://rpubs.com/Mubarak/863076
- https://philippmasur.de/2022/05/13/how-to-run-irt-analyses-in-r/


# Untuk 1PL, 2PL, 3PL
## Referensi
- https://quantdev.ssri.psu.edu/sites/qdev/files/IRT_tutorial_FA17_2.html#parameter-logistic-irt-model


## Penggunaan 
Untuk melihat profil tiap soal dan hasil uji unidimensional, tempatkan kursor di akhir baris kode yang diawali dengan "summmary(...)" atau "unidimTest(...)", selanjutnya  pilih run the current line


## Error yang sering terjadi
Problem:
Error in exists(cacheKey, where = .rs.WorkingDataEnv, inherits = FALSE) : 
  invalid first argument

Solusi: Session --> restart R


Problem:
Tidak menemukan file yang akan diinput

Solusi: Session --> Set Working Directory --> To Source File Location
Pastikan skrip kode dalam satu folder dengan file yang hendak diinput.


Problem:
Error in solve.default(object$hessian) : 
  system is computationally singular: reciprocal condition number = 1.07419e-39

Penjelasan: https://community.rstudio.com/t/error-in-solve-default-object-hessian-system-is-computationally-singular-reciprocal-condition-number-2-53258e-20/100585

Solusi: ??? Menggunakan library mirt (mirt_based_IRT_program)

# Kenapa memakai Rstudio (library mirt)?
- Karena library(ltm, irtoys) tidak dapat menangani data yang besar (sebagai contoh, jawaban 30 soal dari 500 orang siswa)
- Karena jMetrik tidak memberikan support atau menyediakan fitur untuk menghitung dan menampilkan nilai AIC dan BIC yang nantinya digunakan sebagai pedoman dalam pemilihan model.




