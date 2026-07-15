# MDRFDataForJMIPaper
MDRF data in support of "Fisher Information Comparison between a Monolithic and a Fiber-Optic Light Guide in a Modular Gamma Camera" by Kimberly J. Doty, Matthew A. Kupinski, Xin Li, Michael A. King, Phillip H. Kuo, and Lars R. Furenlid to be published in the SPIE Journal of Medical Imaging

These data files are just ray int32 files containing 5,484,672 entries.  There are 81 SiPM sensors, 8 depths, and 91 x 91 x and y entries.  So this data could be loaded in Matlab with the following commands:

The file QuadtoFullMDRF.m shows how to read in the data and mirror the data to exploid the symmetry of the detectory design.
