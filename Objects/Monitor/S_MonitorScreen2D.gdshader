shader_type canvas_item;

uniform sampler2D screen : hint_screen_texture, filter_linear, repeat_enable;
uniform float horizontal_freq = 384.0;
uniform float vertical_freq = 384.0;
uniform float leak_brightness = 0.0125;

void fragment() {
	vec2 UV_scaled = UV * vec2(horizontal_freq, vertical_freq);
	vec2 UV_fixed = vec2((UV_scaled.x) / horizontal_freq, floor(UV_scaled.y) / vertical_freq);
	float color_index = floor(fract(UV_scaled.x) * 3.0);
	vec2 intensity = vec2(
		pow(abs(sin(3.0 * PI * horizontal_freq * UV.x)), 0.5),
		pow(abs(sin(1.0 * PI * vertical_freq * UV.y)), 0.5));
	vec3 albedo = clamp(
		leak_brightness +
			1.1 * textureLod(screen, UV_fixed, 0.0).rgb * intensity.x * intensity.y,
		0.0,
		1.0);
	if (abs(color_index - 0.0) < 0.1)
	{
		albedo *= vec3(1.0, 0.0, 0.0);
	}
	else if (abs(color_index - 1.0) < 0.1)
	{
		albedo *= vec3(0.0, 1.0, 0.0);
	}
	else
	{
		albedo *= vec3(0.0, 0.0, 1.0);
	}
	COLOR = vec4(
		clamp(albedo, 0.0, 1.0),
		1.0);
}
