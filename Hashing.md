# Hashing

Built in Hashing Algorithms:


##  **MD5**

define MD5 datafu.pig.hash.MD5();

--input: "hello, world!"

data_in = LOAD 'input' as (val:chararray);

data_out = FOREACH data_in GENERATE MD5(val) as val;

-- produces: (fc3ff98e8c6a0d3087d515c0473f8677)

DUMP data_out;

## **SHA**

define SHA datafu.pig.hash.SHA();

--input: "hello, world!"

data_in = LOAD 'input' as (val:chararray);

data_out = FOREACH data_in GENERATE SHA(val) as val;


-- produces: (7509e5bda0c762d2bac7f90d758b5b2263fa01ccbc542ab5e3df163be08e6ca9)

DUMP data_out;

