shader_type canvas_item;

uniform float amount;

float random( vec2 p )
{
  vec2 K1 = vec2(
    23.14069263277926, // e^pi (Gelfond's constant)
    2.665144142690225 // 2^sqrt(2) (Gelfond–Schneider constant)
  );
return fract( cos( dot(p,K1) ) * 12345.6789 );
}

void fragment(){
	vec4 color = texture(TEXTURE, UV);
	vec2 NewUV = UV;
	NewUV.y *= random(vec2(NewUV.y,amount));
	color.rgb += random(NewUV)*15.0;
	COLOR = color;
}