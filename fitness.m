function [ value ] = fitness( x)

n = length(x);

lowerBound = 0;
upperBound = 10;

%checking constraints 
if sum((x < lowerBound) + (x > upperBound)) ~= 0
   value = 0
   return;
end

if(prod(x) < .75)
    value = 0;
    return;
end

numer = abs(sum(cos(x').^4) - (2*prod(cos(x').^2)));
denom = 0;
for i=1:n
    denom = denom + i*(x(i))^2;
end

denom = abs(sqrt(denom));

value = numer/denom;

end