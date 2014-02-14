function Pred_per = perceptron_test( model, Xtest )

Pred_per = (sign(sign(Xtest*model.w')*model.c')+ones(length(Xtest(:,1)),1))/2;


end

