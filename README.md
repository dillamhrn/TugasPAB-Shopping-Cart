# Tugas PAB – Shopping Cart Enhancement
Nama: Dilla Maharani  
Mata Kuliah: Pemrograman Aplikasi Bergerak  
Tugas: Shopping Cart Enhancement

## ‎୨ৎ Deskripsi

Project ini merupakan implementasi aplikasi **Shopping Cart (Keranjang Belanja)** berbasis mobile menggunakan framework **Flutter**, yang dikembangkan untuk memenuhi tugas mata kuliah **Pemrograman Aplikasi Bergerak (PAB)**.

Aplikasi ini merupakan pengembangan dari sistem keranjang belanja sederhana dengan penambahan fitur pengelolaan jumlah barang (quantity), penghapusan item, serta perhitungan total harga secara dinamis.

---

## ‎୨ৎ Tujuan Pengembangan

Tujuan dari pembuatan aplikasi ini adalah:

- Memahami konsep pengelolaan state dalam Flutter  
- Mengimplementasikan sistem keranjang belanja (Shopping Cart System)  
- Mengelola data produk dan jumlah pembelian  
- Menghitung total harga secara otomatis  
- Melatih kemampuan dalam pengembangan aplikasi mobile berbasis Flutter  

---

## ୨ৎ Fitur yang Diimplementasikan

1. Menambahkan produk ke dalam keranjang dari halaman daftar produk  
2. Menampilkan item keranjang beserta quantity  
3. Mengubah quantity barang (+/-)  
4. Menghapus item dari keranjang  
5. Menampilkan total harga secara otomatis dan akurat  
6. Pencarian produk berdasarkan nama  
7. Filter produk berdasarkan kategori  
8. Halaman checkout dengan ringkasan pesanan dan form data pengguna  

---

## 📷 Dokumentasi Tampilan Aplikasi

### 1️⃣ Halaman Daftar Produk (Product List)

Halaman utama menampilkan daftar produk yang tersedia.

Informasi yang ditampilkan:
- Nama produk  
- Harga produk
- Kategori produk
- Fitur pencarian produk
- Fitur filter kategori produk
- Tombol **Add to Cart**

Pengguna dapat memilih produk dan menambahkannya ke dalam keranjang belanja.

<img width="1080" height="2280" alt="image" src="https://github.com/user-attachments/assets/6180a995-c62c-4ba3-9000-edd80121a51b" />


---

### 2️⃣ Halaman Keranjang (Shopping Cart)

Halaman keranjang menampilkan produk yang telah dipilih oleh pengguna.

Informasi yang ditampilkan:
- Nama produk  
- Harga satuan  
- Quantity  
- Tombol tambah (+)  
- Tombol kurang (-)  
- Tombol hapus (Remove)  
- Total harga keseluruhan  

Pengguna dapat:
- Menambah jumlah barang menggunakan tombol (+)  
- Mengurangi jumlah barang menggunakan tombol (-)  
- Menghapus produk dari keranjang  

Setiap perubahan quantity akan secara otomatis memperbarui total harga.

<img width="1080" height="2280" alt="image" src="https://github.com/user-attachments/assets/dccadb29-7270-42e3-9218-158e03955dac" />

---

### 3️⃣ Halaman Checkout

Halaman Checkout merupakan tahap akhir dalam proses pembelian. 
Pada halaman ini pengguna dapat melihat ringkasan pesanan sebelum melakukan konfirmasi pembelian.

Bagian yang ditampilkan pada halaman ini meliputi:

#### ⤷ Order Summary
Menampilkan daftar produk yang telah dipilih, termasuk:
- Nama produk
- Jumlah pembelian (quantity)
- Harga masing-masing produk
- Total keseluruhan belanja
- Jumlah total item

#### ⤷ Form Data Pengguna
Tersedia form input untuk melengkapi data pemesan, antara lain:
- Nama
- Nomor Telepon
- Alamat

#### ⤷ Tombol Place Order
Tombol ini digunakan untuk menyelesaikan proses pemesanan. 
Setelah tombol ditekan, sistem akan memproses pesanan sesuai dengan data yang telah diinput.

<img width="1080" height="2280" alt="image" src="https://github.com/user-attachments/assets/f7c3ac5d-e59a-4551-8a7d-ca59b76792f1" />



