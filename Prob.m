function p = Prob(index,k,N)
% Probability that exactly k individuals in N\{i} support change

% N is an array of probabilities (the society)

%% Parameters
n = length(N);
seq = 1:n;



%%
N_removed = N;
N_removed(index) = []; % remove the first element
seq_removed = seq;
seq_removed(index) = []; % remove the first element


% Note that nchoosek(1:9, 6) reverse order and nchoosek(1:9,3) together
% form 1:9

iters = nchoosek(n-1, k); %84 iterations

sum = 0;
in = nchoosek(seq_removed, k);
out = nchoosek(seq_removed, n-1-k);
for i = 1:iters
    temp_in = N(in(i,:));
    temp_out = N(out(end+1-i,:));
    prod = 1;
    for j=1:k
        prod = prod * temp_in(j);
    end
    for j = 1:n-1-k
        prod = prod * (1-temp_out(j));
    end
    sum = sum + prod;
    
    
end

p = sum;
end