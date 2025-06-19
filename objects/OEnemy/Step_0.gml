
var angleToPlayer=  point_direction(x,y, Oplayer.x, Oplayer.y)
var offset= random_range(-15,15)
direction= angleToPlayer+offset
speed= random_range(minimumSpeed, maximumSpeed)

if(direction>90 && direction<270){
image_xscale=1
}else{
image_xscale=-1
}
