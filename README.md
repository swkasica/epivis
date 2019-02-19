Welcome to epivis!
  
  
This project is currently under development and I don't recommend it be used right now. If you'd like to check it out in its dvelopement mode you can do it as follows:


```{r}
devtools::install_deps() #make sure that you have devtools installed
devtools::load_all()
BiocManager::install("ggtree", version = "3.8")
run_epidrive() #this will bring up the SHINY application, which is currently in development

```

To get oriented here is where everything is:

R  - the subfolder with all of the R infrastructure/datat input/ analytic scripts

inst - a subfolder with the shiny application code
inst/epivis_shiny - all the relevant shiny application code


Test data is in the top level repository, this is just to minimize the size of tar package and to ensure that the test data (gathered from public sources) is not accidentally pushed to the version control (because it is quite massive)


