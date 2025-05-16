SELECT
    P.username,
    P.email,
    L.nama AS nama_level,
    K.tipe AS tipe_konten
FROM
    Pengguna P
JOIN
    Level L ON P.id_level = L.id_level
JOIN
    Konten K ON P.id_pengguna = K.id_pengguna
LIMIT 10;