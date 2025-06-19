if (enemiesAlive <= 0 && currentWave < maxWaves && !waitingForNextWave) {
	Oplayer.x=32
	Oplayer.y=320
    waitingForNextWave = true;
    waveCountdown = 180; // 3 segundos (si tu juego va a 60 FPS)
}

if (waitingForNextWave) {
    waveCountdown--;

    if (waveCountdown <= 0) {
		
        startnewWave();
        if (currentWave > 1) {
            applyRandomEffect();
        }
        waitingForNextWave = false;
    }
}

if (enemiesAlive <= 0 && currentWave == maxWaves && !messageDisplayed) {
    show_message("¡Congratulations!");
	game_restart()
    messageDisplayed = true;
}
