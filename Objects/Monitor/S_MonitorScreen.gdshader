shader_type spatial;

uniform sampler2D screen : filter_linear, repeat_disable;

void fragment() {
	vec2 dx = vec2(1.0 / 384.0, 0.0);
	vec2 dy = vec2(0.0, 1.0 / 384.0);
	ALBEDO =
		1.0 * texture(screen, UV).rgb +
		0.25 * texture(screen, UV - dx).rgb +
		0.25 * texture(screen, UV + dx).rgb +
		0.25 * texture(screen, UV - dy).rgb +
		0.25 * texture(screen, UV + dy).rgb;
}
