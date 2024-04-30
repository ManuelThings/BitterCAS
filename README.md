# BitterCAS

I have missed some CAS features in R, so i have added a very very thin interface to access maxima capabilities to nicely display formulas in mathml format.

Using this library should be very easy, although it is not yet ready to be used by other than me. I will be updating it when i find it lacking in the things I need but I will willing to add changes proposed by others if those changes do not break the normal workflow. (Obviously if the normal workflow is wrong i will change it without caring too much if that breaks older code).

This interface is initially only thought to be used from RMarkdown documents, but it is not hard to implement in the normal R scripts.

## Use:

From a RMarkdown file, initialize the project and indicate the file location, temporary files will be saved in the same file location but within a tmp subdirectory:

![](inst/init.png){style="with:100%;"}
