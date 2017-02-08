Advances in Data Mining:
------------------------

# Motto

> It is a capital mistake to theorize before one has data.
> Sherlock Holmes

> Data should be at the heart of strategic decision making in businesses, whether they are huge multinationals or small family-run operations. Data can provide insights that help you answer your key business questions. Data leads to insights; business owners and managers can turn those insights into decisions and actions that improve the business. This is the power of data.
> Bernard Marr http://www.forbes.com/sites/bernardmarr/2016/06/14/data-driven-decision-making-10-simple-steps-for-any-business/#cbeb217283cd

# Syllabus

* Introduction to data exploration 
* Linear regression
* [Classification]
* k-nearest neighbors algorithm 
* Receiver Operating Characteristic (ROC) and other techniques
* PCA and other techniques of feature selection
* Decision trees
* Linear discriminant analysis, Quadratic discriminant analysis
* Naive Bayes classifier
* Support Vector Machines
* Neural Networks, deep learning
* Belief Based Gaussian Modelling
* [Clustering]
* Hierarchical Clustering
* k means, Partitioning Around Medoids
* [Scaling]
* Principal Component Analysis
* MultiDimensional Scaling
* Association Rules

Meetings
--------
mainly Fridays

* 7.X - 4 hours, s. 219 Faculty of MINI
* 14.X - 2 hours
* 21.X - 4 hours
* 28.X - 2 hours
* 4.XI - [Part 1 - project 1] - 4 hours
* 10.XI Thursday - 4 hours
* 18.XI - [Part 2 - project 1] - 2 hours
* 25.XI - 2 hours
* 2.XII - [Part 3 - project 1] - 4 hours
* 9.XII - 2 hours
* 16.XII - [Part 1 - project 2] - 4 hours
* 21.XII Wednesday - [Part 2 - project 2] - 2 hours
* 13.I - [Additional projects presentation], [any questions about 2nd project] - 4 hours
* 20.I - [Final: additional project reports, presentations], [any questions about 2nd project] - 4 hours, lecture: 11_reduction.Rmd
* 27.I - 12:30-14 [Final meeting at Copernicus Science Center http://www.kopernik.org.pl/en/ - bussiness presentations of 2nd projects] - 2 hours
* 30.I 4:30-5:30 pm, room 556  - additional questions, grading 

Projects:
---------

You may work on projects in a group of 2-4 people. You cannot work with same person in both projects.
You will present your results during classes, but you should submit your solution to GitHub before classes.
Projects that are not presented will not be scores. 
Al least 50% of the team is required to be present during the project presentation.

1. Project - Classification

2. Project - Clustering

Grade:
------

Final grade will be based on points from projects (each project is for 60 points, which means 15+20+25 points for each phase of the project) and 10 homeworks (each home work is for 4 points), and final test 40 points.

**Instead of homeworks and final test you can do additional project, please talk with your teacher. The points for the additional project is 60.**

Homeworks:
----------
There will be some home works after some classes (around 10 home works).
Each correct solution gives you 4 points.
Home works have to be done personally. No group work here!
Home works have to be submitted to github not later than 1 week after announcement.

How to cope with challenges in your code:
-----------------------------------------

1. Go carefully through your code
2. Put instructions in proper order (make a sequence)
3. Make your code clean
4. Search any clues in google, e.g. stack overflow, R-bloggers, quick-R
5. Ask your friends, try to do group work and brainstorming
6. If you still have even more problems, write to the lecturer, but with a precise instruction what is wrong and clean code
7. Please respect my time

More remarks:

* Usually in training sets you should have target variable if it is supervised learning, e.g. classification
* Please send (make a pull request with) only *RMD, *R files
* file names of your homework: homework - number - initials (or nick, but I should know about you identity)
* Always some up with written conclusions
* Drive conclusions about the data and plots
* More plots and less number, especially big tables of numbers 
* When you show numbers, try to put plots to visualise this data directly after them
* Often when you remove outliers, the plot is nicer
* Avoid statments: "it can be seen easily..”? In reports there cannot be any statements that are not data driven especially when it is easy to show the reasoning.

Using git repo:
---------------

http://www.cheat-sheets.org/saved-copy/git-cheat-sheet.pdf
how to make a pull request tutorial: https://github.com/yangsu/pull-request-tutorial

useful instructions: `git clone`, `git status`, `git add`, `git commit -m "..."`, `git push origin branch-name`, `git pull ...`

Instruction to make a pull request with your homework:

1. fork the repo from github/awroble/DataMining
2. `git clone` to your local repo
3. `git status` - you can always check the state of your local repo
4. `git branch "name-of-the-branch"`
5. `git checkout "name-of-the-branch"`
6. `git add any-files`
7. `git commint -m "your-comment"`
8. `git push -u origin "name-of-your-branch"`
9. `git push`
10. make pull request from you repo at github to the source repo (github/awroble)
