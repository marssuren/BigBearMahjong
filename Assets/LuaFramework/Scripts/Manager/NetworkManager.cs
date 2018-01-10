using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using LuaInterface;

namespace LuaFramework
{
	public class NetworkManager : Manager
	{
		//private SocketClient socket;
		private ClientPeer _clientPeer;
		private ClientPeer clientPeer
		{
			get
			{
				if(null == _clientPeer)
				{
					_clientPeer = new ClientPeer(AppConst.SocketAddress, AppConst.SocketPort);
				}

				return _clientPeer;
			}
		}

		static readonly object m_lockObject = new object();
		static Queue<KeyValuePair<int, ByteBuffer>> mEvents = new Queue<KeyValuePair<int, ByteBuffer>>();

		//SocketClient SocketClient
		//{
		//	get
		//	{
		//		if(socket == null)
		//			socket = new SocketClient();
		//		return socket;
		//	}
		//}

		void Awake()
		{
			Init();
		}

		void Init()
		{
			//SocketClient.OnRegister();
		}

		public void OnInit()
		{
			CallMethod("Start");
		}

		public void Unload()
		{
			CallMethod("Unload");
		}

		/// <summary>
		/// 执行Lua方法
		/// </summary>
		public object[] CallMethod(string func, params object[] args)
		{
			return Util.CallMethod("Network", func, args);
		}

		///------------------------------------------------------------------------------------
		public static void AddEvent(int _event, ByteBuffer data)
		{
			lock(m_lockObject)
			{
				mEvents.Enqueue(new KeyValuePair<int, ByteBuffer>(_event, data));
			}
		}

		/// <summary>
		/// 交给Command，这里不想关心发给谁。
		/// </summary>
		void Update()
		{
			//if(mEvents.Count > 0)
			//{
			//	while(mEvents.Count > 0)
			//	{
			//		KeyValuePair<int, ByteBuffer> _event = mEvents.Dequeue();
			//		facade.SendMessageCommand(NotiConst.DISPATCH_MESSAGE, _event);
			//	}
			//}
			if(clientPeer.SocketMsgQueue.Count > 0)
			{
				SocketMessage tSocketMessage = clientPeer.SocketMsgQueue.Dequeue();
				processMessage(tSocketMessage);
			}
		}
		private void processMessage(SocketMessage _socketMessage)
		{

			//int tOpCode = _socketMessage.OpCode;
			//int tSubCode = _socketMessage.SubCode;
			//object tValue = _socketMessage.Value;
			//Debug.LogError(tOpCode);
			//Debug.LogError(tSubCode);

			//Debug.LogError(tValue);

			Util.CallMethod("Network","ProcessSocketMessage",_socketMessage);
		}

		/// <summary>
		/// 发送链接请求
		/// </summary>
		public void SendConnect()
		{
			//SocketClient.SendConnect();
			clientPeer.Connect();
		}

		/// <summary>
		/// 发送SOCKET消息
		/// </summary>
		//public void SendMessage(ByteBuffer buffer)
		//{
		//	Debug.LogError(null == SocketClient);
		//	SocketClient.SendMessage(buffer);
		//}

		public void SendSocketMessage(int _opCode, int _subCode, object _value)
		{
			//Debug.LogError(_opCode==null||_subCode==null||_value==null);
			clientPeer.Send(_opCode, _subCode, _value);
		}
		public void SendByteMessage(byte[] _byteMessage)
		{
			ByteBuffer tByteBuffer = new ByteBuffer(_byteMessage);
			//SocketClient.SendMessage(tByteBuffer);
		}
		/// <summary>
		/// 析构函数
		/// </summary>
		void OnDestroy()
		{
			//SocketClient.OnRemove();
			Debug.Log("~NetworkManager was destroy");
		}
	}
}