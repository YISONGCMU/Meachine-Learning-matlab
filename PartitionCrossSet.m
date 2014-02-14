function crossSetLabel = PartitionCrossSet( size,k)

Ltest=floor(size/k);
crossSetLabel=zeros(size,1);

%Part=zeros(k);
%for i=1:size
%    crossSetLabel(i)=randperm(k,1);
%    while (Part(crossSetLabel(i))>=Ltest)
%    crossSetLabel(i)=randperm(k,1);
%    end
%    Part(crossSetLabel(i))=Part(crossSetLabel(i))+1;
%end
order=randperm(size);z=1;
for T=1:k
    for i=1:Ltest
       crossSetLabel(order(z))=T;
       z=z+1;
    end
end

end







