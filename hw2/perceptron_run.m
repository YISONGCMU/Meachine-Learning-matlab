function [ ] = perceptron_run( Xtrain,Ytrain,Xtest,Ytest)
model=perceptron_train(Xtrain,Ytrain);
Pred_per=perceptron_test(model,Xtest);
save Pred_per.mat Pred_per;
precision= (Pred_per'*Ytest)/sum(Pred_per);
recall= (Pred_per'*Ytest)/sum(Ytest);
accuracy=sum(Pred_per==Ytest)/length(Ytest);
fprintf('P:%.3f,R:%.3f,A:%.3f',precision,recall,accuracy);
end

