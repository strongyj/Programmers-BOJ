-- 코드를 입력하세요
WITH MOREFIVECARS AS 
(
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
    WHERE TO_CHAR(START_DATE, 'YYYYMM') BETWEEN '202208' AND '202210'
    GROUP BY CAR_ID
    HAVING COUNT(*) >= 5
)

SELECT EXTRACT(MONTH FROM A.START_DATE) MONTH, A.CAR_ID, COUNT(*) RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY A, MOREFIVECARS B
WHERE (TO_CHAR(A.START_DATE, 'YYYYMM') BETWEEN '202208' AND '202210') AND A.CAR_ID IN (B.CAR_ID)
GROUP BY EXTRACT(MONTH FROM A.START_DATE), A.CAR_ID
HAVING COUNT(*) > 0
ORDER BY MONTH, A.CAR_ID DESC;
