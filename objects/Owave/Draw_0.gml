if (waitingForNextWave) {
    var countdownText = string(ceil(waveCountdown / 60)); // convierte frames a segundos
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(room_width / 2, room_height / 2, "Wave in: " + countdownText);
}
