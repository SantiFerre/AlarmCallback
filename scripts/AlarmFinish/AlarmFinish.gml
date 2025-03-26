// [AlarmCallback 1.0.3]
// Created by Santi Ferre (Banensoft)

// Feather disable all

/// @function AlarmFinish( alarm_id );
/// @description Trigger an alarm or array of alarms and destroy it.
/// @param {Any}	alarm_id	The ID or array of IDs of the previously created alarm
function AlarmFinish(alarm_id) {
	
	if (is_array(alarm_id)) {
		var _i = 0;
		repeat (array_length(alarm_id)) {
			if (AlarmExists(alarm_id[_i])) {
				__AlarmTrigger(alarm_id[_i]);
			}
			_i++;
		}
	} else if (AlarmExists(alarm_id)) {
		__AlarmTrigger(alarm_id);
	}
	
	AlarmDestroy(alarm_id);
}