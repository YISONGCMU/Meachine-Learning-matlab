function  LR_SteepestDescent(Xtrain,Ytrain,Xtest,Ytest )
% this method is  faster but not  very accurate with f(x)=a1*X^3+a2*X^2+a5^X+a6
%
X=[ones(1,length(Xtrain));Xtrain';Xtrain'.^2;Xtrain'.^3]';
Theta=zeros(4,1);
Alpha=1*10^(-5);

for T=1:15000  
  Sum=zeros(4,1);
    for i=1:length(X(:,1))
      Sum=Sum+Alpha*((Ytrain(i)-X(i,:)*Theta)*X(i,:))';
    end
   Theta=Theta+Sum;
end

XX=[ones(1,length(Xtest));Xtest';Xtest'.^2;Xtest'.^3]';
Yresult=XX*Theta;
Error=norm(Yresult-Ytest);
fprintf('%.3f\n',Error);
Ypred_SD=Yresult;
save Ypred_SD.mat Ypred_SD;

end
