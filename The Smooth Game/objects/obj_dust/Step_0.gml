image_alpha -= disapear_spd

if (image_alpha <= 0)
	instance_destroy()

y += vspd
