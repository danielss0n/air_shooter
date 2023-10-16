//get random distance
function array_get_random(values){
	//return a random value of the min and max in array
	var random_value = random_range(values[0], values[1]);
	return round(random_value * 10) / 10;
}