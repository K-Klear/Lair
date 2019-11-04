varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 tint;
uniform lowp vec4 shade;
uniform lowp vec4 screen_size;

float border_side = 40.0;
float border_up = 32.0;
float border_down = 4.0;

void main()
{
    // Pre-multiply alpha since all runtime textures already are
    lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    float x = var_texcoord0.x * (shade.y - shade.x) + shade.x;
    float y = var_texcoord0.y * (shade.w - shade.z) + shade.z;
    vec4 shadow = vec4(x * y, x * y, x * y, 1.0);
    float aspect_ratio = screen_size.y / screen_size.x;
    float view_x = screen_size.y / 0.8;
    float view_y = screen_size.x * 0.8;
    gl_FragColor = texture2D(texture_sampler, var_texcoord0.xy) * shadow * tint_pm;
    if(gl_FragCoord.x > view_x / 2.0 + screen_size.x / 2.0 - view_x / border_side || gl_FragCoord.x < -view_x / 2.0 + screen_size.x / 2.0 + view_x / border_side)
    {
        discard;
    }
    if(gl_FragCoord.y > view_y / 2.0 + screen_size.y / 2.0 - view_y / border_up || gl_FragCoord.y < -view_y / 2.0 + screen_size.y / 2.0 + view_y / border_down)
    {
        discard;
    }
}
