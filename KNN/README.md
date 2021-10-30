
## Overview

### Script takes in dataframe and outputs line charts visualizing average KNN accuracy scores and error rates for each of a range of k-values. A (k-value range x # repetitions) matrix for accuracy scores (and another for error rates) is created, where "# repetitions" refers to a specified number of shuffled train/test splits. Accuracy scores/error rates are subsequently averaged over the shuffled repetitions and plotted against their respective k-values in the line chart. Cut-off lines are shown on both the error rate and accuracy rate plots denoting the 95% accuracy threshold.

## Quick Start

### The dataframe must have a numeric target variable, the name of which will need to be specified in the relevant code sections. The dataset used here is the "iris" dataset, with species recoded as (setosa = 0, versicolor = 1, virginica = 2). User must specify changes to range of k-values and/or number of train/test shuffle repetitions if desired (currently set to k-value range of 1:20 and 20 shuffles). Any changes made will also need to be made to the accuracy score/error rate matrix dimensions (# k-values x # shuffles), as well as the line plot range 

## Analysis

### K-values in the range of (k = 6:10) had the highest average accuracy scores (95.5 - 95.7%), but any k-value in the range of (k = 5:14) resulted in an average accuracy score of at least 95.0%, corresponding to an error rate of 5% or less. This indicates that choosing k-values from the extreme ends of the range (1:4, 15:20) has a detrimental effect upon the average accuracy of predictions made by the algorithm. K-values at the extreme ends of the spectrum possibly either overfit or underfit the data. Different train/test ratios could also be tested to see if accuracy scores associated with various k-values change. 

## Package Requirements

### scipy numpy pandas matplotlib seaborn sklearn pillow yellowbrick ipywidgets

## Sources/References

### https://stackabuse.com/k-nearest-neighbors-algorithm-in-python-and-scikit-learn/
