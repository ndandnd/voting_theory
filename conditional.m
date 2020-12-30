function u = conditional(s,n1,n2,p1,p2)
%Assume a dichotomous society,
%with n1 people in the first group with probability of preferring b p1,
%and similarly for the second group.

%This function calculates the conditional probability
%that a member of the second group will have voted for b,
%given that s members voted for b.

%Example 1 argues that if x is in group 2,
%P(x=b|3 voted for b) < .5, and
%P(x=b|4 voted for b) > .5 show that \hat{s}_2 = 4.

%Usage: observe that 
%conditional(3, 4, 6, .01, .99) < .5
%conditional(4, 4, 6, .01, .99) is about 2/3, as printed in the journal.




% start and finish (for loop) 
t = s - n2;
m = min(n1,s);
if t < 0
    t = 0; % if s<n2, then there is no problem.
end
% calculate the intersection


intersection = 0;
for k = t:m-1 % the most that can vote from N2 is n2.

    intersection = intersection + ...
    nchoosek(n1, k) * p1^(k) * (1-p1)^(n1-k) * nchoosek(n2-1, (s-1)-k) * p2^(s-1-k) * (1-p2)^(n2-(s-k));
end
intersection = intersection * p2;


% calculate the unconditional
unconditional = 0;
for k = t:m
    unconditional = unconditional + ...
    nchoosek(n1, k) * p1^(k) * (1-p1)^(n1-k)  * nchoosek(n2, s-k) * p2^((s-k)) * (1-p2)^(n2-(s-k)) ;
end

u = intersection/unconditional;

end