SELECT
    P.id_pengguna,
    P.username,
    'Mengirim PAP' AS keterangan
FROM
    Pengguna P
JOIN
    Konten K ON P.id_pengguna = K.id_pengguna
JOIN
    Pap PAP_Table ON K.id_pengguna = PAP_Table.id_pengguna AND K.id_room = PAP_Table.id_room AND K.urutan_pengiriman = PAP_Table.urutan_pengiriman
WHERE
    K.tipe = 'PAP'

UNION

SELECT
    P1.id_pengguna,
    P1.username,
    'Memiliki Teman' AS keterangan
FROM
    Pengguna P1
JOIN
    Berteman B ON P1.id_pengguna = B.id_pengguna
JOIN
    Pengguna P2 ON B.id_teman = P2.id_pengguna
LIMIT 20;