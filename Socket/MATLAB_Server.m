% Find the host name and address of the machine where the server is
% created. The client uses this address to connect to the sercer.
[~,hostname] = system('hostname');
hostname = string(strtrim(hostname));
address = resolvehost(hostname,"address");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define server port number
portNumber = 5004; % It can be any number.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created Server
server = tcpserver(address,portNumber,"ConnectionChangedFcn",@connectionFcn)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function connectionFcn(src, ~)
%Client is connected
if src.Connected
    disp("Client connected")
    %Rea Write infinitly with connected client
    while true
        readData = read(src,src.NumBytesAvailable,'string');
        disp(readData);
        write(src,"Bye Bye","string");
        %Sleep for 5 millisecond
        java.lang.Thread.sleep(5);
    end
end
end