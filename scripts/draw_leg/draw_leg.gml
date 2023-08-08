/// @description draw_leg(hip_x,hip_y,thigh_length,calf_length,facing,motion_counter)
/// @param hip_x
/// @param hip_y
/// @param thigh_length
/// @param calf_length
/// @param facing
/// @param motion_counter
function draw_leg(argument0, argument1, argument2, argument3, argument4, argument5) {

	//**********A*********
	//*********/|*********
	//*******b/ |*********
	//*******/  |*********
	//******/   |*********
	//*****C\   |c********
	//*******\  |*********
	//*******a\ |*********
	//*********\|*********
	//**********B*********
	/*********************
	c = facing distance to the foot
	b = length of upper limb
	a = length of lower limb

	To find point C we need angle A (cosine rule)
	We know angle of length c
	Point C = c-A

	-----------------------------------------------
	3D effect:

	*Find x component of direction vector (lengthdir_x)
	*Find distance and direction between Point C and mid-point of length c
	*x component and distance between C and mid-point of c should be a 1:1 ratio (distance*x)

	-----------------------------------------------
	*/


	var _c, _b, _a, alpha, beta, ax, ay, ix, iy, knee_mod, Ax, Ay, Bx, By, Cx, Cy, C2x, C2y, mo_co;

	Ax=argument0 //hip x position
	Ay=argument1 //hip y position
	_b=argument2 //thigh length
	_a=argument3 //calf length
	mo_co=argument4 //motion counter used for the oscillating animation of foot
	knee_mod=Ax-(Ax+lengthdir_x(1,facingdirection)) //Direction the knee will bend for the "3D" knee

	///ANIMATION AND PERSPECTIVE///

	if legspeed>0
	gait=power(legspeed*2,0.4) //how big the step is (you may want to tweak this!)
	//Note that the stride is not related to movement speed linearly, but instead uses a exponent of 0.4.


	//A sine function is used for the horizontal movement and a cosine for the vertical movement of the foot.
	ax=x+lengthdir_x((gait)*((_a+_b)/4)*sin(degtorad(mo_co))-((legspeed*1.25))*2,movingdirection)
	ay=y+((gait)*((_a+_b)/6)*(-cos(degtorad(mo_co))-1))


	///INVERSE KINEMATIC CALCULATION///

	alpha=point_direction(Ax,Ay,ax,ay) //angle between hip and foot
	_c=min(point_distance(Ax,Ay,ax,ay),(_a+_b)) //distance between hip and foot, restricted to total limb length

	Bx=Ax+lengthdir_x(_c,alpha) //foot x position
	By=Ay+lengthdir_y(_c,alpha) //foot y position

	beta=radtodeg(arccos(min(1,max(-1,(sqr(_b)+sqr(_c)-sqr(_a))/(2*(_b)*_c))))) //"Law of Cosines" to get angle of thigh, _c

	Cx=Ax+lengthdir_x(_b,alpha-beta)//knee x position
	Cy=Ay+lengthdir_y(_b,alpha-beta)//knee y position

	ix=Ax+lengthdir_x(_b*cos(degtorad(beta)),point_direction(Ax,Ay,Bx,By)) //find the intersect point on the hip->foot line which divides the triangle into 2 right-angle triangles
	iy=Ay+lengthdir_y(_b*cos(degtorad(beta)),point_direction(Ax,Ay,Bx,By)) //this is to foreshorten the knee when facing toward the camera.

	C2x=ix+lengthdir_x(point_distance(ix,iy,Cx,Cy)*knee_mod,point_direction(ix,iy,Cx,Cy))//"3D" knee x position
	C2y=iy+lengthdir_y(point_distance(ix,iy,Cx,Cy)*knee_mod,point_direction(ix,iy,Cx,Cy))//"3D" knee y position

	///DRAWING THE LEG///
	//Leg can be drawn either as 2 lines, or stretch a calf and a thigh sprite//
	//argument 5 is an offset using the horizontal component of the facing direction
	draw_line_width(Ax+lengthdir_x(argument5,facingdirection+90),Ay,C2x+lengthdir_x(argument5,facingdirection+90),C2y,3)
	draw_line_width(C2x+lengthdir_x(argument5,facingdirection+90),C2y,Bx+lengthdir_x(argument5,facingdirection+90),By,1.5)

	/* SAMPLE CODE FOR LEG SPRITES
	var thigh_scale, calf_scale, thigh_dir, calf_dir, thigh_length, calf_length;
	thigh_scale=point_distance(Ax,Ay,C2x,C2y)
	thigh_dir=point_direction(Ax,Ay,C2x,C2y)
	thigh_length=15 //length of the sprite
	calf_scale=point_distance(C2x,C2y,Bx,By)
	calf_dir=point_direction(C2x,C2y,Bx,By)
	calf_length=10  //length of the sprite

	draw_sprite_ext(thigh_spr,0,Ax+lengthdir_x(argument5,facingdirection+90),Ay,thigh_scale/thigh_length,1,thigh_dir,c_white,1)
	draw_sprite_ext(calf_spr,0,C2x+lengthdir_x(argument5,facingdirection+90),C2y,calf_scale/calf_length,1,calf_dir,c_white,1)
	*/




}
