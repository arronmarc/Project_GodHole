///EXAMPLES OF DRAWING THE SYSTEM OUTPUT
//EXAMPLES OF Cycle Outputs

if alpha <= .35 draw_set_colour(c_blue);
if alpha > .35 draw_set_colour(c_white);

if global.dateCalendarOn    {
    draw_text(32, 16, string_hash_to_newline("Clock:  " + string(global.curClock)));
    draw_text(32, 32, string_hash_to_newline(string(global.curDayTime)));
    draw_text(32, 48, string_hash_to_newline("Day:    " + string(global.curDay)));
    draw_text(32, 64, string_hash_to_newline("D-Name:" + string(ds_list_find_value(days,global.curDay))));
    draw_text(32, 80, string_hash_to_newline("Week:   " + string(global.curWeek)));
    draw_text(32, 96, string_hash_to_newline("Month:  " + string(global.curMonth)));
    draw_text(32, 112, string_hash_to_newline("M-Name:" + string(ds_list_find_value(months,global.curMonth))));
    draw_text(32, 128, string_hash_to_newline("Season: " + string(ds_list_find_value(seasons,global.curMonth))));
    draw_text(32, 144, string_hash_to_newline("Year:   " + string(global.curYear)));
    draw_text(32, 160, string_hash_to_newline("ALPHA:  " + string(alpha)));
    }
if !global.dateCalendarOn    {
    draw_text(32, 32, string_hash_to_newline("Clock:  " + string(global.curClock)));
    draw_text(32, 48, string_hash_to_newline(string(global.curDayTime)));
    draw_text(32, 64, string_hash_to_newline("ALPHA:  " + string(alpha)));
    }





