# Numeric functions:

# absolute
select abs(-44) ;
select abs(44);

# round off
select round(123.567889,3);
select round(-.998,2);

# ceiling
select ceiling(44.45);
select ceil(49.10);
select ceiling(-0.9);

# floor
select floor(44.98);
select floor(0.1);
select floor(-0.9);

# sqrt
select sqrt(4);
select sqrt(100);

#power
select power(2,3);

# random number
select rand()*10 as random_number;
select round(rand()*10,0) as random_number;
# round
select round(44.38,0);

#mod
select mod(3,2);

# sign
select sign(480);

# truncate
select truncate(45.9987654,2);