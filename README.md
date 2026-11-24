# Inventaris dan Penjualan (web app)

Aplikasi statis (HTML) + Supabase (login & database) + GitHub Pages (hosting).

## 1. Siapkan Supabase
1. Buat project baru di https://supabase.com.
2. **SQL Editor** > New query > tempel isi `supabase/schema.sql` > Run.
3. **Authentication > Users > Add user**: isi email + kata sandi, centang *Auto confirm user*.
4. **Authentication > Sign In / Providers**: matikan *Allow new users to sign up* supaya hanya akun yang kamu buat yang bisa masuk.
5. **Project Settings > API**: salin *Project URL* dan *anon / publishable key*, tempel ke `config.js`.
   Jangan pernah memakai *service_role key*.

## 2. Push ke GitHub
```bash
git init
git add .
git commit -m "Inventaris dan Penjualan"
git branch -M main
git remote add origin https://github.com/USERNAME/NAMA-REPO.git
git push -u origin main
```
(Atau lewat web GitHub: Add file > Upload files.)

## 3. Aktifkan hosting
Repo > **Settings > Pages** > Source: *Deploy from a branch* > Branch `main` / folder `/ (root)` > Save.
Alamat: `https://USERNAME.github.io/NAMA-REPO/`
Lalu di Supabase **Authentication > URL Configuration**, isi *Site URL* dengan alamat itu.
(Alternatif: Vercel atau Netlify, cukup impor repo; tanpa build command.)

## 4. Pindahkan data lama
Di aplikasi lama: Pengaturan > **Ekspor cadangan (JSON)**.
Di aplikasi baru (setelah login): Pengaturan > **Impor cadangan (JSON)**.

## Catatan
- Seluruh data disimpan sebagai satu baris JSON per akun (`app_state`). Cocok untuk satu toko.
- Dipakai di banyak perangkat sekaligus: perubahan terakhir yang menang. Data dimuat ulang saat tab dibuka kembali.
- Perubahan disimpan otomatis ±1 detik setelah diedit; status ada di Pengaturan > Akun dan Sinkronisasi.
- Proyek Supabase gratis bisa dijeda jika tidak dipakai lama. Ekspor cadangan secara berkala.
