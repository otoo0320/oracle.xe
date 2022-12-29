/*
ROWID와 ROWNUM
    오라클에서 테이블을 생성하면 기본적으로 제공되는 컬럼이다,
    ROWID : ROW 고유의 아이디 (ROW를 수정해도 변하지 않음)
    ROWNUM : 행의 INDEX (ROW 삭제시 변경될 수 있음)
    
ROWID - 해당 데이터의 저장위치를 가리키는 요소라고 할 수 있다.
    오브젝트(테이블) 번호(6자리)
        해당 데이터가 속하는 오브젝트 번호
    상대 파일 번호 (3자리)
        테이블스페이스의 상대 파일번호를 의미하며, 각데이터별로 유일한 값을 가짐
    블록 번호 (6자리)
        파일 안에 어느 블록인지를 의미함
    데이터 번호 (3자리)
        데이터 번호는 블록별로 데이터가 저장되어 있는 순서를 뜻함
*/
--ROWNUM은 몇 열인지를 나타내줌(열번호)
SELECT *
FROM (
    SELECT ROWNUM, employee_id, first_name, last_name
    FROM employees;)
ORDER BY rno DESC
;

 SELECT ROWID, ROWNUM, employee_id, first_name, last_name
    FROM employees;

-- ROW의 개수를 알고싶다면? 셋다 가능
SELECT COUNT(*) FROM employees;
SELECT MAX(ROWNUM) FROM employees; -- 조금더 빠르다? (카더라)
SELECT COUNT(ROWNUM) FROM employees;



