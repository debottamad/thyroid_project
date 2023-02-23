combine=[];
for i=1:10
s.Width = 800;
s.Height = 600;
s.Title = 'View from the 15th Floor';
s.Animated = false;
s.IDs = [116, 943, 234, 38793];
combine=[combine,s];
end
dataset.data=combine;
temp=jsonencode(dataset,PrettyPrint=true);
fid = fopen('file1.json','w');
fprintf(fid,'%s',temp);
fclose(fid);