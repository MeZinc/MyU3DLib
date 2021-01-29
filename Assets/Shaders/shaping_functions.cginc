#if !defined(SHAPING_FUNCTIONS_INCLUDED)
    #define SHAPING_FUNCTIONS_INCLUDED

    #define PI 3.1415926535

    // useful little functions from iquilezles https://www.iquilezles.org/www/articles/functions/functions.htm


    // Almost Identity(I),m:threshold, n:zero input value
    float almostIdentity(float x, float m, float n)
    {
        if(x > m) return x;

        const float a = 2.0 * n - m;
        const float b = 2.0 * m - 3.0 * n;
        const float t = x / m;
        return (a * t + b) * t * t + n;
    }

    // Almost Unit Identity, m = 1,n = 0
    float almostIdentity(float x)
    {
        return x*x*(2.0-x);
    }

    // Almost Identity (II),smooth-abs(),a bit slower than the cubic abov.While it has zero derivative, it has a non-zero second derivative, which could cause problems in some situations
    float almostIdentity(float x, float n)
    {
        return sqrt(x*x + n);
    }

    // Exponential Impulse.when x = 1/k ,return 1.For anything grows fast and then slowly decays.
    float expImpulse(float x, float k)
    {
        const float h = k * x;
        return h * exp(1.0 - h);
    }

    // Sustained Impulse.allows for control on the width of attack (through the parameter "k") and the release (parameter "f") independently.
    float sustainedImpulse( float x, float f, float k)
    {
        float s = max(x - f, 0.0);
        return min( x*x/(f*f), 1+(2.0/f)*s*exp(-k*s));
    }

    // Quadratic Impulse
    float quaImpulse(float x, float k)
    {
        return 2.0 * sqrt(k) * x / (1.0 + k * x * x);
    }

    // Polynomial Impulse.
    float polyImpulse(float x, float n, float k)
    {
        return (n/(n-1.0))*pow((n-1.0)*k,1.0/n) * x/(1.0+k*pow(x,n));
    }

    // Cubic Pulse c:center w:width
    float cubicImpulse(float x, float c, float w)
    {
        x = abs(x - c);
        if( x>w ) return 0.0;
        x /= w;
        return 1.0 - x * x * (3.0 - 2.0 * x);
    }
    
    // Exponential Step.when k=n=1, return exp(-x).The curve grows like step when n grows bigger.
    float expStep(float x, float k, float n)
    {
        return exp(-k * pow(x, n));
    }

    // Gain. k>1 y axis step.
    float gain(float x, float k)
    {
        const float a = 0.5 * pow(2.0 * ((x < 0.5) ? x : 1.0 -x), k);
        return (x < 0.5) ? a : 1.0 - a;
    }

    // Parabola,center 0.5.
    float parabola(float x, float k)
    {
        return pow(4.0 * x * (1.0 - x), k);
    }

    // Power curve.
    float pcurve(float x, float a, float b)
    {
        const float k = pow(a + b, a + b) / (pow(a, a)*pow(b, b));
        return k * pow(x, a) * pow(1.0 - x, b);
    }

    // Sinc curve.tweak the amount of bounces by k.Peaks at 1.0.
    float sinc(float x, float k)
    {
        const float a = PI * (k * x - 1.0);
        return sin(a) / a;
    }

#endif