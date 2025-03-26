// [AlarmCallback 1.0.3]
// Created by Santi Ferre (Banensoft)

// Feather disable all

/// @function AlarmFire( target, steps, reps, callback, [arg0, ...] );
/// @description Create and set an alarm.
/// @param {Any}	target		Target instance id -- callback will use this environment to call function
/// @param {Any}	steps		Frames to trigger the alarm
/// @param {Any}	reps		Repetions; -1 to infinite loop
/// @param {Any}	callback	Function to callback
/// @param {Any}	[arg0]		Optional arguments to pass to function call
/// @param {Any}	...			Additional optional arguments
/// @return {alarm_id}
function AlarmFire(target, steps, reps, callback) {
	
	static _alarmSystem = __AlarmInitialize();
	
	var _args = [];
	var _index = 4;
	repeat(argument_count-_index) {
		array_push(_args, argument[_index]);
		_index++;
	}
	
	var _alarm_id = AlarmCreate(target, steps, reps, callback, _args);
	
	if (AlarmExists(_alarm_id)) {
		if (_alarm_id.steps == 0) {
			AlarmFinish(_alarmSystem.__alarmArray[array_length(_alarmSystem.__alarmArray)-1]);
			
			return undefined;
		} else {		
			_alarm_id.state = __ALARM_STATE_PLAY;
			
			return _alarm_id;
		}
	}
	
	return _alarm_id;
}