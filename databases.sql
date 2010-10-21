DROP TABLE IF EXISTS example;

CREATE TABLE example (
  note VARCHAR(20),
  value CHAR(1)
);

-- MySQL: FAIL
INSERT INTO example VALUES ('one byte:',    'a');
INSERT INTO example VALUES ('two bytes:',   'ã');
INSERT INTO example VALUES ('three bytes:', 'の');
INSERT INTO example VALUES ('four bytes:',  '沿');
SELECT * FROM example;
DELETE FROM example;

-- WIN
SET NAMES 'utf8';
ALTER TABLE example CONVERT TO CHARACTER SET utf8 COLLATE utf8_bin;

INSERT INTO example VALUES ('one byte:',    'a');
INSERT INTO example VALUES ('two bytes:',   'ã');
INSERT INTO example VALUES ('three bytes:', 'の');
INSERT INTO example VALUES ('four bytes:',  '沿');
SELECT * FROM example;
SELECT * FROM example WHERE value = 'ã';
