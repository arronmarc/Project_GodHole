function CollisionCheck(_moveX, _moveY){
    // Horizontal
    if(_moveX != 0){
        if(place_meeting(x + _moveX, y, obj_collision) || place_meeting(x + _moveX, y, oBreakableParent)){
            repeat(abs(_moveX)){
                if(!place_meeting(x + sign(_moveX), y, obj_collision) && !place_meeting(x + sign(_moveX), y, oBreakableParent)){
                    x += sign(_moveX);
                } else { 
                    break;
                }
            }
            _moveX = 0;
        }
    }

    // Vertical
    if(_moveY != 0){
        if(place_meeting(x, y + _moveY, obj_collision) || place_meeting(x, y + _moveY, oBreakableParent)){
            repeat(abs(_moveY)){
                if(!place_meeting(x, y + sign(_moveY), obj_collision) && !place_meeting(x, y + sign(_moveY), oBreakableParent)){
                    y += sign(_moveY);
                } else { 
                    break;
                }
            }
            _moveY = 0;
        }
    }

    return [_moveX, _moveY]; // Return the possibly modified values
}
