SELECT
    L.nama AS nama_level,
    CAST(COUNT(C.pesan) AS REAL) / COUNT(DISTINCT P.id_pengguna) AS rata_rata_chat_per_pengguna_di_level
FROM
    Level L
JOIN
    Pengguna P ON L.id_level = P.id_level
JOIN
    Konten K ON P.id_pengguna = K.id_pengguna
JOIN
    Chat C ON K.id_pengguna = C.id_pengguna AND K.id_room = C.id_room AND K.urutan_pengiriman = C.urutan_pengiriman
WHERE
    K.tipe = 'CHAT'
GROUP BY
    L.nama
HAVING
    (CAST(COUNT(C.pesan) AS REAL) / COUNT(DISTINCT P.id_pengguna)) > 0.5;