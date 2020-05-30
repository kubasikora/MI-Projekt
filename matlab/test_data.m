function [y,testy,fit,x0]=test_data(sheet_num,outputNames,sys,sel_var,t)

Ts = sys.Ts;

[testT, testTs, testt] = get_data_from_sheet(sheet_num);

%in case of different sampole times - interpolate data using spline
if testTs~=Ts
    testy = interp1(testt,testT.(outputNames{1}),t,'spline');
else
    testy = testT.(outputNames{1});
end

testu = [];
for i=1:width(sel_var)
    if testTs~=Ts
        testu(:,i) = interp1(testt,testT.(sel_var.Properties.VariableNames{i}),t,'spline');
    else
        testu(:,i) = testT.(sel_var.Properties.VariableNames{i});
    end
end
testdata = iddata(testy,testu,Ts);

[y,fit,x0] = compare(testdata,sys);

end