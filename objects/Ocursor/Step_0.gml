x= mouse_x
y= mouse_y
window_set_cursor(cr_none)
changeCursor()

function changeCursor(){
var obj= instance_position(x,y,all)
	if(! obj != noone && variable_instance_exists(obj, "isEnemy") && obj.isEnemy){
		sprite_index= crosshair037
	}else{
		sprite_index= crosshair038
	}

}