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

denom = abs(sqrt(sum((x.^2) .* (1:n))))

numer = abs(sum(cos(x').^4) - (2*prod(cos(x').^2)));
value = numer/denom;

end