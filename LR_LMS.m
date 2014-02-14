function LR_LMS(Xtrain,Ytrain,Xtest,Ytest )
X=[ones(1,length(Xtrain));Xtrain';Xtrain'.^2;Xtrain'.^3;Xtrain'.^4;Xtrain'.^5]';
Theta=zeros(6,1);
Alpha=10^(-6);

for T=1:150000
 
    for i=1:length(X(:,1))
      Theta=Theta+Alpha*((Ytrain(i)-X(i,:)*Theta)*X(i,:))';
    end

end

XX=[ones(1,length(Xtest));Xtest';Xtest'.^2;Xtest'.^3;Xtest'.^4;Xtest'.^5]';
Yresult=XX*Theta;
Error=norm(Yresult-Ytest);
fprintf('%.3f\n',Error);
Ypred_LMS=Yresult;
save Ypred_LMS.mat Ypred_LMS;
end



