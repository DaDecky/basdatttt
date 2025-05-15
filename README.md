buat sql
```bash
pnpx prisma migrate diff   --from-empty   --to-schema-datamodel prisma/schema.prisma   --script > schema_output.sql
```
samain schema dengan database
```bash
pnpx prisma db push --force-reset
```
