// [AlarmCallback 1.0.3]
// Created by Santi Ferre (Banensoft)

// Feather disable all

/// @function AlarmDestroy( alarm_id );
/// @description Destroy an alarm or array of alarms.
/// @param {Any}	alarm_id	The ID or array of IDs of the previously created alarm. You can also use the "all" constant to destroy all alarms
function AlarmDestroy(alarm_id) {
	
    if (alarm_id == all) {
        static _alarmSystem = __AlarmInitialize();
        repeat (array_length(_alarmSystem.__alarmArray)) {
            var _alarm_id = array_shift(_alarmSystem.__alarmArray);
            __AlarmRemove(_alarm_id);
        }
    } else if (is_array(alarm_id)) {
		repeat (array_length(alarm_id)) {
			var _alarm_id = array_shift(alarm_id);
			if (AlarmExists(_alarm_id)) {
				__AlarmRemove(_alarm_id);
			}
		}
	} else if (AlarmExists(alarm_id)) {
		__AlarmRemove(alarm_id);
	}
}