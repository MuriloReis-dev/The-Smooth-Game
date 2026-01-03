// define a animação do objeto
function set_animation(_sprite, _spd)
{
	if (sprite_index != _sprite)
	{
        sprite_index = _sprite;
        image_index = 0;
        image_speed = _spd;
    }
}