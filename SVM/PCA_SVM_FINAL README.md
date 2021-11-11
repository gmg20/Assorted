### PCA_SVM Model: Classification of digits

This script utilizes PCA, RandomizedSearchCV, and SVC methods to reduce dimensionality, identify optimal hyperparameters, and evaluate classification accuracy of digits from the sklearn digits dataset via the following steps:

1) PCA
  * identify optimal number of principal components that will balance feature reduction with information retention (80%)
  * transform dataset into reduced dimensionality dataset in accordance with the PCs identified

2) RandomizedSearchCV
  * Hyperparameter tuning to identify "best" hyperparameters for linear, polynomial, and radial basis function kernels
  * 1000 iterations with 3 CV folds

3) SVM
  * Use SVC models with "best" hyperparameters for linear, polynomial, rbf kernels to predict test dataset 
  * Evaluate model accuracy via use of classification accuracy reports and confusion matrices
  * Determine which kernel performed best

### Hyperparameters selected for each kernel type:
 * Polynomial: Best params: {'C': 99.43994146727952, 'degree': 3, 'gamma': 16.4147752764111, 'kernel': 'poly'}
 * Linear: Best params: {'C': 0.28047450087842485, 'gamma': 12.703203686996483, 'kernel': 'linear'}
 * RBF: Best params: {'C': 718.020261898835, 'gamma': 0.05346463133614199, 'kernel': 'rbf'}
 
### Test set accuracy scores for each kernal type with "best" hyperparameters:

#### *Polynomial Kernel*

![Accuracy Score](/SVM/acc_poly.png)

![Confusion Matrix](/SVM/cm_poly.png)


#### *Linear Kernel*

![Accuracy Score](/SVM/acc_linear.png)

![Confusion Matrix](/SVM/cm_linear.png)


#### *RBF Kernel*

![Accuracy Score](/SVM/acc_rbf.png)

![Confusion Matrix](/SVM/cm_rbf.png)

### Summary/Conclusions

 * The polynomial kernel (C = 99.44, degree = 3, gamma = 16.41) performed best, with a test set accuracy score of 96.85%
 * The linear kernel wasn't too far behind (95.56% accuracy)
 * The rbf kernel performed well when classifying most digits, but had very low precision (13%) when classifying a digit as '3'