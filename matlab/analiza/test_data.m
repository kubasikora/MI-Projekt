function [y,testy,fit,x0,own_fit,testt]=test_data(sheet_num,outputNames,sys,sel_var,t)

Ts = sys.Ts;

[testT, testTs, testt] = get_data_from_sheet(sheet_num);
testt = 0:Ts:max(testt);
%in case of different sampole times - interpolate data using spline

testy = testT.(outputNames{1});
testy = testy(1:Ts/testTs:end);

testu = [];
for i=1:width(sel_var)
    temp = [];
    temp = testT.(sel_var.Properties.VariableNames{i});
    testu(:,i) = temp(1:Ts/testTs:end);
end
testdata = iddata(testy,testu,Ts);

[y,fit,x0] = compare(testdata,sys);

own_fit = sum((testy-y.y).^2)*1e5;

end