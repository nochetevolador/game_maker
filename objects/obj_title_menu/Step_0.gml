up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);

//stopre number of options
op_lenght = array_length(option[menu_level]);


pos += down_key - up_key;
if pos >= op_lenght {pos = 0};
if pos < 0 {pos = op_lenght-1};


//using the options
if accept_key{
	var _sml = menu_level
	switch(menu_level){
		case 0:
			switch(pos){
				case 0: room_goto_next(); break;
	
				case 1: menu_level = 1; break;

				case 2: game_end();break;
				}
			break;
	
	
		case 1:
			switch(pos) {
				case 0: menu_level = 0; break;
			
				case 1: break;
			
				case 2:  break;
			
				case 3: break;
				
		
		
			}
		}
	
	if _sml != menu_level {pos= 0};
	//stopre number of options
	op_lenght = array_length(option[menu_level]);
}