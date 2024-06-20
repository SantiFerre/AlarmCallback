// [AlarmCallback 1.0.1]
// Created by Santi Ferre (Banensoft)

// Feather disable all

/// @function __AlarmInitialize()
/// @description Initialize the library
function __AlarmInitialize() {
	
    static _global = undefined;
    if (_global != undefined) return _global;
    
    _global = {
        __alarmArray:  [],
    };
    
	var _error;
    try {
        time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, __AlarmStep, [], -1));
    } catch(_error) {
        show_error("AlarmCallback is only supported on GMS 2022 LTS and later\n ", true);
    }
    
    return _global;
}


/// @ignore
/// @function __AlarmTargetExists( target )
/// @description Checks to see if a alarm's target is still valid
/// @param {Any}	target		Instance or struct id/reference
/// @return {Bool} 
function __AlarmTargetExists(target) {
	
	static _global = __AlarmInitialize();
	
	if (is_struct(target)) { // STRUCT TARGET
		return weak_ref_alive(target);	
	}
	
	if (target != undefined) { // ASSUME INSTANCE TARGET
			
		if (instance_exists(target)) {
		    return __ALARM_ACTIVATED;
		}
    
		instance_activate_object(target);
    
		if (instance_exists(target)) {
		    instance_deactivate_object(target);
		    return __ALARM_DEACTIVATED;
		}
	
		return __ALARM_NO_EXISTS;
			
	}
	
	return __ALARM_NO_EXISTS;
}


/// @ignore
/// @function __AlarmStep()
/// @description Loop each step to decrease alarms and trigger them
function __AlarmStep() {
	
	static _global = __AlarmInitialize();
	
	var _i = 0;
	repeat (array_length(_global.__alarmArray)) {
		
		var _state = __AlarmTargetExists(_global.__alarmArray[_i].target);
		
		switch(_state) {
			case __ALARM_ACTIVATED:
			case __ALARM_DEACTIVATED:
				
				if (_state == __ALARM_ACTIVATED or (ALARM_INCLUDE_DEACTIVATED_INSTANCES and _state == __ALARM_DEACTIVATED)) {
					if (_global.__alarmArray[_i].state == __ALARM_STATE_PLAY) {
						
						_global.__alarmArray[_i].count--;
						
						if (_global.__alarmArray[_i].count <= 0) { //Trigger alarm
				
							__AlarmTrigger(_global.__alarmArray[_i]);
				
							var _should_remove = false;
							
							if (_global.__alarmArray[_i].reps >= 0) { //Check iterations and decrease
								
								_global.__alarmArray[_i].reps--;
								
								if (_global.__alarmArray[_i].reps < 0) { //If there are no more iterations left, free memory
									_should_remove = true;
								}
							}
							
							if (_should_remove) { //If there are no more iterations left, free memory
								__AlarmRemove(_global.__alarmArray[_i]);
								--_i;
							} else { //If there are more repetitions or it is infinite, reset the counter.
								_global.__alarmArray[_i].count = _global.__alarmArray[_i].steps;
							}
						}
					}
				}
				++_i;
				
				break;
				
			case __ALARM_NO_EXISTS:
				__AlarmRemove(_global.__alarmArray[_i]);
			
				break;
		}
	}
}


/// @ignore
/// @function __AlarmRemove( alarm_id )
/// @description Checks to see if a alarm's target is still valid
/// @param {Any}	alarm_id	The ID of the previously created alarm
function __AlarmRemove(alarm_id) {
	
	static _global = __AlarmInitialize();
	
	var _i = 0;
	repeat (array_length(_global.__alarmArray)) {
		if (alarm_id == _global.__alarmArray[_i]) {
			array_delete(_global.__alarmArray, _i, 1);
		} else {
			++_i;
		}
	}
}


/// @ignore
/// @function __AlarmTrigger( alarm_id )
/// @description Checks to see if a alarm's target is still valid
/// @param {Any}	alarm_id	The ID of the previously created alarm
function __AlarmTrigger(alarm_id) {
	
	static _global = __AlarmInitialize();

	method_call(method(alarm_id.target, alarm_id.callback), alarm_id.args); //If you're using GMLive, replace 'method()' by 'live_method()'
}


/// @ignore
/// @function __AlarmPlay( alarm_id )
/// @description Checks to see if a alarm's target is still valid
/// @param {Any}	alarm_id	The ID of the previously created alarm
function __AlarmPlay(alarm_id) {
	
	alarm_id.state = __ALARM_STATE_PLAY;
}


/// @ignore
/// @function __AlarmPause( alarm_id )
/// @description Checks to see if a alarm's target is still valid
/// @param {Any}	alarm_id	The ID of the previously created alarm
function __AlarmPause(alarm_id) {
	
	alarm_id.state = __ALARM_STATE_PAUSE;
}


/// @ignore
/// @function __AlarmStop( alarm_id )
/// @description Checks to see if a alarm's target is still valid
/// @param {Any}	alarm_id	The ID of the previously created alarm
function __AlarmStop(alarm_id) {
	
	alarm_id.count = alarm_id.steps;
	alarm_id.reps = alarm_id.totalReps;
	alarm_id.state = __ALARM_STATE_PAUSE;
}