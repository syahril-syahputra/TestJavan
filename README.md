# TestJavan

Full Stack - Web Application

Stack yang di gunakan :

Front End : NUXT 3 (SSR on) with VUE 3 composition API, and UI Framework Using Vuetify 3
Back End : Using Express JS v4.18.2
Database : MySQL v8.0.31

Node Version : v16.14.2

Untuk cara menjalankan

1. Clone Git seperti biasa
2. teradapat 3 Folder
   1. client -> berisi source code untuk Front End
      masukan yarn untuk menginstall seluruh package lalu ketik yarn dev untuk menjalankan aplikasinya
      Aplikasi Beradaa di port 8080,
      buka browser lalu akses http://localhost:8080
   2. server -> berisi source code untuk back end.
      masukan yarn untuk menginstall seluruh package LALU KETIK yarn start untuk mulai menjalankan API. untuk API berada di port 3500
      coba akses http://localhost:3500
      jika ada pesan "Ini Adalah API Untuk Data Yang Akan Digunakan" maka API telah di jalankan
   3. database -> disini hanya berisi 1 file saja. untuk import ke database
      buka terminal lalu ketik mysql -uroot -p <namadatabase> < data.sql
      setelah seluruh data telah di import maka aplikasi siap di gunakan

untuk video nya bisa dilihat disini

https://drive.google.com/file/d/1GR8gdhALI5Y_mOWQyDo7GII1OCQyxClD/view

untuk Fitur

1. Menambah menghapus dan mengedit dana orang dan data asset
2. menambahkan data asset ke orang
3. menampilkan total asset setiap orang berdasarkan price
4. udah responsive namun belum sempurna
5. dork mode dan light mode untuk di front end
6. untuk Server side render udah namun belum diset untuk PWA.
7. untuk live demo belum siap karna keterbatasan waktu. namun mungkin nanti saya bisa upload ke https://heroku.com dan https://netlify.com untuk BE dan FE nya.

Terima kasih.

Syahril Syahputra

https://www.rils.dev
