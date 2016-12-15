==Directory Structure==
This 583 project consists of two main optimizations to CDI. (1) The function cloning optimization, and (2) the sled reordering optimization. The "code" folder contains code necessary to build and run each optimizations transformation program. The "results" folder contain the result CSVs of these optimizations.

top ->
    README.txt
    optimizing-control-data-583.pdf
    code -> 
        cdi_generator_with_function_cloning -> ...
        cdi_generator_with_profiling -> ...
    results -> ...

==The Code==
Development of the function cloning optimization may be examined via github repo at...
https://github.com/Shereen92/cdi

The primary point of entry for the function cloning python program is the gen_cdi.py file, used with "python gen_cdi.py <.s file 1> <.s file 2> ..."

The compile_program.sh bash script may make the full process a bit easier (though it may require some customization).

==Presentation==
The presentation was created in Google Slides and executed on December 12th at 11:15am.
View a copy of the presentation...
https://docs.google.com/a/umich.edu/presentation/d/1Mf2mw-GL8LHBYKsv6n0P-5B-xq-nh75sgmCT7CjLzOo/edit?usp=sharing

==Proposal==
View a copy of the initial project proposal...
https://docs.google.com/a/umich.edu/document/d/1nSmGFeeEnjtWKUMkzIsQBVmNsGoQ-Ak6aEMSf8hs8Go/edit?usp=sharing

