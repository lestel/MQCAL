for i=1:12
    eval(['load(''',num2str(i),'[id].mat'')']);
        eval(['load(''',num2str(i),'[id][sd].mat'')']);
    info_id.resource=[num2str(i),'.mat'];
    info_sd.resource=[num2str(i),'.mat'];
    eval(['save(''',num2str(i),'[id].mat'',''info_id'',''test'',''train'');'])
    eval(['save(''',num2str(i),'[id][sd].mat'',''info_sd'',''dataflow_list'');'])
    num(1,i)=size(train,1);
end 