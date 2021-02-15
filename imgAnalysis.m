crp_img = imread('cropped-me.png');
img_gray = rgb2gray(crp_img);
img_dtls = detectSURFFeatures(img_gray);
[img_ftrs, vld_dtls] = extractFeatures(img_gray, img_dtls);
figure; 
imshow(crp_img);
hold on;
plot(img_dtls.selectStrongest(500));

%figure; 
%subplot(5,5,3);
%for i=1:25
%    scale = img_dtls(i).Scale;
%    image = imcrop(crp_img(img_dtls ));
%    subplot(5,5,i);
%    imshow(image);
%    hold on;
%    rectangle('Position',[5*scale 5*scale 10*scale 10*scale])
%end

image = imread('my_img.jpg');
I = rgb2gray(image);
I_pts = detectSURFFeatures(I);
[I_features, I_ValidPts] = extractFeatures(I, I_pts);
figure;
imshow(image);
hold on;
plot(I_pts.selectStrongest(500));
index_pairs = matchFeatures(img_ftrs, I_features);
ref_matched_pts = vld_dtls(index_pairs(:,1)).Location;
I_matched_pts = I_ValidPts(index_pairs(:,2)).Location;
figure, showMatchedFeatures(image, crp_img, I_matched_pts, ref_matched_pts)