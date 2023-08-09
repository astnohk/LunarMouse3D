shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture, repeat_enable, filter_linear;
uniform sampler2D noise : repeat_enable;
uniform vec2 noise_offset = vec2(0.0, 0.0);
uniform float leak_brightness = 0.0125;

void fragment()
{
	float horizontal_freq = 1.0 / SCREEN_PIXEL_SIZE.x / 3.0;
	float vertical_freq = 1.0 / SCREEN_PIXEL_SIZE.y / 5.0;
	vec2 UV_scaled = UV * vec2(horizontal_freq, vertical_freq);
	vec2 UV_fixed = floor(UV_scaled) / vec2(horizontal_freq, vertical_freq);
	float color_index = floor(fract(UV_scaled.x) * 3.0);
	float color_index_noise = floor(fract(UV_scaled.x + noise_offset.x) * 3.0);
	vec2 intensity = vec2(
		pow(abs(sin(3.0 * PI * horizontal_freq * UV.x)), 0.5),
		pow(abs(sin(1.0 * PI * vertical_freq * UV.y)), 0.5));
	float C_noise = 1.0 - 0.4 * texture(noise, SCREEN_UV + noise_offset).r;
	vec2 dx = vec2(SCREEN_PIXEL_SIZE.x, 0);
	vec3 albedo = clamp(
		leak_brightness
			+ textureLod(screen_texture, UV_fixed + vec2(noise_offset.x, 0.0), 0.0).rgb
			* intensity.x * intensity.y,
		0.0,
		1.0);
	float pixel_intensity = 1.1;
	if (abs(color_index_noise - 0.0) < 0.1)
	{
		pixel_intensity *= albedo.r;
	}
	else if (abs(color_index - 1.0) < 0.1)
	{
		pixel_intensity *= albedo.g;
	}
	else
	{
		pixel_intensity *= albedo.b;
	}
	if (abs(color_index - 0.0) < 0.1)
	{
		COLOR = vec4(
			clamp(
				pixel_intensity * vec3(1.0, 0.0, 0.0) * C_noise,
				0.0,
				1.0),
			1.0);
	}
	else if (abs(color_index - 1.0) < 0.1)
	{
		COLOR = vec4(
			clamp(
				pixel_intensity * vec3(0.0, 1.0, 0.0) * C_noise,
				0.0,
				1.0),
			1.0);
	}
	else
	{
		COLOR = vec4(
			clamp(
				pixel_intensity * vec3(0.0, 0.0, 1.0) * C_noise,
				0.0,
				1.0),
			1.0);
	}
}
