function  LR_SteepestDescent_slowbutaccurate(Xtrain,Ytrain,Xtest,Ytest )
% this method is very slow to converge with f(x)=a1*X^5+a2*X^4...+a5^X+a6

X=[ones(1,length(Xtrain));Xtrain';Xtrain'.^2;Xtrain'.^3;Xtrain'.^4;Xtrain'.^5]';
Theta=zeros(6,1);
Alpha=3*10^(-7);

for T=1:280000    
  Sum=zeros(6,1);
    for i=1:length(X(:,1))
      Sum=Sum+Alpha*((Ytrain(i)-X(i,:)*Theta)*X(i,:))';
    end
   Theta=Theta+Sum;

end
XX=[ones(1,length(Xtest));Xtest';Xtest'.^2;Xtest'.^3;Xtest'.^4;Xtest'.^5]';
Yresult=XX*Theta;
Ypred_SD=Yresult;
save Ypred_SD.mat Ypred_SD;
Error=norm(Yresult-Ytest);
fprintf('%.3f\n',Error);

end


