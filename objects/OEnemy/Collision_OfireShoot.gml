if(!dead){
	if(healthLife-Oplayer.attackValue<=0){
		Owave.enemiesAlive--
		dead=true
		instance_destroy()
	}
	audio_play_sound(aEnemyImpact, 1, false)
	instance_destroy(other)
	healthLife-=Oplayer.attackValue
}