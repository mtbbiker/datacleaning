---
title: "Codebook"
author: "Eugene Terblanche"
date: "2015-10-19"
output:
  html_document:
    keep_md: yes
---

## Project Description
This project creates a subset of the training and testing data that was recorded from the experiment to record activity data for 30 subjects. The Signal data was ignored as the project only requires that the measured data should be cleaned and presented.

##Study design and data processing

###Collection of the raw data
The initial raw data was collected from the Accelerometer and gyroscope from subjects (19-48 years) wearing a smartphone (samsung Galaxy SII). Each person performed the following activities:
1. Walking.
2. Walking a flight od stairs.
3. Walking down a flight of stairs.
4. Sitting stationary
5. Laying down

The dataset created by this project is a combination (merged) set of the testing and the training data.

###Notes on the original (raw) data 
The original data sample was grouped in a training (70%) and a test set (30%). The orginal Signal data is omitted for this project as we are only interested in the measured data. 

##Creating the tidy datafile

###Guide to create the tidy data file
The following steps were completed (The ReadMe file also provide HowTo information):

1. The data set was downloaded from the link provided. The data was extracted to a newly created Project Directory.
2. R Studio was used to create a Project and an R script in this directory. The working directory was set to the project directory. Please se the Notes regarding the OS(Linux) this was tested on.
3. An R file to extract and tidy the data was created and named "run_analysis.R"
4. Running the run_analysis completes STEP 1 - STEP 5 as per the project requirement.
5. The script merges, and cleans the data and writes the data to a new file - "avg_tidydata.txt"

###Cleaning of the data
1. The script start by setting the Data directory to where the data was extracted.
2. The libraries used in this script to tidy the data are loaded (dplyr)
3. The training dataset is then created by reading the "X_train.txt" and the "features" table is used as the column names. The Readme file was here used that states that each column is the "X_train.txt" corresponds to a variable as in the featues table.
4. The training activity table was created by reading the "y_train.txt" file. According to the ReadMe file from the original dataset this is the Activity for each measurement in the "X_train.txt" file. The column name was changed to activity.
5. The "features.txt" file is loaded in a dataset(features) - This produces a table with a list of all the variables.
6. STEP -1 from the requirements is then performed, the training and the testing data is merged (rbind() function was used) The labels from the training and testing datasets is also merged as welll as the subjects dataset.
7. The features dataset is now used to apply to the column names of the merged dataset. The subjects and the labels datasets is given new column (variable names).
8. The variables that has mean or std in their description and is extracted, this is now used in sub setting only the variables to be used from the merged dataset. STEP -2.
9. The activity values were replaced by the Activity Labels: ('Walking','Walking up stairs', 'Walking down stairs', 'Sitting', 'Standing', 'Laying') in the activity dataset. STEP -3.
10. The variables is then renamed for the merged dataset. STEP -4. 
11. STEP 5 from the project requirement is then completed by averaging each variable and writing the result to a text file. "avg_tidydata.txt"

##Description of the variables in the "avg_tidydata.txt" file

