function Ypredict = TrainHeldOut( Xtrain,Ytrain,testInstanceLabel)
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


precision= (Pred_nb'*Ytest)/sum(Pred_nb);
recall= (Pred_nb'*Ytest)/sum(Ytest);
accuracy=sum(Pred_nb==Ytest)/length(Ytest);
fprintf('P:%.3f,R:%.3f,A:%.3f',precision,recall,accuracy);
Ypredict=Pred_nb;
for i=1:length(Xtest(:,1));
    
        fprintf('AAA:%d\n',Ytest(i));
    
end


end

