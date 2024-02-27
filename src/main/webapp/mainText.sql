*main
CREATE TABLE "MAIN" (
	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"SUBJECT" VARCHAR2(100 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"HIT" NUMBER(*,0) DEFAULT 0, 
	"GOOD" NUMBER(*,0) DEFAULT 0, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"GUP" NUMBER(*,0), 
	"CATEGORY" VARCHAR2(20 BYTE), 
	"ID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "MAIN_PK" PRIMARY KEY ("IDX")
);

*maincomment
CREATE TABLE "MAINCOMMENT" (
	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"GUP" NUMBER(*,0), 
	 CONSTRAINT "MAINCOMMENT_PK" PRIMARY KEY ("IDX")
);

*register
CREATE TABLE "REGISTER" (
	"ID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"PW" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"NICK" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "REGISTER_PK" PRIMARY KEY ("ID")
);



*�ӽÿ� �ڵ�
DELETE FROM register;
DROP SEQUENCE register_idx_seq;
CREATE SEQUENCE register_idx_seq;

INSERT INTO register (id, pw, name, nick, email) VALUES ('hong', '1111', 'ȫ�浿', 'gildong', 'a@a.com');
INSERT INTO register (id, pw, name, nick, email) VALUES ('lim', '2222', '�Ӳ���', 'kkeokjeong', 'b@b.com');
INSERT INTO register (id, pw, name, nick, email) VALUES ('jang', '3333', '����', 'gilsan', 'c@c.com');
INSERT INTO register (id, pw, name, nick, email) VALUES ('ill', '4444', '������', 'jimae', 'd@d.com');

select * from register;


DELETE FROM main;
DROP SEQUENCE main_idx_seq;
CREATE SEQUENCE main_idx_seq;

INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '1��', '1�� �Դϴ�.', 1, '���1', 'hong');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '2��', '2�� �Դϴ�.', 2, '���2', 'lim');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '3��', '3�� �Դϴ�.', 3, '���3', 'jang');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '4��', '4�� �Դϴ�.', 4, '���4', 'ill');

select * from main;


DELETE FROM maincomment;
DROP SEQUENCE maincomment_idx_seq;
CREATE SEQUENCE maincomment_idx_seq;

INSERT INTO maincomment (idx, name, content, gup) VALUES (main_idx_seq.nextval, 'lim', '�����մϴ�2', 1);
INSERT INTO maincomment (idx, name, content, gup) VALUES (main_idx_seq.nextval, 'jang', '�����մϴ�3', 2);
INSERT INTO maincomment (idx, name, content, gup) VALUES (main_idx_seq.nextval, 'ill', '�����մϴ�4', 3);
INSERT INTO maincomment (idx, name, content, gup) VALUES (main_idx_seq.nextval, 'hong', '�����մϴ�1', 4);

select * from maincomment;


