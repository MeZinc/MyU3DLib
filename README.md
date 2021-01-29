# MyU3DLib（默认管线）
到处搞的些功能函数，自己总结写好，用什么直接打包丢过去。这里先暂时记录写了什么，等内容丰富了再补充。(图床搭建后再上传图片)

## C#

### 1.读取配置文件

scripts\ConfigFile文件夹下

`namespace MeZinc.ConfigDataManageMent`

DataForms.cs 下有`GlobalConfig`类，为配置文件数据结构。`ReadConfig`类下有静态类：`ReadConfigFile()`和`GenerateConfigFile()`。

GenConfigUI.cs挂在场景中运行时可以一键导出默认配置值。

### 2.网络通信（）

### 3.各种文件读取（）



## Shader

### 1.Shaping Functions

`#include "Assets\Shaders\shaping_functions.cginc"`



​	useful little functions from iquilezles https://www.iquilezles.org/www/articles/functions/functions.htm

**Almost Identity(I),m:threshold, n:zero input value**

 `float almostIdentity(float x, float m, float n)`

**Almost Unit Identity, m = 1,n = 0**

  `float almostIdentity(float x)`

**Almost Identity (II),smooth-abs(),a bit slower than the cubic abov.While it has zero derivative, it has a non-zero second derivative, which could cause problems in some situations**

 `float almostIdentity(float x, float n)`

**Exponential Impulse.when x = 1/k ,return 1.For anything grows fast and then slowly decays.**

 `float expImpulse(float x, float k)`

**Sustained Impulse.allows for control on the width of attack (through the parameter "k") and the release (parameter "f") independently.**

 `float sustainedImpulse( float x, float f, float k)`

**Quadratic Impulse**

 `float quaImpulse(float x, float k)`

**Polynomial Impulse**

 `float polyImpulse(float x, float n, float k)`

**Cubic Pulse c:center w:width**

 `float cubicImpulse(float x, float c, float w)`

**Exponential Step.when k=n=1, return exp(-x).The curve grows like step when n grows bigger.**

 `float expStep(float x, float k, float n)`

**Gain. k>1 y axis step.**

 `float gain(float x, float k)`

**Parabola,center 0.5.**

 `float parabola(float x, float k)`

**Power curve.**

 `float pcurve(float x, float a, float b)`

**Sinc curve.tweak the amount of bounces by k.Peaks at 1.0.**

 `float sinc(float x, float k)`

可在此补充：



### 2.Unity shader文档

https://docs.unity3d.com/Manual/SL-CullAndDepth.html

**深度写入的透明shader**：depthWriteTransparent.shader

**Debugging Normals（背面变粉色，调试用）**： debuggingNormal.shader

**Glass Culling**: glass.shader

**Alpha blending, alpha testing, alpha-to-coverage**:写法示例对应三个shader,AlphaBlending.shader,AlphaTest.shader,AlphaToCoverage.shader.

**EnumTest.shader**中列举了shader设置的各种下拉选项的写法（ZWrite,Stencil等等）。s



