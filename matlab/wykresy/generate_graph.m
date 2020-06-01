
clear
clc
close all

[T, Ts, t] = get_data_from_sheet(1);

variables = T.Properties.VariableNames;
outputNames = {'DP','LT01'};

selected_out=2;
if selected_out==1
    load('out1v1.mat')
else
    load('out2v1.mat')
end

[sel_var1] = select_variables(variables, outputNames, T, coeff, 1);
if coeff>0.4
    coeff=0.4;
end
[sel_var2] = select_variables(variables, outputNames, T, coeff, 2);

sel_vars = [{sel_var1} {sel_var2}];

sel_var=sel_vars{selected_out};


na = x(1);
nb = x(2:1+width(sel_var));
nk = x(2+width(sel_var):1+2*width(sel_var));

n = [na nb nk];

[sys]=prep_system(T,outputNames,sel_var,Ts, x);

%testing result
result = 0;
for i=1:4
    [y,testy,~,~,own_fit,testt]=test_data(i,outputNames,sys,sel_var,t);
    fig = figure;
    hold on;
    plot(testt,testy,'b-','LineWidth',1.5);
    plot(testt,y.y,'r-','LineWidth',1.5);
    legend('y_{real}','y_{model}');
    ylabel(outputNames{selected_out});
    xlabel('Czas[s]');
    grid on;
    result = result+abs(own_fit);
    set(fig,'Position',[1000 300 1000 600]);
    
    filename=strcat(outputNames{selected_out},'_',num2str(i));
    saveas(fig,filename,'epsc')
    close all;
end

