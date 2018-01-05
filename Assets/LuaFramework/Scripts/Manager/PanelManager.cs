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

		private Dictionary<string, GameObject> loadedPanelDic = new Dictionary<string, GameObject>();   //��������

		/// <summary>
		/// ������壬������Դ������
		/// </summary>
		/// <param name="type"></param>
		public void CreatePanel(string name, LuaFunction func = null)
		{
			StartCoroutine(StartCreatePanel(name, func));
		}

		/// <summary>
		/// �������
		/// </summary>
		IEnumerator StartCreatePanel(string name, LuaFunction func = null)
		{
			AssetBundle bundle = ResManager.LoadBundle(name);

			
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
				loadedPanelDic.Add(name, go);           //��������ɵ�Panel����dic
			}
		}

		/// <summary>
		/// �ر����
		/// </summary>
		/// <param name="name"></param>
		public void ClosePanel(string _panelName)
		{
			var panelObj = Parent.FindChild(_panelName);
			if(panelObj == null)
				return;
			Destroy(panelObj.gameObject);
			if(loadedPanelDic.ContainsKey(_panelName))
			{
				loadedPanelDic.Remove(_panelName);       //������Ҫ�Ƴ�Panel
			}
		}

		public void SetPanelActive(string _panelName, bool _isShow, LuaFunction _luaFunction = null)      //��������Ƿ���ʾ
		{
			if(loadedPanelDic.ContainsKey(_panelName))
			{
				loadedPanelDic[_panelName].SetActive(_isShow);
				if(null != _luaFunction)
				{
					_luaFunction.Call();        //ִ��ˢ�»ص�
				}
			}
		}


		//public GameObject GetPanel(string _name)            //��ȡָ����Panel
		//{
		//	string tPanelName = _name + "Panel";
		//	if(loadedPanelDic.ContainsKey(tPanelName))
		//	{
		//		return loadedPanelDic[tPanelName];
		//	}
		//	Debug.LogError("���󣺲�����ָ����Panel");
		//	return null;
		//}

	}
}