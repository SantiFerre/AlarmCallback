# Alarm Callback

Alarm Callback is an extension for GameMaker Studio 2.3+ that allows you to create synchronous alarms with a single function. 
It also allows to pause, resume, stop/reset, terminate and destroy alarms.

The extension is based on the existing synchronous alarms in GameMaker, with the difference that these are a hybrid alongside 
the Built-In Time Sources, allowing the creation of alarms from any part with a target, number of steps, number of repetitions, 
and finally a callback function or method that will be triggered each time the countdown ends.

### What are the differences between Alarm Callback, Time Sources, and the Built-in alarms?

|      | Alarm Callback | Time Sources | Built-in alarms |
| :--- |    :----:     |    :----:    |     :----:      |
| **Paused if target is deactivated** | **✓** | ✘ | **✓** |
| **Destroy itself if target doesn't exist** | **✓** | ✘ | **✓** |
| **Loop** | **✓** | **✓** | ✘ |
| **Callback** | **✓** | **✓** | ✘ |
| **Finish before destroy** | **✓** | ✘ | ✘ |

# Functions
### `AlarmCreate(target, steps, reps, callback, [args], ...)`

Create an alarm.

| Argument |Type | Description |
| :---- | :---- | :---- |
| target | Struct or Object Instance | Target instance id -- callback will use this environment to call function |
| steps | Any | Steps to trigger the alarm |
| reps | Any | Repetitions; -1 to infinite loop |
| callback | Method or Function | The method or function to call when the Alarm expires |
| \[args\] | Any | Optional arguments to pass to function call |
| ... | Any | Additional optional arguments |

> **Returns** `Alarm Id`
### `AlarmFire(target, steps, reps, callback, [args], ...)`

Create and set an alarm.

| Argument |Type | Description |
| :---- | :---- | :---- |
| target | Struct or Object Instance | Target instance id -- callback will use this environment to call function |
| steps | Any | Steps to trigger the alarm |
| reps | Any | Repetitions; -1 to infinite loop |
| callback | Method or Function | The method or function to call when the Alarm expires |
| \[args\] | Any | Optional arguments to pass to function call |
| ... | Any | Additional optional arguments |

> **Returns** `Alarm Id`
### `AlarmExists(alarm_id)`

Check if an alarm exists.

| Argument |Type | Description |
| :---- | :---- | :---- |
| alarm_id | Alarm Id | The ID of the previously created alarm |

> **Returns** `Bool`
### `AlarmPlay(alarm_id)`

Set an alarm or array of alarms.

| Argument |Type | Description |
| :---- | :---- | :---- |
| alarm_id | Alarm Id | The ID or array of IDs of the previously created alarm |

> **Returns** `N/A`
### `AlarmPause(alarm_id)`

Pause an alarm or array of alarms.

| Argument |Type | Description |
| :---- | :---- | :---- |
| alarm_id | Alarm Id | The ID or array of IDs of the previously created alarm |

> **Returns** `N/A`
### `AlarmStop(alarm_id)`

Stop and reset an alarm or array of alarms.

| Argument |Type | Description |
| :---- | :---- | :---- |
| alarm_id | Alarm Id | The ID or array of IDs of the previously created alarm |

> **Returns** `N/A`
### `AlarmFinish(alarm_id)`

Trigger an alarm or array of alarms and destroy it.

| Argument |Type | Description |
| :---- | :---- | :---- |
| alarm_id | Alarm Id | The ID or array of IDs of the previously created alarm |

> **Returns** `N/A`
### `AlarmDestroy(alarm_id)`

Destroy an alarm or array of alarms. You can also use the "all" constant to destroy all alarms

| Argument |Type | Description |
| :---- | :---- | :---- |
| alarm_id | Alarm Id | The ID or array of IDs of the previously created alarm. You can also use the "all" constant to destroy all alarms |

> **Returns** `N/A`
# Demo Video

https://github.com/SantiFerre/AlarmCallback/assets/32647282/58807f6e-9953-42ac-8df0-b1f680906594

# Acknowledgements:

I would like to thank the [Tween GMX](https://marketplace.gamemaker.io/assets/10871/tweengmx) library created by Stephen Loney 
and the [DoLater](https://github.com/JujuAdams/DoLater) library created by [@JujuAdams](https://github.com/JujuAdams), which served as inspiration for the creation of this library.
