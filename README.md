
## Project Description
Course project for the Getting and cleaning Data course

##Course project objectives are:
1. Test the abibility to collect data, check and verify the correctness of the provided data and then prepare a tidy data set.
2. Provide a Codebook that explains the variables in the Data, including the steps and transformations required to create the tidy data set.
3. Provide a script that when executed will provide the tidy data set.

###Testing the the data file in R
Follow the following steps to import/read the text file (exported version of the cleaned data file) in R to be able to view the correctness of the data, this at the same time will help to view if the object of the course was reached

1. Create a working directory for testing the R analysis script.
2. Download and extract the data files from the lingk provided.
3. Open R (Or R studio) 
4. Set your working directory to the directory where the data was copied and extracted (from item 2)
5. Download the run_analysis.R from the git Repo (https://github.com/mtbbiker/datacleaning/blob/master/run_analysis.R)
6. Change on the first line of the "run_analysis.R" the Path to where you extracted the Data
7. Load the script in R (or RStudio) (source("run_analysis.R")). The script will set the Paths to the Data directory, and create a Tidy data set that is wriiten to a file in your Data directory, the file will benamed tidydaya.txt


##Sources
Codebook Template used from work done by :https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41
