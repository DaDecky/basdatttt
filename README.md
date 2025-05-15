buat sql
```bash
pnpx prisma migrate diff   --from-empty   --to-schema-datamodel prisma/schema.prisma   --script > schema_output.sql
```
samain schema dengan database
```bash
pnpx prisma db push --force-reset
```
.env
```bash
DATABASE_URL="mysql://fakeruser:fakerpass@localhost:3306/fakerdb"
```
docker
```
docker compose down
docker compose up -d
```

