import numpy as np
import matplotlib.pyplot as plt

def parse(file_name):
	with open(file_name, "r") as f:
		content = f.readlines()
	data = []
	for i in range(len(content)):
		data.append(map(float, content[i].strip().split()))
	return data

def continuous(class_, feature, class_num):
	feature_list = []
	for i in range(len(class_)):
		feature_list.append(class_[i][feature-1])
	min_ = min(feature_list)
	max_ = max(feature_list)
	avg_ = np.average(feature_list)
	median_ = np.median(feature_list)
	std_ = np.std(feature_list)
	print ("class: %d\n feature: %d\n min: %f\n max: %f\n avg: %f\n median: %f\n std: %f\n") % (class_num, feature, min_, max_, avg_, median_, std_)
	

def cat01(class_, feature, class_num):
        values = []
        zeros = 0
        ones = 0
        for x in range(len(class_)):
                values.append(class_[x][feature-1])
        for x in values:
                if x == 0:
                        zeros+=1
                elif x == 1:
                        ones+=1
        print "Feature : " + str(feature)
        print "class : " + str(class_num)
        print "0 - " + str(zeros)
        print "1 - " + str(ones)

def cat123(class_, feature, class_num):
        values = []
        one = 0
        two = 0
        three = 0
        for x in range(len(class_)):
                values.append(class_[x][feature-1])
        for x in values:
                if x == 1:
                        one+=1
                elif x == 2:
                        two+=1
                elif x == 3:
                        three+=1
        print "Feature : " + str(feature)
        print "class : " + str(class_num)
        print "1 - " + str(one)
        print "2 - " + str(two)
        print "3 - " + str(three)

def cat1_14(class_, class_num, feature=5):
        values = []
        num = [0 for x in range(14)]
        for x in range(len(class_)):
                values.append(class_[x][feature-1])
        for x in values:
                if x == 1:
                        num[0]+=1
                elif x == 2:
                        num[1]+=1
                elif x == 3:
                        num[2]+=1
                elif x == 4:
                        num[3]+=1
                elif x == 5:
                        num[4]+=1
                elif x == 6:
                        num[5]+=1
                elif x == 7:
                        num[6]+=1
                elif x == 8:
                        num[7]+=1
                elif x == 9:
                        num[8]+=1
                elif x == 10:
                        num[9]+=1
                elif x == 11:
                        num[10]+=1
                elif x == 12:
                        num[11]+=1
                elif x == 13:
                        num[12]+=1
                elif x == 14:
                        num[13]+=1
        print "Feature : " + str(feature)
        print "class : " + str(class_num)
        for x in range(len(num)):
                print str(x+1) + " - " + str(num[x])

def cat1_9(class_, class_num, feature=6):
        values = []
        num = [0 for x in range(9)]
        for x in range(len(class_)):
                values.append(class_[x][feature-1])
        for x in values:
                if x == 1:
                        num[0]+=1
                elif x == 2:
                        num[1]+=1
                elif x == 3:
                        num[2]+=1
                elif x == 4:
                        num[3]+=1
                elif x == 5:
                        num[4]+=1
                elif x == 6:
                        num[5]+=1
                elif x == 7:
                        num[6]+=1
                elif x == 8:
                        num[7]+=1
                elif x == 9:
                        num[8]+=1
        print "Feature : " + str(feature)
        print "class : " + str(class_num)
        for x in range(len(num)):
                print str(x+1) + " - " + str(num[x])

class0 = []
class1 = []

data = parse("australian.dat")

for i in range(len(data)):
	if data[i][-1] == 0.0:
		class0.append(data[i])
	if data[i][-1] == 1.0:
		class1.append(data[i])

#print cat1_14(class0, 5, 0)

plt.bar([0.25, 0.50, 0.75, 1., 1.25, 1.5, 1.75, 2, 2.25], [8, 2, 3, 173, 25, 0, 3, 87, 6], 0.2)

plt.xticks([0.25+0.2/2, 0.50+0.2/2, 0.75+0.2/2, 1.+0.2/2, 1.25+0.2/2, 1.5+0.2/2, 1.75+0.2/2, 2+0.2/2, 2.25+0.2/2],  ('1', '2', '3', '4', '5', '6', '7', '8', '9') )


plt.show()

'''
continuous(class0, 2, 0)
continuous(class1, 2, 1)
continuous(class0, 3, 0)
continuous(class1, 3, 1)
continuous(class0, 7, 0)
continuous(class1, 7, 1)
continuous(class0, 10, 0)
continuous(class1, 10, 1)
continuous(class0, 13, 0)
continuous(class1, 13, 1)
continuous(class0, 14, 0)
continuous(class1, 14, 1)
'''
