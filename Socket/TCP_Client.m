clc
clear

data_all=[]; %Store data
tcpclient= tcpip('127.0.0.1', 8000, 'Timeout', 60,'InputBufferSize',10240);%连接这个ip和这个端口的UDP服务器
%t.BytesAvailableFcnMode='byte'
while(1)
    fopen(tcpclient);
    fwrite(tcpclient,'get');% Send a piece of data to tcp server to let server know the IP address and port of MATLAB.
    while(1)
        nBytes = get(tcpclient,'BytesAvailable');
        if nBytes>0
            break;
        end
    end
    receive = fread(tcpclient,nBytes);% Read the data from tcp server
    %fread(t);
    fclose(tcpclient); % Close connection
    data=str2num(char(receive(2:end-1)'));% Convert from ASCII to str and then from str to array.
    data_all=[data_all;data];
    data
    pause(0.0001);
    plot(data)
end
delete(tcpclient);
