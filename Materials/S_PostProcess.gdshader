shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture, repeat_disable, filter_nearest;
uniform sampler2D noise : repeat_enable;
uniform vec2 noise_offset = vec2(0.0, 0.0);

void fragment()
{
	float C = 0.6 + 0.4 * cos(2.0 * PI * SCREEN_UV.y / SCREEN_PIXEL_SIZE.y * 0.3);
	float C_noise = 1.0 - 0.4 * texture(noise, SCREEN_UV + noise_offset).r;
	vec2 dx = vec2(SCREEN_PIXEL_SIZE.x, 0);
	vec4 color = 0.5 * textureLod(screen_texture, SCREEN_UV, 0.0)
		+ 0.25 * textureLod(screen_texture, SCREEN_UV + dx, 0.0)
		+ 0.25 * textureLod(screen_texture, SCREEN_UV - dx, 0.0);
	COLOR = vec4(
		color.rgb * C * C_noise,
		color.a);
}
