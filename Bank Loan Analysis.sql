Select * from financial_loan1;

-- Total Loan Applications Submitted in the Bank
select count(id) as Total_Loan_Applications from financial_loan1;

-- Month to Date (MTD) Loan Applications
select count(id) as Total_Loan_Applications from financial_loan1 where month(issue_date )              =12;

-- Previous Month to Date (PMTD) Loan Applications
select count(id) as PMTD_Total_Loan_Applications from financial_loan1 where       month(issue_date ) =11;

-- Total Funded Amount by the Bank
select sum(loan_amount) as Total_Funded_Amount from financial_loan1;

-- Month To Date (MTD) Total Funded Amount
select sum(loan_amount) as MTD_Total_Funded_Amount from financial_loan1 where month(issue_date) = 12 and year(issue_date)=2021;

-- Previous Month to Date (PMTD) Total Funded Amount
select sum(loan_amount) as PMTD_Total_Funded_Amount from financial_loan1 where month(issue_date) = 11 and year(issue_date)=2021;

-- Total Amount Received( recovered) by the Bank 
select sum(total_payment) as Total_Amount_Collected from financial_loan1;

-- Month To Date (MTD) Total Amount Received
select sum(total_payment) as MTD_Total_Amount_Collected from financial_loan1 where month(issue_date) = 12 and year(issue_date)=2021;

-- Previous Month To Date (PMTD) Total Amount Received
select sum(total_payment) as PMTD_Total_Amount_Collected from financial_loan1 where month(issue_date) = 11 and year(issue_date)=2021;

-- Calculate Average Interest Rate applied by the bank on the loan
select round(avg(int_rate) * 100,3)  as Avg_Interest_Rate from financial_loan1;

-- MTD Average Interest Rate
select round(avg(int_rate) * 100,3)  as MTD_Avg_Interest_Rate from financial_loan1 where month(issue_date) = 12 and year(issue_date)=2021;

-- PMTD Average Interest Rate
select round(avg(int_rate) * 100,3)  as PMTD_Avg_Interest_Rate from financial_loan1 where month(issue_date) = 11 and year(issue_date)=2021;

-- Calculate average Debt to Interest percentage
select avg(dti) * 100 as Avg_DTI from financial_loan1;

-- MTD Avg DTI
select avg(dti) * 100 as MTD_Avg_DTI from financial_loan1 where month(issue_date) = 12 and year(issue_date)=2021;

-- PMTD Avg DTI
select avg(dti) * 100 as PMTD_Avg_DTI from financial_loan1 where month(issue_date) = 11 and year(issue_date)=2021;


-- GOOD LOAN ISSUED (The loan that is fully or mostly recovered by the bank)

-- Good Loan Percentage from overall loan 
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM financial_loan1;

-- Good Loan Applications
select count(id) as Good_Loan_Applications from financial_loan1 where loan_status = 'Fully Paid' or loan_status = 'Current';

-- Good Loan Funded Amount
select sum(loan_amount) as Good_Loan_Funded_Amount from financial_loan1 where loan_status = 'Fully Paid' or loan_status = 'Current';

-- Good Loan Amount Received
select sum(total_payment) as Good_Loan_Received_Amount from financial_loan1 where loan_status = 'Fully Paid' or loan_status = 'Current';

-- BAD LOAN ISSUED ( the loan in which recovery rate is poor)

-- Bad Loan Percentage from the overall loan 
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off'  THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM financial_loan1;

-- Bad Loan Applications
select count(id) as Bad_Loan_Applications from financial_loan1 where loan_status = 'Charged Off';

-- Bad Loan Funded Amount
select sum(loan_amount) as Bad_Loan_Funded_Amount from financial_loan1 where loan_status = 'Charged Off';

-- Bad Loan Amount Received
select sum(total_payment) as Bad_Loan_Received_Amount from financial_loan1 where loan_status = 'Charged Off';

-- Total Loan Applications , Total Funded Amount , Total Funded Amount, Interest rate and Dti grouped by  LOAN STATUS
select 
loan_status,
count(id) as Total_Loan_Applications,
sum(total_payment) as Total_Amount_Received,
sum(loan_amount) as Total_Funded_Amount,
avg(int_rate *100) as Interest_Rate,
avg(dti*100) as DTI
from 
financial_loan1
group by loan_status;

select 
loan_status,
sum(total_payment) as MTD_Total_Amount_Received,
sum(loan_amount) as MTD_Total_Funded_Amount
from 
financial_loan1
where month(issue_date) = 12
group by loan_status;

-- MONTH
select
month(issue_date) as Month_Number,
monthname(issue_date)as Month_Name,
count(id) as Total_Loan_Application,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Received
from financial_loan1
group by month(issue_date),monthname(issue_date)
order by month(issue_date);

-- Total Loan Applications , Total Funded Amount , Total Funded Amount, Interest rate and Dti grouped by STATE
select
address_state as State,
count(id) as Total_Loan_Application,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Received
from financial_loan1
group by address_state
order by address_state;

-- Total Loan Applications , Total Funded Amount and  Total Funded Amount grouped by TERM
SELECT 
	term as Term , 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan1
GROUP BY term
ORDER BY term;

-- Total Loan Applications , Total Funded Amount and  Total Funded Amount grouped by EMPLOYEE LENGTH
SELECT 
	emp_length as Employee_Length , 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan1
GROUP BY emp_length
ORDER BY emp_length;

-- Total Loan Applications , Total Funded Amount and  Total Funded Amount grouped by PURPOSE
SELECT 
	purpose as Purpose , 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan1
GROUP BY purpose
ORDER BY purpose;


-- Total Loan Applications , Total Funded Amount and  Total Funded Amount grouped by financial_loan1HOME OWNERSHIP
SELECT 
	home_ownership as Home_Ownership , 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan1
GROUP BY home_ownership
ORDER BY home_ownership



