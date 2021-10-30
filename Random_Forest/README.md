### Group 11 RandomForest_HW5

### Annie Winston: winstonan20@students.ecu.edu, Isaiah Wells: wellsi19@students.ecu.edu, Gordon Goodwin: goodwing20@students.ecu.edu

### Quick Start

This script analyzes the breast cancer dataset from sklearn and performs two general functions:

 1) Hyperparameters tuned and features selected using RandomizedSearchCV and SelectFromModel (see below for details)
 2) Uses RandomForestClassifier to predict (classify) breast cancer status and calculate accuracy (see below for details)

### Hyperparameters/Features Selected:
 
 * Number of estimators/trees -> 100
 * Min samples required for split -> 5
 * Min samples required per leaf -> 4
 * Max features considered (Auto/Sqrt) -> Sqrt
 * Features selected -> worst area, worst concave points

 ### Accuracy and Accuracy Ratio

 * Accuracy = 96.5%
 * Accuracy/# Features = 48.25%


### Dependencies

numpy sklearn pandas scipy
