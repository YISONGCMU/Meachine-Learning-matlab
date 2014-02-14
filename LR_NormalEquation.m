function LR_NormalEquation(Xtrain,Ytrain,Xtest,Ytest)
X=[ones(1,length(Xtrain));Xtrain';Xtrain'.^2;Xtrain'.^3;Xtrain'.^4;Xtrain'.^5]';
Theta=((X'*X)^(-1))*X'*Ytrain;
XX=[ones(1,length(Xtest));Xtest';Xtest'.^2;Xtest'.^3;Xtest'.^4;Xtest'.^5]';
Yresult=XX*Theta;
Error=norm(Yresult-Ytest);
Ypred_NE=Yresult;
save Ypred_NE.mat Ypred_NE;
fprintf('%.3f\n',Error);
end

