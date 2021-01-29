Shader "MyLib/AlmostIdentity"
{
    Properties
    {
        _LineColor("Tint", color)=(1,1,1,1)
        _M ("m", Range(0,1)) = 0.5
        
        _N ("n", Range(0,1)) = 0.1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"
            #include "Assets\Shaders\shaping_functions.cginc"

            float4 _LineColor;
            float _M,_N;
            

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };
            
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {

                float3 color = _LineColor;
                
                float shape;
                //shape = step(almostIdentity(i.uv.x, _M, _N),i.uv.y) - step(almostIdentity(i.uv.x, _M, _N) + 0.01,i.uv.y);
                //shape =step(almostIdentity(i.uv.x), i.uv.y) - step(almostIdentity(i.uv.x) + 0.01, i.uv.y);
                //shape =step(almostIdentity(i.uv.x, _N), i.uv.y) - step(almostIdentity(i.uv.x, _N) + 0.01, i.uv.y);
                //shape =step(expImpulse(i.uv.x, 10.0), i.uv.y) - step(expImpulse(i.uv.x, 10.0) + 0.01, i.uv.y);
                //shape =step(sustainedImpulse(i.uv.x , _N, 10.0), i.uv.y *2.0 ) - step(sustainedImpulse(i.uv.x , _N, 10.0) + 0.01, i.uv.y*2.0);
                //shape = step(quaImpulse(i.uv.x , 20.0), i.uv.y) - step(quaImpulse(i.uv.x , 20.0) + 0.01, i.uv.y);
                //shape = step(polyImpulse(i.uv.x , 2.0, 20.0), i.uv.y) - step(polyImpulse(i.uv.x , 2.0, 20.0) + 0.01, i.uv.y);
                //shape = step(cubicImpulse(i.uv.x , 0.6, 0.3), i.uv.y) - step(cubicImpulse(i.uv.x , 0.6, 0.3) + 0.01, i.uv.y);
                shape = step(expStep(i.uv.x , 6.0, 15.0), i.uv.y) - step(expStep(i.uv.x , 6.0, 15.0) + 0.01, i.uv.y);
                //shape = step(gain(i.uv.x , 11.2), i.uv.y) - step(gain(i.uv.x , 11.2) + 0.01, i.uv.y);
                //shape = step(parabola(i.uv.x , 11.2), i.uv.y) - step(parabola(i.uv.x , 11.2) + 0.01, i.uv.y);
                //shape = step(pcurve(i.uv.x , _M, _N), i.uv.y) - step(pcurve(i.uv.x , _M, _N) + 0.01, i.uv.y);
                //shape = step(sinc(i.uv.x * 2.0, 10.0), i.uv.y * 2.0 - 1.0) - step(sinc(i.uv.x * 2.0, 10.0) + 0.01, i.uv.y * 2.0 - 1.0);
                return float4(color*shape,1.0);
            }

            ENDCG
        }
    }
}
