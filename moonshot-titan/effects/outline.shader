shader_type canvas_item;
render_mode blend_mix;

uniform bool enabled = false;
uniform float outline_width : hint_range(0, 10, 0.1) = 0.5;
uniform vec4 outline_color : hint_color = vec4(1.0, 0.0, 0.0, 1.0);

void fragment() {
	vec4 current_color = texture(TEXTURE, UV);

	if (enabled && current_color.a == 0.0) {
		float outline_x = outline_width / float(textureSize(TEXTURE, 0).x);
		float outline_y = outline_width / float(textureSize(TEXTURE, 0).y);
		vec2 neighbours[] = {
			vec2(0, outline_y), vec2(outline_x, outline_y), vec2(outline_x, 0), vec2(outline_x, -outline_y),
			vec2(0, -outline_y), vec2(-outline_x, -outline_y), vec2(-outline_x, 0), vec2(-outline_x, outline_y)
		};
		for (int i = 0; i < neighbours.length(); i++) {
			vec4 neighbour_color = texture(TEXTURE, UV + neighbours[i]);
			if (neighbour_color.a != 0.0) {
				current_color = outline_color;
				break;
			}
		}
	}

	COLOR = current_color;
}
