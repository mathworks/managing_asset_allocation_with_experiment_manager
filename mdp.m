function [new_weights] = mdp(weights,returns,lambda)
    %Checks if entered data is timetable and mods if so
    if istimetable(returns)
        temp = timetable2table(returns);
        returns = tick2ret(temp(:,2:(length(weights)+1)));
    end
    %creates new Portfolio object
    p = Portfolio('NumAssets',length(weights));
    p = estimateAssetMoments(p,returns);
    %sets default constraints, i.e. weights are b/t 0 and 1 inclusive and must
    %sum up to 1
    p = setDefaultConstraints(p);
    sigma = sqrt(diag(p.AssetCovar));
    % Variance + Herfindahl-Hirschman (HH) index
    %0.1 instead of lambda for now
    MDPMixObjFun = @(x) x'*p.AssetCovar*x - lambda*(sigma'*x);
    % Solution that accounts for risk and HH diversification
    new_weights = estimateCustomObjectivePortfolio(p,MDPMixObjFun);
end