function sel_var = order_vars(sel_var)

ord(1,:) = [sel_var{2,:}];
ord(2,:) = (1:length(ord));
ord = sortrows(ord',1,'descend')';

new_sel_var = {};
for i=1:size(ord,2)
   new_sel_var{1,end+1} = sel_var{1,ord(2,i)};
   new_sel_var{2,end} = sel_var{2,ord(2,i)};
end

sel_var = new_sel_var;

end