#version 400 core

uniform sampler3D tex;

uniform mat4 modelviewMatrix;
uniform mat4 projMatrix;

#ifdef _VERTEX_
in vec3 in_Position;
in vec3 in_Normal;
in vec3 in_TexCoord;
out vec3 pass_TexCoord;
void main(void) {
    pass_TexCoord  = in_TexCoord;
    gl_Position = projMatrix * modelviewMatrix * vec4(in_Position,1.0);
}

#endif

#ifdef _FRAGMENT_
in vec3 pass_TexCoord;
out vec3 out_Color;
void main() {
    vec3 color = texture(tex, vec3(pass_TexCoord.st, 1.0)).xxx;
    out_Color = color;//vec4(abs(pass_TexCoord.s),abs(pass_TexCoord.t),0.0,0.0);
}
#endif
