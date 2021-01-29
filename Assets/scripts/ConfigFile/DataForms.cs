using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace  MeZinc.ConfigDataManageMent
{
    public class GlobalConfig
    {
        public int value;
        public float x;

        //default values.
        public GlobalConfig()
        {
            value = 0;
            x = 0.51f;
        }
    }
}