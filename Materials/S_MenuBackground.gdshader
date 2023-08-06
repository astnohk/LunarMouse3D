shader_type canvas_item;

uniform sampler2D noise : repeat_enable, filter_linear;
uniform sampler2D noise_lowfreq : repeat_enable, filter_linear;
uniform vec2 offset = vec2(0.0);
uniform float noise_strength = 0.05;
uniform float noise_lowfreq_strength = 0.05;
uniform float brightness = 0.8;

void fragment()
{
	vec3 color = vec3(brightness) * (0.5 + 0.5 * sin(2.0 * PI * UV.y / SCREEN_PIXEL_SIZE.y * 0.3));
	float lfnoise = texture(
		noise_lowfreq,
		vec2(0.1 * offset.x + (UV.x + UV.y / SCREEN_PIXEL_SIZE.y) * SCREEN_PIXEL_SIZE.y, 0.1 * offset.y)
		).r;
	COLOR = vec4(
		(1.0 - noise_lowfreq_strength * lfnoise) * clamp(
			color * (1.0 - noise_strength * texture(noise, UV + offset).r),
			0.0,
			1.0),
		1.0);
}