// [AlarmCallback 1.0.3]
// Created by Santi Ferre (Banensoft)

// Feather disable all

/// @function AlarmCreate( target, steps, reps, callback, [arg0, ...] );
/// @description Create an alarm.
/// @param {Any}	target		Target instance id -- callback will use this environment to call function
/// @param {Any}	steps		Frames to trigger the alarm
/// @param {Any}	reps		Repetitions; -1 to infinite loop
/// @param {Any}	callback	Function to callback
/// @param {Any}	[arg0]		Optional arguments to pass to function call
/// @param {Any}	...			Additional optional arguments
/// @return {alarm_id}			
function AlarmCreate(target, steps, reps, callback) {
	
	static _alarmSystem = __AlarmInitialize();
	
	var _args = [];
	var _index = 4;
	if (is_array(argument[_index])) {
		_args = argument[_index];
	} else {
		repeat(argument_count-_index) {
			array_push(_args, argument[_index]);
			_index++;
		}
	}
	
	array_push(_alarmSystem.__alarmArray, {target: is_struct(target) ? weak_ref_create(target) : target, steps: steps, count: steps, totalReps: reps, reps: reps, callback: callback, args: _args, state: __ALARM_STATE_PAUSE});
	
	return _alarmSystem.__alarmArray[array_length(_alarmSystem.__alarmArray)-1];
}