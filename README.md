# Financial-Loan-Using-Power-Bi-and-SQL-
# Overview
This project presents an in-depth analysis of bank loan data using Power BI. The report includes various insights into loan applications, funded amounts, interest rates, and debt-to-income (DTI) ratios. The aim is to provide a comprehensive overview of loan performance and facilitate data-driven decision-making.

# Key Features
* **Total Loan Applications**  : Analysis of the total number of loan applications.
* **Funded Amounts**: Insights into the total funded amounts and their distribution across different categories.
* **Interest Rates**: Average interest rates across various loan statuses and grades.
* **DTI Ratios**: Analysis of debt-to-income ratios to assess borrower risk.
* **Loan Status Breakdown**: Segmentation of loans into categories such as Charged Off, Current, and Fully Paid.

# Highlighted DAX Formulas
* **Total Loan Applications**: SUM(LoanData[Total Loan Application])
* **Total Funded Amount**: SUM(LoanData[Funded Amount])
* **Average Interest Rate**: AVERAGE(LoanData[Interest Rate])
* **Average DTI**: AVERAGE(LoanData[DTI])
* **MTD (Month-to-Date) Funded Amount**: CALCULATE(SUM(LoanData[Funded Amount]), DATESMTD('Date'[Date]))
* **MTD (Month-to-Date) Received Amount**: CALCULATE(SUM(LoanData[Amount Received]), DATESMTD('Date'[Date]))
* **YTD (Year-to-Date) Funded Amount**: CALCULATE(SUM(LoanData[Funded Amount]), DATESYTD('Date'[Date]))
* **YTD (Year-to-Date) Received Amount**: CALCULATE(SUM(LoanData[Amount Received]), DATESYTD('Date'[Date]))
* **Total Loan Applications by Status**: CALCULATE(SUM(LoanData[Total Loan Application]), LoanData[Status] = "Fully Paid")
* **Average Interest Rate by Loan Status**: CALCULATE(AVERAGE(LoanData[Interest Rate]), LoanData[Status] = "Charged Off")

# Dashboard Highlights
* **Total Loan Applications**: 38.6K applications with a Month-to-Date (MTD) increase of 4.3K.
* **Total Funded Amount**: $435.8M with a 13.0% MTD increase.
* **Total Amount Received**: $473.1M with a 15.8% MTD increase.
* **Average Interest Rate**: 12.0% with a 3.5% MTD increase.
* **Average DTI**: 13.3% with a 2.7% MTD increase.

# Detailed Analysis
* **Loan Status Distribution**: Breakdown of loan statuses including Charged Off, Current, and Fully Paid.
* **Funded Amount by Month**: Visualization of funded amounts on a monthly basis.
* **Funded Amount by State and Term**: Analysis of how funded amounts vary by state and loan term.
* **Funded Amount by Employment Length and Purpose**: Insights into loan amounts based on employment duration and loan purpose.
* **Good vs. Bad Loans**: Classification of loans into good and bad categories based on performance metrics.
* **Interest Rate Trends**: Analysis of interest rate trends over time and across different loan statuses.
* **Borrower Risk Analysis**: Detailed examination of borrower risk profiles using DTI ratios and loan performance.
* **Loan Purpose Breakdown**: Segmentation of loans based on the purpose of the loan, such as debt consolidation, home improvement, etc.
* **Repayment Analysis**: Insights into loan repayment patterns and timelines.
* **Default Analysis**: Examination of factors contributing to loan defaults, including borrower demographics and loan characteristics.

# Tools
* **Power BI Desktop**: For data visualization and report creation.
* **SQL**: For data extraction and preprocessing.
* **Excel**: For initial data analysis and manipulation.
  
# Screenshot
![bank loan Summary ss](https://github.com/user-attachments/assets/71c40990-230a-4d8d-97a7-6b84a79a9105)


![bank loan Overview ss](https://github.com/user-attachments/assets/bb461120-93a2-44d5-8bcf-c2e8a5b94765)


![bank loan detail ss](https://github.com/user-attachments/assets/e9d01b83-44f7-4be7-8d1b-1d57e9652556)



