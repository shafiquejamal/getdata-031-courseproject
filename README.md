The Dataset
===========

The dataset conforms to the rules for tidy data, as specified in the Hadley Wickham paper. I assembled the dataset from the data given in the course as follows:

- column binded the subject, activity and measurement data for each of the test and train sets
- row binded the resulting test and train sets
- replaced (via merge) the activity numbers with the activity names
- retained only the subject, activity and mean and standard deviation measurement variables
- renamed the variables to make them more descriptive
- calculated the means by subject and activity

Variable Names
==============

I have altered the variable names from the original dataset as follows:
- replaced 't' with 'time'
- replaced 'f' with 'freq' to denote frequency
- replaced 'BodyBody' with 'Body' (In the forms it is mentioned that the former might be a typo)
- replaced 'Acc' with 'Accelerator'
- replaced 'Gyro' with 'Gyroscope'
- replaced 'Mag' with 'Magnitude'
- removed excess dots ('.') from the variable names

I think this makes the variable names more descriptive (though I think the variable names were good enough to begin with)

