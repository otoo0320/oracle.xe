/*
JOIN 
    조인은 여러 테이블의 정보를 보는 데 사용됨
    테이블을 조인하여 두 개 이상의 테이블에 있는 정보를 볼 수 있다.
*/

/*
Natural Join 생성
    두 테이블에서 데이터 유형과 이름이 일치하는 열을 기반으로 자동으로 테이블을 조인할 수 있다.
    예제에서는 locations이 join의 열쇠가 됨
    from이랑 natural join의 테이블이 바뀌어도 상관없음
*/
SELECT department_id, department_name, location_id, city, locations.state_province
FROM locations
NATURAL JOIN departments;

select * from departments;
SELECT * FROM locations;

/*
USING 절로 조인 생성
    Natural join 은 이름과 데이터 유형이 대응되는 모든 열을 사용하여 테이블 조인함
*/
SELECT employee_id, last_name, location_id, department_id
FROM employees JOIN departments
USING(department_id);

/*
중요!!!!!!!!!!
대부분 이렇게 씀
열(column) 이름이 달라도 on에서 매칭할 수 있음
가독성도 좋음(성향탐)
ON 절로 조인 생성
    ON 절을 사용하여 조인 조건을 지정
*/
SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

/*
on 절을 사용하여 3-way 조인 생성
사원 정보를 이용해 다른 테이블에서 열 들을 가져옴
*/
SELECT employee_id, city, department_name
FROM employees e
JOIN departments d
ON d.department_id = e.department_id
JOIN locations l
ON d.location_id = l.location_id;

-- 조인에 추가 조건 적용(여기서 추가조건은 where로 더해줌)
SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id, e.manager_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
WHERE e.manager_id = 149

/*
테이블 자체 조인
    on 절을 사용하는 self join
*/

SELECT worker.last_name emp, manager.last_name mgr
FROM employees worker JOIN employees manager
ON (worker.manager_id = manager.employee_id);

select * from employees;

/*
Nonequijoin
    Nonequijoin은 등호 연산자 외의 다른 연산자를 포함하는 조인 조건입니다.
    
    
CREATE TABLE job_grades (
grade 		CHAR(1),
lowest_sal 	NUMBER(8,2) NOT NULL,
highest_sal	NUMBER(8,2) NOT NULL
);
ALTER TABLE job_grades
ADD CONSTRAINT jobgrades_grade_pk PRIMARY KEY (grade);

INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);
COMMIT;
*/

--jobgrades의 월급 등급에 맞춰서 employees의 salary의 등급을 매겨줌
SELECT e.last_name, e.salary, j.grade_level
FROM employees e JOIN job_grades j
ON e.salary
        BETWEEN j.lowest_sal AND j.highest_sal;

select * from job_grades;

/*
INNER JOIN 과 OUTER JOIN
    INNER JOIN
        NATURAL JOIN, USING 또는 ON 절을 사용하여 테이블을 조인
        일치하지 않는 행은 출력에 표시되지 않음
        (위에서 한거)
    OUTER JOIN
        일치하지 않는 행도 반환(출력)함
*/

/*
LEFT OUTER JOIN
    DEPARTMENT 테이블에 대응되는 행이 없어도 왼쪽 테이블인 EMPLOYEES 테이블의 모든 행을 검색함
    데이터가 많은 행을 왼쪽에다가 놓는 게 좋음(left outer join 왼쪽)
*/
SELECT e.last_name, e.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON (e.department_id = d.department_id);
--left 가 기준이므로 employees를 기준으로 일단 다 보여주고 dep.id, dep.name의 데이터를 채워줌(없으면 null)

/*
RIGHT OUTER JOIN
    EMPLOYEES 테이블에 대응되는 행이 없어도 오른쪽 테이블인 DEPARTMENTS 테이블의 모든 행을 검색함
*/

SELECT e.last_name, e.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
ON (e.department_id = d.department_id);
 
/*
FULL OUTER JOIN
    DEPARTMENTS, EMPLOYEES 대응되는 행이 없어도
    테이블의 모든행을 검색함
*/
SELECT e.last_name, e.department_id, d.department_name
FROM employees e FULL OUTER JOIN departments d
ON (e.department_id = d.department_id);

/*
Cartesian Product
    조인 조건이 잘못되거나 완전히 생략 된 경우 결과는 모든 행 조합이 표시되는 cartesian product로 나타남
*/

/*
cross join 생성
    cross join 절은 두 테이블의 교차 곱을 생성함
    join 조건을 잘못 걸었을때 발생함
*/
SELECT last_name, department_name
FROM employees
CROSS JOIN departments;





















