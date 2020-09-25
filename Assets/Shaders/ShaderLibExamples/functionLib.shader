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
            //#include "shaping_functions.cginc"

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

            float almostIdentity(float x, float m, float n)
            {
                if(x > m) return x;

                const float a = 2.0 * n - m;
                const float b = 2.0 * m - 3.0 * n;
                const float t = x / m;
                return (a * t + b) * t * t + n;
            }

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
                
                float shape =step(almostIdentity(i.uv.x, _M, _N),i.uv.y) - step(almostIdentity(i.uv.x, _M, _N) + 0.01,i.uv.y);


                return float4(color*shape,1.0);
            }

            ENDCG
        }
    }
}
