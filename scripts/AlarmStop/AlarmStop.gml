// [AlarmCallback 1.0.2]
// Created by Santi Ferre (Banensoft)

// Feather disable all

/// @function AlarmStop( alarm_id );
/// @description Stop and reset an alarm or array of alarms.
/// @param {Any}	alarm_id	The ID or array of IDs of the previously created alarm
function AlarmStop(alarm_id) {
	
	if (is_array(alarm_id)) {
		var _i = 0;
		repeat (array_length(alarm_id)) {
			if (AlarmExists(alarm_id[_i])) {
				__AlarmStop(alarm_id[_i]);
			}
			_i++;
		}
	} else if (AlarmExists(alarm_id)) {
		__AlarmStop(alarm_id);
	}
}