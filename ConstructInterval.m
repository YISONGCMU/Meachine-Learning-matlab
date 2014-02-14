function [Accuracy ,lowerInterval,upperInterval] = ConstructInterval(Ypredict,Ytest,confLevel)


precision= (Ypredict'*Ytest)/sum(Ypredict);
recall= (Ypredict'*Ytest)/sum(Ytest);
Accuracy=sum(Ypredict==Ytest)/length(Ytest);
fprintf('P:%.3f,R:%.3f,A:%.3f',precision,recall,Accuracy);
%error=1-Accuracy;
n=length(Ytest);

if confLevel==0.99 Zn=2.58; end
if confLevel==0.95 Zn=1.96; end
lowerInterval=Accuracy-Zn*sqrt(Accuracy*(1-Accuracy)/n);

upperInterval=Accuracy+Zn*sqrt(Accuracy*(1-Accuracy)/n);

end


