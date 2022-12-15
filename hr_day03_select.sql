/*
sql (structured query language)-������ ���� ���
     ������ �����ͺ��̽� �ý���(RDBMS)���� �ڷḦ ���� �� ó���ϱ� ���� ����� ���
     
    select ��
    �����ͺ��̽����� ���� �˻�
    
*/

--��� �� ���� *
SELECT *department_id, location_id
FROM departments;

/* 
�����
    ��� �����ڸ� ����Ͽ� ����/��¥ ������ ǥ���� �ۼ�
    
    +
    -
    *
    /
*/

--��� ������ ���
SELECT LAST_NAME, SALARY, SALARY + 300
FROM employees;

/* 
������ �켱����
        ���ϱ�� ������� ���ϱ⻩�⺸�� ���� ����
*/

SELECT last_name, salary, 12*salary+100
FROM employees;

/*
������� Null ��
     null���� �����ϴ� ������� null�� ���
*/
SELECT last_name, 12*salary*commission_pct, salary, commission_pct
FROM employees;

/*
�� alias(����) ����
    �� �Ӹ����� �̸��� �ٲߴϴ�.
    ��꿡�� ����
    �� �̸� �ٷ� �ڿ� ����(�� �̸��� alias���̿� ���� ������ as Ű���尡 �� ���� ����
    �����̳� Ư�� ���ڸ� �����ϰų� ��ҹ��ڸ� �����ϴ� ��� ū ����ǥ�� �ʿ���
*/

SELECT last_name AS name, commission_pct comm, salary*10 AS �޿�
FROM employees;

 SELECT last_name AS Name, salary*12 AS "Annual_salary"
 FROM employees;
 
/* ���� ������||
        ���̳� ���ڿ��� �ٸ����� ����
        �� ���� ���μ�(||)���� ��Ÿ��
        ��� ���� ���� ǥ������ �ۼ���
*/
SELECT last_name||job_id AS "Employees", last_name, job_id
 From employees;
 
/*
���ͷ� ���ڿ�
    ���ͷ��� SELECT ���� ���Ե� (������ �ʴ�)����, ����, �Ǵ� ��¥��
    ��¥ �� ���� ���ͷ� ���� ���� ����ǥ('')�� ����� ��
    �� ���ڿ��� ��ȯ�Ǵ� �� �࿡ �� �� ��µ�
*/

SELECT last_name || ' is a ' || job_id AS "Employee Details"
 FROM employees;

 /*
��ü �ο�(q) ,������
    �ڽ��� ����ǥ �����ڸ� ������
    �����ڸ� ���Ƿ� ����
    ������ �� ��뼺�� ������.
*/
 
SELECT department_name || q'[department's manager ID: ]' || manager_id
AS "Department and Manager"
From departments;
 
/*
�ߺ���
    �⺻������ query ������� �ߺ� ���� ������ ������� ǥ�õ�
    DISTINCT
    ������� �ߺ��� ����
*/
--�ߺ���
SELECT department_id
FROM employees;

-- �ߺ�����
SELECT DISTINCT department_id
FROM employees;

/* 
���̺� ����ǥ��
    DESCRIBE ������ ����Ͽ� ���̺� ������ ǥ��
*/
DESCRIBE employees;

 
 
 
 