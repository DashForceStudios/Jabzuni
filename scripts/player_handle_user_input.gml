/// player.handle_user_input

key_left = -keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);

// React to keypresses
player_move = key_left + key_right; 
horizontal_speed = player_move * movespeed;

// Wall collision handling
if (place_meeting(x + horizontal_speed, y - 1, obj_block)){
    while (!place_meeting(x + sign(horizontal_speed), y - 1, obj_block)){
      x += sign(horizontal_speed);
    }
    horizontal_speed = 0;
}
/// Handle ground collisons, force falling, and react to jumping
// If we haven't hit terminal velocity yet, accellerate
if (vertical_speed < 10){ 
    vertical_speed += grav;
}

// Jump handling
if (place_meeting(x, y+1, obj_block)){
    vertical_speed = key_jump * -jumpspeed;
    if(key_jump) {
        audio_play_sound(smb_jump, 10, false);
    }
}

// Variable jump height
if((vertical_speed < 0) && (!key_jump_held)){
  vertical_speed = max(0, vertical_speed);
}

// floor collision handling
if (place_meeting(x, y + vertical_speed, obj_block)){
    while (!place_meeting(x, y + sign(vertical_speed), obj_block)){
      y += sign(vertical_speed);
    }
    vertical_speed = 0;
}

y += vertical_speed;
x += horizontal_speed;


