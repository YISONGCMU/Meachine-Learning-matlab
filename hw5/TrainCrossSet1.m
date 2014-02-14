function Ypredict1 = TrainCrossSet1( Xtrain,Ytrain,crossSetLabel)

Ypredict11=zeros(length(Ytrain),1);
k=max(crossSetLabel);
SumPred=[];
SumYTest=[];
for TT=1:k

x=[];
y=[];
Xtest=[];
Ytest=[];
for i=1:length(Xtrain(:,1));
    if (crossSetLabel(i)~=TT)
    x=[x;Xtrain(i,:)];
    y=[y;Ytrain(i,:)];
    else
        
    Xtest=[Xtest;Xtrain(i,:)];
    Ytest=[Ytest;Ytrain(i,:)];    
    end
end

model.nY=sum(y);
model.total=length(y);
model.tokenY=x'*y;
model.tokenNY=x'*(ones(length(y),1)-y);
model.tokenT=sum(model.tokenY);
model.tokenNT=sum(model.tokenNY);



Y=model.tokenY;
T=model.tokenT;
NY=model.tokenNY;
NT=model.tokenNT;
Y=Y+ones(length(Y),1);
NY=NY+ones(length(NY),1);
Yture=Xtest*(log(Y/(T+3000)))+log(model.nY/model.total)*ones(length(Xtest(:,1)),1);
Yfalse=Xtest*(log(NY/(NT+3000)))+log(1-model.nY/model.total)*ones(length(Xtest(:,1)),1);
Pred_nb=Yture>Yfalse;

SumPred=[SumPred;Pred_nb];
SumYTest=[SumYTest;Ytest];
XX=1;
for i=1:length(Xtrain(:,1));
    if (crossSetLabel(i)==TT)
       Ypredict11(i,1)=Pred_nb(XX,1);
       XX=XX+1;
    end
end

end
Pred_nb=SumPred;
Ytest=SumYTest;
precision= (Pred_nb'*Ytest)/sum(Pred_nb);
recall= (Pred_nb'*Ytest)/sum(Ytest);
accuracy=sum(Pred_nb==Ytest)/length(Ytest);
fprintf('P:%.3f,R:%.3f,A:%.3f',precision,recall,accuracy);
Ypredict1=Pred_nb;


end
