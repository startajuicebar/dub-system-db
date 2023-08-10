FROM node:14-alpine

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

RUN npm install --save-dev prisma

COPY . .

# CMD npx prisma migrate deploy