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
    `id_lens` INTEGER NOT NULL AUTO_INCREMENT,
    `tipe` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Lens_Type_tipe_key`(`tipe`),
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
    `nomor_langganan` INTEGER NOT NULL,
    `id_pengguna` INTEGER NOT NULL,
    `tanggal_langganan` DATETIME(3) NOT NULL,
    `tanggal_kedaluwarsa` DATETIME(3) NOT NULL,
    `status` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`nomor_langganan`, `id_pengguna`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Lokasi` (
    `id_pengguna` INTEGER NOT NULL,
    `latitude` DOUBLE NOT NULL,
    `longitude` DOUBLE NOT NULL,
    `waktu_mulai` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `waktu_akhir` DATETIME(3) NULL,
    `status` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_pengguna`, `waktu_mulai`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Berteman` (
    `id_pengguna` INTEGER NOT NULL,
    `id_teman` INTEGER NOT NULL,
    `runtutan` INTEGER NOT NULL DEFAULT 0,
    `tanggal_mulai` DATETIME(3) NOT NULL,

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
    `id_pengguna` INTEGER NOT NULL,
    `id_room` INTEGER NOT NULL,
    `urutan_pengiriman` INTEGER NOT NULL,
    `tipe_konten` ENUM('PAP', 'CHAT') NOT NULL,
    `is_simpan` BOOLEAN NOT NULL DEFAULT false,
    `waktu_pengiriman` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pap` (
    `id_pengguna` INTEGER NOT NULL,
    `id_room` INTEGER NOT NULL,
    `urutan_pengiriman` INTEGER NOT NULL,
    `id_lens` INTEGER NULL,
    `durasi` INTEGER NULL,

    PRIMARY KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Chat` (
    `id_pengguna` INTEGER NOT NULL,
    `id_room` INTEGER NOT NULL,
    `urutan_pengiriman` INTEGER NOT NULL,
    `pesan` TEXT NOT NULL,

    PRIMARY KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Add_On` (
    `id_pengguna` INTEGER NOT NULL,
    `id_room` INTEGER NOT NULL,
    `urutan_pengiriman` INTEGER NOT NULL,
    `first_x` DOUBLE NOT NULL,
    `last_x` DOUBLE NOT NULL,
    `first_y` DOUBLE NOT NULL,
    `last_y` DOUBLE NOT NULL,
    `layer` INTEGER NOT NULL,
    `tipe_add_on` ENUM('CAPTION', 'OVERLAY') NOT NULL,

    PRIMARY KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`, `layer`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Caption` (
    `teks` VARCHAR(191) NOT NULL,
    `font_style` VARCHAR(191) NULL,
    `id_pengguna` INTEGER NOT NULL,
    `id_room` INTEGER NOT NULL,
    `urutan_pengiriman` INTEGER NOT NULL,
    `layer` INTEGER NOT NULL,

    PRIMARY KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`, `layer`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Overlay` (
    `nama` VARCHAR(191) NOT NULL,
    `id_pengguna` INTEGER NOT NULL,
    `id_room` INTEGER NOT NULL,
    `urutan_pengiriman` INTEGER NOT NULL,
    `layer` INTEGER NOT NULL,

    PRIMARY KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`, `layer`)
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
ALTER TABLE `Pap` ADD CONSTRAINT `Pap_id_pengguna_id_room_urutan_pengiriman_fkey` FOREIGN KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`) REFERENCES `Konten`(`id_pengguna`, `id_room`, `urutan_pengiriman`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Pap` ADD CONSTRAINT `Pap_id_lens_fkey` FOREIGN KEY (`id_lens`) REFERENCES `Lens`(`id_lens`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Chat` ADD CONSTRAINT `Chat_id_pengguna_id_room_urutan_pengiriman_fkey` FOREIGN KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`) REFERENCES `Konten`(`id_pengguna`, `id_room`, `urutan_pengiriman`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Add_On` ADD CONSTRAINT `Add_On_id_pengguna_id_room_urutan_pengiriman_fkey` FOREIGN KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`) REFERENCES `Pap`(`id_pengguna`, `id_room`, `urutan_pengiriman`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Caption` ADD CONSTRAINT `Caption_id_pengguna_id_room_urutan_pengiriman_layer_fkey` FOREIGN KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`, `layer`) REFERENCES `Add_On`(`id_pengguna`, `id_room`, `urutan_pengiriman`, `layer`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Overlay` ADD CONSTRAINT `Overlay_id_pengguna_id_room_urutan_pengiriman_layer_fkey` FOREIGN KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`, `layer`) REFERENCES `Add_On`(`id_pengguna`, `id_room`, `urutan_pengiriman`, `layer`) ON DELETE RESTRICT ON UPDATE CASCADE;

