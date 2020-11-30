shader_type canvas_item;
render_mode blend_mix;

uniform bool enabled = false;
uniform float outline_width : hint_range(0, 10, 0.1) = 0.5;
uniform vec4 outline_color : hint_color = vec4(1.0, 0.0, 0.0, 1.0);

void fragment() {
	vec4 current_color = texture(TEXTURE, UV);

	if (enabled && current_color.a == 0.0) {
		vec2 size = vec2(outline_width, outline_width) * TEXTURE_PIXEL_SIZE;
		if (texture(TEXTURE, UV + vec2(0, size.y)).a != 0.0 ||
			texture(TEXTURE, UV + vec2(size.x, size.y)).a != 0.0 ||
			texture(TEXTURE, UV + vec2(size.x, 0)).a != 0.0 ||
			texture(TEXTURE, UV + vec2(size.x, -size.y)).a != 0.0 ||
			texture(TEXTURE, UV + vec2(0, -size.y)).a != 0.0 ||
			texture(TEXTURE, UV + vec2(-size.x, -size.y)).a != 0.0 ||
			texture(TEXTURE, UV + vec2(-size.x, 0)).a != 0.0 ||
			texture(TEXTURE, UV + vec2(-size.x, size.y)).a != 0.0
		) {
			current_color = outline_color;
		}
	}

	COLOR = current_color;
}
