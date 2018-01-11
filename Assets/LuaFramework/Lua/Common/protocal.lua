--Buildin Table
Protocal = {
	Connect		= '101';	--连接服务器
	Exception   = '102';	--异常掉线
	Disconnect  = '103';	--正常断线   
	Message		= '104';	--接收消息
}


OpCode={
	Account=0,
	Room=1,				--对房间的操作
	Battle=2,			--进入房间后的操作

}

SubCode={
	Ready_ClientReq=1002,					--准备游戏客户端请求
	Ready_ServerRes=1003,					--准备游戏服务器回应

	CreateRoom_ClientReq=1200,				--创建房间客户端请求
	CreateRoom_ServerRes=1201,				--创建房间服务器回应
	EnterRoom_ClientReq = 1202,				--进入房间客户端请求
	EnterRoom_SuccessServerRes = 1203,		--进入房间成功服务器回应
	EnterRoom_FailServerRes=1206,			--进入房间失败服务器回应
	ExitRoom_ClientReq=1204,				--退出房间客户端请求
	ExitRoom_ServerRes=1205,				--退出房间服务器回应
}
