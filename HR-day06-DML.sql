DML (데이터 조작어)
    DML문은 다음과 같은 경우에 실행함
    - 테이블에 새 행 추가
    - 테이블의 기존 행 수정
    - 테이블에서 기존 행 제거
    
*/

/*
INSERT 문
    각 열에 대한 값을 포함하는 새 행을 삽입함
    
[기본형식]
    INSERT INTO 테이블명 (컬럼명1, 컬럼명2...)
    VALUES(값1, 값2...);
    
    또는
    
    INSERT INTO 테이블명  (컬럼명1, 컬럼명2...) subquery;
*/

INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (280, 'Public Relations', 100, 1700);

select * from departments;

ROLLBACK;

commit;

-- null 값을 가진 행 삽입 (열생략)
INSERT INTO departments (department_id, department_name)
VALUES(290, 'Purchasing');

--null 키워드 지정
INSERT INTO departments
VALUES(300, 'Finance', NULL, NULL);

commit;

/*
INSERT 문을 subquery로 작성
*/

--CREATE문으로 새로운 TABLE 만들기
CREATE TABLE sales_reps
AS (SELECT employee_id id, last_name name, salary, commission_pct
    FROM employees WHERE 1=2);
--select 뒤의 컬럼들을 열로 하는 테이블을 만들겠다는 뜻
DESC sales_reps;
select * from sales_reps;

INSERT INTO sales_reps (id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%';
--select로 먼저 데이터가 내가 넣을 데이터가 맞는지 확인부터 하고 insert실행하도록
rollback;
commit;

-- 테이블 삭제하는건 DROP TABLE 테이블명;

/*
UPDATE 문
    테이블의 기존 값을 수정함
    
[기본형식]
    UPDATE 테이블명
    SET 컬럼명1 = 수정값,
        컬럼명2 = 수정값 ....
    WHERE 조건절
*/

CREATE TABLE copy_emp
as SELECT * FROM employees WHERE 1=2;

INSERT INTO copy_emp
SELECT * FROM employees;

select * from copy_emp;
--내가 건들기 힘든 테이블 같은 경우 저렇게 복제 테이블을 만들어서 내맘대로 건들 수 있음

UPDATE copy_emp
SET department_id = 150
WHERE employee_id = 113;
--사원번호가 113인 사람의 부서 아이디를 50으로 바꿔라

SELECT * FROM employees
WHERE employee_id = 113;
-- update 하기 전에 이런식으로 확인 먼저 해야함

commit;

--다른 테이블을 기반으로 행 갱신
UPDATE copy_emp
SET department_id = (SELECT department_id
                        FROM employees
                        WHERE employee_id = 100)
WHERE job_id = (SELECT job_id
                FROM copy_emp
                WHERE employee_id = 114);

rollback;
commit;

/*
DELETE 문
    DELETE 문을 사용하여 테이블에서 기존 행을 제거할 수 있음
    이것도 select 다음 조건절 한번더 써서 먼저 확인하기!!
*/
DELETE FROM departments
WHERE department_id = 300;

SELECT * FROM departments
WHERE department_id = 300;

DELETE FROM copy_emp;
rollback;

/*
TRUNCATE 문
    테이블은 빈 상태로, 테이블 구조는 그대로 남겨둔채 테이블에서 모든 행을 제거함
    DML문이 아니라 DDL(데이터 정의어) 문이므로 쉽게 UNDO할 수 없음
    복구하기 어려움(롤백으로 안됌)
    쓰지말자..?
*/
TRUNCATE TABLE copy_emp;

/*
트랜잭션(Transaction)
    데이터 처리의 한 단위
    오라클에서 발생하는 여러 개의 SQL 명령문들을 하나의 논리적인 작업 단위로 처리하는데 이를 트랜잭션이라고 함

    COMMIT : SQL문의 결과를 영구적으로 DB에 반영
    ROLLBACK : SQL문의 실행결과를 취소
    SAVEPOINT : 트랜잭션의 한지점에 표시하는 임시 저장점
                (geometry dash 에 practice 버전 할 때 연두색 다이아몬드랑 같은거)
*/

SELECT * FROM sales_reps;
delete from sales_reps;

DESC sales_reps;

INSERT INTO sales_reps VALUES (1, '피카츄', 300, 0.1);
SAVEPOINT mypoint;
INSERT INTO sales_reps VALUES (1, '라이츄', 400, 0.2);
INSERT INTO sales_reps VALUES (1, '꼬부기', 130, 0.7);
INSERT INTO sales_reps VALUES (1, '파랑이', 270, 0.01);
--update 로 id 바꿔주기
ROLLBACK TO mypoint;
COMMIT;

/*
SELECT 문의 FOR UPDATE 절
쓰지말자! 괜히 잠궈서 일낼필요 없다
*/
SELECT employee_id, salary, commission_pct, job_id
FROM employees
WHERE job_id = 'SA_REP'
FOR UPDATE
ORDER BY employee_id;
--EMPLOYEES 테이블에서 job_id가 SA_REP인 행을 잠급니다
rollback;
