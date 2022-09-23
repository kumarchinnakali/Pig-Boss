# Statistics

## **StreamingMedian**


define Median datafu.pig.stats.StreamingMedian();

-- input: 3,5,4,1,2
  
  input = LOAD 'input' AS (val:int);

-- produces: 3

  medians = FOREACH (GROUP input ALL) GENERATE Median(input.val);



## **StreamingQuantile**

define Quantile datafu.pig.stats.StreamingQuantile('0.0','0.5','1.0');

-- input: 9,10,2,3,5,8,1,4,6,7

input = LOAD 'input' AS (val:int);

-- produces: (1,5.5,10)

quantiles = FOREACH (GROUP input ALL) GENERATE Quantile(input.val);


## **Variance**

define VAR datafu.pig.stats.VAR();

-- input: 1,2,3,4,5,6,7,8,9

input = LOAD 'input' AS (val:int);

-- produces: 6.666666666666668

variance = FOREACH (GROUP input ALL) GENERATE VAR(input.val);
