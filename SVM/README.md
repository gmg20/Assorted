
### Quick Start
This script generates random clusters according to pre-set specifications and uses a k-means elbow visualizer to determine the "best" k-value based on the elbow method and disortion values, and then runs a k-means cluster algorithm to group the data points by cluster using an expectation-maximization algorithm. K-value input into the cluster algorithm can be changed based on user specification, but should be chosen in accordance with the elbow method and the plot output by the Elbow Visualizer. Accuracy is then calculated using the y_true values and visualized in the form of a confusion matrix. The predicted cluster indices, along with the cluster centroids, are plotted next to the "true" cluster indices (as created by the original make_blobs cluster creation). Package dependencies are listed in the requirements.txt file.

### Which K best?
The best k-value, as determined by the Elbow Visualizer, was k=4

### Best K Accuracy
The accuracy score for the k-means cluster algorithm when using k=4 was 100% (see confusion matrix for visualization)

### Confusion Matrix Using Best K-value (K = 4)
![Confusion Matrix](/K-Means/CM.png)
