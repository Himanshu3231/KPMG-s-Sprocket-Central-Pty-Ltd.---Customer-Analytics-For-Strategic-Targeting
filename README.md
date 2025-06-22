# KPMG's Sprocket Central Pty Ltd. – Customer Analytics for Strategic Targeting

## 📊 Project Overview

This self-initiated project replicates and expands upon the KPMG Virtual Internship Case Study hosted by Forage, using publicly available datasets from Kaggle. The objective was to analyze historical customer behavior, generate a data-backed Ideal Customer Profile (ICP), and recommend the top 1000 high-potential new customers for targeted marketing.

---

## 🎯 Objective

To identify and profile 1000 new potential customers most aligned with historically valuable segments, helping Sprocket Central Pty Ltd. focus their marketing efforts for maximum ROI.

---

## 🔧 Tools & Technologies

- **SQL** (MySQL Workbench)
- **Microsoft Excel** (for data cleaning & preparation)
- **Pandas / Python** (optional extensions)
- **Data Visualization** (Excel charts / external dashboards if required)

---

## 🗂️ Repository Structure

| File/Folder Name | Description |
|------------------|-------------|
| `Customer_Address KPMG.xlsx` | Cleaned customer address dataset |
| `Customer_Demographics KPMG.xlsx` | Cleaned historical customer demographic dataset |
| `Transaction Dataset KPMG.xlsx` | Transaction data from historical customers |
| `New_Customer_List KPMG.xlsx` | Demographics and "Value" scores of potential new customers |
| `KPMG_VI_New_raw_data_update_final.xlsx` | Original raw datasets before cleaning |
| `Customer Segmentation and Demographics.sql` | SQL scripts to segment customers by age, gender, and wealth tier |
| `High Value Customer Analysis.sql` | SQL query to generate high-value customer profiles |
| `Highest Total Spending Customer Analysis From Transaction Dataset.sql` | Identifies customers with the highest total transaction value |
| `Highest Average Spending Customer Analysis.sql` | Identifies customers with highest average spend |
| `Frequently Purchasing Customer Analysis From Transaction Dataset.sql` | Identifies the most frequent buyers |
| `New Customers Analysis Based on New Customer Value Score.sql` | SQL script to extract top 1000 new customers by value score |
| `KPMG's Sprocket Central Pty Ltd Dataset Analysis Report.docx` | Full project report summarizing insights, EDA, profiling, and final recommendations |
| `README.md` | This documentation file |

---

## 🔍 What I Did

✅ **Data Cleaning (Excel)**  
- Cleaned 4 datasets (20,000+ rows), fixing 2,500+ missing or inconsistent values  
- Standardized columns (dates, gender, wealth segments, product info)

✅ **SQL-Based Analysis**  
- Executed 20+ SQL queries to:
  - Identify high-value historical customers
  - Segment customers by demographics and industries
  - Compare historical profiles with new customers

✅ **Customer Profiling**  
- Built an **Ideal Customer Profile (ICP)** using historical data  
- Profile included: Age (35+), Wealth Segment (Mass, HNW), Industry (Financial Services, Manufacturing), Gender (slight Female lead)

✅ **New Customer Targeting**  
- Ranked new customers using provided `Value` score  
- Validated score with custom metric (Avg. Spend × Purchase Frequency) — 85%+ correlation  
- Recommended top 1000 new customers matching the ICP

✅ **Final Deliverables**  
- Report of key strategic insights for campaign targeting  
- Clean SQL scripts for reuse and audit  
- Reusable Excel datasets for further modeling or visualization

---

## 🧠 Key Learnings

- Mastered end-to-end data analysis process: **Data Collection → Cleaning → SQL Analysis → Insight Generation → Business Recommendation**
- Gained confidence in **SQL** for customer segmentation, profiling, and pattern discovery
- Understood how **business logic** and **data** combine to drive real-world decisions

---

## 💡 Use Cases

- Entry-level analytics portfolio project  
- Customer segmentation & profiling case study  
- SQL practice for analyzing real-world business datasets  
- Demonstrating data storytelling for business strategy

---

## 📌 Author

**Himanshu Kumar**  
📧 ds.himanshu.kumar@gmail.com  
🔗 [LinkedIn](http://www.linkedin.com/in/himanshukumar3231) | [GitHub](https://github.com/himanshu3231)

---

## 📝 Disclaimer

This project is **self-initiated** for learning purposes. It is based on the original problem statement and datasets provided in the **KPMG Data Analytics Virtual Internship** on Forage, but was completed independently using publicly available files. This repository is not affiliated with KPMG or Forage.

---

## 📁 License

This repository is intended for **educational and non-commercial use** only.
