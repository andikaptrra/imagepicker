# Flutter Image Picker App

A simple one-page Flutter application that allows users to select an image from their device gallery with full permission handling and clean UI feedback.

## Cara Menjalankan Aplikasi

1. Pastikan Flutter sudah terinstal di perangkat Anda.
   Jalankan perintah berikut untuk memastikan:
   flutter --version

2. Clone repository ini:
   git clone https://github.com/username/flutter-image-picker-app.git

3. Masuk ke folder proyek:
   cd flutter-image-picker-app

4. Install dependency:
   flutter pub get

5. Jalankan aplikasi:
   flutter run

## Package yang Digunakan

- cupertino_icons 
- image_picker 
- permission_handler 
- app_settings
- provider
- awesome_dialog

## Alur Aplikasi

1. Pengguna menekan tombol “Pilih Foto”.
2. Aplikasi memeriksa izin akses galeri.
   - Jika izin diberikan → galeri terbuka.
   - Jika izin ditolak sementara → muncul SnackBar dengan pesan.
   - Jika izin ditolak permanen → muncul AwesomeDialog yang menawarkan untuk membuka pengaturan aplikasi.
3. Setelah gambar dipilih, tampil di layar utama.
4. Jika dibatalkan, aplikasi tetap berjalan tanpa crash.
