run query pwsh

```pwsh
Get-Content .\query\0.sql | docker exec -i papchat_db mysql -u papchatuser -ppapchatpass -t papchatdb
```

push schema

```bash
pnpm db:push
```

seed

```bash
pnpm db:seed
```

studio (gui)

```bash
pnpm db:studio
```
