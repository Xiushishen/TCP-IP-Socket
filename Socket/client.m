clc 
clear
data_all = [];% Store data 
% Connection this IP address and port
tcpclient = tcpip('127.0.0.1', 8000, 'Timeout', 60, 'OutputBufferSize', 10240, 'InputBufferSize', 10240)
fopen(tcpclient);
%t.BytesAvailableFcnMode='byte'
fwrite(tcpclient, 'please sent');% Send a piece of data to tcp server to let server know the IP address and port of MATLAB.
while (1)
    nBytes = get(tcpclient, 'BytesAvailable');
    if nBytes > 0
        break;
    end
end
receive = fread(tcpclient, nBytes); % Read the data from tcp server

fclose(tcpclient);% Close connection

data = str2num(char(receive(2:end-1)')); % Convert from ASCII to str and then from str to array.
data_all=[data_all;data];
disp(data)
delete(tcpclient);