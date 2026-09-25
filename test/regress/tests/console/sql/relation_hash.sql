CREATE DISTRIBUTION ds1 COLUMN TYPES int hash;
CREATE RELATION r3 HASH murmur (i int);
CREATE RELATION old_r3 (i HASH murmur);
ALTER DISTRIBUTION ds1 ATTACH RELATION table1
  DISTRIBUTION KEY murmur [entity_type varchar, entity_id uinteger];
CREATE DISTRIBUTED RELATION app.hashed HASH FUNCTION city (i uinteger) IN ds1;

-- The column type must match the distribution column type.
CREATE RELATION invalid HASH murmur (i varchar);

CREATE DISTRIBUTION ds_text COLUMN TYPES varchar hash;
CREATE RELATION text_rel HASH murmur (s varchar) IN ds_text;
CREATE DISTRIBUTION ds_uuid COLUMN TYPES uuid hash;
CREATE RELATION uuid_rel HASH city (id uuid) FOR DISTRIBUTION ds_uuid;
SHOW RELATIONS;
DROP DISTRIBUTION ALL CASCADE;
