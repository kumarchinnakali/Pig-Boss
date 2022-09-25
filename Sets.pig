Computes the set intersection-

define SetIntersect datafu.pig.sets.SetIntersect();

-- ({(3),(4),(1),(2),(7),(5),(6)},{(0),(5),(10),(1),(4)})
input = LOAD 'input' AS (B1:bag{T:tuple(val:int)},B2:bag{T:tuple(val:int)});

intersected = FOREACH input {
  sorted_b1 = ORDER B1 by val;
  sorted_b2 = ORDER B2 by val;
  GENERATE SetIntersect(sorted_b1,sorted_b2);
}

Computes the set union-

-- produces: ({(1),(4),(5)})
DUMP intersected;

define SetUnion datafu.pig.sets.SetUnion();

-- ({(3),(4),(1),(2),(7),(5),(6)},{(0),(5),(10),(1),(4)})
input = LOAD 'input' AS (B1:bag{T:tuple(val:int)},B2:bag{T:tuple(val:int)});

unioned = FOREACH input GENERATE SetUnion(B1,B2);

-- produces: ({(3),(4),(1),(2),(7),(5),(6),(0),(10)})
DUMP unioned;

Computes the set difference-

define SetDifference datafu.pig.sets.SetDifference();

-- ({(3),(4),(1),(2),(7),(5),(6)},{(1),(3),(5),(12)})
input = LOAD 'input' AS (B1:bag{T:tuple(val:int)},B2:bag{T:tuple(val:int)});

differenced = FOREACH input {
  -- input bags must be sorted
  sorted_b1 = ORDER B1 by val;
  sorted_b2 = ORDER B2 by val;
  GENERATE SetDifference(sorted_b1,sorted_b2);
}

-- produces: ({(2),(4),(6),(7)})
DUMP differenced;
