function [var_set] = select_variables(variables, outputNames, T, thrs, selected_out)

coefs = {};
for i=2:1:length(variables)
    if ~ismember(variables(i),outputNames)
        coefs{1,end+1} = variables{i};
        c = corrcoef(T.(i),T.(outputNames{selected_out}));
        coefs{2,end} = abs(c(1,2));
    end
end

sel_var = {};
sel_var2 = {};

MIN_COEF = thrs;
for i=1:length(coefs)
    if coefs{2,i}>MIN_COEF
        sel_var{1,end+1} = coefs{1,i};
        sel_var{2,end} = coefs{2,i};
    end
end
sel_var = order_vars(sel_var);

var_set = cell2table(sel_var(2,:),'VariableNames',sel_var(1,:));

end