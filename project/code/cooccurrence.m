function result = cooccurrence(r)

%shifting the range of truncated matrix from range [-3,3] to [1,7]
si = r+4;
a = zeros(7,7,7);

%intrachannel cooccurrence
si1 = si(1:end-1,1:end-1,1); si2 = si(1:end-1,2:end,1); si3 = si(2:end,2:end,1);
subs = [si1(:) si2(:) si3(:)];
a = accumarray(subs, 1);

%merging all the cooccurrences
result = [a(:)'];

end