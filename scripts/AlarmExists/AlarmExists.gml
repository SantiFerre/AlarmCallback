// [AlarmCallback 1.0.3]
// Created by Santi Ferre (Banensoft)

// Feather disable all

/// @function AlarmExists( alarm_id );
/// @description Check if an alarm exists.
/// @param {Any}	alarm_id	The ID of the previously created alarm
/// @return {Bool}
function AlarmExists(alarm_id) {
	
	static _alarmSystem = __AlarmInitialize();
	
	return array_contains(_alarmSystem.__alarmArray, alarm_id);
}