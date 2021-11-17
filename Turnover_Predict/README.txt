This project (ongoing work) analyzes a real dataset from 1454 employees across 199 organizations. Employees rated their turnover/attrition intentions, which was then dichotomized into "Intentions of Quitting" and "No intentions of quitting" for this project. Turnover intentions are then predicted from a variety of variables. Multiple methods are used, including KNN, Random Forest, and Logistic Regression. Due to class imbalance, an initial set of classification models were run, and then SMOTE was used to adress the imbalance. The models were then all refit on the adjusted dataset. Model comparison was conducted to select the best final model.
 * See Model_Comparison_Final for results

Dataset from:
Yuan, S., Kroon, B., & Kramer, A. (2021). Building prediction models with grouped data: A case study on the prediction of turnover intention. Human Resource Management Journal.

Parts of SMOTE-related code adapated from:
https://rpubs.com/ZardoZ/SMOTE_FRAUD_DETECTION