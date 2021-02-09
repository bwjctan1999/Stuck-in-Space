shader_type canvas_item;
render_mode unshaded;//delete blend_mul

uniform float scale_y = 1.0f;
uniform float zoom_y = 1.0f;

bool is_magenta(vec4 AColor) {
// Return whether the given color is magenta-looking.
// I defined this as "red and blue are greater than green, and the difference
// between red and blue is small."
bool magenta = AColor.r > 0.99 && AColor.g == 0.0 && AColor.b > 0.99;
//bool magenta = AColor.r > 0.99 && AColor.g == 0.0 && abs(AColor.r - AColor.b) < 0.55;
return magenta;
}

void fragment() {
	float uv_size_ratio_v = SCREEN_PIXEL_SIZE.y / TEXTURE_PIXEL_SIZE.y;
	vec4 screen_color = texture(SCREEN_TEXTURE, SCREEN_UV);
	float distance = 1.1; //dictates the distance of the reflection, 1.0 is the minimum
	
	vec2 uv_reflected = vec2(SCREEN_UV.x, SCREEN_UV.y - uv_size_ratio_v * distance * scale_y * zoom_y);
	vec4 reflection = texture(SCREEN_TEXTURE, uv_reflected);
	
	COLOR = reflection; //is_magenta(reflection) ? vec4(0.0,0.0,0.0,1.0) : reflection;
}