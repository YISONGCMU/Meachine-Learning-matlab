function Pred_nb = nb_test(model,Xtest)
Y=model.tokenY;
T=model.tokenT;
NY=model.tokenNY;
NT=model.tokenNT;


Y=Y+ones(length(Y),1);
NY=NY+ones(length(NY),1);


Yture=Xtest*(log(Y/(T+41567)))+log(model.nY/model.total)*ones(length(Xtest(:,1)),1);
Yfalse=Xtest*(log(NY/(NT+41567)))+log(1-model.nY/model.total)*ones(length(Xtest(:,1)),1);

Pred_nb=Yture>Yfalse;

end

