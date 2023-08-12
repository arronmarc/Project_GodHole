

//Shader code
size = clamp(size+(mouse_wheel_up()-mouse_wheel_down())*2,4,64)//pixel scale
shader_set(sh_pixel)
shader_set_uniform_f(pixel,1024,1024,size,size)//background width,background height,pixel width,pixel height
///Draw code goes here
draw_self();
shader_reset()