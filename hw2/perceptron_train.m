function [model] = perceptron_train( X , Y )
Y=2*Y-ones(length(Y),1);
k=1;
c(1)=0;
w(1,:)=zeros(1,length(X(1,:)));

t=1;
T= length(X(:,1));
round=10;
for i=1:round
while t <= T 
    
    if Y(t) * dot(w(k,:),X(t,:)) <= 0 
        w(k+1,:) = w(k,:) + Y(t)*X(t,:);
        c(k+1) = 1;
        k=k+1;
    else
        c(k) = c(k) + 1; 
    end
    
    t=t+1;
end
t=1;
end

model.k=k;
model.c=c;
model.w=w;

end

