xMove= keyboard_check(ord("D"))- keyboard_check(ord("A"))
yMove= keyboard_check(ord("S")) - keyboard_check(ord("W"))
if(!Owave.waitingForNextWave){
	x+=xMove * spd
	y+=yMove * spd
}

animation()
shoot()
invincibleTime()

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
		audio_play_sound(ashoot,1,false)
		coolDown= coolDownValue
		with (instance_create_layer(x,y, "fireShoots", OfireShoot)){
			angle= point_direction(x,y,mouse_x, mouse_y)
			direction= angle
			speed=8
		}
	}
}

function invincibleTime(){
	if(invincible){
		invincibleTimer--
		blinkTimer++
		if(blinkTimer>=5){
			image_alpha= (image_alpha==1)? blink_alpha: 1
		}
	}
	if(invincibleTimer<=0){
		image_alpha=1
		invincible=false
		invincibleTimer=invincibleDuration
	}
	
}

function collision() {
    //set target values
    var _tx = x;
    var _ty = y;
    //move back to last step position, out of the collision
    x = xprevious;
    y = yprevious;
    //get distance we want to move
    var _disx = abs(_tx - x);
    var _disy = abs(_ty - y);

    //move as far as in x and y before hitting the solid
    repeat(_disx) {
        if (!place_meeting(x + sign(_tx - x), y, o_solid)) x += sign(_tx - x);
    }
    repeat(_disy) {
        if (!place_meeting(x, y + sign(_ty - y), o_solid)) y += sign(_ty - y);
    }
}



