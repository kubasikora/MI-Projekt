function [result] = model_and_verify(T, outputNames, sel_vars, t, Ts, x, selected_out, final)

sel_var=sel_vars{selected_out};

na = x(1);
nb = x(2:1+width(sel_var));
nk = x(2+width(sel_var):1+2*width(sel_var));

n = [na nb nk];

[sys]=prep_system(T,outputNames,sel_var,Ts, x);

%testing result
result = 0;
[y,testy,fit,x0]=test_data(1,outputNames,sys,sel_var,t);
result = result+abs(fit);
[y,testy,fit,x0]=test_data(2,outputNames,sys,sel_var,t);
result = result+abs(fit);
[y,testy,fit,x0]=test_data(3,outputNames,sys,sel_var,t);
result = result+abs(fit);
%[y,testy,fit,x0]=test_data(4,outputNames,sys,sel_var,t);
%result = result+abs(fit)

if final==1
    figure;
    hold on
    plot(t,y.y);
    plot(t,testy);
    legend('Identified model','True output');
end
end