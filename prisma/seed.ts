import { PrismaClient } from "@prisma/client";
import { clients } from "../data/clients";

const prisma = new PrismaClient();

async function main() {
  const clientRecords = await prisma.client.createMany({
    data: clients,
  });
}

main()
  .catch((e) => {
    console.error(e.message);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
