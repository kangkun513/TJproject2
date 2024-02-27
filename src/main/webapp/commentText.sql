DELETE FROM boardcomment;
DROP SEQUENCE boardcomment_idx_seq;
CREATE SEQUENCE boardcomment_idx_seq;

select * from boardcomment order by idx desc;