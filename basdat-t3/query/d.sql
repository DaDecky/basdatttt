SELECT
    P_main.username,
    P_main.email,
    K_main.tipe AS tipe_konten_dikirim,
    K_main.id_room AS id_room_target
FROM
    Pengguna P_main
JOIN
    Konten K_main ON P_main.id_pengguna = K_main.id_pengguna
WHERE
    K_main.id_room IN (
        SELECT DISTINCT
            RC.id_room
        FROM
            Room_Chat RC
        JOIN
            Anggota A ON RC.id_room = A.id_room
        JOIN
            Pengguna P_sub ON A.id_pengguna = P_sub.id_pengguna
        WHERE
            RC.tanggal_buat > '2023-01-01 00:00:00'
    )
LIMIT 10;