/*
한글은 인코딩 타입에 따라서 저장되는 값이 달라진다.
*/


/*
치환 변수
    - 단일 앰퍼센드(&) 및 이중 앰퍼샌드(&&) 치환을 사용 값 임시저장
    사용자가 원하는 값에 맞는 데이터를 골라서 뽑아낼수있음(본인이 원하는 id, 급여량 등을 직접 입력)
*/

/*
단일 앰퍼샌드 치환 변수 사용
    변수 앞에 & 붙이면 사용자가 값을 입력하게 할 수 있음
*/
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num;

/*
문자 및 날짜 값을 치환 변수로 지정
    날짜 값 및 문자 값에 대해 작은 따옴표를 붙여줘야함
*/
SELECT last_name, department_id, salary*12
FROM employees
WHERE job_id = '&job_title';

-- 열 이름, 표현식 및 텍스트 지정
SELECT employee_id, last_name, job_id, &column_name
FROM employees
WHERE &condition
ORDER BY &order_column;

/*
이중 앰퍼샌드 치환 변수 사용
    사용자가 매번 값을 입력할 필요 없이 재사용할 경우 '&&'사용함
*/
SELECT employee_id, last_name, job_id, &&column_name
FROM employees
ORDER BY &column_name;

/*
DEFINE 명령 사용
    DEFINE 명령 사용하여 변수 생성하고 값 할당함
    UNDEFINE 명령 사용하여 변수 제거
*/
DEFINE employee_num = 200

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num;

UNDEFINE employee_num;

/*
VERIFY 명령 사용
    VERIFY 명령을 사용하여 SQL developer가 
    치환 변수를 값으로 바꾸기 전후에 치환 변수의 표시를 토글함
*/
SET VERIFY ON
SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id = &employee_num;

/*
바인드 변수
    오라클에서 사용하는 변수
    치환변수보다 성능 좋음. 적극사용!!
    
    자바 개발자 JDBC
        --> STATEMENT  치환변수
        --> PREPARESTATMENT  바인드변수
        
        마이바티스
        --> #변수 명
*/
VAR  employee_num NUMBER

EXEC :employee_num :=200

SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id = :employee_num;







