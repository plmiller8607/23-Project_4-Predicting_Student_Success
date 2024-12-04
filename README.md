### **Project Title 4: Predictive Analysis of Student Performance**
# Overview 
The purpose of this project it to develop a predictive model to analyze and predict student 
performance using historical data. The goal is to identify features that influence 
student grades in high school using SQL and Colab.

# Dependencies
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, classification_report

# Usage 
•	Use SQL to load the CSVs into a database, merge, and redact the data, 
•	Use pandas to load the data from SQL into a DataFrame.
•	Drop rows with NaN and missing values.
•	Encode categorical variables (e.g., Gender, Hispanic/Latino, Ethnicity).
•	Standardize the “Mark” column (A=5, B=4, C=3, D=2, F=1)
•	Explore data and visualize using histograms
•	Split data into training and testing sets.

# Performance & Results
This machine model did fairly well in predicting students that achieved marks of 3 (grade letter C) 
or higher. It did not do as well identifying students with letter grades of D or F.  
The model showed the  feature that was highest rated in determining success is where a student attended 
elementary school for 8th grade. Interestingly, smaller elementary schools represented both the 
highest percentage of students obtaining scores of 4.5 or higher AND the highest percentage of 
students obtaining scores of 2 or lower in high school.

# License
This project is licensed under the MIT License - see the LICENSE file for details.
