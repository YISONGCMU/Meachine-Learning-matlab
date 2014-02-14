function   Ypredict2 = TrainHeldOut2( Xtrain,Ytrain,testInstanceLabel)
x=[];
y=[];
Xtest=[];
Ytest=[];
for i=1:length(Xtrain(:,1));
    if (testInstanceLabel(i)==0)
    x=[x;Xtrain(i,:)];
    y=[y;Ytrain(i,:)];
    else
    Xtest=[Xtest;Xtrain(i,:)];
    Ytest=[Ytest;Ytrain(i,:)];    
    end
end
X=x;
Y=y;

Y=2*Y-ones(length(Y),1);
k=1;
c(1)=0;
w(1,:)=zeros(1,length(X(1,:)));

t=1;
T= length(X(:,1));
round=10;
for i=1:round
while t <= T 
    
    if Y(t) * dot(w(k,:),X(t,:)) <= 0 
        w(k+1,:) = w(k,:) + Y(t)*X(t,:);
        c(k+1) = 1;
        k=k+1;
    else
        c(k) = c(k) + 1; 
    end
    
    t=t+1;
end
t=1;
end

model.k=k;
model.c=c;
model.w=w;


Pred_per = (sign(sign(Xtest*model.w')*model.c')+ones(length(Xtest(:,1)),1))/2;


precision= (Pred_per'*Ytest)/sum(Pred_per);
recall= (Pred_per'*Ytest)/sum(Ytest);
accuracy=sum(Pred_per==Ytest)/length(Ytest);
fprintf('P:%.3f,R:%.3f,A:%.3f',precision,recall,accuracy);

Ypredict2=Pred_per;





end

