clear
clc
close all

[T, Ts, t] = get_data_from_sheet(1);

variables = T.Properties.VariableNames;
outputNames = {'DP','LT01'};

selected_out=2;

if selected_out==1
    lb = 0.4;
    ub = 0.6;
else
    lb = 0.3;
    ub = 0.4;
end

f=@(x)find_coeffs(T, Ts, t, variables, outputNames, selected_out, x, 0);
f_final=@(x)find_coeffs(T, Ts, t, variables, outputNames, selected_out, x, 1);

starttime = cputime;

%opts = optimoptions('ga','UseParallel', true, 'UseVectorized', false, 'TimeLimit', 60, 'MaxGenerations', 4);
%opts.Display = 'iter';
%[x,fval] = ga(f,1,[],[],[],[],lb,ub,[],[],opts);

result = Inf;
solution = 0;
for i=lb:0.1:ub
    new_result = f(i);
    if new_result<result
        result = new_result;
        solution = i;
    end
end
x = solution;
endtime = cputime;


elapsed_time = endtime-starttime;


[result] = f_final(x);