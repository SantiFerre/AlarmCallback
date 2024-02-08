/// @description 

dbgRefs = [];
dbgSteps = 20;
dbgReps = -1;

campfire = instance_create_depth(round(room_width*3/4) - 20, room_height/2, depth, objCampfire);

dbgView = dbg_view($"AlarmCallback", true, 40, 60, 540, 668);
dbg_section("Campfire");

dbg_button("Activate Instance", function() { 
	instance_activate_object(objCampfire);
}, 150, 30);
dbg_same_line();
dbg_button("Deactivate Instance", function() {
	instance_deactivate_object(objCampfire);
}, 150, 30);

dbg_section("Spawn Enemies");
dbg_slider_int(ref_create(self, "dbgSteps"), 0, 100, "Steps");
dbg_slider_int(ref_create(self, "dbgReps"), -1, 100, "Reps");
dbg_button("AlarmCreate", function() {
	dbg_create_alarm(AlarmCreate(campfire, dbgSteps, dbgReps, function() {
		instance_create_depth(x, y, depth-10, objEnemy);
	}), "AlarmCreate");
	
}, 150, 30);
dbg_same_line();
dbg_button("AlarmFire", function() {
	dbg_create_alarm(AlarmFire(campfire, dbgSteps, dbgReps, function() {
		instance_create_depth(x, y, depth-10, objEnemy);
	}), "AlarmFire");
	
}, 150, 30);


dbg_create_alarm = function(alarm_id, label) {
	
	var _dbgSection = dbg_section(label);
	
	array_push(dbgRefs, {
		alarmId: alarm_id,
		dbgSection: _dbgSection
	});
	
	var _refAlarm = ref_create(dbgRefs[array_length(dbgRefs)-1], "alarmId");
	
	dbg_text("State: ");
	dbg_same_line();
	dbg_text(ref_create(_refAlarm, "state"));
	
	dbg_text("Reps: ");
	dbg_same_line();
	dbg_text(ref_create(_refAlarm, "reps"));
	
	dbg_text("Count: ");
	dbg_same_line();
	dbg_text(ref_create(_refAlarm, "count"));
	
	dbg_button("AlarmPlay", method({ alarmId: alarm_id }, function() {
		AlarmPlay(alarmId);
		
	}), 98, 30);
	dbg_same_line();
	
	dbg_button("AlarmPause", method({ alarmId: alarm_id }, function() {
		AlarmPause(alarmId);
		
	}), 98, 30);
	dbg_same_line();
	
	dbg_button("AlarmStop", method({ alarmId: alarm_id }, function() {
		AlarmStop(alarmId);
		
	}), 98, 30);
	dbg_same_line();
	
	dbg_button("AlarmFinish", method({ alarmId: alarm_id }, function() {
		AlarmFinish(alarmId);
		
	}), 98, 30);
	dbg_same_line();
	
	dbg_button("AlarmDestroy", method({ alarmId: alarm_id }, function() {
		AlarmDestroy(alarmId);
		
	}), 98, 30);
	
}

















