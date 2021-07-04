-- CreateTable
CREATE TABLE "Person" (
    "personId" SERIAL NOT NULL,
    "fatherId" INTEGER NOT NULL,
    "motherId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "notes" TEXT NOT NULL,

    PRIMARY KEY ("personId")
);

-- CreateTable
CREATE TABLE "Marriages" (
    "marriageId" SERIAL NOT NULL,
    "husbandId" INTEGER NOT NULL,
    "wifeId" INTEGER NOT NULL,
    "notes" TEXT NOT NULL,

    PRIMARY KEY ("marriageId")
);

-- CreateTable
CREATE TABLE "Association" (
    "relationshipId" SERIAL NOT NULL,
    "persion1Id" INTEGER NOT NULL,
    "persion2Id" INTEGER NOT NULL,
    "notes" TEXT NOT NULL,

    PRIMARY KEY ("relationshipId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Person.fatherId_motherId_unique" ON "Person"("fatherId", "motherId");

-- CreateIndex
CREATE UNIQUE INDEX "Person_fatherId_unique" ON "Person"("fatherId");

-- CreateIndex
CREATE UNIQUE INDEX "Person_motherId_unique" ON "Person"("motherId");

-- AddForeignKey
ALTER TABLE "Person" ADD FOREIGN KEY ("fatherId") REFERENCES "Person"("personId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Person" ADD FOREIGN KEY ("motherId") REFERENCES "Person"("personId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Marriages" ADD FOREIGN KEY ("husbandId") REFERENCES "Person"("personId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Marriages" ADD FOREIGN KEY ("wifeId") REFERENCES "Person"("personId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Association" ADD FOREIGN KEY ("persion1Id") REFERENCES "Person"("personId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Association" ADD FOREIGN KEY ("persion2Id") REFERENCES "Person"("personId") ON DELETE CASCADE ON UPDATE CASCADE;
