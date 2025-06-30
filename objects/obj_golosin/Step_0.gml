// Teclas
right_key = keyboard_check(ord("D")) || keyboard_check(vk_right);
left_key  = keyboard_check(ord("A")) || keyboard_check(vk_left);
up_key    = keyboard_check(ord("W")) || keyboard_check(vk_up);
down_key  = keyboard_check(ord("S")) || keyboard_check(vk_down);

// Velocidades base
var speed_x = move_spd;   // velocidad normal en X
var speed_y = move_spd / 2; // velocidad más lenta en Y (ajusta /2 a lo que quieras)

// Movimiento bruto
var move_x = (right_key - left_key);
var move_y = (down_key - up_key);

// Normalizar vector movimiento para que diagonal no sea más rápido
var length = point_distance(0, 0, move_x, move_y);
if (length != 0) {
    move_x /= length;
    move_y /= length;
}

// Aplicar velocidades
xspd = move_x * speed_x;
yspd = move_y * speed_y;

// Collisiones en X
if (place_meeting(x + xspd, y, obj_wall)) {
    xspd = 0;
}

// Collisiones en Y
if (place_meeting(x, y + yspd, obj_wall)) {
    yspd = 0;
}

// Mover el jugador
x += xspd;
y += yspd;

// Actualizar dirección sprite
if (yspd == 0) {
    if (xspd > 0) { face = RIGHT; }
    if (xspd < 0) { face = LEFT; }
}
if (xspd == 0) {
    if (yspd > 0) { face = DOWN; }
    if (yspd < 0) { face = UP; }
}

sprite_index = sprite[face];

// Sin animación idle si no se mueve
if (xspd == 0 && yspd == 0) {
    image_index = 0;
}

// Profundidad (depth) para orden correcto de dibujo
depth = -bbox_bottom;

// Escalado según distancia vertical a obj_golosin_scale
var dy = abs(y - obj_golosin_scale.y);

var dist_min = 0;
var dist_max = 200;

var escala_min = 0.1;
var escala_max = 2.0;

if (dy <= dist_max) {
    var escala = lerp(escala_min, escala_max, clamp(dy / dist_max, 0, 1));
    image_xscale = escala;
    image_yscale = escala;
} else {
    image_xscale = escala_max;
    image_yscale = escala_max;
}
