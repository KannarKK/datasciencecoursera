Process:
-------
> dim(x_train)
[1] 7352  561
> dim(y_train)
[1] 7352    1
> dim(subject_train)
[1] 7352    1
---------------------
> dim(x_test)
[1] 2947  561
> dim(y_test)
[1] 2947    1
> dim(subject_test)
[1] 2947    1


=> We need to merge as ( subject_train, y_train, x_train) and similarly for test set. and then merge both files.
hardata <- rbind(x_train, x_test)
> dim(hardata)
[1] 10299   563
