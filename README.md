# F2LIX — Flutter Movie App UI

F2LIX merupakan proyek aplikasi mobile berbasis Flutter yang dibuat untuk memenuhi tugas, dengan fokus pada implementasi layout aplikasi bertema streaming film.

Aplikasi ini menggunakan tampilan dark mode dengan beberapa komponen interaktif untuk menampilkan informasi dan rekomendasi film. Pengembangan pada tugas ini difokuskan pada desain antarmuka dan interaksi dalam satu halaman, tanpa memerlukan navigasi antarhalaman.

## Fitur dan Tampilan

**1. Home Screen**

Halaman utama menampilkan nama aplikasi F2LIX, banner film, informasi judul, rating, genre, tahun rilis, serta tombol Tonton sebagai bagian dari desain antarmuka.

**2. Carousel Slider**

Banner film pada halaman utama menggunakan package `carousel_slider`, sehingga pengguna dapat menggeser banner secara horizontal untuk melihat film lainnya.

**3. Daftar Film dan Serial**

Menampilkan beberapa kategori konten, seperti Trending, Film Terbaru, Series Terbaru, dan Anime. Setiap konten dilengkapi poster, judul, rating, serta informasi genre dan tahun rilis.

**4. Recommendation Card Swiper**

Bagian Pilihan Untukmu menggunakan package `flutter_card_swiper` untuk menampilkan rekomendasi film dalam bentuk kartu bertumpuk yang dapat digeser ke kiri atau kanan.

**5. Responsive Layout**

Tampilan aplikasi disusun agar dapat menyesuaikan ukuran layar perangkat mobile, dengan kombinasi scroll vertikal dan horizontal.

## Teknologi yang Digunakan

- Flutter
- Dart
- Material Design
- `carousel_slider`
- `flutter_card_swiper`
