CREATE VIEW VSAL
AS
  SELECT A.DEPTNO                  "DEPARTMENT",
         A.NUM_EMP / B.TOTAL_COUNT "EMPLOYEES",
         A.SAL_SUM / B.TOTAL_SAL   "SALARY"
  FROM   (SELECT DEPTNO,
                 COUNT()  NUM_EMP,
                 SUM(SAL) SAL_SUM
          FROM   SCOTT.EMP
          WHERE  CITY = 'NYC'
          GROUP  BY DEPTNO) A,
         (SELECT COUNT()  TOTAL_COUNT,
                 SUM(SAL) TOTAL_SAL
          FROM   SCOTT.EMP
          WHERE  CITY = 'NYC') B
;

INSERT ALL
  WHEN OTTL < 100000 THEN
    INTO SMALL_ORDERS
      VALUES(OID, OTTL, SID, CID)
  WHEN OTTL > 100000 AND OTTL < 200000 THEN
    INTO MEDIUM_ORDERS
      VALUES(OID, OTTL, SID, CID)
  WHEN OTTL > 200000 THEN
    INTO LARGE_ORDERS
      VALUES(OID, OTTL, SID, CID)
  WHEN OTTL > 290000 THEN
    INTO SPECIAL_ORDERS
SELECT O.ORDER_ID OID, O.CUSTOMER_ID CID, O.ORDER_TOTAL OTTL,
O.SALES_REP_ID SID, C.CREDIT_LIMIT CL, C.CUST_EMAIL CEM
FROM ORDERS O, CUSTOMERS C
WHERE O.CUSTOMER_ID = C.CUSTOMER_ID;