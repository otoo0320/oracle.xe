/*
sql (structured query language)-구조적 질의 언어
     관계형 데이터베이스 시스템(RDBMS)에서 자료를 관리 및 처리하기 위해 설계된 언어
     
    select 문
    데이터베이스에서 정보 검색
    
*/

--모든 열 선택 *
SELECT *department_id, location_id
FROM departments;

/* 
산술식
    산술 연산자를 사용하여 숫자/날짜 데이터 표현식 작성
    
    +
    -
    *
    /
*/

--산술 연산자 사용
SELECT LAST_NAME, SALARY, SALARY + 300
FROM employees;

/* 
연산자 우선순위
        곱하기와 나누기는 더하기빼기보다 먼저 수행
*/

SELECT last_name, salary, 12*salary+100
FROM employees;

/*
산술식의 Null 값
     null값을 포함하는 산술식은 null로 계산
*/
SELECT last_name, 12*salary*commission_pct, salary, commission_pct
FROM employees;

/*
열 alias(별명) 정의
    열 머리글의 이름을 바꿉니다.
    계산에서 유용
    열 이름 바로 뒤에 나옴(열 이름과 alias사이에 선택 사항인 as 키워드가 올 수도 있음
    공백이나 특수 문자를 포함하거나 대소문자를 구분하는 경우 큰 따옴표가 필요함
*/

SELECT last_name AS name, commission_pct comm, salary*10 AS 급여
FROM employees;

 SELECT last_name AS Name, salary*12 AS "Annual_salary"
 FROM employees;
 
/* 연결 연산자||
        열이나 문자열을 다른열에 연결
        두 개의 세로선(||)으로 나타냄
        결과 열로 문자 표현식을 작성함
*/
SELECT last_name||job_id AS "Employees", last_name, job_id
 From employees;
 
/*
리터럴 문자열
    리터럴은 SELECT 문에 포함된 (변하지 않는)문자, 숫자, 또는 날짜임
    날짜 및 문자 리터럴 값은 작은 따옴표('')로 묶어야 함
    각 문자열은 반환되는 각 행에 한 번 출력됨
*/

SELECT last_name || ' is a ' || job_id AS "Employee Details"
 FROM employees;

 /*
대체 인용(q) ,연산자
    자신의 따옴표 구분자를 지정함
    구분자를 임의로 선택
    가독성 및 사용성이 증가함.
*/
 
SELECT department_name || q'[department's manager ID: ]' || manager_id
AS "Department and Manager"
From departments;
 
/*
중복행
    기본적으로 query 결과에는 중복 행을 포함한 모든행이 표시됨
    DISTINCT
    결과에서 중복행 제거
*/
--중복행
SELECT department_id
FROM employees;

-- 중복제거
SELECT DISTINCT department_id
FROM employees;

/* 
테이블 구조표시
    DESCRIBE 명령을 사용하여 테이블 구조를 표시
*/
DESCRIBE employees;

 
 
 
 