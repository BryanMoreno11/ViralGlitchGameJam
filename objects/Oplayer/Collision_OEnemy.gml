if (!other.dead && !invincible){
show_debug_message("El valor de invincible es "+ string(invincible) )
if(playerLifeHealth==1){
	game_restart()

}
playerLifeHealth--
invincible=true

}

