

function model=nb_train(x,y)
model.nY=sum(y);
model.total=length(y);
model.tokenY=x'*y;
model.tokenNY=x'*(ones(length(y),1)-y);
model.tokenT=sum(model.tokenY);
model.tokenNT=sum(model.tokenNY);
end

