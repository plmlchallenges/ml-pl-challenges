This repository includes three types of CSV files:
1.	<LanguageName>-acc.csv
2.	<LanguageName>_recorded.csv
3.	<LanguageName>_times.csv
********************************************
<LanguageName>-acc.csv
Each row in this file indicates the information related to a Stack Overflow question with the following features:
•	Includes <machine-learning> tag 
•	Includes a keyword related to this programming language in the title, body, or tags
•	Has more than threescore

The columns in this file respectively represent:
1.	Post ID
2.	
3.	Post Type: as the type of our posts is “question”, the value for this column is one for all rows.
4.	Creation Time of the post
5.	Number of Answers for this post
6.	Accepted Answer ID: The question owner can choose one of the answers the question has got, as the most helpful answer under the title “accepted answer”
7.	Accepted Answer Creation Time
8.	Post Tags
9.	Post Score
10.	ML Phase: The ML phases that this question is concerning. Based on our paper, the ML life cycle consists of 7 phases; Model Requirement (MR), Data Collection & Preprocessing (DCP), Feature Processing (FP), Model Building (MB), Model Evaluation (ME), Model Deployment (MD), Model Monitoring (MM). Label “all” represents the question is associated with all ML phases, and “No” shows the question is unrelated to the ML life cycle.
11.	The Programming Languages that this question is related to.
12.	The Programming Languages this question is not related to, but their keyword is included in the question’s title, body, or tag
13.	Accepted Answer Time (Hour): the time (hours) it has taken that the question got the accepted answer. (time difference between Question Creation Time and Accepted Answer Creation Time )
 **************************************
<LanguageName>_recorded.csv
This file is the modification of the “<LanguageName>-acc.csv” file.  As each question can get multiple ML labels, in this file, we repeated each question according to the number of its labels, but each time with one of them. 
**************************************
<LanguageName>_times.csv
This file is a modification of the file “<LanguageName>_recorded.csv”. In this file, we only consider the questions with accepted answers. Besides, we eliminated the questions which contain the <LanguageName> keyword and are not related to that language (based on the 12th column of <LanguageName>-acc.csv)
