using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Net.Sockets;

public class ClientPeer
{
	private Socket clientSocket;                        //客户端socket
	private string ip;                                  //ip地址
	private int port;                                   //端口号
	private byte[] receiveBuffer = new byte[1024];      //用于接收数据的缓冲区
	private List<byte> dataCache = new List<byte>();    //用于接收到数据存放入的缓冲区
	private bool isProcessReceiving;                    //是否正在处理接收
	public Queue<SocketMessage> SocketMsgQueue = new Queue<SocketMessage>();       //缓存接收到的服务器数据

	public ClientPeer(string _ip, int _port)            //初始化
	{
		try
		{
			clientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
			ip = _ip;
			port = _port;
		}
		catch(Exception _e)
		{
			Debug.LogError(_e.Message);
		}
	}
	public void Connect()
	{
		try
		{
			clientSocket.Connect(ip, port);
			startReceive();
		}
		catch(Exception _e)
		{
			Debug.LogError(_e.Message);
		}
	}
	private void startReceive()                         //开始接受数据
	{
		if(null == clientSocket && clientSocket.Connected == false)
		{
			Debug.LogError("连接失败，无法发送数据");
			return;
		}
		clientSocket.BeginReceive(receiveBuffer, 0, 1024, SocketFlags.None, receiveCallBack, clientSocket);
	}
	private void receiveCallBack(IAsyncResult _asyncResult)             //收到消息的回调
	{
		try
		{
			int tLength = clientSocket.EndReceive(_asyncResult);
			byte[] tByteArray = new byte[tLength];
			Buffer.BlockCopy(receiveBuffer, 0, tByteArray, 0, tLength);     //将接受到的byte[]复制到本地缓冲的byteBuffer

			dataCache.AddRange(tByteArray);
			if(isProcessReceiving == false)                                 //此时没有处理接收则处理
			{
				processReceive();
			}
			startReceive();                                                 //递归，不断接收
		}
		catch(Exception _e)
		{
			Debug.LogError(_e.Message);
		}
	}
	private void processReceive()
	{
		isProcessReceiving = true;
		byte[] tData = EncodeTool.DecodePacket(ref dataCache);      //解析数据
		if(null == tData)
		{
			isProcessReceiving = false;
			return;
		}
		SocketMessage tSocketMessage = EncodeTool.DecodeMsg(tData);
		SocketMsgQueue.Enqueue(tSocketMessage);         //存储消息，等待处理
		processReceive();                               //递归，不断接收
	}
	public void Send(int _opCode, int _subCode, object _value)          //发送消息
	{
		//Debug.LogError("!!!"+_opCode+"!"+_subCode+ "!"+_value.ToString());
		SocketMessage tSocketMessage = new SocketMessage(_opCode, _subCode, _value);
		sendSocketMessage(tSocketMessage);
	}
	private void sendSocketMessage(SocketMessage _socketMessage)
	{
		byte[] tData = EncodeTool.EncodeMsg(_socketMessage);
		byte[] tPacket = EncodeTool.EncodePacket(tData);                //打包数据
		try
		{
			clientSocket.Send(tPacket);
		}
		catch(Exception _exception)
		{
			Debug.LogError(_exception.Message);
		}
	}
}
