SELECT * FROM bank_loan_data;

SELECT COUNT(id) AS Total_Loan_Applications FROM bank_loan_data;

SELECT COUNT(id) AS MTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date)= 2021;

SELECT COUNT(id) AS Previous_MTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date)= 2021;

#Loan Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data;

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date)= 2021;

#total Payment
SELECT SUM(total_payment) AS Total_Amount_Recevied FROM bank_loan_data;

SELECT SUM(total_payment) AS MTD_Total_Amount_Recevied FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date)= 2021;

SELECT SUM(total_payment) AS Previous_MTD_Total_Amount_Recevied FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date)= 2021;


#AVG Intrest Rate

SELECT ROUND(AVG(int_rate),3) *100 AS Avg_Int_Rate FROM bank_loan_data;

SELECT ROUND(AVG(int_rate),3) *100 AS MTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date)= 2021;

SELECT ROUND(AVG(int_rate),4) *100 AS MTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date)= 2021;

#AVG DTI
SELECT ROUND(AVG(dti),4) *100 AS Avg_Int_Rate FROM bank_loan_data;

SELECT ROUND(AVG(dti),3) *100 AS Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date)= 2021; 

SELECT ROUND(AVG(dti),3) *100 AS Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date)= 2021;

#Loan Status
SELECT  loan_status FROM bank_loan_data;

#GOOD LOAN PERCENTAGE
SELECT 
      (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
      /
      COUNT(id) AS Good_loan_percentage
      FROM bank_loan_data;
      
#GOOD LOAN APPLICATION
SELECT COUNT(id) AS Good_Loan_Application FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';
      
   #GOOD LOAN FUNDAMENT   
SELECT SUM(loan_amount) AS Good_Loan_FUNDED_AMOUNT FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

#GOOD LOAN AMOUNT RECEIVED 
SELECT SUM(total_payment) AS Good_Loan_RECEIVED_AMOUNT FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current' ;

#BAD LOAN  
SELECT
 (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0)
      /
      COUNT(id) AS Bad_loan_percentage
      FROM bank_loan_data;
      
      #BAD LOAN
SELECT COUNT(id) AS Bad_Loan_Application FROM bank_loan_data
WHERE loan_status = 'Charged Off';

#BAD LOAN AMOUNT
SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off';   

#BAD LOAN AMOUNT RECEVIED
SELECT SUM(total_payment) AS Bad_Loan_Amount_Recevied FROM bank_loan_data
WHERE loan_status = 'Charged Off';   

SELECT 
  loan_status,
  COUNT(id) AS Total_Loan_Applications,
  SUM(total_payment) AS Total_Amount_Recevied,
  SUM(loan_amount) AS Total_Funded_Amount,
  AVG(int_rate *100) AS Interest_Rate,
  AVG(dti *100) AS DTI
FROM 
  bank_loan_data
GROUP BY
  loan_status;
  
SELECT 
  loan_status,
  SUM(total_payment) AS MTD_Total_Amount_Recevied,
  SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM 
  bank_loan_data
WHERE MONTH(issue_date) =12
GROUP BY
  loan_status;
     
SELECT
   MONTH(issue_date ) AS Month_Number,
   DATE_FORMAT(issue_date,"%M") AS Month_Name,
   COUNT(id) AS Total_Loan_Applications,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Total_Recevied_Amount
   FROM
   bank_loan_data
	GROUP BY 
    MONTH(issue_date),
    DATE_FORMAT(issue_date,"%M")
    ORDER BY MONTH(issue_date); 
   
   #REGIONAL ANALYSIS BY STATE 
   SELECT
   address_state,
   COUNT(id) AS Total_Loan_Applications,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Total_Recevied_Amount
   FROM
   bank_loan_data
GROUP BY 
    address_state
    -- ORDER BY address_state #address state order by
     -- ORDER BY  SUM(loan_amount)  DESC    #maximum total funded amount
        ORDER BY COUNT(id)  DESC  ;          #maximum loan application
    
    
    #LOAN TERM QUERY
SELECT
   term,
   COUNT(id) AS Total_Loan_Applications,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Total_Recevied_Amount
   FROM
   bank_loan_data
GROUP BY 
    term
ORDER BY term;

#BY USING EMPLOYEE NAME
SELECT
   emp_length,
   COUNT(id) AS Total_Loan_Applications,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Total_Recevied_Amount
   FROM
   bank_loan_data
GROUP BY 
    emp_length
ORDER BY COUNT(id) DESC;

#LOAN PURPOSE BREAKDOWN QUERY
SELECT
   purpose,
   COUNT(id) AS Total_Loan_Applications,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Total_Recevied_Amount
   FROM
   bank_loan_data
GROUP BY 
    purpose
ORDER BY COUNT(id) DESC;

#Home Ownership
SELECT
   home_ownership,
   COUNT(id) AS Total_Loan_Applications,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Total_Recevied_Amount
   FROM
   bank_loan_data
   WHERE grade = 'A' AND address_state = 'CA'
GROUP BY 
    home_ownership
ORDER BY COUNT(id) DESC;

