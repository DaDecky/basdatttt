-- prisma/migrations/20250515100000_init/migration.sql
-- ===================================================

-- ENUM
CREATE TYPE "JenisKonten" AS ENUM ('PAP', 'CHAT');

-- MASTER TABLES -------------------------------------------------------------

CREATE TABLE IF NOT EXISTS "Level" (
  "id_level"        INTEGER PRIMARY KEY,
  "nama"            TEXT    NOT NULL,
  "upah_per_bulan"  INTEGER NOT NULL,
  "lensa_minimum"   INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS "Lens_Type" (
  "id_lens" INTEGER PRIMARY KEY,
  "tipe"    TEXT NOT NULL
);

-- USER & RELATED ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS "Pengguna" (
  "id_pengguna"       SERIAL PRIMARY KEY,
  "id_level"          INTEGER  NOT NULL,
  "email"             TEXT     NOT NULL UNIQUE,
  "username"          TEXT     NOT NULL UNIQUE,
  "nomor_telepon"     TEXT,
  "tanggal_lahir"     TIMESTAMP,
  "tanggal_pembuatan" TIMESTAMP NOT NULL DEFAULT now(),
  "password"          TEXT     NOT NULL,
  CONSTRAINT "fk_pengguna_level"
      FOREIGN KEY ("id_level") REFERENCES "Level"("id_level")
);

CREATE TABLE IF NOT EXISTS "Langganan" (
  "nomor_langganan"     SERIAL PRIMARY KEY,
  "id_pengguna"         INTEGER  NOT NULL,
  "tanggal_langganan"   TIMESTAMP NOT NULL,
  "tanggal_kedaluwarsa" TIMESTAMP NOT NULL,
  "status"              TEXT      NOT NULL,
  CONSTRAINT "fk_langganan_user"
      FOREIGN KEY ("id_pengguna") REFERENCES "Pengguna"("id_pengguna")
);

CREATE TABLE IF NOT EXISTS "Lokasi" (
  "id_lokasi"   SERIAL PRIMARY KEY,
  "id_pengguna" INTEGER NOT NULL,
  "latitude"    DOUBLE PRECISION NOT NULL,
  "longitude"   DOUBLE PRECISION NOT NULL,
  "waktu_mulai" TIMESTAMP NOT NULL,
  "waktu_akhir" TIMESTAMP,
  "status"      TEXT NOT NULL,
  CONSTRAINT "fk_lokasi_user"
      FOREIGN KEY ("id_pengguna") REFERENCES "Pengguna"("id_pengguna")
);

-- self-join friend list
CREATE TABLE IF NOT EXISTS "Berteman" (
  "id_pengguna"  INTEGER NOT NULL,
  "id_teman"     INTEGER NOT NULL,
  "runtutan"     INTEGER,
  "tanggal_mulai" TIMESTAMP,
  PRIMARY KEY ("id_pengguna","id_teman"),
  CONSTRAINT "fk_bert_user"  FOREIGN KEY ("id_pengguna") REFERENCES "Pengguna"("id_pengguna"),
  CONSTRAINT "fk_bert_friend" FOREIGN KEY ("id_teman")    REFERENCES "Pengguna"("id_pengguna")
);

-- LENS ----------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS "Lens" (
  "id_lens"       SERIAL PRIMARY KEY,
  "id_lens_type"  INTEGER NOT NULL,
  "id_pengguna"   INTEGER NOT NULL,
  "nama"          TEXT    NOT NULL,
  "tanggal_rilis" TIMESTAMP NOT NULL,
  CONSTRAINT "fk_lens_type"  FOREIGN KEY ("id_lens_type") REFERENCES "Lens_Type"("id_lens"),
  CONSTRAINT "fk_lens_user"  FOREIGN KEY ("id_pengguna")  REFERENCES "Pengguna"("id_pengguna")
);

-- ROOM CHAT & MEMBER --------------------------------------------------------

CREATE TABLE IF NOT EXISTS "Room_Chat" (
  "id_room"      SERIAL PRIMARY KEY,
  "tanggal_buat" TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS "Anggota" (
  "id_room"      INTEGER NOT NULL,
  "id_pengguna"  INTEGER NOT NULL,
  "tanggal_gabung" TIMESTAMP NOT NULL,
  PRIMARY KEY ("id_room","id_pengguna"),
  CONSTRAINT "fk_member_room" FOREIGN KEY ("id_room")     REFERENCES "Room_Chat"("id_room"),
  CONSTRAINT "fk_member_user" FOREIGN KEY ("id_pengguna") REFERENCES "Pengguna"("id_pengguna")
);

-- KONTEN --------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS "Konten" (
  "id_konten"         SERIAL PRIMARY KEY,
  "id_pengguna"       INTEGER NOT NULL,
  "id_room"           INTEGER NOT NULL,
  "urutan_pengiriman" INTEGER NOT NULL,
  "tipe"              "JenisKonten" NOT NULL,
  "is_simpan"         BOOLEAN NOT NULL DEFAULT FALSE,
  "waktu_pengiriman"  TIMESTAMP NOT NULL,
  CONSTRAINT "fk_konten_user" FOREIGN KEY ("id_pengguna") REFERENCES "Pengguna"("id_pengguna"),
  CONSTRAINT "fk_konten_room" FOREIGN KEY ("id_room")     REFERENCES "Room_Chat"("id_room")
);

-- PAP / CHAT ---------------------------------------------------------------

CREATE TABLE IF NOT EXISTS "Pap" (
  "id_pap"     SERIAL PRIMARY KEY,
  "id_konten"  INTEGER NOT NULL UNIQUE,
  "id_lens"    INTEGER NOT NULL,
  "tipe"       TEXT,
  "durasi"     INTEGER,
  CONSTRAINT "fk_pap_konten" FOREIGN KEY ("id_konten") REFERENCES "Konten"("id_konten") ON DELETE CASCADE,
  CONSTRAINT "fk_pap_lens"   FOREIGN KEY ("id_lens")   REFERENCES "Lens"("id_lens")
);

CREATE TABLE IF NOT EXISTS "Chat" (
  "id_chat"    SERIAL PRIMARY KEY,
  "id_konten"  INTEGER NOT NULL UNIQUE,
  "pesan"      TEXT NOT NULL,
  CONSTRAINT "fk_chat_konten" FOREIGN KEY ("id_konten") REFERENCES "Konten"("id_konten") ON DELETE CASCADE
);

-- ADD-ON & turunannya -------------------------------------------------------

CREATE TABLE IF NOT EXISTS "Add_On" (
  "id_add_on" SERIAL PRIMARY KEY,
  "id_pap"    INTEGER NOT NULL,
  "first_x"   INTEGER NOT NULL,
  "last_x"    INTEGER NOT NULL,
  "first_y"   INTEGER NOT NULL,
  "last_y"    INTEGER NOT NULL,
  CONSTRAINT "fk_addon_pap" FOREIGN KEY ("id_pap") REFERENCES "Pap"("id_pap")
);

CREATE TABLE IF NOT EXISTS "Caption" (
  "id_add_on" INTEGER PRIMARY KEY,
  "teks"      TEXT NOT NULL,
  "font_style" TEXT,
  CONSTRAINT "fk_caption_addon" FOREIGN KEY ("id_add_on") REFERENCES "Add_On"("id_add_on") ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "Overlay" (
  "id_add_on" INTEGER PRIMARY KEY,
  "nama"      TEXT NOT NULL,
  CONSTRAINT "fk_overlay_addon" FOREIGN KEY ("id_add_on") REFERENCES "Add_On"("id_add_on") ON DELETE CASCADE
);
