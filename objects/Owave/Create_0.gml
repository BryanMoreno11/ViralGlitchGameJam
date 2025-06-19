currentWave=0
enemiesPerWave=2
enemiesToSpawn=0
enemiesAlive=0

startnewWave()


function startnewWave(){
enemiesToSpawn= enemiesPerWave+ currentWave*2
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

    // Reglas de mejora/disminución de velocidad del jugador
    if (Oplayer.spd > 0.5) array_push(possibleEffects, "player_spd_down");
    if (Oplayer.spd < 10) array_push(possibleEffects, "player_spd_up");

    // Reglas de cooldown (tiempo entre disparos)
    if (Oplayer.coolDownValue > 5) array_push(possibleEffects, "cooldown_down");
    if (Oplayer.coolDownValue < 60) array_push(possibleEffects, "cooldown_up");

    // Reglas de ataque
	if (Oplayer.attackValue > 1) array_push(possibleEffects, "attack_down");
    if (Oplayer.attackValue < 50) array_push(possibleEffects, "attack_up");

    // Efectos enemigos (siempre se permiten)
    array_push(possibleEffects, "enemy_life_up");
	array_push(possibleEffects, "enemy_speed_up");

    // Elegir y aplicar efecto
    if (array_length(possibleEffects) > 0) {
        var choice = possibleEffects[irandom_range(0,array_length(possibleEffects)-1)]

        switch (choice) {
            case "player_spd_up":
                Oplayer.spd += 0.5;
                show_message("¡Tu velocidad ha aumentado!");
                break;
            case "player_spd_down":
                Oplayer.spd -= 0.5;
                show_message("¡Tu velocidad ha disminuido!");
                break;
            case "cooldown_up":
                Oplayer.coolDownValue += 5;
                show_message("¡Tus disparos son más lentos!");
                break;
            case "cooldown_down":
                Oplayer.coolDownValue = max(1, Oplayer.coolDownValue - 5);
                show_message("¡Tus disparos son más rápidos!");
                break;
            case "attack_up":
                Oplayer.attackValue *= 2;
                show_message("¡Tu poder de ataque se duplicó!");
                break;
            case "attack_down":
                Oplayer.attackValue = max(1, Oplayer.attackValue / 2);
                show_message("¡Tu poder de ataque se redujo a la mitad!");
                break;
            case "enemy_life_up":
                OEnemy.healthLife += 1;
                show_message("¡Los enemigos tienen más vida!");
                break;
            case "enemy_speed_up":
                OEnemy.minimumSpeed += 0.5;
                OEnemy.maximumSpeed += 0.5;
                show_message("¡Los enemigos se mueven más rápido!");
                break;
        }
    }
}



