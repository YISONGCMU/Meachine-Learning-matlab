function [ accuracy1,accuracy2,p_value] = CompareClassifier(Ypredict1,Ypredict2,Ytest,crossSetLabel,isTwoTail)
accuracy1=sum(Ypredict1==Ytest)/length(Ytest);
accuracy2=sum(Ypredict2==Ytest)/length(Ytest);
for T=1:max(crossSetLabel)

y1=[];
y2=[];
YY=[];
for i=1:length(Ytest);
    if (crossSetLabel(i)==T)
    y1=[y1;Ypredict1(i,:)];
    y2=[y2;Ypredict2(i,:)];
    YY=[YY;Ytest(i,:)];    
    end    
end

error1(T)=1-sum(y1==YY)/length(YY);
error2(T)=1-sum(y2==YY)/length(YY);
end
E=error1-error2;
%[h,p_value]=ttest(E,0);

Sk= sqrt( sum( (E-mean(E)*ones(1,length(E))).^2) /(length(E)-1));
tvalue=mean(E)*sqrt(length(E))/Sk;
P_value=1-tcdf(tvalue,length(E)-1);
if P_value>0.5 P_value=1-P_value; end
if (isTwoTail==1) P_value=2*P_value; end
p_value=P_value;

end

