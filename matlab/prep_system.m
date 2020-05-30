function [sys]=prep_system(T,outputNames,sel_var,Ts, n)
    y = medfilt1(T.(outputNames{1}),5);
    u = [];
    for i=1:width(sel_var)
        u(:,i) = medfilt1(T.(sel_var.Properties.VariableNames{i}),5);
    end
    data1 = iddata(y,u,Ts);


    sys = arx(data1, n ); %próba wymodelowania arx
end