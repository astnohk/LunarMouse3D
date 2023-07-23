shader_type spatial;

uniform vec3 albedo;
uniform sampler2D noise;
uniform sampler2D normalmap;
uniform float scale = 0.5;

varying vec2 tex_position;

void vertex() {
	tex_position = VERTEX.xz * 0.5 + 0.5;
	VERTEX.y += texture(noise, VERTEX.xz * 0.5 + 0.5).x * scale;
}

void fragment() {
	ALBEDO = albedo;
	NORMAL_MAP = texture(normalmap, tex_position).xyz;
}
