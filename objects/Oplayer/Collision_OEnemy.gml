if (!other.dead && !invincible){
show_debug_message("El valor de invincible es "+ string(invincible) )
if(playerLifeHealth==1){
	audio_play_sound(aPlayerHit, 1, false)
	game_restart()

}
audio_play_sound(aPlayerHit, 1, false)
playerLifeHealth--
invincible=true

}

