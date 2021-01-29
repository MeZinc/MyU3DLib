using UnityEngine;
using MeZinc.ConfigDataManageMent;

/// <summary>
/// 用于自动生成Json配置文件
/// </summary>
public class GenConfigUI : MonoBehaviour
{
    private void OnGUI()
    {
        ////生成json 
        if(GUI.Button(new Rect(50,50,100,50),"生成Json"))
        {
            GlobalConfig tmpConfig = new GlobalConfig();
            ReadConfig.GenerateConfigFile(tmpConfig);
        }
        ////读取json
        //if(GUI.Button(new Rect(50,110,100,50),"读取Json"))
        //{
        //    GlobalConfig globalConfig = ReadConfig.ReadConfigFile();

        //    Debug.Log("分辨率：" + globalConfig.resWidth + "x" + globalConfig.resHeight + " 选取区域：" + globalConfig.interactRect.ToString());
        //}
    }



}
