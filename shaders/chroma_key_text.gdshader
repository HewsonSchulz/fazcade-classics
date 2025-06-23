shader_type canvas_item;

render_mode blend_mix, unshaded;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);

    if (tex_color.rgb != vec3(1.0, 1.0, 1.0)) {
        discard;
    }

    COLOR = tex_color;
}
