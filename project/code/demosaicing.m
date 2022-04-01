function feature = demosaicing(fullname)

i = imread(fullname);

%bayer pattern & sampling image according to bayer pattern
d = [2 3;1 2];
s = bayer(i,d);

%demosaicing using interpolation and calculating error
id = interpolation(s, 'nearest');
e = double(i) - id;

%quantization and truncation
t = 3;
q = 2;
r = round(e/q);
r(r > t) = t;
r(r < -t) = -t;

%calculating co-occurrence/feature
feature = cooccurrence(r);

%again for bilinear interpolation
id = interpolation(s, 'bilinear');
e = double(i) - id;

r = round(e/q);
r(r > t) = t;
r(r < -t) = -t;

feature = [feature cooccurrence(r)];

end