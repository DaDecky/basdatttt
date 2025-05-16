import {
  PrismaClient,
  JenisKonten,
  type Pengguna,
  type Level,
  type LensType,
  type RoomChat,
  type Anggota,
  type Lens,
  type Pap,
  type Konten,
} from "@prisma/client";
import { faker } from "@faker-js/faker";

const prisma = new PrismaClient();

const urutanPengirimanTracker: Map<string, number> = new Map();
function getNextUrutanPengiriman(idPengguna: number, idRoom: number): number {
  const key = `${idPengguna}-${idRoom}`;
  const currentUrutan = urutanPengirimanTracker.get(key) || 0;
  const nextUrutan = currentUrutan + 1;
  urutanPengirimanTracker.set(key, nextUrutan);
  return nextUrutan;
}

type AnggotaWithRelations = Anggota & {
  pengguna: Pengguna;
  room: RoomChat;
};
type KontenWithPap = Konten & {
  pap: Pap | null;
};

async function main() {
  console.log(`Start seeding ...`);

  console.log("Cleaning up old data...");
  await prisma.addOn.deleteMany();
  await prisma.pap.deleteMany();
  await prisma.chat.deleteMany();
  await prisma.konten.deleteMany();
  await prisma.anggota.deleteMany();
  await prisma.roomChat.deleteMany();
  await prisma.lens.deleteMany();
  await prisma.berteman.deleteMany();
  await prisma.lokasi.deleteMany();
  await prisma.langganan.deleteMany();
  await prisma.pengguna.deleteMany();
  await prisma.lensType.deleteMany();
  await prisma.level.deleteMany();
  console.log("Old data cleaned.");

  // 1. Seed Level
  const levelsData = [
    { id_level: 0, nama: "Not Rated", upah_per_bulan: 0, lensa_minimum: 0 },
    { id_level: 1, nama: "Bronze", upah_per_bulan: 1000000, lensa_minimum: 10 },
    { id_level: 2, nama: "Silver", upah_per_bulan: 2000000, lensa_minimum: 20 },
    { id_level: 3, nama: "Gold", upah_per_bulan: 3000000, lensa_minimum: 30 },
    {
      id_level: 4,
      nama: "Platinum",
      upah_per_bulan: 5000000,
      lensa_minimum: 50,
    },
  ];

  for (const levelData of levelsData) {
    await prisma.level.upsert({
      where: { id_level: levelData.id_level },
      update: {},
      create: levelData,
    });
  }
  console.log(`Seeded ${await prisma.level.count()} levels.`);
  const seededLevels: Level[] = await prisma.level.findMany();

  // 2. Seed LensType
  const lensTypesData = [
    { id_lens: 1001, tipe: "Face" },
    { id_lens: 1002, tipe: "Background" },
    { id_lens: 1003, tipe: "FaceAndBackground" },
  ];
  for (const ltData of lensTypesData) {
    await prisma.lensType.upsert({
      where: { id_lens: ltData.id_lens },
      update: { tipe: ltData.tipe },
      create: ltData,
    });
  }
  console.log(`Seeded ${await prisma.lensType.count()} lens types.`);
  const seededLensTypes: LensType[] = await prisma.lensType.findMany();

  // 3. Seed Pengguna
  const penggunaList: Pengguna[] = [];
  const jumlahPengguna = 55;
  for (let i = 0; i < jumlahPengguna; i++) {
    const randomLevel = faker.helpers.arrayElement(seededLevels);
    const firstName = faker.person.firstName();
    const lastName = faker.person.lastName();
    const pengguna = await prisma.pengguna.create({
      data: {
        id_level: randomLevel.id_level,
        email: faker.internet.email({
          firstName: `${firstName}.${i}`,
          lastName,
          allowSpecialCharacters: false,
        }),
        username: faker.internet.username({
          firstName: `${firstName}${i}`,
          lastName,
        }),
        nomor_telepon: "08" + faker.string.numeric(10),
        tanggal_lahir: faker.date.birthdate({ min: 18, max: 65, mode: "age" }),
        password: faker.internet.password(),
        tanggal_pembuatan: faker.date.past({ years: 3 }),
      },
    });
    penggunaList.push(pengguna);
  }
  console.log(`Seeded ${penggunaList.length} pengguna.`);

  // 4. Seed Langganan
  const targetLanggananCount = Math.floor(penggunaList.length * 0.75);
  for (const pengguna of faker.helpers.arrayElements(
    penggunaList,
    targetLanggananCount,
  )) {
    await prisma.langganan.create({
      data: {
        id_pengguna: pengguna.id_pengguna,
        tanggal_langganan: faker.date.past({
          years: 1,
          refDate: pengguna.tanggal_pembuatan,
        }),
        tanggal_kedaluwarsa: faker.date.future({ years: 1 }),
        status: faker.helpers.arrayElement(["aktif", "tidak_aktif"]),
      },
    });
  }
  console.log(`Seeded ${await prisma.langganan.count()} langganan.`);

  // 5. Seed Lokasi
  const targetLokasiCount = Math.floor(penggunaList.length * 0.6);
  for (const pengguna of faker.helpers.arrayElements(
    penggunaList,
    targetLokasiCount,
  )) {
    const waktu_mulai = faker.date.recent({
      days: 60,
      refDate: pengguna.tanggal_pembuatan,
    });
    await prisma.lokasi.create({
      data: {
        id_pengguna: pengguna.id_pengguna,
        latitude: faker.location.latitude(),
        longitude: faker.location.longitude(),
        waktu_mulai: waktu_mulai,
        waktu_akhir: faker.helpers.maybe(
          () => faker.date.soon({ days: 2, refDate: waktu_mulai }),
          { probability: 0.6 },
        ),
        status: faker.helpers.arrayElement(["aktif", "tidak_aktif"]),
      },
    });
  }
  console.log(`Seeded ${await prisma.lokasi.count()} lokasi.`);

  // 6. Seed Berteman
  if (penggunaList.length > 1) {
    for (let i = 0; i < penggunaList.length; i++) {
      const pengguna1 = penggunaList[i];
      if (!pengguna1) continue;

      const numFriends = faker.number.int({
        min: 1,
        max: Math.min(8, penggunaList.length - 1),
      });
      const potentialFriends = penggunaList.filter(
        (p) => p && p.id_pengguna !== pengguna1.id_pengguna,
      );
      if (potentialFriends.length === 0) continue;

      const friendsToMake = faker.helpers.arrayElements(
        potentialFriends,
        Math.min(numFriends, potentialFriends.length),
      );

      for (const pengguna2 of friendsToMake) {
        if (!pengguna2) continue;

        const userA_id = Math.min(pengguna1.id_pengguna, pengguna2.id_pengguna);
        const userB_id = Math.max(pengguna1.id_pengguna, pengguna2.id_pengguna);

        const refDatePengguna1 = pengguna1.tanggal_pembuatan;
        const refDatePengguna2 = pengguna2.tanggal_pembuatan;
        const latestCreationDate =
          refDatePengguna1 > refDatePengguna2
            ? refDatePengguna1
            : refDatePengguna2;

        const existingFriendship = await prisma.berteman.findUnique({
          where: {
            id_pengguna_id_teman: { id_pengguna: userA_id, id_teman: userB_id },
          },
        });

        if (!existingFriendship) {
          await prisma.berteman.create({
            data: {
              id_pengguna: userA_id,
              id_teman: userB_id,
              runtun: faker.helpers.maybe(
                () => faker.number.int({ min: 1, max: 200 }),
                { probability: 0.6 },
              ),
              tanggal_mulai: faker.date.between({
                from: latestCreationDate,
                to: new Date(),
              }),
            },
          });
        }
      }
    }
  }
  console.log(`Seeded ${await prisma.berteman.count()} pertemanan.`);

  // 7. Seed Lens
  const lensList: Lens[] = [];
  const targetLensCreators = Math.floor(penggunaList.length * 0.6);
  for (const pengguna of faker.helpers.arrayElements(
    penggunaList,
    targetLensCreators,
  )) {
    const numLenses = faker.number.int({ min: 1, max: 4 });
    for (let i = 0; i < numLenses; i++) {
      const randomLensType = faker.helpers.arrayElement(seededLensTypes);
      if (!randomLensType) continue;

      const lens = await prisma.lens.create({
        data: {
          id_lens_type: randomLensType.id_lens,
          id_pengguna: pengguna.id_pengguna,
          nama: faker.company.buzzNoun() + " " + faker.color.human() + " Lens",
          tanggal_rilis: faker.date.past({
            years: 2,
            refDate: pengguna.tanggal_pembuatan,
          }),
        },
      });
      lensList.push(lens);
    }
  }
  console.log(`Seeded ${lensList.length} lens.`);

  // 8. Seed RoomChat
  const roomChatList: RoomChat[] = [];
  const jumlahRoomChat = 20;
  for (let i = 0; i < jumlahRoomChat; i++) {
    const room = await prisma.roomChat.create({
      data: {
        tanggal_buat: faker.date.past({ years: 2 }),
      },
    });
    roomChatList.push(room);
  }
  console.log(`Seeded ${roomChatList.length} room chats.`);

  // 9. Seed Anggota
  const seededAnggota: AnggotaWithRelations[] = (await prisma.anggota.findMany({
    include: { pengguna: true, room: true },
  })) as AnggotaWithRelations[];

  for (const room of roomChatList) {
    const numAnggota = faker.number.int({
      min: 2,
      max: Math.min(10, penggunaList.length),
    });
    const anggotaForRoom = faker.helpers.arrayElements(
      penggunaList,
      numAnggota,
    );
    for (const pengguna of anggotaForRoom) {
      await prisma.anggota.upsert({
        where: {
          id_room_id_pengguna: {
            id_room: room.id_room,
            id_pengguna: pengguna.id_pengguna,
          },
        },
        update: {},
        create: {
          id_room: room.id_room,
          id_pengguna: pengguna.id_pengguna,
          tanggal_gabung: faker.date.between({
            from: room.tanggal_buat,
            to: new Date(),
          }),
        },
      });
    }
  }
  // Re-fetch seededAnggota dengan relasi setelah semua anggota dibuat
  const refreshedSeededAnggota: AnggotaWithRelations[] =
    (await prisma.anggota.findMany({
      include: { pengguna: true, room: true },
    })) as AnggotaWithRelations[];
  console.log(`Seeded ${await prisma.anggota.count()} anggota.`);

  // 10. Seed Konten (PAP dan CHAT)
  const papKontenRecords: KontenWithPap[] = [];
  const desiredKontenCount = 100;
  let createdKontenCount = 0;

  if (refreshedSeededAnggota.length > 0 && lensList.length > 0) {
    for (let k = 0; k < desiredKontenCount; k++) {
      const anggota = faker.helpers.arrayElement(refreshedSeededAnggota);
      if (!anggota || !anggota.pengguna || !anggota.room) continue;

      const jenisKonten = faker.helpers.arrayElement([
        JenisKonten.PAP,
        JenisKonten.CHAT,
        JenisKonten.CHAT,
        JenisKonten.CHAT,
      ]);
      const urutan = getNextUrutanPengiriman(
        anggota.id_pengguna,
        anggota.id_room,
      );
      const waktu_pengiriman = faker.date.between({
        from: anggota.tanggal_gabung,
        to: new Date(),
      });

      if (jenisKonten === JenisKonten.PAP) {
        let randomLens: Lens | undefined;
        const userSpecificLenses = lensList.filter(
          (l) => l.id_pengguna === anggota.id_pengguna,
        );

        if (userSpecificLenses.length > 0) {
          randomLens = faker.helpers.arrayElement(userSpecificLenses);
        } else {
          if (lensList.length > 0) {
            randomLens = faker.helpers.arrayElement(lensList);
          }
        }

        if (!randomLens) {
          console.warn(
            `Could not select a lens for PAP content (user: ${anggota.id_pengguna}, room: ${anggota.id_room}). User lenses: ${userSpecificLenses.length}, total lenses: ${lensList.length}. Skipping this PAP.`,
          );
          continue;
        }

        const tipePap = faker.helpers.arrayElement(["foto", "video"]);
        const newKontenWithPap = (await prisma.konten.create({
          data: {
            id_pengguna: anggota.id_pengguna,
            id_room: anggota.id_room,
            urutan_pengiriman: urutan,
            tipe: JenisKonten.PAP,
            is_simpan: faker.datatype.boolean(0.3),
            waktu_pengiriman: waktu_pengiriman,
            pap: {
              create: {
                id_lens: randomLens.id_lens,
                tipe: tipePap,
                durasi:
                  tipePap === "video"
                    ? faker.number.int({ min: 1, max: 60 })
                    : null,
              },
            },
          },
          include: { pap: true },
        })) as KontenWithPap;

        if (newKontenWithPap.pap) {
          papKontenRecords.push(newKontenWithPap);
        }
      } else {
        // CHAT
        await prisma.konten.create({
          data: {
            id_pengguna: anggota.id_pengguna,
            id_room: anggota.id_room,
            urutan_pengiriman: urutan,
            tipe: JenisKonten.CHAT,
            is_simpan: faker.datatype.boolean(0.1),
            waktu_pengiriman: waktu_pengiriman,
            chat: {
              create: {
                pesan: faker.lorem.sentence({ min: 1, max: 30 }),
              },
            },
          },
        });
      }
      createdKontenCount++;
    }
  }
  console.log(`Seeded ${createdKontenCount} konten (PAP & CHAT).`);
  console.log(
    `Created ${papKontenRecords.length} PAP records for AddOn seeding.`,
  );

  // 11. Seed AddOn (Caption & Overlay untuk Konten PAP)
  const targetAddOnCount = Math.floor(papKontenRecords.length * 0.6);
  if (papKontenRecords.length > 0) {
    for (const loopKontenPap of faker.helpers.arrayElements(
      papKontenRecords,
      targetAddOnCount,
    )) {
      const kontenPap = loopKontenPap as KontenWithPap;
      if (!kontenPap || !kontenPap.pap) continue;

      const numLayers = faker.number.int({ min: 1, max: 2 });
      for (let layerIdx = 1; layerIdx <= numLayers; layerIdx++) {
        const addOnBaseData = {
          id_pengguna: kontenPap.id_pengguna,
          id_room: kontenPap.id_room,
          urutan_pengiriman: kontenPap.urutan_pengiriman,
          layer: layerIdx,
          first_x: faker.number.float({ min: 0, max: 0.8, fractionDigits: 2 }),
          last_x: faker.number.float({ min: 0.2, max: 1.0, fractionDigits: 2 }),
          first_y: faker.number.float({ min: 0, max: 0.8, fractionDigits: 2 }),
          last_y: faker.number.float({ min: 0.2, max: 1.0, fractionDigits: 2 }),
        };
        if (addOnBaseData.last_x <= addOnBaseData.first_x)
          addOnBaseData.last_x = parseFloat(
            (addOnBaseData.first_x + 0.2).toFixed(2),
          );
        if (addOnBaseData.last_y <= addOnBaseData.first_y)
          addOnBaseData.last_y = parseFloat(
            (addOnBaseData.first_y + 0.2).toFixed(2),
          );
        if (addOnBaseData.last_x > 1.0) addOnBaseData.last_x = 1.0;
        if (addOnBaseData.last_y > 1.0) addOnBaseData.last_y = 1.0;

        const hasCaption = faker.datatype.boolean(0.7);
        const hasOverlay = !hasCaption || faker.datatype.boolean(0.5);

        await prisma.addOn.create({
          data: {
            ...addOnBaseData,
            caption: hasCaption
              ? {
                  create: {
                    teks: faker.lorem.words(
                      faker.number.int({ min: 1, max: 7 }),
                    ),
                    font_style: faker.helpers.arrayElement([
                      "Bold",
                      "Italic",
                      "Underline",
                    ]),
                  },
                }
              : undefined,
            overlay: hasOverlay
              ? {
                  create: {
                    nama: faker.commerce.productAdjective() + " Overlay",
                  },
                }
              : undefined,
          },
        });
      }
    }
  }
  console.log(
    `Seeded ${await prisma.addOn.count()} add-ons (Captions & Overlays).`,
  );

  console.log(`Seeding finished.`);
}

main()
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
