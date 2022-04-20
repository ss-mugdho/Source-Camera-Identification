function a = bayer(i,d)

[m,n,~] = size(i);

a = zeros(m,n);

a(1:2:end,1:2:end) = i(1:2:end,1:2:end,d(1));
a(2:2:end,1:2:end) = i(2:2:end,1:2:end,d(2));
a(1:2:end,2:2:end) = i(1:2:end,2:2:end,d(3));
a(2:2:end,2:2:end) = i(2:2:end,2:2:end,d(4));

end