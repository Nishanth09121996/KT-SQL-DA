SELECT 
    ms.monthdate,
    ms.salesamount,
    ms2.monthdate AS PreviousMonth,
    ms2.salesamount AS previoussalesamount
FROM
    interviewquestion.monthly_sales ms
        LEFT JOIN
    interviewquestion.monthly_sales ms2 ON ms.MonthDate = DATE_ADD(ms2.MonthDate,
        INTERVAL 1 MONTH);
-- -----------------------------------------------------------

SELECT 
    e.employee_id,
    e.employee_name,
    e.manager_id,
    m.employee_name AS managerName
FROM
    interviewquestion.employee e
        LEFT JOIN
    interviewquestion.employee m ON e.manager_id = m.employee_id;
select * from interviewquestion.student s ;
