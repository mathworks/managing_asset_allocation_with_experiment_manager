function [returns,volatility,turnover] = summarize_backtest(backtester)

summarystrat = summary(backtester);
%Portfolio returns
returns = table2array(summarystrat("TotalReturn",:));
%Portfolio volatility
volatility = table2array(summarystrat("Volatility",:));
%Portfolio turnover
turnover = table2array(summarystrat("AverageTurnover",:));

end