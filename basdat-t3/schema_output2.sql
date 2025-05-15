-- CreateTable
CREATE TABLE `Level` (
    `id_level` INTEGER NOT NULL,
    `nama` VARCHAR(191) NOT NULL,
    `upah_per_bulan` INTEGER NOT NULL,
    `lensa_minimum` INTEGER NOT NULL,

    PRIMARY KEY (`id_level`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Lens_Type` (
    `id_lens` INTEGER NOT NULL,
    `tipe` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_lens`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pengguna` (
    `id_pengguna` INTEGER NOT NULL AUTO_INCREMENT,
    `id_level` INTEGER NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `nomor_telepon` VARCHAR(191) NULL,
    `tanggal_lahir` DATETIME(3) NULL,
    `tanggal_pembuatan` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `password` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Pengguna_email_key`(`email`),
    UNIQUE INDEX `Pengguna_username_key`(`username`),
    PRIMARY KEY (`id_pengguna`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Langganan` (
    `nomor_langganan` INTEGER NOT NULL AUTO_INCREMENT,
    `id_pengguna` INTEGER NOT NULL,
    `tanggal_langganan` DATETIME(3) NOT NULL,
    `tanggal_kedaluwarsa` DATETIME(3) NOT NULL,
    `status` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`nomor_langganan`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Lokasi` (
    `id_pengguna` INTEGER NOT NULL,
    `latitude` DOUBLE NOT NULL,
    `longitude` DOUBLE NOT NULL,
    `waktu_mulai` DATETIME(3) NOT NULL,
    `waktu_akhir` DATETIME(3) NULL,
    `status` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_pengguna`, `waktu_mulai`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Berteman` (
    `id_pengguna` INTEGER NOT NULL,
    `id_teman` INTEGER NOT NULL,
    `runtun` INTEGER NULL,
    `tanggal_mulai` DATETIME(3) NULL,

    PRIMARY KEY (`id_pengguna`, `id_teman`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Lens` (
    `id_lens` INTEGER NOT NULL AUTO_INCREMENT,
    `id_lens_type` INTEGER NOT NULL,
    `id_pengguna` INTEGER NOT NULL,
    `nama` VARCHAR(191) NOT NULL,
    `tanggal_rilis` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id_lens`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Room_Chat` (
    `id_room` INTEGER NOT NULL AUTO_INCREMENT,
    `tanggal_buat` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id_room`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Anggota` (
    `id_room` INTEGER NOT NULL,
    `id_pengguna` INTEGER NOT NULL,
    `tanggal_gabung` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id_room`, `id_pengguna`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Konten` (
    `id_konten` INTEGER NOT NULL AUTO_INCREMENT,
    `id_pengguna` INTEGER NOT NULL,
    `id_room` INTEGER NOT NULL,
    `urutan_pengiriman` INTEGER NOT NULL,
    `tipe` ENUM('PAP', 'CHAT') NOT NULL,
    `is_simpan` BOOLEAN NOT NULL DEFAULT false,
    `waktu_pengiriman` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id_konten`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pap` (
    `id_pap` INTEGER NOT NULL AUTO_INCREMENT,
    `id_konten` INTEGER NOT NULL,
    `id_lens` INTEGER NOT NULL,
    `tipe` VARCHAR(191) NULL,
    `durasi` INTEGER NULL,

    UNIQUE INDEX `Pap_id_konten_key`(`id_konten`),
    PRIMARY KEY (`id_pap`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Chat` (
    `id_chat` INTEGER NOT NULL AUTO_INCREMENT,
    `id_konten` INTEGER NOT NULL,
    `pesan` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Chat_id_konten_key`(`id_konten`),
    PRIMARY KEY (`id_chat`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Add_On` (
    `id_add_on` INTEGER NOT NULL AUTO_INCREMENT,
    `id_pap` INTEGER NOT NULL,
    `first_x` INTEGER NOT NULL,
    `last_x` INTEGER NOT NULL,
    `first_y` INTEGER NOT NULL,
    `last_y` INTEGER NOT NULL,

    PRIMARY KEY (`id_add_on`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Caption` (
    `id_add_on` INTEGER NOT NULL,
    `teks` VARCHAR(191) NOT NULL,
    `font_style` VARCHAR(191) NULL,

    PRIMARY KEY (`id_add_on`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Overlay` (
    `id_add_on` INTEGER NOT NULL,
    `nama` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_add_on`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Pengguna` ADD CONSTRAINT `Pengguna_id_level_fkey` FOREIGN KEY (`id_level`) REFERENCES `Level`(`id_level`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Langganan` ADD CONSTRAINT `Langganan_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna`(`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Lokasi` ADD CONSTRAINT `Lokasi_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna`(`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Berteman` ADD CONSTRAINT `Berteman_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna`(`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Berteman` ADD CONSTRAINT `Berteman_id_teman_fkey` FOREIGN KEY (`id_teman`) REFERENCES `Pengguna`(`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Lens` ADD CONSTRAINT `Lens_id_lens_type_fkey` FOREIGN KEY (`id_lens_type`) REFERENCES `Lens_Type`(`id_lens`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Lens` ADD CONSTRAINT `Lens_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna`(`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Anggota` ADD CONSTRAINT `Anggota_id_room_fkey` FOREIGN KEY (`id_room`) REFERENCES `Room_Chat`(`id_room`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Anggota` ADD CONSTRAINT `Anggota_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna`(`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Konten` ADD CONSTRAINT `Konten_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna`(`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Konten` ADD CONSTRAINT `Konten_id_room_fkey` FOREIGN KEY (`id_room`) REFERENCES `Room_Chat`(`id_room`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Pap` ADD CONSTRAINT `Pap_id_konten_fkey` FOREIGN KEY (`id_konten`) REFERENCES `Konten`(`id_konten`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Pap` ADD CONSTRAINT `Pap_id_lens_fkey` FOREIGN KEY (`id_lens`) REFERENCES `Lens`(`id_lens`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Chat` ADD CONSTRAINT `Chat_id_konten_fkey` FOREIGN KEY (`id_konten`) REFERENCES `Konten`(`id_konten`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Add_On` ADD CONSTRAINT `Add_On_id_pap_fkey` FOREIGN KEY (`id_pap`) REFERENCES `Pap`(`id_pap`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Caption` ADD CONSTRAINT `Caption_id_add_on_fkey` FOREIGN KEY (`id_add_on`) REFERENCES `Add_On`(`id_add_on`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Overlay` ADD CONSTRAINT `Overlay_id_add_on_fkey` FOREIGN KEY (`id_add_on`) REFERENCES `Add_On`(`id_add_on`) ON DELETE RESTRICT ON UPDATE CASCADE;

