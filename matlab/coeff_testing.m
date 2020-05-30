clear
clc
close all

selected_out=2;
coeff=0.2;

outputNames = {'DP','LT01'};

[T, Ts, t] = get_data_from_sheet(1);
variables = T.Properties.VariableNames;
[sel_var1] = select_variables(variables, outputNames, T, coeff, selected_out);

coeff=0.1;
[T, Ts, t] = get_data_from_sheet(2);
variables = T.Properties.VariableNames;
[sel_var2] = select_variables(variables, outputNames, T, coeff, selected_out);

coeff=0.3;
[T, Ts, t] = get_data_from_sheet(3);
variables = T.Properties.VariableNames;
[sel_var3] = select_variables(variables, outputNames, T, coeff, selected_out);

coeff=0.5;
[T, Ts, t] = get_data_from_sheet(4);
variables = T.Properties.VariableNames;
[sel_var4] = select_variables(variables, outputNames, T, coeff, selected_out);


total_select = intersect(sel_var1.Properties.VariableNames,sel_var2.Properties.VariableNames);
total_select = intersect(total_select,sel_var3.Properties.VariableNames);
total_select = intersect(total_select,sel_var4.Properties.VariableNames)