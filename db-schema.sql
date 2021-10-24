CREATE TABLE IF NOT EXISTS places(
  "geonameid" INT,
  "name" TEXT,
  "asciiname" TEXT,
  "alternatenames" TEXT,
  "latitude" TEXT,
  "longitude" TEXT,
  "feature class" TEXT,
  "feature code" TEXT,
  "country code" TEXT,
  "cc2" TEXT,
  "admin1 code" TEXT,
  "admin2 code" TEXT,
  "admin3 code" TEXT,
  "admin4 code" TEXT,
  "population" TEXT,
  "elevation" TEXT,
  "dem" TEXT,
  "timezone" TEXT,
  "modification date" TEXT
);
CREATE TABLE IF NOT EXISTS alternatePlaces(
  "alternateNameId" INT,
  "geonameid" INT,
  "isolanguage" TEXT,
  "alternate name" TEXT,
  "isPreferredName" TEXT,
  "isShortName" TEXT,
  "isColloquial" TEXT,
  "isHistoric" TEXT,
  "from" TEXT,
  "to" TEXT, 
  FOREIGN KEY ("geonameid") REFERENCES `places` (`geonameid`) ON DELETE CASCADE ON UPDATE NO ACTION
);
CREATE INDEX IF NOT EXISTS  `placeNameIndex` ON `places` (`name`);
CREATE TABLE IF NOT EXISTS missing(id int);