General description of the file including:
 - Dimensions: 83 variables and 35 observations
 - Summary of the data
 
 activity    subject      TimedomainBodyAccelerationmeanX TimedomainBodyAccelerationmeanY
 LAYING            :6   Min.   : 1.00   Min.   :0.2423                  Min.   :-0.03166               
 SITTING           :6   1st Qu.: 8.50   1st Qu.:0.2727                  1st Qu.:-0.01896               
 STANDING          :7   Median :16.00   Median :0.2759                  Median :-0.01768               
 WALKING           :6   Mean   :15.71   Mean   :0.2736                  Mean   :-0.01815               
 WALKING_DOWNSTAIRS:4   3rd Qu.:22.50   3rd Qu.:0.2771                  3rd Qu.:-0.01692               
 WALKING_UPSTAIRS  :6   Max.   :30.00   Max.   :0.2792                  Max.   :-0.01445               
                                                                                                       
 TimedomainBodyAccelerationmeanZ TimedomainGravityAccelerationmeanX TimedomainGravityAccelerationmeanY
 Min.   :-0.1183                 Min.   :0.4412                     Min.   :-0.350769                 
 1st Qu.:-0.1109                 1st Qu.:0.6464                     1st Qu.:-0.067810                 
 Median :-0.1088                 Median :0.6813                     Median : 0.002085                 
 Mean   :-0.1090                 Mean   :0.6751                     Mean   :-0.010878                 
 3rd Qu.:-0.1074                 3rd Qu.:0.7037                     3rd Qu.: 0.066294                 
 Max.   :-0.1010                 Max.   :0.9084                     Max.   : 0.200569                 
                                                                                                      
 TimedomainGravityAccelerationmeanZ TimedomainBodyAccelerationJerkmeanX TimedomainBodyAccelerationJerkmeanY
 Min.   :-0.27820                   Min.   :0.06861                     Min.   :-0.001372                  
 1st Qu.: 0.03295                   1st Qu.:0.07727                     1st Qu.: 0.004524                  
 Median : 0.06232                   Median :0.07886                     Median : 0.007304                  
 Mean   : 0.06841                   Mean   :0.07967                     Mean   : 0.008614                  
 3rd Qu.: 0.14069                   3rd Qu.:0.08182                     3rd Qu.: 0.012233                  
 Max.   : 0.26623                   Max.   :0.10590                     Max.   : 0.032078                  
                                                                                                           
 TimedomainBodyAccelerationJerkmeanZ TimedomainBodyAngularSpeedmeanX TimedomainBodyAngularSpeedmeanY
 Min.   :-0.032698                   Min.   :-0.07353                Min.   :-0.17216               
 1st Qu.:-0.007646                   1st Qu.:-0.04753                1st Qu.:-0.08332               
 Median :-0.003553                   Median :-0.02576                Median :-0.07444               
 Mean   :-0.005631                   Mean   :-0.02715                Mean   :-0.07671               
 3rd Qu.:-0.001159                   3rd Qu.:-0.01903                3rd Qu.:-0.06699               
 Max.   : 0.003645                   Max.   : 0.11961                Max.   :-0.04514               
                                                                                                    
 TimedomainBodyAngularSpeedmeanZ TimedomainBodyAngularAccelerationmeanX
 Min.   :-0.004648               Min.   :-0.11905                      
 1st Qu.: 0.084701               1st Qu.:-0.10546                      
 Median : 0.087284               Median :-0.09881                      
 Mean   : 0.085932               Mean   :-0.09759                      
 3rd Qu.: 0.096384               3rd Qu.:-0.08973                      
 Max.   : 0.109093               Max.   :-0.07311                      
                                                                       
 TimedomainBodyAngularAccelerationmeanY TimedomainBodyAngularAccelerationmeanZ
 Min.   :-0.05938                       Min.   :-0.07434                      
 1st Qu.:-0.04415                       1st Qu.:-0.05763                      
 Median :-0.04176                       Median :-0.05558                      
 Mean   :-0.04284                       Mean   :-0.05560                      
 3rd Qu.:-0.04012                       3rd Qu.:-0.05307                      
 Max.   :-0.03688                       Max.   :-0.04507                      
                                                                              
 TimedomainBodyAccelerationMagnitudemean TimedomainGravityAccelerationMagnitudemean
 Min.   :-0.9854                         Min.   :-0.9854                           
 1st Qu.:-0.6085                         1st Qu.:-0.6085                           
 Median :-0.5428                         Median :-0.5428                           
 Mean   :-0.5419                         Mean   :-0.5419                           
 3rd Qu.:-0.5143                         3rd Qu.:-0.5143                           
 Max.   : 0.1946                         Max.   : 0.1946                           
                                                                                   
 TimedomainBodyAccelerationJerkMagnitudemean TimedomainBodyAngularSpeedMagnitudemean
 Min.   :-0.99325                            Min.   :-0.9833                        
 1st Qu.:-0.70263                            1st Qu.:-0.6785                        
 Median :-0.65018                            Median :-0.6177                        
 Mean   :-0.64090                            Mean   :-0.6016                        
 3rd Qu.:-0.59914                            3rd Qu.:-0.5492                        
 Max.   :-0.06621                            Max.   :-0.1373                        
                                                                                    
 TimedomainBodyAngularAccelerationMagnitudemean FrequencydomainBodyAccelerationmeanX
 Min.   :-0.9943                                Min.   :-0.99450                    
 1st Qu.:-0.8134                                1st Qu.:-0.68461                    
 Median :-0.7859                                Median :-0.61952                    
 Mean   :-0.7614                                Mean   :-0.61688                    
 3rd Qu.:-0.7040                                3rd Qu.:-0.57958                    
 Max.   :-0.5439                                Max.   :-0.04146                    
                                                                                    
 FrequencydomainBodyAccelerationmeanY FrequencydomainBodyAccelerationmeanZ
 Min.   :-0.9824                      Min.   :-0.9865                     
 1st Qu.:-0.6051                      1st Qu.:-0.7326                     
 Median :-0.5485                      Median :-0.6843                     
 Mean   :-0.5290                      Mean   :-0.6631                     
 3rd Qu.:-0.4744                      3rd Qu.:-0.6299                     
 Max.   : 0.1231                      Max.   :-0.1986                     
                                                                          
 FrequencydomainBodyAccelerationmeanFreqX FrequencydomainBodyAccelerationmeanFreqY
 Min.   :-0.31917                         Min.   :-0.15308                        
 1st Qu.:-0.23726                         1st Qu.:-0.02263                        
 Median :-0.21243                         Median : 0.03604                        
 Mean   :-0.20959                         Mean   : 0.02073                        
 3rd Qu.:-0.18413                         3rd Qu.: 0.07263                        
 Max.   :-0.02094                         Max.   : 0.12808                        
                                                                                  
 FrequencydomainBodyAccelerationmeanFreqZ FrequencydomainBodyAccelerationJerkmeanX
 Min.   :-0.10784                         Min.   :-0.994117                       
 1st Qu.: 0.00420                         1st Qu.:-0.715484                       
 Median : 0.05028                         Median :-0.652023                       
 Mean   : 0.05474                         Mean   :-0.646034                       
 3rd Qu.: 0.08813                         3rd Qu.:-0.611146                       
 Max.   : 0.28697                         Max.   : 0.007745                       
                                                                                  
 FrequencydomainBodyAccelerationJerkmeanY FrequencydomainBodyAccelerationJerkmeanZ
 Min.   :-0.9888                          Min.   :-0.9906                         
 1st Qu.:-0.6956                          1st Qu.:-0.7955                         
 Median :-0.6294                          Median :-0.7656                         
 Mean   :-0.6189                          Mean   :-0.7413                         
 3rd Qu.:-0.5871                          3rd Qu.:-0.7069                         
 Max.   :-0.0429                          Max.   :-0.3882                         
                                                                                  
 FrequencydomainBodyAccelerationJerkmeanFreqX FrequencydomainBodyAccelerationJerkmeanFreqY
 Min.   :-0.219176                            Min.   :-0.3478                             
 1st Qu.:-0.095135                            1st Qu.:-0.2476                             
 Median :-0.038915                            Median :-0.2068                             
 Mean   :-0.030002                            Mean   :-0.2010                             
 3rd Qu.: 0.006708                            3rd Qu.:-0.1654                             
 Max.   : 0.263820                            Max.   : 0.1082                             
                                                                                          
 FrequencydomainBodyAccelerationJerkmeanFreqZ FrequencydomainBodyAngularSpeedmeanX
 Min.   :-0.29029                             Min.   :-0.9860                     
 1st Qu.:-0.16960                             1st Qu.:-0.7058                     
 Median :-0.11253                             Median :-0.6674                     
 Mean   :-0.11225                             Mean   :-0.6666                     
 3rd Qu.:-0.07941                             3rd Qu.:-0.6387                     
 Max.   : 0.12948                             Max.   :-0.2371                     
                                                                                  
 FrequencydomainBodyAngularSpeedmeanY FrequencydomainBodyAngularSpeedmeanZ
 Min.   :-0.9874                      Min.   :-0.9887                     
 1st Qu.:-0.7861                      1st Qu.:-0.7095                     
 Median :-0.7448                      Median :-0.6707                     
 Mean   :-0.7069                      Mean   :-0.6384                     
 3rd Qu.:-0.6302                      3rd Qu.:-0.6021                     
 Max.   :-0.4771                      Max.   :-0.1585                     
                                                                          
 FrequencydomainBodyAngularSpeedmeanFreqX FrequencydomainBodyAngularSpeedmeanFreqY
 Min.   :-0.24134                         Min.   :-0.37533                        
 1st Qu.:-0.14058                         1st Qu.:-0.23151                        
 Median :-0.10257                         Median :-0.16665                        
 Mean   :-0.10014                         Mean   :-0.16657                        
 3rd Qu.:-0.04414                         3rd Qu.:-0.09676                        
 Max.   : 0.02891                         Max.   : 0.07375                        
                                                                                  
 FrequencydomainBodyAngularSpeedmeanFreqZ FrequencydomainBodyAccelerationMagnitudemean
 Min.   :-0.212818                        Min.   :-0.99001                            
 1st Qu.:-0.088672                        1st Qu.:-0.65311                            
 Median :-0.048165                        Median :-0.58993                            
 Mean   :-0.046889                        Mean   :-0.58148                            
 3rd Qu.:-0.001057                        3rd Qu.:-0.52877                            
 Max.   : 0.101045                        Max.   :-0.02958                            
                                                                                      
 FrequencydomainBodyAccelerationMagnitudemeanFrequency FrequencydomainBodyBodyAccelerationJerkMagnitudemean
 Min.   :-0.06007                                      Min.   :-0.993006                                   
 1st Qu.: 0.03975                                      1st Qu.:-0.684158                                   
 Median : 0.08732                                      Median :-0.614818                                   
 Mean   : 0.09261                                      Mean   :-0.611856                                   
 3rd Qu.: 0.13274                                      3rd Qu.:-0.568708                                   
 Max.   : 0.32008                                      Max.   : 0.003827                                   
                                                                                                           
 FrequencydomainBodyBodyAccelerationJerkMagnitudemeanFrequency
 Min.   :0.0817                                               
 1st Qu.:0.1401                                               
 Median :0.1829                                               
 Mean   :0.1823                                               
 3rd Qu.:0.2132                                               
 Max.   :0.4287                                               
                                                              
 FrequencydomainBodyBodyAngularSpeedMagnitudemean FrequencydomainBodyBodyAngularSpeedMagnitudemeanFrequency
 Min.   :-0.9866                                  Min.   :-0.22082                                         
 1st Qu.:-0.7566                                  1st Qu.:-0.10931                                         
 Median :-0.7173                                  Median :-0.03615                                         
 Mean   :-0.6956                                  Mean   :-0.04249                                         
 3rd Qu.:-0.6326                                  3rd Qu.: 0.00961                                         
 Max.   :-0.3544                                  Max.   : 0.15472                                         
                                                                                                           
 FrequencydomainBodyBodyAngularAccelerationMagnitudemean
 Min.   :-0.9933                                        
 1st Qu.:-0.8382                                        
 Median :-0.8101                                        
 Mean   :-0.7813                                        
 3rd Qu.:-0.7148                                        
 Max.   :-0.5841                                        
                                                        
 FrequencydomainBodyBodyAngularAccelerationMagnitudemeanFrequency TimedomainBodyAccelerationstdX
 Min.   :-0.01339                                                 Min.   :-0.99504              
 1st Qu.: 0.07620                                                 1st Qu.:-0.66457              
 Median : 0.14588                                                 Median :-0.60559              
 Mean   : 0.13554                                                 Mean   :-0.60130              
 3rd Qu.: 0.19563                                                 3rd Qu.:-0.57448              
 Max.   : 0.37006                                                 Max.   : 0.07648              
                                                                                                
 TimedomainBodyAccelerationstdY TimedomainBodyAccelerationstdZ TimedomainGravityAccelerationstdX
 Min.   :-0.9794                Min.   :-0.98098               Min.   :-0.9933                  
 1st Qu.:-0.5792                1st Qu.:-0.69785               1st Qu.:-0.9732                  
 Median :-0.5314                Median :-0.64710               Median :-0.9665                  
 Mean   :-0.5024                Mean   :-0.61266               Mean   :-0.9653                  
 3rd Qu.:-0.4389                3rd Qu.:-0.55494               3rd Qu.:-0.9594                  
 Max.   : 0.2200                Max.   :-0.09352               Max.   :-0.9397                  
                                                                                                
 TimedomainGravityAccelerationstdY TimedomainGravityAccelerationstdZ TimedomainBodyAccelerationJerkstdX
 Min.   :-0.9848                   Min.   :-0.9813                   Min.   :-0.9940                   
 1st Qu.:-0.9604                   1st Qu.:-0.9502                   1st Qu.:-0.7002                   
 Median :-0.9564                   Median :-0.9418                   Median :-0.6355                   
 Mean   :-0.9550                   Mean   :-0.9401                   Mean   :-0.6297                   
 3rd Qu.:-0.9510                   3rd Qu.:-0.9286                   3rd Qu.:-0.5804                   
 Max.   :-0.9011                   Max.   :-0.8807                   Max.   : 0.0296                   
                                                                                                       
 TimedomainBodyAccelerationJerkstdY TimedomainBodyAccelerationJerkstdZ TimedomainBodyAngularSpeedstdX
 Min.   :-0.9892                    Min.   :-0.9920                    Min.   :-0.9870               
 1st Qu.:-0.6766                    1st Qu.:-0.8111                    1st Qu.:-0.7603               
 Median :-0.6100                    Median :-0.7816                    Median :-0.7151               
 Mean   :-0.5981                    Mean   :-0.7613                    Mean   :-0.7177               
 3rd Qu.:-0.5635                    3rd Qu.:-0.7250                    3rd Qu.:-0.6856               
 Max.   :-0.0271                    Max.   :-0.4446                    Max.   :-0.3776               
                                                                                                     
 TimedomainBodyAngularSpeedstdY TimedomainBodyAngularSpeedstdZ TimedomainBodyAngularAccelerationstdX
 Min.   :-0.9851                Min.   :-0.9879                Min.   :-0.9919                      
 1st Qu.:-0.7651                1st Qu.:-0.7178                1st Qu.:-0.7758                      
 Median :-0.7134                Median :-0.6741                Median :-0.7323                      
 Mean   :-0.6842                Mean   :-0.6468                Mean   :-0.7269                      
 3rd Qu.:-0.6304                3rd Qu.:-0.6032                3rd Qu.:-0.6896                      
 Max.   :-0.3990                Max.   :-0.1331                Max.   :-0.3890                      
                                                                                                    
 TimedomainBodyAngularAccelerationstdY TimedomainBodyAngularAccelerationstdZ
 Min.   :-0.9933                       Min.   :-0.9934                      
 1st Qu.:-0.8538                       1st Qu.:-0.7956                      
 Median :-0.8112                       Median :-0.7508                      
 Mean   :-0.7880                       Mean   :-0.7386                      
 3rd Qu.:-0.7137                       3rd Qu.:-0.6806                      
 Max.   :-0.5460                       Max.   :-0.4822                      
                                                                            
 TimedomainBodyAccelerationMagnitudestd TimedomainGravityAccelerationMagnitudestd
 Min.   :-0.9868                        Min.   :-0.9868                          
 1st Qu.:-0.6549                        1st Qu.:-0.6549                          
 Median :-0.5972                        Median :-0.5972                          
 Mean   :-0.5907                        Mean   :-0.5907                          
 3rd Qu.:-0.5529                        3rd Qu.:-0.5529                          
 Max.   :-0.1269                        Max.   :-0.1269                          
                                                                                 
 TimedomainBodyAccelerationJerkMagnitudestd TimedomainBodyAngularSpeedMagnitudestd
 Min.   :-0.99338                           Min.   :-0.9817                       
 1st Qu.:-0.68473                           1st Qu.:-0.7340                       
 Median :-0.62566                           Median :-0.6797                       
 Mean   :-0.62037                           Mean   :-0.6598                       
 3rd Qu.:-0.57751                           3rd Qu.:-0.5893                       
 Max.   :-0.03635                           Max.   :-0.2238                       
                                                                                  
 TimedomainBodyAngularAccelerationMagnitudestd FrequencydomainBodyAccelerationstdX
 Min.   :-0.9933                               Min.   :-0.9953                    
 1st Qu.:-0.8386                               1st Qu.:-0.6558                    
 Median :-0.8037                               Median :-0.6064                    
 Mean   :-0.7801                               Mean   :-0.5967                    
 3rd Qu.:-0.7203                               3rd Qu.:-0.5650                    
 Max.   :-0.5739                               Max.   : 0.1183                    
                                                                                  
 FrequencydomainBodyAccelerationstdY FrequencydomainBodyAccelerationstdZ
 Min.   :-0.9784                     Min.   :-0.9788                    
 1st Qu.:-0.5907                     1st Qu.:-0.7007                    
 Median :-0.5426                     Median :-0.6521                    
 Mean   :-0.5214                     Mean   :-0.6181                    
 3rd Qu.:-0.4637                     3rd Qu.:-0.5554                    
 Max.   : 0.1907                     Max.   :-0.1093                    
                                                                        
 FrequencydomainBodyAccelerationJerkstdX FrequencydomainBodyAccelerationJerkstdY
 Min.   :-0.99446                        Min.   :-0.99041                       
 1st Qu.:-0.71133                        1st Qu.:-0.67741                       
 Median :-0.64961                        Median :-0.61291                       
 Mean   :-0.64648                        Mean   :-0.60335                       
 3rd Qu.:-0.59903                        3rd Qu.:-0.56099                       
 Max.   :-0.04166                        Max.   :-0.08012                       
                                                                                
 FrequencydomainBodyAccelerationJerkstdZ FrequencydomainBodyAngularSpeedstdX
 Min.   :-0.9919                         Min.   :-0.9874                    
 1st Qu.:-0.8306                         1st Qu.:-0.7818                    
 Median :-0.7968                         Median :-0.7358                    
 Mean   :-0.7802                         Mean   :-0.7356                    
 3rd Qu.:-0.7420                         3rd Qu.:-0.7042                    
 Max.   :-0.5005                         Max.   :-0.4232                    
                                                                            
 FrequencydomainBodyAngularSpeedstdY FrequencydomainBodyAngularSpeedstdZ
 Min.   :-0.9838                     Min.   :-0.9887                    
 1st Qu.:-0.7671                     1st Qu.:-0.7514                    
 Median :-0.7152                     Median :-0.7082                    
 Mean   :-0.6761                     Mean   :-0.6838                    
 3rd Qu.:-0.6110                     3rd Qu.:-0.6529                    
 Max.   :-0.3489                     Max.   :-0.2055                    
                                                                        
 FrequencydomainBodyAccelerationMagnitudestd FrequencydomainBodyBodyAccelerationJerkMagnitudestd
 Min.   :-0.9863                             Min.   :-0.99263                                   
 1st Qu.:-0.7028                             1st Qu.:-0.68354                                   
 Median :-0.6631                             Median :-0.64109                                   
 Mean   :-0.6614                             Mean   :-0.63483                                   
 3rd Qu.:-0.6241                             3rd Qu.:-0.59059                                   
 Max.   :-0.3235                             Max.   :-0.09778                                   
                                                                                                
 FrequencydomainBodyBodyAngularSpeedMagnitudestd FrequencydomainBodyBodyAngularAccelerationMagnitudestd
 Min.   :-0.9814                                 Min.   :-0.9935                                       
 1st Qu.:-0.7661                                 1st Qu.:-0.8499                                       
 Median :-0.7113                                 Median :-0.8100                                       
 Mean   :-0.6969                                 Mean   :-0.7949                                       
 3rd Qu.:-0.6541                                 3rd Qu.:-0.7385                                       
 Max.   :-0.2724                                 Max.   :-0.5937                                       
                                                                                                       
   activities     subjects    
 Min.   : NA   Min.   : 1.00  
 1st Qu.: NA   1st Qu.: 8.50  
 Median : NA   Median :16.00  
 Mean   :NaN   Mean   :15.71  
 3rd Qu.: NA   3rd Qu.:22.50  
 Max.   : NA   Max.   :30.00  
 NA's   :35


