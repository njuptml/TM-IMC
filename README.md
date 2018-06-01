For different academic purposes, we develop two demo programs, and share the codes and datasets in the Github. 
The website is https://github.com/njuptml/tm-imc. Our codes are produced in the environment of Window 10 and MATLAB 2014.
Our codes have two functions: the demo_new and demo_predict. 



(1) demo_new:
This provides a general learning framework integrating text mining and Inductive Matrix Completion, 
and it is easy for users to develop their own tools on the basis of our codes.

Input:  text information of samples, text information of labels, and the sample-label association matrix. 

Output: model performance (Ratio and Relative Recovery Error values).
 
The steps are as follows: 

  1. Vector representation of sample and label text information is implemented by the Word2Vec tool.
  
     Install the Word2vec tool;
     Running Vector.py; 
     Get the corresponding vector file, such as GPCRvector.txt and GOvector.txt file.
	
  2. Running RemoveBlankDemo.java to remove blank lines from GPCR.txt and GO.txt. 
  
  3. Implement miFV algorithm to transform the multi-instance package into a Fisher vector(mifv need vlfeat toolkit);
	
  4. Run the demo_new.m , and get the model performance (Probability and Relative Recovery Error values).

      
	
(2) demo_predict_MF:

This provides the models for predicting the GO molecular functions of all 1674 GPCR proteins used in this paper, 
and the predictive scores can be obtained for each GPCR protein on each GO term.  

Input: the GPCR feature spaces, the GO feature spaces, and the GPCR-GO association matrix.

Output: the predictive scores of 1674 GPCR proteins on each GO molecular function term.

The steps are as follows: 
First, the GPCR-GO associations are randomly divided into three equal parts, where two of them are used for training and the remaining one part is for testing the model. 
The process is repeated three times to ensure that each association is tested exactly once.
Finally, all the predictive scores are saved in the predict_scores_MF.txt file.

Run the demo_predict_MF.m , and the results are saved in the predict_scores_MF.txt file.



(2) demo_predict_BP:

This provides the models for predicting the GO biological functions of all 1277 GPCR proteins used in this paper, 
and the predictive scores can be obtained for each GPCR protein on each GO term.

Input: the GPCR feature spaces, the GO feature spaces, and the GPCR-GO association matrix.

Output: the predictive scores of 1277 GPCR proteins on each GO molecular function term.

The steps are as follows: 
First, the GPCR-GO associations are randomly divided into three equal parts, where two of them are used for training and the remaining one part is for testing the model. 
The process is repeated three times to ensure that each association is tested exactly once. 
Finally, all the predictive scores are saved in the predict_scores_BP.txt file.

Run the demo_predict_BP.m , and the results are saved in the predict_scores_BP.txt file.

