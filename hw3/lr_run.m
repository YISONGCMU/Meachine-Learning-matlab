function lr_run( Xtrain,Ytrain,Xtest,Ytest)
tic;
model=lr_train(Xtrain,Ytrain);
Pred_lr=lr_test(model,Xtest);
save Pred_lr.mat Pred_lr;
precision= (Pred_lr*Ytest)/sum(Pred_lr);
recall= (Pred_lr*Ytest)/sum(Ytest);
accuracy=sum(Pred_lr'==Ytest)/length(Ytest);
fprintf('P:%.3f,R:%.3f,A:%.3f',precision,recall,accuracy);
toc;

end

