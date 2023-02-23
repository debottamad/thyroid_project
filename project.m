path="C:\Users\debot\OneDrive\Documents\MATLAB\Ece 529-project\Dataset 2\malignant";
files = dir(fullfile(path, '*.png'));
img_name=[];
props_whole=[];
for i=1:length(files)
    filenames=files(i).name;
    I = imread(filenames);
    I=im2gray(I);
    I=adapthisteq(I,'NumTiles',[16 16],'ClipLimit',0.01);
    [name ext]= split(filenames,".");
    [LoD,HiD,LoR,HiR] = wfilters("db8");
    [LL1,LH1,HL1,HH1]=dwt2(I,LoD,HiD,'mode','symh');
    [LL2,LH2,HL2,HH2]=dwt2(LL1,LoD,HiD,'mode','symh');
    glcm= graycomatrix(I);
    X = glcm .* log2(glcm + (glcm == 0));
    entropy = -sum(X(:));
    stats_I = graycoprops(glcm);
    A2=scalar_value_generator(LL2);
    H1=scalar_value_generator(LH1);
    H2=scalar_value_generator(LH2); 
    V1=scalar_value_generator(HL1); 
    V2=scalar_value_generator(HL2); 
    D1=scalar_value_generator(HH1);
    D2=scalar_value_generator(HH2);
    prop=[stats_I.Contrast,stats_I.Homogeneity,entropy,A2,H1,H2,V1,V2,D1,D2,1];
    img_name=[img_name;name(1)];
    props_whole=[props_whole;prop]
end
writecell(img_name, 'data.csv');
writematrix(props_whole, 'data1.csv');