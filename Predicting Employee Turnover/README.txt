This project analyzed a real dataset from 1454 employees across 199 organizations. Employees rated their turnover/attrition intentions, which was then dichotomized into "Intentions of Quitting" and "No intentions of quitting" for this project. Turnover intentions are then predicted from a variety of variables. Multiple methods are used, including KNN, Random Forest, and Logistic Regression. Due to class imbalance, an initial set of classification models were run, and then SMOTE was used to adress the imbalance. The models were then all refit on the adjusted dataset. Model comparison was conducted to select the best final model.
 * Logistic Regression models outperformed Random Forest and KNN models after using synthetic minority over-sampling to adjust class imbalance
 * See Turnover_Presentation PPT for results

Dataset from:
Yuan, S., Kroon, B., & Kramer, A. (2021). Building prediction models with grouped data: A case study on the prediction of turnover intention. Human Resource Management Journal.

 * IO_Level1_Data contains only level 1 (employee-level) predictors and was used for this analysis
 * IO_BothLevels contains both level 1 and level 2 (organization level) predictors and was not used 

Parts of SMOTE-related code adapated from:
https://rpubs.com/ZardoZ/SMOTE_FRAUD_DETECTION