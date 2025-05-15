import { PrismaClient, JenisKonten } from "@prisma/client";
import { faker } from "@faker-js/faker";

const prisma = new PrismaClient();

async function main() {
  // Create 5 levels
  await prisma.level.createMany({
    data: Array.from({ length: 5 }, (_, i) => ({
      id_level: i + 1,
      nama: `Level ${i + 1}`,
      upah_per_bulan: faker.number.int({ min: 5000, max: 100000 }),
      lensa_minimum: faker.number.int({ min: 1, max: 10 }),
    })),
    skipDuplicates: true,
  });

  // Create 50 users
  const users = await Promise.all(
    Array.from({ length: 50 }, () =>
      prisma.pengguna.create({
        data: {
          id_level: faker.number.int({ min: 1, max: 5 }),
          email: faker.internet.email(),
          username: faker.internet.userName(),
          nomor_telepon: faker.phone.number(),
          tanggal_lahir: faker.date.past({ years: 40 }),
          password: faker.internet.password(),
        },
      }),
    ),
  );

  // Create 50 rooms
  const rooms = await Promise.all(
    Array.from({ length: 50 }, () =>
      prisma.roomChat.create({
        data: {
          tanggal_buat: faker.date.past(),
        },
      }),
    ),
  );

  // Create 50 lokasi
  await Promise.all(
    users.map((user) =>
      prisma.lokasi.create({
        data: {
          id_pengguna: user.id_pengguna,
          latitude: parseFloat(faker.location.latitude()),
          longitude: parseFloat(faker.location.longitude()),
          waktu_mulai: faker.date.recent(),
          waktu_akhir: faker.date.future(),
          status: "Aktif",
        },
      }),
    ),
  );

  // Create 50 lens types
  await prisma.lensType.createMany({
    data: Array.from({ length: 50 }, (_, i) => ({
      id_lens: i + 1,
      tipe: `Tipe-${i + 1}`,
    })),
    skipDuplicates: true,
  });

  // Create 50 lenses
  const lenses = await Promise.all(
    Array.from({ length: 50 }, () =>
      prisma.lens.create({
        data: {
          id_pengguna: faker.helpers.arrayElement(users).id_pengguna,
          id_lens_type: faker.number.int({ min: 1, max: 50 }),
          nama: faker.commerce.productName(),
          tanggal_rilis: faker.date.past(),
        },
      }),
    ),
  );

  // Create 50 friendships without duplication (id_pengguna < id_teman)
  const friendPairs = new Set<string>();
  for (let i = 0; i < 50; i++) {
    let user1, user2;
    do {
      user1 = faker.helpers.arrayElement(users);
      user2 = faker.helpers.arrayElement(users);
    } while (
      user1.id_pengguna === user2.id_pengguna ||
      friendPairs.has(`${user1.id_pengguna}-${user2.id_pengguna}`) ||
      friendPairs.has(`${user2.id_pengguna}-${user1.id_pengguna}`)
    );
    friendPairs.add(`${user1.id_pengguna}-${user2.id_pengguna}`);

    await prisma.berteman.create({
      data: {
        id_pengguna: user1.id_pengguna,
        id_teman: user2.id_pengguna,
        runtun: i,
        tanggal_mulai: faker.date.past(),
      },
    });
  }

  // Create 50 anggota
  // Create 50 anggota with unique (id_room, id_pengguna) pairs
  const anggotaPairs = new Set<string>();
  const anggotaData = [];

  while (anggotaData.length < 50) {
    const pengguna = faker.helpers.arrayElement(users);
    const room = faker.helpers.arrayElement(rooms);
    const key = `${room.id_room}-${pengguna.id_pengguna}`;

    if (!anggotaPairs.has(key)) {
      anggotaPairs.add(key);
      anggotaData.push({
        id_room: room.id_room,
        id_pengguna: pengguna.id_pengguna,
        tanggal_gabung: faker.date.past(),
      });
    }
  }

  await prisma.$transaction(
    anggotaData.map((data) => prisma.anggota.create({ data })),
  );

  // Create 50 konten
  const kontens = await Promise.all(
    Array.from({ length: 50 }, (_, i) => {
      const user = faker.helpers.arrayElement(users);
      const room = faker.helpers.arrayElement(rooms);
      const tipe = faker.helpers.arrayElement([
        JenisKonten.PAP,
        JenisKonten.CHAT,
      ]);
      return prisma.konten.create({
        data: {
          id_pengguna: user.id_pengguna,
          id_room: room.id_room,
          urutan_pengiriman: i + 1,
          tipe,
          is_simpan: faker.datatype.boolean(),
          waktu_pengiriman: faker.date.recent(),
        },
      });
    }),
  );

  // Create PAP
  const papKonten = kontens.filter((k) => k.tipe === JenisKonten.PAP);
  const papList = await Promise.all(
    papKonten.map((konten) =>
      prisma.pap.create({
        data: {
          id_konten: konten.id_konten,
          id_lens: faker.helpers.arrayElement(lenses).id_lens,
          tipe: faker.commerce.productAdjective(),
          durasi: faker.number.int({ min: 5, max: 300 }),
        },
      }),
    ),
  );

  // Create Chat
  const chatKonten = kontens.filter((k) => k.tipe === JenisKonten.CHAT);
  await Promise.all(
    chatKonten.map((konten) =>
      prisma.chat.create({
        data: {
          id_konten: konten.id_konten,
          pesan: faker.lorem.sentence(),
        },
      }),
    ),
  );

  // Create 50 Add-On
  const addons = await Promise.all(
    papList.map((pap) =>
      prisma.addOn.create({
        data: {
          id_pap: pap.id_pap,
          first_x: faker.number.int({ min: 0, max: 100 }),
          last_x: faker.number.int({ min: 100, max: 200 }),
          first_y: faker.number.int({ min: 0, max: 100 }),
          last_y: faker.number.int({ min: 100, max: 200 }),
        },
      }),
    ),
  );

  // Create 50 Caption / Overlay
  await Promise.all(
    addons.map((addon) =>
      Math.random() > 0.5
        ? prisma.caption.create({
            data: {
              id_add_on: addon.id_add_on,
              teks: faker.lorem.words(),
              font_style: faker.helpers.arrayElement([
                "bold",
                "italic",
                "normal",
              ]),
            },
          })
        : prisma.overlay.create({
            data: {
              id_add_on: addon.id_add_on,
              nama: faker.color.human(),
            },
          }),
    ),
  );
}

main()
  .then(() => {
    console.log("✅ Seeding done.");
    return prisma.$disconnect();
  })
  .catch((e) => {
    console.error("❌ Error during seeding:", e);
    return prisma.$disconnect();
  });
