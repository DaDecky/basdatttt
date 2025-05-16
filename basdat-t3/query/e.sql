WITH RuangObrolanPopulerBaru AS (
    SELECT
        RC.id_room
    FROM
        Room_Chat RC
    JOIN
        Anggota A ON RC.id_room = A.id_room
    JOIN
        Pengguna P_anggota ON A.id_pengguna = P_anggota.id_pengguna
    WHERE
        RC.tanggal_buat >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) 
    GROUP BY
        RC.id_room
    HAVING
        COUNT(DISTINCT A.id_pengguna) > 5 
)
SELECT DISTINCT
    P_chat.id_pengguna,
    P_chat.username,
    P_chat.email,
    'Pengguna Aktif di Room Populer Baru' AS kategori_pengguna
FROM
    Pengguna P_chat
JOIN
    Konten K ON P_chat.id_pengguna = K.id_pengguna
JOIN
    Chat C ON K.id_pengguna = C.id_pengguna
            AND K.id_room = C.id_room
            AND K.urutan_pengiriman = C.urutan_pengiriman
WHERE
    K.tipe = 'CHAT'
    AND K.id_room IN (SELECT id_room FROM RuangObrolanPopulerBaru)

UNION

SELECT DISTINCT
    P_kreator.id_pengguna,
    P_kreator.username,
    P_kreator.email,
    'Kreator Lens "Background" Lama' AS kategori_pengguna
FROM
    Pengguna P_kreator
JOIN
    Lens L ON P_kreator.id_pengguna = L.id_pengguna
JOIN
    Lens_Type LT ON L.id_lens_type = LT.id_lens 
WHERE
    LT.tipe = 'Background' 
    AND L.tanggal_rilis < DATE_SUB(CURDATE(), INTERVAL 6 MONTH); 