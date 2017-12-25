using UnityEngine;
using System.Collections;
using System.IO;
using System;

namespace LuaFramework {
    public class ResourceManager : Manager {
        private AssetBundle shared;

        /// <summary>
        /// ��ʼ��
        /// </summary>
        public void initialize(Action func) {
            if (AppConst.ExampleMode) {
                //------------------------------------Shared--------------------------------------
                string uri = Util.DataPath + "shared" + AppConst.ExtName;
                Debug.LogWarning("LoadFile::>> " + uri);

                shared = AssetBundle.LoadFromFile(uri);
#if UNITY_5
                shared.LoadAsset("Dialog", typeof(GameObject));
#else
                shared.Load("Dialog", typeof(GameObject));
#endif
            }
            if (func != null) func();    //��Դ��ʼ����ɣ��ص���Ϸ��������ִ�к������� 
        }

        /// <summary>
        /// �����ز�
        /// </summary>
        public AssetBundle LoadBundle(string name) {
            string uri = Util.DataPath + name.ToLower() + AppConst.ExtName;
            AssetBundle bundle = AssetBundle.LoadFromFile(uri); //�������ݵ��زİ�
            return bundle;
        }

        /// <summary>
        /// ������Դ
        /// </summary>
        void OnDestroy() {
            if (shared != null) shared.Unload(true);
            Debug.Log("~ResourceManager was destroy!");
        }
    }
}