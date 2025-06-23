shader_type canvas_item;

uniform vec3 color : source_color = vec3(0.0, 0.0, 0.0);
uniform float tolerance : hint_range(0.0, 1.0, 0.1) = 0;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);

    if (distance(tex_color.rgb, color) <= tolerance) {
        discard;
    }

    COLOR = tex_color;
}
