DEFINE CountEach datafu.pig.bags.CountEach();

items = FOREACH (GROUP items BY memberId) GENERATE
  group as memberId,
  CountEach(items.(itemId)) as items;
  
Define BagConcat datafu.pig.bags.BagConcat();

-- ({(1),(2),(3)},{(4),(5)},{(6),(7)})
input = LOAD 'input' AS (B1: bag{T: tuple(v:INT)}, B2: bag{T: tuple(v:INT)}, B3: bag{T: tuple(v:INT)});

-- ({(1),(2),(3),(4),(5),(6),(7)})
output = FOREACH input GENERATE BagConcat(B1,B2,B3);

define AppendToBag datafu.pig.bags.AppendToBag();

-- ({(1),(2),(3)},(4))
input = LOAD 'input' AS (B: bag{T: tuple(v:INT)}, T: tuple(v:INT));

-- ({(1),(2),(3),(4)})
output = FOREACH input GENERATE AppendToBag(B,T);
