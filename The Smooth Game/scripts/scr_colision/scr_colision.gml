
function resolve_colision_h(other_obj) // checa colisao horizontal
{
	var dir = sign(hspd)
	if (dir != 0)
	{
		if (place_meeting(x + hspd, y, other_obj)) // checa se o próximo movimento irá colidir
		{
			while (!place_meeting(x + dir, y, other_obj))
			{
				x += dir
			}
			hspd = 0
		}
	}
}

function resolve_colision_v(other_obj) // checa colisao vertical
{
	var dir = sign(vspd)
	if (dir != 0)
	{
		if (place_meeting(x, y + vspd, other_obj)) // checa se o próximo movimento irá colidir
		{
			while (!place_meeting(x, y + dir, other_obj))
			{
				y += dir
			}
			vspd = 0
		}
	}
}