The following table relates the names used as prefix for the
variables names present in the aggregated data set for mean() and std(). (XYZ) denotes three variables, one for each axis and is therefore not repeated to keep the table short.

Measurements for mean, all values are of class num

Description                                  	| Time domain                                 	| Frequency domain
------------------------------------------------| ------------------------------------------- 	| ----------------------------------------------------
Body Acceleration (XYZ dimensions)    		| TimedomainBodyAccelerationmean(XYZ)         	| FrequencydomainBodyAccelerationmean(XYZ)
Gravity Acceleration (XYZ dimensions) 		| TimedomainGravityAccelerationmean(XYZ)        | 
Body Acceleration Jerk (XYZ dimensions) 	| TimedomainBodyAccelerationJerkmean(XYZ)       | FrequencydomainBodyAccelerationJerkmean(XYZ)
Body Angular Speed (XYZ dimensions)  		| TimedomainBodyAngularSpeedmean(XYZ)           | FrequencydomainBodyAngularSpeedmean(XYZ)
Body Angular Acceleration (XYZ dimensions)	| TimedomainBodyAngularAccelerationmean(XYZ)    |
Body Acceleration Magnitude           		| TimedomainBodyAccelerationMagnitudemean       | FrequencydomainBodyAccelerationMagnitudemean
Gravity Acceleration Magnitude        		| TimedomainGravityAccelerationMagnitudemean    |
Body Acceleration Jerk Magnitude      		| TimedomainBodyAccelerationJerkMagnitudemean   | FrequencydomainBodyBodyAccelerationJerkMagnitudemean
Body Angular Speed Magnitude          		| TimedomainBodyAngularSpeedMagnitudemean       | FrequencydomainBodyBodyAngularSpeedMagnitudemean
Body Angular Acceleration Magnitude   		| TimedomainBodyAngularAccelerationMagnitudemean| FrequencydomainBodyBodyAngularAccelerationMagnitudemean

