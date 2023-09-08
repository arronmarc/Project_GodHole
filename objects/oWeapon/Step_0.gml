if (!global.pause) 
{
    bulletDirection = point_direction(x, y, crosshair.x, crosshair.y);

    var mouseb;
    if (automatic)
    { 
        mouseb = input_check("shoot");
    }
    else 
    { 
        mouseb = input_check_pressed("shoot"); 
    }

    if (mouseb)
    { 
        if (current_cd == 0) 
        { 
            current_cd = cooldown; 
            current_delay = startup; 
        } 
    }

    if (current_delay == 0) && (projectile != -1) && (input_check("aim")) && (input_check("shoot"))
    {
        var player_angle = point_direction(obj_player.x, obj_player.y, crosshair.x, crosshair.y);
        var offsetDistance = 80; // Distance from the player to spawn the bullet

        var bullet_x = obj_player.x + lengthdir_x(offsetDistance, player_angle);
        var bullet_y = obj_player.y + lengthdir_y(offsetDistance, player_angle);

        if (ammo[weapon] != 0)
        {
            if (weapon == 4) // Shotgun
            {
                var numPellets = 5; // Adjust this to change the number of pellets
                var spreadAngle = 15; // Total angle for the spread

                for (var i = 0; i < numPellets; i++)
                {
                    var randomSpread = random_range(-spreadAngle/2, spreadAngle/2);
                    var pelletDirection = player_angle + randomSpread;

                    bullet_x = obj_player.x + lengthdir_x(offsetDistance, pelletDirection);
                    bullet_y = obj_player.y + lengthdir_y(offsetDistance, pelletDirection);

                    with (instance_create_layer(bullet_x, bullet_y, "Instances", projectile))
                    {
                        direction = pelletDirection;
                        speed = other.bulletspeed;
                        Screenshake(10, 5);
                    }
                }

                ammo[weapon] -= 1; // Consume 1 ammo for all pellets
            }
            else // Other guns
            {
                with (instance_create_layer(bullet_x, bullet_y, "Instances", projectile))
                {
                    speed = other.bulletspeed;
                    Screenshake(10, 5);
                }
                ammo[weapon] -= 1;
            }
        }

        current_recoil = _x;
        curvePos = 0;
        curveSpd = 0.01;
    }

    current_delay = max(-1,current_delay-1);
    if (current_delay == -1) current_cd = max(0,current_cd-1);
    current_recoil = max(0,floor(current_recoil*0.005));

    if (input_check_pressed("weapon1") && ammo[1] > 0) ChangeWeapon(1);
    if (input_check_pressed("weapon2") && ammo[2] > 0) ChangeWeapon(2);
    if (input_check_pressed("weapon4") && ammo[4] > 0) ChangeWeapon(4);
    if input_check_pressed("weapon0") ChangeWeapon(0);

}
