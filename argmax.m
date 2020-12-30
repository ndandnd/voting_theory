function a = argmax(index, N)
amax = 1;
for s = 1:length(N)
    if EU(index,s, N) > EU(index, amax, N)
        amax = s;
    end
end
a = amax;
end