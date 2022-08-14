# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Admin account

Admin.create!(email: "admin@gmail.com", password: "password", password_confirmation: "password")

# User accounts

user1 = User.create!(email: "andi@gmail.com", password: "password", password_confirmation: "password")
user1.create_profile(name: "Andi", birthplace: "Batam", birthdate: DateTime.new(2000,1,1), gender: "Laki-laki", address: "Batam", phone_number: "081234567890", major: "Teknik Komputer dan Jaringan", graduation_year: "2018")
user1.statuses.create(category: "Kuliah", name: "Universitas Internasional Batam", position: "Mahasiswa", address: "Batam", start_date: DateTime.new(2018,1,1), end_date: DateTime.new(2022,1,1), comment: "Sedang berkuliah di prodi Teknologi Informasi")
user1.statuses.create(category: "Bekerja", name: "PT Maju", position: "IT Staff", address: "Batam", start_date: DateTime.new(2018,1,1), comment: "Masih bekerja sampai sekarang")

user2 = User.create!(email: "budi@gmail.com", password: "password", password_confirmation: "password")
user2.create_profile(name: "Budi", birthplace: "Batam", birthdate: DateTime.new(2000,1,1), gender: "Laki-laki", address: "Batam", phone_number: "081234567890", major: "Teknik Komputer dan Jaringan", graduation_year: "2018")
user2.statuses.create(category: "Kuliah", name: "Universitas Internasional Batam", position: "Mahasiswa", address: "Batam", start_date: DateTime.new(2018,1,1), end_date: DateTime.new(2022,1,1), comment: "Sedang berkuliah di prodi Teknologi Informasi")
user2.statuses.create(category: "Bekerja", name: "PT Bangkit", position: "IT Staff", address: "Batam", start_date: DateTime.new(2018,1,1), comment: "Masih bekerja sampai sekarang")

user3 = User.create!(email: "cahaya@gmail.com", password: "password", password_confirmation: "password")
user3.create_profile(name: "Cahaya", birthplace: "Batam", birthdate: DateTime.new(2001,1,1), gender: "Perempuan", address: "Batam", phone_number: "081234567890", major: "Akuntansi", graduation_year: "2019")
user3.statuses.create(category: "Kuliah", name: "Universitas Internasional Batam", position: "Mahasiswa", address: "Batam", start_date: DateTime.new(2019,1,1), end_date: DateTime.new(2023,1,1), comment: "Sedang berkuliah di prodi Akuntansi")
user3.statuses.create(category: "Bekerja", name: "PT Cepat", position: "Akuntan", address: "Batam", start_date: DateTime.new(2019,1,1), comment: "Masih bekerja sampai sekarang")

user4 = User.create!(email: "doni@gmail.com", password: "password", password_confirmation: "password")
user4.create_profile(name: "Doni", birthplace: "Batam", birthdate: DateTime.new(2001,1,1), gender: "Perempuan", address: "Batam", phone_number: "081234567890", major: "Akuntansi", graduation_year: "2019")
user4.statuses.create(category: "Kuliah", name: "Universitas Internasional Batam", position: "Mahasiswa", address: "Batam", start_date: DateTime.new(2019,1,1), end_date: DateTime.new(2023,1,1), comment: "Sedang berkuliah di prodi Akuntansi")
user4.statuses.create(category: "Bekerja", name: "PT Laju", position: "Akuntan", address: "Batam", start_date: DateTime.new(2019,1,1), comment: "Masih bekerja sampai sekarang")

user5 = User.create!(email: "erlangga@gmail.com", password: "password", password_confirmation: "password")
user5.create_profile(name: "Erlangga", birthplace: "Batam", birthdate: DateTime.new(2002,1,1), gender: "Laki-laki", address: "Batam", phone_number: "081234567890", major: "Rekayasa Perangkat Lunak", graduation_year: "2020")
user5.statuses.create(category: "Kuliah", name: "Universitas Internasional Batam", position: "Mahasiswa", address: "Batam", start_date: DateTime.new(2020,1,1), end_date: DateTime.new(2024,1,1), comment: "Sedang berkuliah di prodi Sistem Informasi")
user5.statuses.create(category: "Bekerja", name: "PT Kencang", position: "Programmer", address: "Batam", start_date: DateTime.new(2020,1,1), comment: "Masih bekerja sampai sekarang")
