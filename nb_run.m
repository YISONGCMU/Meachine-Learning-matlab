function [ ] = nb_run(Xtrain, Ytrain, Xtest, Ytest)
tic
model=nb_train(Xtrain, Ytrain);
Pred_nb=nb_test(model,Xtest);
save Pred_nb.mat Pred_nb;
precision= (Pred_nb'*Ytest)/sum(Pred_nb);
recall= (Pred_nb'*Ytest)/sum(Ytest);
accuracy=sum(Pred_nb==Ytest)/length(Ytest);
fprintf('P:%.3f,R:%.3f,A:%.3f',precision,recall,accuracy);
toc
end

