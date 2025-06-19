currentWave=0
enemiesPerWave=2
enemiesToSpawn=0
enemiesAlive=0
messageDisplayed=false
//Contador
waveCountdown = 0;
waitingForNextWave = false;
showPrompt = false;
//variables globales
global.enemy_min_speed = 0.5;
global.enemy_max_speed = 1.5;
global.enemy_life = 2;



function startnewWave(){
enemiesToSpawn= enemiesPerWave+ currentWave
enemiesAlive= enemiesToSpawn
currentWave++
repeat(enemiesToSpawn){
	spawnEnemy()
}
}


function spawnEnemy(){
var positionX= random_range(100, room_width - 20);
var positionY= random_range(0, room_height-20);
instance_create_layer(positionX, positionY, "Instances", OEnemy)
}



function applyRandomEffect() {
    var possibleEffects = [];

    // Player speed rules
    if (Oplayer.spd > 0.5) array_push(possibleEffects, "player_spd_down");
    if (Oplayer.spd < 10) array_push(possibleEffects, "player_spd_up");

    // Player cooldown rules
    if (Oplayer.coolDownValue > 5) array_push(possibleEffects, "cooldown_down");
    if (Oplayer.coolDownValue < 60) array_push(possibleEffects, "cooldown_up");

    // Player attack rules
    if (Oplayer.attackValue > 1) array_push(possibleEffects, "attack_down");
    if (Oplayer.attackValue < 50) array_push(possibleEffects, "attack_up");

    // Enemy effects (always allowed)
    array_push(possibleEffects, "enemy_life_up");
    array_push(possibleEffects, "enemy_speed_up");

    // Choose and apply effect
    if (array_length(possibleEffects) > 0) {
        var choice = possibleEffects[irandom_range(0, array_length(possibleEffects) - 1)];

        switch (choice) {
            case "player_spd_up":
                Oplayer.spd += 0.5;
                show_message("Your speed has increased!");
                break;
            case "player_spd_down":
                Oplayer.spd -= 0.5;
                show_message("Your speed has decreased!");
                break;
            case "cooldown_up":
                Oplayer.coolDownValue += 10;
                show_message("Your shots are slower!");
                break;
            case "cooldown_down":
                Oplayer.coolDownValue = max(1, Oplayer.coolDownValue - 10);
                show_message("Your shots are faster!");
                break;
            case "attack_up":
                Oplayer.attackValue *= 2;
                show_message("Your attack power has doubled!");
                break;
            case "attack_down":
                Oplayer.attackValue = max(1, Oplayer.attackValue / 2);
                show_message("Your attack power has been halved!");
                break;
            case "enemy_life_up":
				global.enemy_life += 1;
                show_message("Enemies have more health!");
                break;
            case "enemy_speed_up":
               global.enemy_min_speed += 0.5;
               global.enemy_max_speed += 0.5;
                show_message("Enemies move faster!");
                break;
        }
    }
}



