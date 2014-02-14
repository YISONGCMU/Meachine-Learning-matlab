function model=lr_train(X,Y)

Xlength= length(X(1,:));

w=zeros(1,Xlength);
Alpha= 0.0230;
lamda= 10^(-4);
L2=100;
L1=0;
T=0;
while (abs(L2-L1)>0.5)||(T<30)
    
Shuffle= randperm(Xlength);

  for i=1:Xlength
     Xvector=X(Shuffle(i),:);
     p=1/(1+exp(-1*dot(Xvector,w)));
     w=w+Alpha*( (Y(Shuffle(i))-p) *Xvector-2*lamda*w);
  end
  
  L1=L2;L2=0;
  for j=1:Xlength
    Xvector=X(Shuffle(j),:);
    p=1/(1+exp(-dot(Xvector,w)));
    L2= L2+Y(Shuffle(j))*log(p)+ (1-Y(Shuffle(j)) ) *log(1-p);
  end
  L2=L2-lamda*dot(w,w);
   T=T+1;
end

model.w=w;

end

