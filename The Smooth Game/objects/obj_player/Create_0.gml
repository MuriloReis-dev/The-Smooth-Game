// FÍSICA
move_spd = 4 // velocidade de movimento
jump_force = 10 // força do pulo
on_ground = false // está no chão

coyote_time_max = 0.15 * game_get_speed(gamespeed_fps) // intervalo para pular após sair do chão
coyote_time = 0 // contador para o coyote_time_max

jump_buffer_max = 0.1 * game_get_speed(gamespeed_fps) // intervalo para pular antes de encostar no chão
jump_buffer = 0 // contador para o jump_buffer_max

extra_gravity = 1.0 // gravidade extra aplicada ao soltar o pulo

hspd = 0 // velocidade horizontal
vspd = 0 // velocidade vertical

vacc = 0.4 * global.gravity // aceleração vertical

solid_objects = array_create(2, [obj_block_green, obj_block_red]) // lista de objetos com colisão


// ANIMAÇÂO
image_speed = 1
state = "idle" // estado do objeto para a animação
