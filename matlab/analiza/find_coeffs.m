function [result] = find_coeffs(T, Ts, t, variables, outputNames, selected_out, coeff, final)
    %selecting variables
    preset=0;
    
    if preset==1
        coeff=0;
    end
    
    [sel_var1] = select_variables(variables, outputNames, T, coeff, 1);
    if coeff>0.4
        coeff2=0.4;
    else
        coeff2=coeff;
    end
    [sel_var2] = select_variables(variables, outputNames, T, coeff2, 2);
    
    if preset==1
        sel_var1=sel_var1(:,'FWF');
        sel_var2=sel_var2(:,'PT01');
    end
    

    %na = 10;%order of polynomial A(q), Ny-by-Ny
    %nb = ones(1,width(sel_var1))*10;%order of polynomial B(q) + 1,  Ny-by-Nu
    %nk = ones(1,width(sel_var1))*10;%input-output delay, Ny-by-Nu

    %modelling

    sel_vars = [{sel_var1} {sel_var2}];

    varnum = 1+2*width(sel_vars{selected_out});

    lb = ones(1+2*width(sel_vars{selected_out}),1);
    ub = [100  ones(1,width(sel_vars{selected_out}))*30 ones(1,width(sel_vars{selected_out}))*200];
    IntCon = 1:length(lb);

    f=@(x)model_and_verify(T, outputNames, sel_vars, t, Ts, x, selected_out, 0);
    f_final=@(x)model_and_verify(T, outputNames, sel_vars, t, Ts, x, selected_out, 1);
    
    opts = optimoptions('ga','UseParallel', true, 'UseVectorized', false, 'TimeLimit', 1000, 'MaxGenerations', 10000, 'MaxStallGenerations', 5,'ConstraintTolerance',1e-25);

    [x,fval] = ga(f,varnum,[],[],[],[],lb,ub,[],IntCon,opts);
    
    if final==1
        [result] = f_final(x);
        coeff
        x
    end
    result = fval;
end