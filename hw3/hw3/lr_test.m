function Pred_lr = lr_test(model,X)

for i=1 : length(X(:,1) )
    p=1/(1+exp(-1*dot(X(i,:),model.w)));
    if p>0.5 Pred_lr(i)=1; else Pred_lr(i)=0; end        
end


end

