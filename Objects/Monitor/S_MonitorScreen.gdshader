shader_type spatial;

uniform sampler2D screen : filter_linear, repeat_disable;
uniform float brightness;

void fragment() {
	ALBEDO = texture(screen, UV).rgb;
}
