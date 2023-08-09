shader_type canvas_item;

uniform sampler2D screen : repeat_disable, filter_linear;

void fragment() {
	COLOR = 0.8 * texture(screen, SCREEN_UV) +
		0.25 * texture(screen, SCREEN_UV - vec2(SCREEN_PIXEL_SIZE.x, 0.0)) +
		0.25 * texture(screen, SCREEN_UV + vec2(SCREEN_PIXEL_SIZE.x, 0.0)) +
		0.25 * texture(screen, SCREEN_UV - vec2(0.0, SCREEN_PIXEL_SIZE.y)) +
		0.25 * texture(screen, SCREEN_UV + vec2(0.0, SCREEN_PIXEL_SIZE.y)) +
		0.125 * texture(screen, SCREEN_UV - 2.0 * vec2(SCREEN_PIXEL_SIZE.x, 0.0)) +
		0.125 * texture(screen, SCREEN_UV + 2.0 * vec2(SCREEN_PIXEL_SIZE.x, 0.0)) +
		0.125 * texture(screen, SCREEN_UV - 2.0 * vec2(0.0, SCREEN_PIXEL_SIZE.y)) +
		0.125 * texture(screen, SCREEN_UV + 2.0 * vec2(0.0, SCREEN_PIXEL_SIZE.y));
}
