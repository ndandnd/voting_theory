function u = EU(index, s, N)
% Expected utility of voter_index when voting rule s is used

%% Parameters
n = length(N);

p_index = N(index);
%% sum over k=s-1, ..., n-1
sum1 = 0;
sum2 = 0;

for k = s-1:n-1
    sum1 = sum1 + Prob(index,k, N);
end
sum1 = sum1 * p_index;

for k = 0:s-1
    sum2 = sum2 + Prob(index,k, N);
end
sum2 = sum2 * (1-p_index);


u = sum1 + sum2;
end