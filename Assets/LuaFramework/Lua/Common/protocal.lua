--Buildin Table
Protocal = {
	Connect		= '101';	--连接服务器
	Exception   = '102';	--异常掉线
	Disconnect  = '103';	--正常断线   
	Message		= '104';	--接收消息
}


OpCode={
	Account=0
}

SubCode={
	CreateRoom_ClientReq=1000,			--创建房间客户端请求
	CreateRoom_ServerRes=1001,				--创建房间服务器回应
}
