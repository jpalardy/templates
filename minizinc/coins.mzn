
array[int] of int: denominations = [1, 5, 10, 25];
int: target;

int: n = length(denominations);

array[1..n] of var 0..100: coins;

var int: obj;

% -------------------------------------------------

constraint obj = sum(coins);

constraint sum(i in 1..n) (
  denominations[i] * coins[i]
) = target;

% -------------------------------------------------

% annotations in https://www.minizinc.org/resources.html
solve minimize obj;

output [
  show(coins), " --> ", show(sum(coins)), "\n",
  show([ denominations[i] * coins[i] | i in 1..n])
];

