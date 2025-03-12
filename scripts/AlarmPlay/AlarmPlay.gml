// [AlarmCallback 1.0.2]
// Created by Santi Ferre (Banensoft)

// Feather disable all

/// @function AlarmPlay( alarm_id );
/// @description Set an alarm or array of alarms.
/// @param {Any}	alarm_id	The ID or array of IDs of the previously created alarm
function AlarmPlay(alarm_id) {
	
	if (is_array(alarm_id)) {
		var _i = 0;
		repeat (array_length(alarm_id)) {
			if (AlarmExists(alarm_id[_i])) {
				__AlarmPlay(alarm_id[_i]);
			}
			_i++;
		}
	} else if (AlarmExists(alarm_id)) {
		__AlarmPlay(alarm_id);
	}
}
