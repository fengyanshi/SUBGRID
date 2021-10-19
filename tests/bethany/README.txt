Use USGS IRI data 

1) remove headers in the data file: IRIUSGSTides_4_28_5_4.txt

2) in matlab, run read_data.m to generate two-column data file, gauge_data.txt. The first column is time (s), the second is surface elevation in meters (make sure the unit in the downloaded USGS file is in meters (IRIUSGSTides_4_28_5_4.txt))

3) compile and run mk_nesting.f

If you use gfortran, type 
gfortran mk_nesting.f -o mk_nesting

and run ./mk_nesting. It will generate coupling.txt

4) run the model

