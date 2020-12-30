%% example 1: Single Peaked Preferences

N1 = ones(1,4)*.01;
N2 = ones(1,6)*.99;

N = cat(2,N1,N2); % concatenated row vector

%argmax(4, N) % paper says it's 8
%argmax(5, N) % paper says it's 4

%% example 2: Society for which No rule is Self-Stable


N = [.5, .5, .5, .375, 3/16];
%argmax(1,N) % should be 2
%argmax(4,N) % should be 3
%argmax(5,N) % should be 4


%% example 3 Society with Multiple, Nonadjacent Self-Stable Rules

N1 = ones(1,5) * .01;
N2 = ones(1,11) * .99;
N = cat(2,N1,N2); % concatenated row vector
argmax(5,N) % should be 14
argmax(6,N) % should be 6