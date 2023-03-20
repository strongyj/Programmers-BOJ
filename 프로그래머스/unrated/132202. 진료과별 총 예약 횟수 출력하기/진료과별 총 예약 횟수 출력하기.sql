-- 코드를 입력하세요
SELECT MCDP_CD "진료과코드", COUNT(MCDP_CD) "5월예약건수"
FROM APPOINTMENT 
WHERE TO_CHAR(APNT_YMD, 'YYYYMM') = '202205'
GROUP BY MCDP_CD
ORDER BY COUNT(MCDP_CD), MCDP_CD;