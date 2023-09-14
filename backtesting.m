function [backtester] = backtesting(strat,fnx_hndl,init_weights)
%defines backtesting strategy
strat = backtestStrategy(strat,fnx_hndl,'RebalanceFrequency',21,'TransactionCosts',0.005,'LookbackWindow',40,'InitialWeights',init_weights);
%Creates backtesting engine 
backtester = backtestEngine(strat, 'RiskFreeRate', 0.01);

end