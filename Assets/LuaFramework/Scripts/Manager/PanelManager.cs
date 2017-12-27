using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using LuaInterface;

namespace LuaFramework
{
	public class PanelManager : Manager
	{
		private Transform parent;
		Transform Parent
		{
			get
			{
				if(parent == null)
				{
					GameObject go = GameObject.FindWithTag("GuiCamera");
					if(go != null)
						parent = go.transform;
				}
				return parent;
			}
		}

		private Dictionary<string, GameObject> loadedPanelDic = new Dictionary<string, GameObject>();   //缓存的面板

		/// <summary>
		/// 创建面板，请求资源管理器
		/// </summary>
		/// <param name="type"></param>
		public void CreatePanel(string name, LuaFunction func = null)
		{
			StartCoroutine(StartCreatePanel(name, func));
		}

		/// <summary>
		/// 创建面板
		/// </summary>
		IEnumerator StartCreatePanel(string name, LuaFunction func = null)
		{
			AssetBundle bundle = ResManager.LoadBundle(name);

			name += "Panel";
			GameObject prefab = null;
#if UNITY_5
			prefab = bundle.LoadAsset(name, typeof(GameObject)) as GameObject;
#else
            prefab = bundle.Load(name, typeof(GameObject)) as GameObject;
#endif
			yield return new WaitForEndOfFrame();

			if(Parent.FindChild(name) != null || prefab == null)
			{
				yield break;
			}
			GameObject go = Instantiate(prefab) as GameObject;
			go.name = name;
			go.layer = LayerMask.NameToLayer("Default");
			go.transform.parent = Parent;
			go.transform.localScale = Vector3.one;
			go.transform.localPosition = Vector3.zero;

			yield return new WaitForEndOfFrame();
			go.AddComponent<LuaBehaviour>().OnInit(bundle);
			if(func != null)
				func.Call(go);
			Debug.Log("StartCreatePanel------>>>>" + name);
			if(!loadedPanelDic.ContainsKey(name))
			{
				loadedPanelDic.Add(name, go);           //将加载完成的Panel加入dic
			}
		}

		/// <summary>
		/// 关闭面板
		/// </summary>
		/// <param name="name"></param>
		public void ClosePanel(string name)
		{
			var panelName = name + "Panel";
			var panelObj = Parent.FindChild(panelName);
			if(panelObj == null)
				return;
			Destroy(panelObj.gameObject);
			if(loadedPanelDic.ContainsKey(panelName))
			{
				loadedPanelDic.Remove(panelName);       //销毁需要移除Panel
			}
		}

		public void SetPanelActive(string _panelName, bool _isShow, LuaFunction _luaFunction = null)          //控制面板是否显示
		{
			//Debug.LogError(_panelName + "!!!!!!!!!");
			if(loadedPanelDic.ContainsKey(_panelName))
			{
				//Debug.LogError(loadedPanelDic[_panelName].gameObject.activeSelf);
				loadedPanelDic[_panelName].SetActive(_isShow);
				if(null != _luaFunction)
				{
					_luaFunction.Call();        //执行刷新回调
				}
			}
		}


		//public GameObject GetPanel(string _name)            //获取指定的Panel
		//{
		//	string tPanelName = _name + "Panel";
		//	if(loadedPanelDic.ContainsKey(tPanelName))
		//	{
		//		return loadedPanelDic[tPanelName];
		//	}
		//	Debug.LogError("错误：不存在指定的Panel");
		//	return null;
		//}

	}
}