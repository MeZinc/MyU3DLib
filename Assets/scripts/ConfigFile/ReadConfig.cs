using System.IO;
using UnityEngine;

namespace MeZinc.ConfigDataManageMent
{
    public class ReadConfig
    {

        private static string configFilePath = Application.streamingAssetsPath + "/Config.json";

        public static GlobalConfig ReadConfigFile()
        {
            GlobalConfig globalConfig = new GlobalConfig();
            if (File.Exists(configFilePath))
            {
                string json = File.ReadAllText(configFilePath);
                globalConfig = JsonUtility.FromJson<GlobalConfig>(json);
            }
            return globalConfig;
        }

        public static void GenerateConfigFile(GlobalConfig config)
        {
            string json = JsonUtility.ToJson(config, true);
            File.WriteAllText(configFilePath, json);
        }
    }
}

