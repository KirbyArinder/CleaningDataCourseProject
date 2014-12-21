CleaningDataCourseProject
=========================

This repo is intended to partially fulfill the requirements of the course project for Getting and Cleaning Data.

The attached file is pretty extensively commented; I hope it should be self-explanatory.  The code acts somewhat
inefficiently in producing its intended outcome -- it does other things besides -- but I made it the way I
did for autopedagogical purposes; I thought that it would be handy to first build up a maximal tidy dataset
from the data we were given, and only then subset out the stuff that we were told to actually return.  That way,
if on future occasions I need to tidy a dataset and look at the whole thing, I can use the basic code grammar
embodied here.  I didn't want to forget the content of the course after leaving it, essentially.

The code sticks together the test and train versions of subject, x, and y (activity) files.  It also, as
a gesture toward intelligibility, reads the features.txt file, converts it into a vector, and renames all
of the columns according to their features.txt names.  I judged that given the description of the variables
from the original documentation, the features.txt names represented practically optimal combinations of
brevity and clarity.  Just for ease of coding, it also concatenates the subject and activity columns into a new
column, SubAct, intended to make one-step grouping simpler and return fewer columns.  The last consideration
turned out to be pretty much moot with 79 mean/standard deviation variables, but c'est la vie.  

The code takes a subset of columns that take a mean -- including meanFreq -- of their underlying physical
phenomenon, but doesn't take those columns whose underlying physical phenomenon IS a mean; this was what I understood
the intention of the assignment to be.  It then takes a subset of columns that take a standard deviation of their 
underlying physical phenomenon in the same fashion.  

It then cbinds the SubAct column, the mean columns, and the standard deviation columns, groups them by SubAct, and takes the mean of all variables.  
