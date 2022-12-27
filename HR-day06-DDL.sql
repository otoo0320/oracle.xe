/*
DDL(데이터 정의어)
    데이터 베이스 내의 객체(테이블, 시퀀스...)등을 생성하고 변경하고 삭제하기 위해 사용되는 SQL
*/

/*
CREATE TABLE 문
*/
CREATE TABLE dept(
    deptno NUMBER(6),
    dname VARCHAR2(200),
    loc VARCHAR2(200),
    create_date DATE DEFAULT SYSDATE
    );
    
DESC dept;
    
/*
데이터 유형
    VARCHAR2(size) 가변 길이 문자 데이터(4000)
    NUMBER(p, s) 가변 길이 숫자 데이터
    CHAR(size) 고정 길이 문자 데이터(2000)
    DATE 날짜 및 시간 값
    LONG 가변 길이 문자 데이터(최대 2GB)
    CLOB 문자 데이터(최대 4GB)
    RAW and LONG RAW 원시 이진 데이터(binary 값)
    BLOB 바이너리 데이터(최대 4GB) -이진수값
    BFILE 외부 파일에 저장된 바이널 데이터(최대 4GB)
    ROWID 테이블에 있는 행의 고유한 주소를 나타내는 base-64
*/

--dept 테이블에 데이터 넣어주기
INSERT INTO dept
SELECT department_id, department_name, location_id, SYSDATE
FROM departments;

commit;

-- 테이블 복사하기
CREATE TABLE dept2 AS SELECT * FROM dept;

select * from dept2;

--테이블 구조만 복사(1=2인 데이터가 없으므로 구조(컬럼)만 복사)
CREATE TABLE dept3 AS SELECT * FROM dept WHERE 1=2;

select * from dept3;
--확인용


/*
ALTER 문
    객체를 변경할 때 사용
*/
CREATE TABLE simple(num NUMBER); --테이블 생성

DESC simple;
ALTER TABLE simple ADD(NAME VARCHAR2(3));
ALTER TABLE simple MODIFY(name VARCHAR2(30));
ALTER TABLE simple DROP COLUMN name;

ALTER TABLE simple ADD(addr VARCHAR2(50));
ALTER TABLE simple DROP(addr);

select * from simple;

/*
제약조건(Constraint)
    테이블의 해당컬럼에 원하지 않는 데이터가 입력/수정/삭제 되는 것을 방지하기
    위에 테이블 생성 또는 변경시 설정하는 조건임(저장된 데이터의 신뢰성을 높이기 위해 사용)
    
    NOT NULL
        NULL로 입력이 되어서는 안되는 컬럼에 부여하는
        조건으로 컬럼 레벨에서만 부여할 수 있는 제약조건
    UNIQUE KEY(유일키)
        저장된 값이 중복되지 않고 오직 유일하게
        유지돼야 할 때 사용하는 제약조건
        (NULL은 허용됨)
    PRIMARY KEY(대표키/기본키)
        NOT NULL 조건과 UNIQUE KEY를 합친 조건
    CHECK
        조건에 맞는 데이터만 입력되도록 조건을 부여하는 제약조건
    FOREIGN KEY(외래키)
        부모 테이블의 PRIMARY KEY를 참조하는 컬럼에 붙이는 제약조건
*/

CREATE TABLE dept4(
    deptno NUMBER(2) CONSTRAINT dept4_deptno_pk PRIMARY KEY,
    dname VARCHAR2(15) DEFAULT '영업부',
    loc CHAR(1) CONSTRAINT dept4_loc_ck CHECK(loc in('1', '2'))
    );
--primarykey라는 제약을 deptno에 걸고
--default라는 조건을 dname에 검
--loc에는 1또는 2라는 값만 들어갈 수 있게 제약을 검

desc dept4;

INSERT INTO dept4 (deptno, dname, loc)
VALUES(1, '마켓팅', 2);
commit;

select * from dept4;

CREATE TABLE dept5(
deptno NUMBER(2) PRIMARY KEY
dname VARCHAR2(15) NOT NULL);

INSERT INTO dept5 (deptno, dname)
VALUES(1, 'QA');

CREATE TABLE emp(
empno NUMBER(4)PRIMARY KEY
ename 




+
SELECT * FROM DEPT5
VALUES)1, 'MINE', ':
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

-- 제약 조건은 수정 불가능, 삭제만 가능
ALTER TABLE dept4 DROP CONSTRAINT dept4_loc_ck;

-- 제약 조건 추가하기
ALTER TABLE dept4 ADD(CONSTRAINT dept4_loc2_ck CHECK(loc IN('1', '2'));

--


