xMove= keyboard_check(ord("D"))- keyboard_check(ord("A"))
yMove= keyboard_check(ord("S")) - keyboard_check(ord("W"))
x+=xMove * spd
y+=yMove * spd
animation()
shoot()



//Funciones
function animation(){
	if(xMove!=0 ||yMove!=0 ){
		lastHorizontal=xMove
		lastVertical=yMove
	}
	//Iddle Animation
	if (xMove== 0 || yMove==0){
	switch(lastHorizontal){
		case 1:
			sprite_index= Idle_Right_Down
		break;
		case -1:
			sprite_index= Idle_Left_Down	
	}
	switch(lastVertical){
		case 1:
			sprite_index= Idle_Down
		break;
		case -1:
			sprite_index= Idle_Up
	}
	
	}
	//Movement Animation
	if (xMove<0){
		sprite_index= walk_Left
	}

	if (xMove>0){
		sprite_index= walk_Right
	}

	if(yMove<0){
	sprite_index= walk_Up
	}

	if(yMove>0){
	sprite_index=walk_Down
	}
}

function shoot(){
	coolDown--
	if(coolDown<=0 && mouse_check_button(mb_left)){
		coolDown= coolDownValue
		with (instance_create_layer(x,y, "fireShoots", OfireShoot)){
			angle= point_direction(x,y,mouse_x, mouse_y)
			direction= angle
			speed=8
		}
	}
}




