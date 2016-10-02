/// player.handle_user_input

key_left = -keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// React to keypresses
player_move = key_left + key_right;
if (place_meeting(x + player_move, y-1, obj_wall)){
    horizontal_speed = 0;
}
else {
    horizontal_speed = player_move * movespeed;
}
x += horizontal_speed;

// Fall, check for jump noise, and check for jump
if (vertical_speed < 10){ 
    vertical_speed += grav;
}

if(key_jump) {
    audio_play_sound(smb_jump, 10, false);
}

if (place_meeting(x, y+1, obj_wall)){
    vertical_speed = key_jump * -jumpspeed;
}
y += vertical_speed;

// Handle ground collisions
if (place_meeting(x, y + vspeed, obj_wall)){
    gravity = 0;
    while (!place_meeting(x, y + 1, obj_wall)){
        y += sign(vspeed);
    }
    vspeed = 0;
}




/// Various handlers

// Ground collision handling
//if (place_meeting(x, y + vspeed, obj_wall)){
//  gravity = 0;
//  while (!place_meeting(x, y + 1, obj_wall)){
//   y += sign(vspeed);
//  }
//  vspeed = 0;
//}

// If the enemy isn't on the floor, turn on gravity
//if (!place_meeting(x - 1, y + 1, obj_wall) && vspeed < 1) {
//  gravity = default_gravity;
//}

// Wall collision handling
//if (place_meeting(x + hspeed, y - 1, obj_wall)){
//    while (!place_meeting(x + sign(hspeed), y - 1, obj_wall)){
//      x += sign(hspeed);
//    }
//    hspeed *= -1;
//}

// Handling for walking off ledges
//if (!walks_off_ledges && !place_meeting(x + (sprite_width * sign(hspeed)), y + (sprite_height / 2) + 1, obj_wall)){
//  hspeed *= -1;
//}
