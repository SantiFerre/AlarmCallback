/// @description 

var _i = 0;

repeat (array_length(dbgRefs)) {
	
	if (!AlarmExists(dbgRefs[_i].alarmId)) {
		dbg_section_delete(dbgRefs[_i].dbgSection);
		array_delete(dbgRefs, _i, 1);
	} else {
		_i++;
	}
}

















