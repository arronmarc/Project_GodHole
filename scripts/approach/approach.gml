function approach(){

/// approach(start, end, shift)
var _start = argument0;
var _end = argument1;
var _shift = argument2;

if (_start < _end)
{
    return min(_start + _shift, _end);
}
else
{
    return max(_start - _shift, _end);
}


}