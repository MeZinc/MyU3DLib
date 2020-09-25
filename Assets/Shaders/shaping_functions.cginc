#if !defined(SHAPING_FUNCTIONS_INCLUDED)
    #define SHAPING_FUNCTIONS_INCLUDED

    //useful little functions from iquilezles https://www.iquilezles.org/www/articles/functions/functions.htm
    //Almost Identity(I)
    float almostIdentity(float x, float m, float n)
    {
        if(x > m) return x;

        const float a = 2.0 * n - m;
        const float b = 2.0 * m - 3.0 * n;
        const float t = x / m;
        return (a * t + b) * t * t + n;
    }

#endif