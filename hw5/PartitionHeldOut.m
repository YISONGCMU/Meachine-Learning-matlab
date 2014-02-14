function testInstanceLabel= PartitionHeldOut(size,k)
Ltest=fix(size/k);
Shuffle= randperm(size);
testInstanceLabel=zeros(size,1);
for i=1:Ltest
testInstanceLabel(Shuffle(i))=1;
end

end

