function  LR_SteepestDescent(Xtrain,Ytrain,Xtest,Ytest )
% this method is very slow to converge with f(x)=a1*X^5+a2*X^4...+a5^X+a6

X=[ones(1,length(Xtrain));Xtrain';Xtrain'.^2;Xtrain'.^3;Xtrain'.^4;Xtrain'.^5]';
Theta=zeros(6,1);
Alpha=3*10^(-7);

for T=1:1000000   

    XX=Ytrain-X*Theta; 
    Theta=Theta+Alpha*sum([XX,XX,XX,XX,XX,XX].*X)';


end
XX=[ones(1,length(Xtest));Xtest';Xtest'.^2;Xtest'.^3;Xtest'.^4;Xtest'.^5]';
Yresult=XX*Theta;
Ypred_SD=Yresult;
save Ypred_SD.mat Ypred_SD;
Error=norm(Yresult-Ytest);
fprintf('%.3f\n',Error);

end


