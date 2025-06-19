var messageDisplayed=false
if(enemiesAlive<=0 && currentWave< maxWaves){
startnewWave()
applyRandomEffect()
}
else if(enemiesAlive<=0 && currentWave==maxWaves &&  messageDisplayed==false){
show_message("Congratulations!!!!")
}