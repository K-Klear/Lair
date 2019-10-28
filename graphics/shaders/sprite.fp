varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 tint;
uniform lowp vec4 shade;

void main()
{
    // Pre-multiply alpha since all runtime textures already are
    lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    float x = var_texcoord0.x * (shade.y - shade.x) + shade.x;
    float y = var_texcoord0.y * (shade.w - shade.z) + shade.z;
    vec4 shadow = vec4(x * y, x * y, x * y, 1);
    
    gl_FragColor = texture2D(texture_sampler, var_texcoord0.xy) * shadow;

}
