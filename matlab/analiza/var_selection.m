
var_count=56;
class_count=2;
sample_count=size(data,1);

data_norm=zeros(sample_count,var_count);
labels=-1*ones(sample_count,class_count);
avg=zeros(var_count,1);

cos2=zeros(var_count);
var_ranking=zeros(class_count,var_count);
original_var_no=1:1:var_count;

for i=1:1:var_count,
   avg(i)=mean(data(:,i));
   data_norm(:,i)=data(:,i)-avg(i);
end

for i=1:1:sample_count,
   labels(i,data(i,var_count+1))=1;
end

for class_no=1:1:class_count,
    data_ort=data_norm;
    for sel_feature_no=1:1:var_count,
        cos2=zeros(var_count,1);
        for var_no=sel_feature_no:1:var_count,
            exp1=0;
            exp2=0;
            exp3=0;
           for i=1:1:sample_count,
               exp1=exp1+data_ort(i,var_no)*labels(i,class_no);
               exp2=exp2+data_ort(i,var_no)^2;
               exp3=exp3+labels(class_no)^2;
           end
           cos2(var_no)=exp1^2/(exp2*exp3);
        end 
                
        [max_r, var_idx]=max(cos2);
        var_ranking(class_no,sel_feature_no)=original_var_no(var_idx);
        temp=data_ort(:,sel_feature_no);
        data_ort(:,sel_feature_no)=data_ort(:,var_idx);
        data_ort(:,var_idx)=temp;
        
        temp=original_var_no(sel_feature_no);
        original_var_no(sel_feature_no)=original_var_no(var_idx);
        original_var_no(var_idx)=temp;
        
        for i=sel_feature_no+1:1:var_count,
            V=data_ort(:,sel_feature_no);
            U=data_ort(:,i);
            UprojV=((U'*V)/(V'*V))*V;
            UortV=U-UprojV;
            data_ort(:,i)=UortV;
        end
        
    end
    figure(3140+class_no);
    idx_pos=find(data(:,5)==class_no);
    idx_neg=find(data(:,5)~=class_no);
    plot(data(idx_pos,var_ranking(class_no,1)),data(idx_pos,var_ranking(class_no,2)),'ro');
    hold on;
    plot(data(idx_neg,var_ranking(class_no,1)),data(idx_neg,var_ranking(class_no,2)),'k.');
end