Measurements for standard deviation, all vlaues are of class num

Description					| Time domain					| Frequency domain
------------------------------------------------|-----------------------------------------------|--------------------------------------------------------
Body Acceleration (XYZ dimensions) 		| TimedomainBodyAccelerationstd(XYZ)		| FrequencydomainBodyAccelerationstd(XYZ)
Gravity Acceleration (XYZ dimensions)		| TimedomainGravityAccelerationstd(XYZ)		| 
Body Acceleration Jerk (XYZ dimensions)		| TimedomainBodyAccelerationJerkstd(XYZ)	| FrequencydomainBodyAccelerationJerkstd(XYZ)	
Body Angular Speed (XYZ dimensions		| TimedomainBodyAngularSpeedstd(XYZ)		| FrequencydomainBodyAngularSpeedstd(XYZ)
Body Angular Acceleration (XYZ dimensions)	| TimedomainBodyAngularAccelerationstd(XYZ)	|
Body Acceleration Magnitude 			| TimedomainBodyAccelerationMagnitudestd	| FrequencydomainBodyAccelerationMagnitudestd
Gravity Acceleration Magnitude			| TimedomainGravityAccelerationMagnitudestd	|
Body Acceleration Jerk Magnitude		| TimedomainBodyAccelerationJerkMagnitudestd	| FrequencydomainBodyBodyAccelerationJerkMagnitudestd
Body Angular Speed Magnitude			| TimedomainBodyAngularSpeedMagnitudestd	| FrequencydomainBodyBodyAngularSpeedMagnitudestd
Body Angular Acceleration Magnitude		| TimedomainBodyAngularAccelerationMagnitudestd	| FrequencydomainBodyBodyAngularAccelerationMagnitudestd


Activities and Subject fields

Name		| Description 		| class
----------------|-----------------------|----------------
activities	| Activity measured	| Factor w/ 6 levels 
subjects	| Subject id		| int  


##Sources
https://thoughtfulbloke.wordpress.com/tag/getting-and-cleaning
http://vita.had.co.nz/papers/tidy-data.pdf


