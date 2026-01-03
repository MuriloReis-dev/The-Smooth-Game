// CHECAGEM DAS TECLAS
var right = keyboard_check(vk_right)
var left = keyboard_check(vk_left)
var jump = keyboard_check_pressed(vk_space)


// CÁLCULO DA VELOCIDADE
hspd = (right-left) * move_spd
vspd = min(vspd + vacc, global.max_gravity)


// PULO
on_ground = place_meeting(x, y + 1, obj_block_green) ||
				place_meeting(x, y + 1, obj_block_red) ? true : false
				
if (on_ground) // coyote time
    coyote_time = coyote_time_max
else
    coyote_time = max(coyote_time - 1, 0)

if (jump) // jump buffer
    jump_buffer = jump_buffer_max
else
    jump_buffer = max(jump_buffer - 1, 0)

if (jump_buffer > 0 && coyote_time > 0)
{
	vspd = 0
	vspd -= jump_force
	coyote_time = 0
	jump_buffer = 0
}

if (vspd < 0) { // pulo variável
    if (!keyboard_check(vk_space))
        vspd += extra_gravity
}



// COLISÕES E MOVIMENTO
array_foreach(solid_objects, function(el, i) {
	resolve_colision_v(el)
})
y += vspd

array_foreach(solid_objects, function(el, i) {
	resolve_colision_h(el)
})
x += hspd


// DIREÇÃO DO SPRITE
if (right)
	image_xscale = 1
if (left)
	image_xscale = -1


// FUMAÇA AO SE MOVER
if (hspd != 0 && on_ground)
	instance_create_layer(x, y, 0, obj_dust)


// ANIMAÇÕES
if (hspd != 0) // seta o estado
	state = "moving"
else
	state = "idle"

switch (state) // altera sprite
{
	case "idle":
		set_animation(spr_player_idle, 1)
		break
		
	case "moving":
		set_animation(spr_player_moving, 1)
		break
}
