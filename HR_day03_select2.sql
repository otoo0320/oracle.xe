/*
������ ����Ͽ� �� ����
    WHERE ���� ����Ͽ� ��ȯ�Ǵ� ���� ������
    select�� ����� �ҷ��� ������ �� where ������ �����ϴ� �����͸� �ҷ��´�
    
    WHRER
    ������ �����ϴ� ������ query�� ������
    �� ���� ���
    -���̸�
    -�� ����
    -�� �̸�, ��� �Ǵ� �� ����Ʈ
*/

-- WHERE �� ���
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90;

/*
���ڿ� �� ��¥
    ���ڿ� �� ��¥ ���� ���� ����ǥ�� ���´�
    ���� ���� ��ҹ��ڸ� �����ϰ� ��¥ ���� ������ ������
    �⺻ ��¥ ǥ�� ������ DD-MON-RR��
*/
SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'Whalen';

SELECT last_name
FROM employees
WHERE 1= 1And hire_date = '03/06/17'

/* 
�� ������
    Ư�� ǥ������ �ٸ����̳� ǥ���İ� ���ϴ� ���ǿ��� ����
    
    = ����
    > ���� ŭ
    >= ���� ũ�ų� ����
    < ���� ����
    <= ���� �۰ų� ����
    BETWEEN ... AND ...    �� �� ����(��谪 ����)
    IN(set)                �� ����Ʈ �� ��ġ�ϴ� �� �˻�
    LIKE                   ��ġ�ϴ� ���� ���� �˻�
    IS NULL                NULL ������ ����
*/

-- �� ������ ���
SELECT last_name, salary
FROM employees
WHERE salary <= 3000;

-- BETWEEN �����ڸ� ����ϴ� ���� ����
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500;

-- IN �����ڸ� ����ϴ� �������
SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201);

/*
LIKE �����ڸ� ����Ͽ� ���� ��ġ
    LIKE �����ڸ� ����Ͽ� ��ȿ�� �˻� ���ڿ� ���� ��ü ���� �˻��� ������
    �˻����ǿ��� ���ͷ� ���ڳ� ���ڰ� ���Ե� �� ����
        - %�� 0�� �̻��� ���ڸ� ��Ÿ��
        - _�� �� ���ڸ� ��Ÿ��
*/
SELECT first_name
FROM employees
WHERE first_name lIKE '%a%';

-- ��ü ���� ����
SELECT last_name
FROM employees
WHERE last_name LIKE '_o%';

-- ESCAPE �ĺ���(like ���� _�� �ƴ϶� �׳� ���ڶ�� ���� _�� \_�� ����)
SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%SA\_%' ESCAPE '\';

/*
NULL ���� ���
    IS NULL �����ڷ� null���� �ƴ��� Ȯ����
*/
SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

/* 
�� �����ڸ� ����Ͽ� ��������
    AND : ���� ��� ������ ��� ���� ��� TRUE ��ȯ
    OR : ���� ��� ���� �� �ϳ��� ���� ��� TRUE ��ȯ
    NOT : ������ ������ ��� TRUE�� ��ȯ
*/

--AND ������ ���
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000
AND job_id LIKE '%MAN%';

--OR ������ ���
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000
OR job_id LIKE '%MAN%';

--NOT ������ ���
SELECT last_name, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP');

/*
ORDER BY ��
    ORDER BY���� ����Ͽ� �˻��� ���� ������
    - ASC : ��������, �⺻��
    - DESC : ��������
    (�Ѵ� C�� ��������)
    SELECT���� �� �������� ��
*/
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;

--�������� ����
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC;

-- �� alias�� �������� ����
SELECT employee_id, last_name, salary*12 annsal
FROM employees
ORDER BY annsal

-- �� ���� ��ġ�� ����Ͽ� ����
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 3;]

--���� ���� �������� ����
SELECT last_name, job_id, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;