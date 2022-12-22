/*
집합연산자
    SELECT 리스트의 표현식은 개수가 일치해야 함
    데이터 유형은 첫번째 query 데이터 유형과 일치해야 함
    UNION, UNION ALL, INTERSECT, MINUS
두 셀렉트 문을 더하거나 빼거나 교집합을 구할수 있음
*/

/*
UNION 연산자
    중복 행이 제거된 두 QUERY의 행(합집합)
많은 테이블들을 한 테이블에 다 정리하고 싶을때 씀(통계에서)
*/

SELECT employee_id, job_id
FROM employees
UNION
SELECT employee_id, job_id
FROM job_history;

--select 이용해서 중복행 찾아내보기(안됌)
SELECT employee_id
FROM employees
WHERE employee_id in (SELECT employee_id
                        FROM job_history);

--union all 은 중복된거 포함해서 그냥 합쳐버림
SELECT employee_id, job_id, department_id
FROM employees
UNION ALL
SELECT employee_id, job_id, department_id
FROM job_history
ORDER BY employee_id;

/*
INTERSECT 연산자
    두 QUERY 의 공통적인 행(교집합)
*/
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

/*
주의! 
위의 연산자들을 쓸 땐 데이터 유형(select 하는 데이터)이 같아야 함(파일명이 아니라 데이터의 유형)
데이터 유형은 desc 테이블명 하면 볼 수 있음(숫자는 number 문자는 varchar)
*/
SELECT location_id, department_name "Department",
        TO_CHAR(3) "Warehouse location"
FROM departments
UNION
SELECT location_id, TO_CHAR(null) "Department",
        state_province
FROM locations;

DESCRIBE departments;
DESC departments;

/*
(SELECT 문 기본형식)
    SELECT 컬럼명1, 컬럼명2....                     5
    FROM 테이블명                                  1
    WHERE 조건절                                   2
    GROUP BY 컬럼명                                3
    HAVING 조건절                                  4
    ORDER BY 컬럼명[ASC|DESC] => 오름차순|내림차순   6
이때 컬럼명을 별칭으로 해서 쓰는 건 select랑 order by에만 쓸 수 있고 다른 연산자에는 안됨
*/
-- 이렇게 별칭을 where문에 쓰면 오류남
SELECT employee_id, first_name AS name
FROM employees
ORDER BY name DESC
WHERE name like '%a%';

