## Repo Overview

This repo is the central db management/migration project. It uses Prisma to build and manage the schema.

## Local dev

Rename the .env.sample to .env and update the values

### Start Docker

Use the docker desktop app

### Start docker compose

```
docker compose -f compose-dev.yaml up
```

### Start ngrok

```bash
ngrok start --all
```

`ngrok tcp 5432`
Remeber to update retool resource when restarting

### Reset the db

```
npx prisma migrate reset --skip-seed
```

### Common commands

npx prisma migrate reset
npx prisma migrate reset --skip-seed
npx prisma migrate dev
