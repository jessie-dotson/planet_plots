# planet_plots
Code to create a variety of different plots exploring the known distributions of confirmed planets and how our knowledge of those distributions have changed over time.  (Fair warning -- not all of this code is clean and friendly.  yet...)

rmd/planethistory_base.rmd (https://github.com/jessie-dotson/planet_plots/blob/master/rmd/planethistory_base.Rmd) does the following:
  + downloads the most recent confirmed and composite tables from NExScI
  + combines them to get all the columns I like to have for plotting
  + predicts mass for planets that only have radii and radii for planets that only have mass 
  + makes a few plots
  + writes out the table of planet parameters suitable for plotting as a .RDS and a .csv file for use elsewhere
  
  (A quick note on the mass/radii predictions.  Like those available in the NExScI composite table, these are based on the Chen and Kipping broken power law.  But I include their scatter term rather than just assuming all planets lie on the nominal line.  If you use the NExScI values, you end up with a lot of planets clustered tightly together in a way that (imho) implies more order than is justified.)
  
  
rmd/moving_planets_v2.rmd (https://github.com/jessie-dotson/planet_plots/blob/master/rmd/moving_planets_v2.Rmd) uses the planet table created by planethistory_base and generates a couple animated plots.

General structure of repository:
  + rmd:  Rmarkdown files.  This is where the code lives.
  + RDS:  R data files.  (kinda like pickled files in python)
  + Rscripts: bits of R code that I reuse in multiple rmd files.
  + inputs: small input data files
  + outputs: any .csv files written out by the rmd files
  + plots: self explanatory :)
  + \*.Rproj: The rproject file for the whole shebang.  Can be opened in Rstudio to provide a base for running all this stuff
  
  (The repository doesn't include data that the code can download from elsewhere, like tables from NExScI)
  
  
