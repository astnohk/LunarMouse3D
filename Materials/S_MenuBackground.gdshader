shader_type canvas_item;

uniform sampler2D noise : repeat_enable, filter_linear;
uniform vec2 offset = vec2(0.0);
uniform float noise_strength = 0.2;
uniform float brightness = 0.8;

void fragment()
{
	vec3 color = vec3(brightness) * (0.5 + 0.5 * sin(2.0 * PI * UV.y / SCREEN_PIXEL_SIZE.y * 0.3));
	COLOR = vec4(
		clamp(
			color - noise_strength * texture(noise, UV + offset).rgb,
			0.0,
			1.0),
		1.0);
}