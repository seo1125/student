create table STUDENT_TBL_03(
    SNO varchar2(6) primary key,
    SNAME varchar2(10),
    SPHONE varchar2(15),
    SGENDER varchar2(4),
    SADDRESS varchar2(60)
);

insert into STUDENT_TBL_03 values ('10101', '김행복', '010-1111-1111', 'M', '서울 동대문구 휘경1동');
insert into STUDENT_TBL_03 values ('10102', '이춘복', '010-1111-3333', 'F', '서울 동대문구 휘경2동');
insert into STUDENT_TBL_03 values ('10103', '장믿음', '010-1111-4444', 'M', '을릉군 을릉읍 독도1리');
insert into STUDENT_TBL_03 values ('10104', '최사랑', '010-1111-5555', 'F', '을릉군 을릉읍 독도2리');
insert into STUDENT_TBL_03 values ('10105', '진평화', '010-1111-6666', 'M', '제주도 제주시 외나무골');
insert into STUDENT_TBL_03 values ('10106', '차공단', '010-1111-7777', 'M', '제주도 제주시 감나무골');

create table exam_tbl_03(
    SNO varchar2(6) primary key,
    EKOR number(4),
    EMATH number(4),
    EENG number(4),
    EHIST number(4)
);

insert into exam_tbl_03 values ('10101', 98, 91, 95, 90);
insert into exam_tbl_03 values ('10102', 87, 89, 92, 82);