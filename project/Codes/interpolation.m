function img = interpolation(s, type)

%creating cfa filter for g,b,r,g pattern
rcfa = repmat([0 0;1 0],size(s,1)/2,size(s,2)/2);
gcfa = repmat([1 0;0 1],size(s,1)/2,size(s,2)/2);
bcfa = repmat([0 1;0 0],size(s,1)/2,size(s,2)/2);

rh = s.*rcfa;
gh = s.*gcfa;
bh = s.*bcfa;

switch type
    case 'nearest' % nearest neighbor interpolation
        r = rh(floor([0:end-1]/2)*2+2,floor([0:end-1]/2)*2+1);
        g = zeros(size(gh));
        g(floor([0:end-1]/2)*2+1,:) = gh(floor([0:end-1]/2)*2+1,floor([0:end-1]/2)*2+1);
        g(floor([0:end-1]/2)*2+2,:) = gh(floor([0:end-1]/2)*2+2,floor([0:end-1]/2)*2+2);
        b = bh(floor([0:end-1]/2)*2+1,floor([0:end-1]/2)*2+2);
    case 'bilinear' % bilinear interpolation
        r = conv2(rh,[1 2 1;2 4 2;1 2 1]/4,'same');
        g = conv2(gh,[0 1 0;1 4 1;0 1 0]/4,'same');
        b = conv2(bh,[1 2 1;2 4 2;1 2 1]/4,'same');
end

img(:,:,1) = r;
img(:,:,2) = g;
img(:,:,3) = b;
end