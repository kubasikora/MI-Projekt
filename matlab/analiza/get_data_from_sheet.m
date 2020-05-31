function [T, Ts, t] = get_data_from_sheet(sheet_num)
    opts = detectImportOptions('K-1_MI.xlsx');
    opts.Sheet=sheet_num;
    T = readtable('K-1_MI.xlsx',opts);

    t=datenum(T.date,'dd/mm/yyyy HH:MM:SS');
    t = round((t-t(1)) * (24 * 60 * 60));
    Ts = t(2)-t(1);
    
    t = datenum(T.date,'dd/mm/yyyy HH:MM:SS');
    t = round((t-t(1)) * (24 * 60 * 60));
end