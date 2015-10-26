import numpy as np
from sklearn import svm
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score, precision_score, recall_score
from sklearn.cross_validation import train_test_split

def parse(file_name):
	with open(file_name, "r") as f:
		content = f.readlines()
	data = []
	for i in range(len(content)):
		data.append(map(float, content[i].strip().split()))
	return data

X = []
y = []

data = parse("australian.dat")

for i in range(len(data)):
	X.append(data[i][:-1])
	y.append(data[i][-1])

print "Splitting data into train and test data..."
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.3)

print
print "Running SVM classifier..."
clf = svm.SVC(gamma = 5e-6)
clf.fit(X_train, y_train)
pred = clf.predict(X_test)

print "Confusion matrix:"
print confusion_matrix(y_test, pred)
print "Accuracy score:", accuracy_score(y_test, pred)
print "Precision score:", precision_score(y_test, pred)
print "Recall score:", recall_score(y_test, pred)

print
print "Running GaussianNB classifier..."
clf = GaussianNB()
clf.fit(X_train, y_train)
pred = clf.predict(X_test)

print "Confusion matrix:"
print confusion_matrix(y_test, pred)
print "Accuracy score:", accuracy_score(y_test, pred)
print "Precision score:", precision_score(y_test, pred)
print "Recall score:", recall_score(y_test, pred)
