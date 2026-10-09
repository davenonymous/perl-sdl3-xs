MODULE = SDL3  PACKAGE = SDL3::API::Events

void
SDL_PumpEvents()
    PPCODE:
	SDL_PumpEvents();
	XSRETURN(0);

void
SDL_PeepEvents(sv_events, sv_numevents, sv_action, sv_minType, sv_maxType)
	SV *sv_events
	SV *sv_numevents
	SV *sv_action
	SV *sv_minType
	SV *sv_maxType
    PREINIT:
	SDL_Event * c_events;
	int c_numevents;
	SDL_EventAction c_action;
	Uint32 c_minType;
	Uint32 c_maxType;
	int c_bg_ret;
    PPCODE:
	c_events = (SDL_Event *)bg_in_record_ptr(aTHX_ sv_events, "SDL3::Event", "SDL_PeepEvents(events)");
	c_numevents = (int)bg_in_iv(aTHX_ sv_numevents, "SDL_PeepEvents(numevents)");
	c_action = (SDL_EventAction)bg_in_iv(aTHX_ sv_action, "SDL_PeepEvents(action)");
	c_minType = (Uint32)bg_in_uv(aTHX_ sv_minType, "SDL_PeepEvents(minType)");
	c_maxType = (Uint32)bg_in_uv(aTHX_ sv_maxType, "SDL_PeepEvents(maxType)");
	c_bg_ret = SDL_PeepEvents(c_events, c_numevents, c_action, c_minType, c_maxType);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasEvent(sv_type)
	SV *sv_type
    PREINIT:
	Uint32 c_type;
	_Bool c_bg_ret;
    PPCODE:
	c_type = (Uint32)bg_in_uv(aTHX_ sv_type, "SDL_HasEvent(type)");
	c_bg_ret = SDL_HasEvent(c_type);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasEvents(sv_minType, sv_maxType)
	SV *sv_minType
	SV *sv_maxType
    PREINIT:
	Uint32 c_minType;
	Uint32 c_maxType;
	_Bool c_bg_ret;
    PPCODE:
	c_minType = (Uint32)bg_in_uv(aTHX_ sv_minType, "SDL_HasEvents(minType)");
	c_maxType = (Uint32)bg_in_uv(aTHX_ sv_maxType, "SDL_HasEvents(maxType)");
	c_bg_ret = SDL_HasEvents(c_minType, c_maxType);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_FlushEvent(sv_type)
	SV *sv_type
    PREINIT:
	Uint32 c_type;
    PPCODE:
	c_type = (Uint32)bg_in_uv(aTHX_ sv_type, "SDL_FlushEvent(type)");
	SDL_FlushEvent(c_type);
	XSRETURN(0);

void
SDL_FlushEvents(sv_minType, sv_maxType)
	SV *sv_minType
	SV *sv_maxType
    PREINIT:
	Uint32 c_minType;
	Uint32 c_maxType;
    PPCODE:
	c_minType = (Uint32)bg_in_uv(aTHX_ sv_minType, "SDL_FlushEvents(minType)");
	c_maxType = (Uint32)bg_in_uv(aTHX_ sv_maxType, "SDL_FlushEvents(maxType)");
	SDL_FlushEvents(c_minType, c_maxType);
	XSRETURN(0);

void
SDL_PollEvent(sv_event)
	SV *sv_event
    PREINIT:
	SDL_Event * c_event;
	_Bool c_bg_ret;
    PPCODE:
	c_event = (SDL_Event *)bg_in_record_ptr(aTHX_ sv_event, "SDL3::Event", "SDL_PollEvent(event)");
	c_bg_ret = SDL_PollEvent(c_event);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WaitEvent(sv_event)
	SV *sv_event
    PREINIT:
	SDL_Event * c_event;
	_Bool c_bg_ret;
    PPCODE:
	c_event = (SDL_Event *)bg_in_record_ptr(aTHX_ sv_event, "SDL3::Event", "SDL_WaitEvent(event)");
	c_bg_ret = SDL_WaitEvent(c_event);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WaitEventTimeout(sv_event, sv_timeoutMS)
	SV *sv_event
	SV *sv_timeoutMS
    PREINIT:
	SDL_Event * c_event;
	Sint32 c_timeoutMS;
	_Bool c_bg_ret;
    PPCODE:
	c_event = (SDL_Event *)bg_in_record_ptr(aTHX_ sv_event, "SDL3::Event", "SDL_WaitEventTimeout(event)");
	c_timeoutMS = (Sint32)bg_in_iv(aTHX_ sv_timeoutMS, "SDL_WaitEventTimeout(timeoutMS)");
	c_bg_ret = SDL_WaitEventTimeout(c_event, c_timeoutMS);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_PushEvent(sv_event)
	SV *sv_event
    PREINIT:
	SDL_Event * c_event;
	_Bool c_bg_ret;
    PPCODE:
	c_event = (SDL_Event *)bg_in_record_ptr(aTHX_ sv_event, "SDL3::Event", "SDL_PushEvent(event)");
	c_bg_ret = SDL_PushEvent(c_event);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetEventFilter(sv_filter, sv_userdata)
	SV *sv_filter
	SV *sv_userdata
    PREINIT:
	SDL_EventFilter c_filter;
	void * c_userdata;
    PPCODE:
	c_filter = SvOK(sv_filter) ? (SDL_EventFilter)bg_tramp_SDL_EventFilter : NULL;
	c_userdata = SvOK(sv_filter) ? (void *)bg_make_holder(aTHX_ sv_filter, sv_userdata, "SDL_SetEventFilter(userdata)") : NULL;
	SDL_SetEventFilter(c_filter, c_userdata);
	XSRETURN(0);

void
SDL_GetEventFilter(sv_filter, sv_userdata)
	SV *sv_filter
	SV *sv_userdata
    PREINIT:
	SDL_EventFilter c_filter; SDL_EventFilter * p_filter; SV *t_filter;
	void * c_userdata; void ** p_userdata; SV *t_userdata;
	_Bool c_bg_ret;
    PPCODE:
	t_filter = bg_outref_target(aTHX_ sv_filter);
	c_filter = (t_filter && SvOK(t_filter)) ? (SDL_EventFilter)bg_in_raw_ptr(aTHX_ t_filter, "SDL_GetEventFilter(filter)") : (SDL_EventFilter)0;
	p_filter = t_filter ? &c_filter : (SDL_EventFilter *)bg_outref_raw(aTHX_ sv_filter, "SDL_GetEventFilter(filter)");
	t_userdata = bg_outref_target(aTHX_ sv_userdata);
	c_userdata = (t_userdata && SvOK(t_userdata)) ? (void *)bg_in_raw_ptr(aTHX_ t_userdata, "SDL_GetEventFilter(userdata)") : (void *)0;
	p_userdata = t_userdata ? &c_userdata : (void **)bg_outref_raw(aTHX_ sv_userdata, "SDL_GetEventFilter(userdata)");
	c_bg_ret = SDL_GetEventFilter(p_filter, p_userdata);
	if (t_filter) sv_setsv(t_filter, sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_filter), "SDL3::Pointer")));
	if (t_userdata) sv_setsv(t_userdata, sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_userdata), "SDL3::Pointer")));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_AddEventWatch(sv_filter, sv_userdata)
	SV *sv_filter
	SV *sv_userdata
    PREINIT:
	SDL_EventFilter c_filter;
	void * c_userdata;
	_Bool c_bg_ret;
    PPCODE:
	c_filter = SvOK(sv_filter) ? (SDL_EventFilter)bg_tramp_SDL_EventFilter : NULL;
	c_userdata = SvOK(sv_filter) ? (void *)bg_make_holder(aTHX_ sv_filter, sv_userdata, "SDL_AddEventWatch(userdata)") : NULL;
	c_bg_ret = SDL_AddEventWatch(c_filter, c_userdata);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RemoveEventWatch(sv_filter, sv_userdata)
	SV *sv_filter
	SV *sv_userdata
    PREINIT:
	SDL_EventFilter c_filter;
	void * c_userdata;
    PPCODE:
	c_filter = SvOK(sv_filter) ? (SDL_EventFilter)bg_tramp_SDL_EventFilter : NULL;
	c_userdata = SvOK(sv_filter) ? (void *)bg_make_holder(aTHX_ sv_filter, sv_userdata, "SDL_RemoveEventWatch(userdata)") : NULL;
	SDL_RemoveEventWatch(c_filter, c_userdata);
	XSRETURN(0);

void
SDL_FilterEvents(sv_filter, sv_userdata)
	SV *sv_filter
	SV *sv_userdata
    PREINIT:
	SDL_EventFilter c_filter;
	void * c_userdata;
    PPCODE:
	c_filter = SvOK(sv_filter) ? (SDL_EventFilter)bg_tramp_SDL_EventFilter : NULL;
	c_userdata = SvOK(sv_filter) ? (void *)bg_make_holder(aTHX_ sv_filter, sv_userdata, "SDL_FilterEvents(userdata)") : NULL;
	SDL_FilterEvents(c_filter, c_userdata);
	XSRETURN(0);

void
SDL_SetEventEnabled(sv_type, sv_enabled)
	SV *sv_type
	SV *sv_enabled
    PREINIT:
	Uint32 c_type;
	_Bool c_enabled;
    PPCODE:
	c_type = (Uint32)bg_in_uv(aTHX_ sv_type, "SDL_SetEventEnabled(type)");
	c_enabled = (_Bool)SvTRUE(sv_enabled);
	SDL_SetEventEnabled(c_type, c_enabled);
	XSRETURN(0);

void
SDL_EventEnabled(sv_type)
	SV *sv_type
    PREINIT:
	Uint32 c_type;
	_Bool c_bg_ret;
    PPCODE:
	c_type = (Uint32)bg_in_uv(aTHX_ sv_type, "SDL_EventEnabled(type)");
	c_bg_ret = SDL_EventEnabled(c_type);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RegisterEvents(sv_numevents)
	SV *sv_numevents
    PREINIT:
	int c_numevents;
	Uint32 c_bg_ret;
    PPCODE:
	c_numevents = (int)bg_in_iv(aTHX_ sv_numevents, "SDL_RegisterEvents(numevents)");
	c_bg_ret = SDL_RegisterEvents(c_numevents);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowFromEvent(sv_event)
	SV *sv_event
    PREINIT:
	const SDL_Event * c_event;
	SDL_Window * c_bg_ret;
    PPCODE:
	c_event = (const SDL_Event *)bg_in_record_ptr(aTHX_ sv_event, "SDL3::Event", "SDL_GetWindowFromEvent(event)");
	c_bg_ret = SDL_GetWindowFromEvent(c_event);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Window"));
	XSRETURN(1);

void
SDL_GetEventDescription(sv_event, sv_buf, sv_buflen)
	SV *sv_event
	SV *sv_buf
	SV *sv_buflen
    PREINIT:
	const SDL_Event * c_event;
	char * c_buf;
	int c_buflen;
	int c_bg_ret;
    PPCODE:
	c_event = (const SDL_Event *)bg_in_record_ptr(aTHX_ sv_event, "SDL3::Event", "SDL_GetEventDescription(event)");
	c_buf = (char *)bg_in_writable_string(aTHX_ sv_buf, "SDL_GetEventDescription(buf)");
	c_buflen = (int)bg_in_iv(aTHX_ sv_buflen, "SDL_GetEventDescription(buflen)");
	c_bg_ret = SDL_GetEventDescription(c_event, c_buf, c_buflen);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Events", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_EVENT_FIRST", BG_CONST_SV(SDL_EVENT_FIRST));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_QUIT", BG_CONST_SV(SDL_EVENT_QUIT));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_TERMINATING", BG_CONST_SV(SDL_EVENT_TERMINATING));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_LOW_MEMORY", BG_CONST_SV(SDL_EVENT_LOW_MEMORY));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WILL_ENTER_BACKGROUND", BG_CONST_SV(SDL_EVENT_WILL_ENTER_BACKGROUND));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DID_ENTER_BACKGROUND", BG_CONST_SV(SDL_EVENT_DID_ENTER_BACKGROUND));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WILL_ENTER_FOREGROUND", BG_CONST_SV(SDL_EVENT_WILL_ENTER_FOREGROUND));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DID_ENTER_FOREGROUND", BG_CONST_SV(SDL_EVENT_DID_ENTER_FOREGROUND));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_LOCALE_CHANGED", BG_CONST_SV(SDL_EVENT_LOCALE_CHANGED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_SYSTEM_THEME_CHANGED", BG_CONST_SV(SDL_EVENT_SYSTEM_THEME_CHANGED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DISPLAY_ORIENTATION", BG_CONST_SV(SDL_EVENT_DISPLAY_ORIENTATION));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DISPLAY_ADDED", BG_CONST_SV(SDL_EVENT_DISPLAY_ADDED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DISPLAY_REMOVED", BG_CONST_SV(SDL_EVENT_DISPLAY_REMOVED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DISPLAY_MOVED", BG_CONST_SV(SDL_EVENT_DISPLAY_MOVED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED", BG_CONST_SV(SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED", BG_CONST_SV(SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED", BG_CONST_SV(SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED", BG_CONST_SV(SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DISPLAY_FIRST", BG_CONST_SV(SDL_EVENT_DISPLAY_FIRST));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DISPLAY_LAST", BG_CONST_SV(SDL_EVENT_DISPLAY_LAST));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_SHOWN", BG_CONST_SV(SDL_EVENT_WINDOW_SHOWN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_HIDDEN", BG_CONST_SV(SDL_EVENT_WINDOW_HIDDEN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_EXPOSED", BG_CONST_SV(SDL_EVENT_WINDOW_EXPOSED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_MOVED", BG_CONST_SV(SDL_EVENT_WINDOW_MOVED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_RESIZED", BG_CONST_SV(SDL_EVENT_WINDOW_RESIZED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED", BG_CONST_SV(SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_METAL_VIEW_RESIZED", BG_CONST_SV(SDL_EVENT_WINDOW_METAL_VIEW_RESIZED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_MINIMIZED", BG_CONST_SV(SDL_EVENT_WINDOW_MINIMIZED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_MAXIMIZED", BG_CONST_SV(SDL_EVENT_WINDOW_MAXIMIZED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_RESTORED", BG_CONST_SV(SDL_EVENT_WINDOW_RESTORED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_MOUSE_ENTER", BG_CONST_SV(SDL_EVENT_WINDOW_MOUSE_ENTER));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_MOUSE_LEAVE", BG_CONST_SV(SDL_EVENT_WINDOW_MOUSE_LEAVE));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_FOCUS_GAINED", BG_CONST_SV(SDL_EVENT_WINDOW_FOCUS_GAINED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_FOCUS_LOST", BG_CONST_SV(SDL_EVENT_WINDOW_FOCUS_LOST));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_CLOSE_REQUESTED", BG_CONST_SV(SDL_EVENT_WINDOW_CLOSE_REQUESTED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_HIT_TEST", BG_CONST_SV(SDL_EVENT_WINDOW_HIT_TEST));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_ICCPROF_CHANGED", BG_CONST_SV(SDL_EVENT_WINDOW_ICCPROF_CHANGED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_DISPLAY_CHANGED", BG_CONST_SV(SDL_EVENT_WINDOW_DISPLAY_CHANGED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED", BG_CONST_SV(SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_SAFE_AREA_CHANGED", BG_CONST_SV(SDL_EVENT_WINDOW_SAFE_AREA_CHANGED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_OCCLUDED", BG_CONST_SV(SDL_EVENT_WINDOW_OCCLUDED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_ENTER_FULLSCREEN", BG_CONST_SV(SDL_EVENT_WINDOW_ENTER_FULLSCREEN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_LEAVE_FULLSCREEN", BG_CONST_SV(SDL_EVENT_WINDOW_LEAVE_FULLSCREEN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_DESTROYED", BG_CONST_SV(SDL_EVENT_WINDOW_DESTROYED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_HDR_STATE_CHANGED", BG_CONST_SV(SDL_EVENT_WINDOW_HDR_STATE_CHANGED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_FIRST", BG_CONST_SV(SDL_EVENT_WINDOW_FIRST));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_WINDOW_LAST", BG_CONST_SV(SDL_EVENT_WINDOW_LAST));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_KEY_DOWN", BG_CONST_SV(SDL_EVENT_KEY_DOWN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_KEY_UP", BG_CONST_SV(SDL_EVENT_KEY_UP));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_TEXT_EDITING", BG_CONST_SV(SDL_EVENT_TEXT_EDITING));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_TEXT_INPUT", BG_CONST_SV(SDL_EVENT_TEXT_INPUT));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_KEYMAP_CHANGED", BG_CONST_SV(SDL_EVENT_KEYMAP_CHANGED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_KEYBOARD_ADDED", BG_CONST_SV(SDL_EVENT_KEYBOARD_ADDED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_KEYBOARD_REMOVED", BG_CONST_SV(SDL_EVENT_KEYBOARD_REMOVED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_TEXT_EDITING_CANDIDATES", BG_CONST_SV(SDL_EVENT_TEXT_EDITING_CANDIDATES));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_SCREEN_KEYBOARD_SHOWN", BG_CONST_SV(SDL_EVENT_SCREEN_KEYBOARD_SHOWN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_SCREEN_KEYBOARD_HIDDEN", BG_CONST_SV(SDL_EVENT_SCREEN_KEYBOARD_HIDDEN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_MOUSE_MOTION", BG_CONST_SV(SDL_EVENT_MOUSE_MOTION));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_MOUSE_BUTTON_DOWN", BG_CONST_SV(SDL_EVENT_MOUSE_BUTTON_DOWN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_MOUSE_BUTTON_UP", BG_CONST_SV(SDL_EVENT_MOUSE_BUTTON_UP));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_MOUSE_WHEEL", BG_CONST_SV(SDL_EVENT_MOUSE_WHEEL));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_MOUSE_ADDED", BG_CONST_SV(SDL_EVENT_MOUSE_ADDED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_MOUSE_REMOVED", BG_CONST_SV(SDL_EVENT_MOUSE_REMOVED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_JOYSTICK_AXIS_MOTION", BG_CONST_SV(SDL_EVENT_JOYSTICK_AXIS_MOTION));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_JOYSTICK_BALL_MOTION", BG_CONST_SV(SDL_EVENT_JOYSTICK_BALL_MOTION));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_JOYSTICK_HAT_MOTION", BG_CONST_SV(SDL_EVENT_JOYSTICK_HAT_MOTION));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_JOYSTICK_BUTTON_DOWN", BG_CONST_SV(SDL_EVENT_JOYSTICK_BUTTON_DOWN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_JOYSTICK_BUTTON_UP", BG_CONST_SV(SDL_EVENT_JOYSTICK_BUTTON_UP));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_JOYSTICK_ADDED", BG_CONST_SV(SDL_EVENT_JOYSTICK_ADDED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_JOYSTICK_REMOVED", BG_CONST_SV(SDL_EVENT_JOYSTICK_REMOVED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_JOYSTICK_BATTERY_UPDATED", BG_CONST_SV(SDL_EVENT_JOYSTICK_BATTERY_UPDATED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_JOYSTICK_UPDATE_COMPLETE", BG_CONST_SV(SDL_EVENT_JOYSTICK_UPDATE_COMPLETE));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_GAMEPAD_AXIS_MOTION", BG_CONST_SV(SDL_EVENT_GAMEPAD_AXIS_MOTION));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_GAMEPAD_BUTTON_DOWN", BG_CONST_SV(SDL_EVENT_GAMEPAD_BUTTON_DOWN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_GAMEPAD_BUTTON_UP", BG_CONST_SV(SDL_EVENT_GAMEPAD_BUTTON_UP));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_GAMEPAD_ADDED", BG_CONST_SV(SDL_EVENT_GAMEPAD_ADDED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_GAMEPAD_REMOVED", BG_CONST_SV(SDL_EVENT_GAMEPAD_REMOVED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_GAMEPAD_REMAPPED", BG_CONST_SV(SDL_EVENT_GAMEPAD_REMAPPED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN", BG_CONST_SV(SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION", BG_CONST_SV(SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_GAMEPAD_TOUCHPAD_UP", BG_CONST_SV(SDL_EVENT_GAMEPAD_TOUCHPAD_UP));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_GAMEPAD_SENSOR_UPDATE", BG_CONST_SV(SDL_EVENT_GAMEPAD_SENSOR_UPDATE));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_GAMEPAD_UPDATE_COMPLETE", BG_CONST_SV(SDL_EVENT_GAMEPAD_UPDATE_COMPLETE));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED", BG_CONST_SV(SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_FINGER_DOWN", BG_CONST_SV(SDL_EVENT_FINGER_DOWN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_FINGER_UP", BG_CONST_SV(SDL_EVENT_FINGER_UP));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_FINGER_MOTION", BG_CONST_SV(SDL_EVENT_FINGER_MOTION));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_FINGER_CANCELED", BG_CONST_SV(SDL_EVENT_FINGER_CANCELED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_PINCH_BEGIN", BG_CONST_SV(SDL_EVENT_PINCH_BEGIN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_PINCH_UPDATE", BG_CONST_SV(SDL_EVENT_PINCH_UPDATE));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_PINCH_END", BG_CONST_SV(SDL_EVENT_PINCH_END));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_CLIPBOARD_UPDATE", BG_CONST_SV(SDL_EVENT_CLIPBOARD_UPDATE));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DROP_FILE", BG_CONST_SV(SDL_EVENT_DROP_FILE));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DROP_TEXT", BG_CONST_SV(SDL_EVENT_DROP_TEXT));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DROP_BEGIN", BG_CONST_SV(SDL_EVENT_DROP_BEGIN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DROP_COMPLETE", BG_CONST_SV(SDL_EVENT_DROP_COMPLETE));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_DROP_POSITION", BG_CONST_SV(SDL_EVENT_DROP_POSITION));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_AUDIO_DEVICE_ADDED", BG_CONST_SV(SDL_EVENT_AUDIO_DEVICE_ADDED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_AUDIO_DEVICE_REMOVED", BG_CONST_SV(SDL_EVENT_AUDIO_DEVICE_REMOVED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED", BG_CONST_SV(SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_SENSOR_UPDATE", BG_CONST_SV(SDL_EVENT_SENSOR_UPDATE));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_PEN_PROXIMITY_IN", BG_CONST_SV(SDL_EVENT_PEN_PROXIMITY_IN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_PEN_PROXIMITY_OUT", BG_CONST_SV(SDL_EVENT_PEN_PROXIMITY_OUT));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_PEN_DOWN", BG_CONST_SV(SDL_EVENT_PEN_DOWN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_PEN_UP", BG_CONST_SV(SDL_EVENT_PEN_UP));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_PEN_BUTTON_DOWN", BG_CONST_SV(SDL_EVENT_PEN_BUTTON_DOWN));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_PEN_BUTTON_UP", BG_CONST_SV(SDL_EVENT_PEN_BUTTON_UP));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_PEN_MOTION", BG_CONST_SV(SDL_EVENT_PEN_MOTION));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_PEN_AXIS", BG_CONST_SV(SDL_EVENT_PEN_AXIS));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_CAMERA_DEVICE_ADDED", BG_CONST_SV(SDL_EVENT_CAMERA_DEVICE_ADDED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_CAMERA_DEVICE_REMOVED", BG_CONST_SV(SDL_EVENT_CAMERA_DEVICE_REMOVED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_CAMERA_DEVICE_APPROVED", BG_CONST_SV(SDL_EVENT_CAMERA_DEVICE_APPROVED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_CAMERA_DEVICE_DENIED", BG_CONST_SV(SDL_EVENT_CAMERA_DEVICE_DENIED));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_RENDER_TARGETS_RESET", BG_CONST_SV(SDL_EVENT_RENDER_TARGETS_RESET));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_RENDER_DEVICE_RESET", BG_CONST_SV(SDL_EVENT_RENDER_DEVICE_RESET));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_RENDER_DEVICE_LOST", BG_CONST_SV(SDL_EVENT_RENDER_DEVICE_LOST));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_PRIVATE0", BG_CONST_SV(SDL_EVENT_PRIVATE0));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_PRIVATE1", BG_CONST_SV(SDL_EVENT_PRIVATE1));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_PRIVATE2", BG_CONST_SV(SDL_EVENT_PRIVATE2));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_PRIVATE3", BG_CONST_SV(SDL_EVENT_PRIVATE3));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_POLL_SENTINEL", BG_CONST_SV(SDL_EVENT_POLL_SENTINEL));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_USER", BG_CONST_SV(SDL_EVENT_USER));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_LAST", BG_CONST_SV(SDL_EVENT_LAST));
	bg_export_constant(aTHX_ stash, "SDL_EVENT_ENUM_PADDING", BG_CONST_SV(SDL_EVENT_ENUM_PADDING));
	bg_export_constant(aTHX_ stash, "SDL_ADDEVENT", BG_CONST_SV(SDL_ADDEVENT));
	bg_export_constant(aTHX_ stash, "SDL_PEEKEVENT", BG_CONST_SV(SDL_PEEKEVENT));
	bg_export_constant(aTHX_ stash, "SDL_GETEVENT", BG_CONST_SV(SDL_GETEVENT));
	}

MODULE = SDL3  PACKAGE = SDL3::CommonEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_CommonEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_CommonEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_CommonEvent *self;
    PPCODE:
	self = (struct SDL_CommonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::CommonEvent", "SDL3::CommonEvent::type");
	if (items > 1) {
		self->type = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::CommonEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_CommonEvent *self;
    PPCODE:
	self = (struct SDL_CommonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::CommonEvent", "SDL3::CommonEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::CommonEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_CommonEvent *self;
    PPCODE:
	self = (struct SDL_CommonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::CommonEvent", "SDL3::CommonEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::CommonEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::DisplayEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_DisplayEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_DisplayEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DisplayEvent *self;
    PPCODE:
	self = (struct SDL_DisplayEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DisplayEvent", "SDL3::DisplayEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::DisplayEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DisplayEvent *self;
    PPCODE:
	self = (struct SDL_DisplayEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DisplayEvent", "SDL3::DisplayEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::DisplayEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DisplayEvent *self;
    PPCODE:
	self = (struct SDL_DisplayEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DisplayEvent", "SDL3::DisplayEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::DisplayEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
displayID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DisplayEvent *self;
    PPCODE:
	self = (struct SDL_DisplayEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DisplayEvent", "SDL3::DisplayEvent::displayID");
	if (items > 1) {
		self->displayID = (SDL_DisplayID)bg_in_uv(aTHX_ ST(1), "SDL3::DisplayEvent::displayID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->displayID)));
	XSRETURN(1);

void
data1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DisplayEvent *self;
    PPCODE:
	self = (struct SDL_DisplayEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DisplayEvent", "SDL3::DisplayEvent::data1");
	if (items > 1) {
		self->data1 = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::DisplayEvent::data1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->data1)));
	XSRETURN(1);

void
data2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DisplayEvent *self;
    PPCODE:
	self = (struct SDL_DisplayEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DisplayEvent", "SDL3::DisplayEvent::data2");
	if (items > 1) {
		self->data2 = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::DisplayEvent::data2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->data2)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::WindowEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_WindowEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_WindowEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_WindowEvent *self;
    PPCODE:
	self = (struct SDL_WindowEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::WindowEvent", "SDL3::WindowEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::WindowEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_WindowEvent *self;
    PPCODE:
	self = (struct SDL_WindowEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::WindowEvent", "SDL3::WindowEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::WindowEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_WindowEvent *self;
    PPCODE:
	self = (struct SDL_WindowEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::WindowEvent", "SDL3::WindowEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::WindowEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_WindowEvent *self;
    PPCODE:
	self = (struct SDL_WindowEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::WindowEvent", "SDL3::WindowEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::WindowEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

void
data1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_WindowEvent *self;
    PPCODE:
	self = (struct SDL_WindowEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::WindowEvent", "SDL3::WindowEvent::data1");
	if (items > 1) {
		self->data1 = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::WindowEvent::data1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->data1)));
	XSRETURN(1);

void
data2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_WindowEvent *self;
    PPCODE:
	self = (struct SDL_WindowEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::WindowEvent", "SDL3::WindowEvent::data2");
	if (items > 1) {
		self->data2 = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::WindowEvent::data2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->data2)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::KeyboardDeviceEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_KeyboardDeviceEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_KeyboardDeviceEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_KeyboardDeviceEvent *self;
    PPCODE:
	self = (struct SDL_KeyboardDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::KeyboardDeviceEvent", "SDL3::KeyboardDeviceEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::KeyboardDeviceEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_KeyboardDeviceEvent *self;
    PPCODE:
	self = (struct SDL_KeyboardDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::KeyboardDeviceEvent", "SDL3::KeyboardDeviceEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::KeyboardDeviceEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_KeyboardDeviceEvent *self;
    PPCODE:
	self = (struct SDL_KeyboardDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::KeyboardDeviceEvent", "SDL3::KeyboardDeviceEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::KeyboardDeviceEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_KeyboardDeviceEvent *self;
    PPCODE:
	self = (struct SDL_KeyboardDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::KeyboardDeviceEvent", "SDL3::KeyboardDeviceEvent::which");
	if (items > 1) {
		self->which = (SDL_KeyboardID)bg_in_uv(aTHX_ ST(1), "SDL3::KeyboardDeviceEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::KeyboardEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_KeyboardEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_KeyboardEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_KeyboardEvent *self;
    PPCODE:
	self = (struct SDL_KeyboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::KeyboardEvent", "SDL3::KeyboardEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::KeyboardEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_KeyboardEvent *self;
    PPCODE:
	self = (struct SDL_KeyboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::KeyboardEvent", "SDL3::KeyboardEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::KeyboardEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_KeyboardEvent *self;
    PPCODE:
	self = (struct SDL_KeyboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::KeyboardEvent", "SDL3::KeyboardEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::KeyboardEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_KeyboardEvent *self;
    PPCODE:
	self = (struct SDL_KeyboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::KeyboardEvent", "SDL3::KeyboardEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::KeyboardEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_KeyboardEvent *self;
    PPCODE:
	self = (struct SDL_KeyboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::KeyboardEvent", "SDL3::KeyboardEvent::which");
	if (items > 1) {
		self->which = (SDL_KeyboardID)bg_in_uv(aTHX_ ST(1), "SDL3::KeyboardEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
scancode(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_KeyboardEvent *self;
    PPCODE:
	self = (struct SDL_KeyboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::KeyboardEvent", "SDL3::KeyboardEvent::scancode");
	if (items > 1) {
		self->scancode = (SDL_Scancode)bg_in_iv(aTHX_ ST(1), "SDL3::KeyboardEvent::scancode");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->scancode)));
	XSRETURN(1);

void
key(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_KeyboardEvent *self;
    PPCODE:
	self = (struct SDL_KeyboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::KeyboardEvent", "SDL3::KeyboardEvent::key");
	if (items > 1) {
		self->key = (SDL_Keycode)bg_in_uv(aTHX_ ST(1), "SDL3::KeyboardEvent::key");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->key)));
	XSRETURN(1);

void
mod(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_KeyboardEvent *self;
    PPCODE:
	self = (struct SDL_KeyboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::KeyboardEvent", "SDL3::KeyboardEvent::mod");
	if (items > 1) {
		self->mod = (SDL_Keymod)bg_in_uv(aTHX_ ST(1), "SDL3::KeyboardEvent::mod");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->mod)));
	XSRETURN(1);

void
raw(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_KeyboardEvent *self;
    PPCODE:
	self = (struct SDL_KeyboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::KeyboardEvent", "SDL3::KeyboardEvent::raw");
	if (items > 1) {
		self->raw = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::KeyboardEvent::raw");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->raw)));
	XSRETURN(1);

void
down(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_KeyboardEvent *self;
    PPCODE:
	self = (struct SDL_KeyboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::KeyboardEvent", "SDL3::KeyboardEvent::down");
	if (items > 1) {
		self->down = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->down)));
	XSRETURN(1);

void
repeat(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_KeyboardEvent *self;
    PPCODE:
	self = (struct SDL_KeyboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::KeyboardEvent", "SDL3::KeyboardEvent::repeat");
	if (items > 1) {
		self->repeat = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->repeat)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::TextEditingEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_TextEditingEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_TextEditingEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingEvent", "SDL3::TextEditingEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::TextEditingEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingEvent", "SDL3::TextEditingEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::TextEditingEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingEvent", "SDL3::TextEditingEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::TextEditingEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingEvent", "SDL3::TextEditingEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::TextEditingEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

void
text(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingEvent", "SDL3::TextEditingEvent::text");
	if (items > 1) {
		self->text = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::TextEditingEvent::text");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->text)));
	XSRETURN(1);

void
start(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingEvent", "SDL3::TextEditingEvent::start");
	if (items > 1) {
		self->start = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::TextEditingEvent::start");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->start)));
	XSRETURN(1);

void
length(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingEvent", "SDL3::TextEditingEvent::length");
	if (items > 1) {
		self->length = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::TextEditingEvent::length");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->length)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::TextEditingCandidatesEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_TextEditingCandidatesEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_TextEditingCandidatesEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingCandidatesEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingCandidatesEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingCandidatesEvent", "SDL3::TextEditingCandidatesEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::TextEditingCandidatesEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingCandidatesEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingCandidatesEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingCandidatesEvent", "SDL3::TextEditingCandidatesEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::TextEditingCandidatesEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingCandidatesEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingCandidatesEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingCandidatesEvent", "SDL3::TextEditingCandidatesEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::TextEditingCandidatesEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingCandidatesEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingCandidatesEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingCandidatesEvent", "SDL3::TextEditingCandidatesEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::TextEditingCandidatesEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

void
candidates(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingCandidatesEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingCandidatesEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingCandidatesEvent", "SDL3::TextEditingCandidatesEvent::candidates");
	if (items > 1) {
		self->candidates = (const char * const *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::TextEditingCandidatesEvent::candidates");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->candidates), "SDL3::Pointer"));
	XSRETURN(1);

void
num_candidates(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingCandidatesEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingCandidatesEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingCandidatesEvent", "SDL3::TextEditingCandidatesEvent::num_candidates");
	if (items > 1) {
		self->num_candidates = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::TextEditingCandidatesEvent::num_candidates");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->num_candidates)));
	XSRETURN(1);

void
selected_candidate(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingCandidatesEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingCandidatesEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingCandidatesEvent", "SDL3::TextEditingCandidatesEvent::selected_candidate");
	if (items > 1) {
		self->selected_candidate = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::TextEditingCandidatesEvent::selected_candidate");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->selected_candidate)));
	XSRETURN(1);

void
horizontal(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingCandidatesEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingCandidatesEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingCandidatesEvent", "SDL3::TextEditingCandidatesEvent::horizontal");
	if (items > 1) {
		self->horizontal = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->horizontal)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingCandidatesEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingCandidatesEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingCandidatesEvent", "SDL3::TextEditingCandidatesEvent::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::TextEditingCandidatesEvent::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingCandidatesEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingCandidatesEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingCandidatesEvent", "SDL3::TextEditingCandidatesEvent::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::TextEditingCandidatesEvent::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

void
padding3(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextEditingCandidatesEvent *self;
    PPCODE:
	self = (struct SDL_TextEditingCandidatesEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextEditingCandidatesEvent", "SDL3::TextEditingCandidatesEvent::padding3");
	if (items > 1) {
		self->padding3 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::TextEditingCandidatesEvent::padding3");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding3)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::TextInputEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_TextInputEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_TextInputEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextInputEvent *self;
    PPCODE:
	self = (struct SDL_TextInputEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextInputEvent", "SDL3::TextInputEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::TextInputEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextInputEvent *self;
    PPCODE:
	self = (struct SDL_TextInputEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextInputEvent", "SDL3::TextInputEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::TextInputEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextInputEvent *self;
    PPCODE:
	self = (struct SDL_TextInputEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextInputEvent", "SDL3::TextInputEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::TextInputEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextInputEvent *self;
    PPCODE:
	self = (struct SDL_TextInputEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextInputEvent", "SDL3::TextInputEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::TextInputEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

void
text(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TextInputEvent *self;
    PPCODE:
	self = (struct SDL_TextInputEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TextInputEvent", "SDL3::TextInputEvent::text");
	if (items > 1) {
		self->text = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::TextInputEvent::text");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->text)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::MouseDeviceEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_MouseDeviceEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_MouseDeviceEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseDeviceEvent *self;
    PPCODE:
	self = (struct SDL_MouseDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseDeviceEvent", "SDL3::MouseDeviceEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::MouseDeviceEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseDeviceEvent *self;
    PPCODE:
	self = (struct SDL_MouseDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseDeviceEvent", "SDL3::MouseDeviceEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::MouseDeviceEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseDeviceEvent *self;
    PPCODE:
	self = (struct SDL_MouseDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseDeviceEvent", "SDL3::MouseDeviceEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::MouseDeviceEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseDeviceEvent *self;
    PPCODE:
	self = (struct SDL_MouseDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseDeviceEvent", "SDL3::MouseDeviceEvent::which");
	if (items > 1) {
		self->which = (SDL_MouseID)bg_in_uv(aTHX_ ST(1), "SDL3::MouseDeviceEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::MouseMotionEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_MouseMotionEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_MouseMotionEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseMotionEvent *self;
    PPCODE:
	self = (struct SDL_MouseMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseMotionEvent", "SDL3::MouseMotionEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::MouseMotionEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseMotionEvent *self;
    PPCODE:
	self = (struct SDL_MouseMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseMotionEvent", "SDL3::MouseMotionEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::MouseMotionEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseMotionEvent *self;
    PPCODE:
	self = (struct SDL_MouseMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseMotionEvent", "SDL3::MouseMotionEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::MouseMotionEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseMotionEvent *self;
    PPCODE:
	self = (struct SDL_MouseMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseMotionEvent", "SDL3::MouseMotionEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::MouseMotionEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseMotionEvent *self;
    PPCODE:
	self = (struct SDL_MouseMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseMotionEvent", "SDL3::MouseMotionEvent::which");
	if (items > 1) {
		self->which = (SDL_MouseID)bg_in_uv(aTHX_ ST(1), "SDL3::MouseMotionEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
state(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseMotionEvent *self;
    PPCODE:
	self = (struct SDL_MouseMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseMotionEvent", "SDL3::MouseMotionEvent::state");
	if (items > 1) {
		self->state = (SDL_MouseButtonFlags)bg_in_uv(aTHX_ ST(1), "SDL3::MouseMotionEvent::state");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->state)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseMotionEvent *self;
    PPCODE:
	self = (struct SDL_MouseMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseMotionEvent", "SDL3::MouseMotionEvent::x");
	if (items > 1) {
		self->x = (float)bg_in_nv(aTHX_ ST(1), "SDL3::MouseMotionEvent::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseMotionEvent *self;
    PPCODE:
	self = (struct SDL_MouseMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseMotionEvent", "SDL3::MouseMotionEvent::y");
	if (items > 1) {
		self->y = (float)bg_in_nv(aTHX_ ST(1), "SDL3::MouseMotionEvent::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->y)));
	XSRETURN(1);

void
xrel(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseMotionEvent *self;
    PPCODE:
	self = (struct SDL_MouseMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseMotionEvent", "SDL3::MouseMotionEvent::xrel");
	if (items > 1) {
		self->xrel = (float)bg_in_nv(aTHX_ ST(1), "SDL3::MouseMotionEvent::xrel");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->xrel)));
	XSRETURN(1);

void
yrel(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseMotionEvent *self;
    PPCODE:
	self = (struct SDL_MouseMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseMotionEvent", "SDL3::MouseMotionEvent::yrel");
	if (items > 1) {
		self->yrel = (float)bg_in_nv(aTHX_ ST(1), "SDL3::MouseMotionEvent::yrel");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->yrel)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::MouseButtonEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_MouseButtonEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_MouseButtonEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseButtonEvent *self;
    PPCODE:
	self = (struct SDL_MouseButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseButtonEvent", "SDL3::MouseButtonEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::MouseButtonEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseButtonEvent *self;
    PPCODE:
	self = (struct SDL_MouseButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseButtonEvent", "SDL3::MouseButtonEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::MouseButtonEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseButtonEvent *self;
    PPCODE:
	self = (struct SDL_MouseButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseButtonEvent", "SDL3::MouseButtonEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::MouseButtonEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseButtonEvent *self;
    PPCODE:
	self = (struct SDL_MouseButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseButtonEvent", "SDL3::MouseButtonEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::MouseButtonEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseButtonEvent *self;
    PPCODE:
	self = (struct SDL_MouseButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseButtonEvent", "SDL3::MouseButtonEvent::which");
	if (items > 1) {
		self->which = (SDL_MouseID)bg_in_uv(aTHX_ ST(1), "SDL3::MouseButtonEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
button(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseButtonEvent *self;
    PPCODE:
	self = (struct SDL_MouseButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseButtonEvent", "SDL3::MouseButtonEvent::button");
	if (items > 1) {
		self->button = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::MouseButtonEvent::button");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->button)));
	XSRETURN(1);

void
down(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseButtonEvent *self;
    PPCODE:
	self = (struct SDL_MouseButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseButtonEvent", "SDL3::MouseButtonEvent::down");
	if (items > 1) {
		self->down = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->down)));
	XSRETURN(1);

void
clicks(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseButtonEvent *self;
    PPCODE:
	self = (struct SDL_MouseButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseButtonEvent", "SDL3::MouseButtonEvent::clicks");
	if (items > 1) {
		self->clicks = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::MouseButtonEvent::clicks");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->clicks)));
	XSRETURN(1);

void
padding(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseButtonEvent *self;
    PPCODE:
	self = (struct SDL_MouseButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseButtonEvent", "SDL3::MouseButtonEvent::padding");
	if (items > 1) {
		self->padding = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::MouseButtonEvent::padding");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseButtonEvent *self;
    PPCODE:
	self = (struct SDL_MouseButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseButtonEvent", "SDL3::MouseButtonEvent::x");
	if (items > 1) {
		self->x = (float)bg_in_nv(aTHX_ ST(1), "SDL3::MouseButtonEvent::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseButtonEvent *self;
    PPCODE:
	self = (struct SDL_MouseButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseButtonEvent", "SDL3::MouseButtonEvent::y");
	if (items > 1) {
		self->y = (float)bg_in_nv(aTHX_ ST(1), "SDL3::MouseButtonEvent::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->y)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::MouseWheelEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_MouseWheelEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_MouseWheelEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseWheelEvent *self;
    PPCODE:
	self = (struct SDL_MouseWheelEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseWheelEvent", "SDL3::MouseWheelEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::MouseWheelEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseWheelEvent *self;
    PPCODE:
	self = (struct SDL_MouseWheelEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseWheelEvent", "SDL3::MouseWheelEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::MouseWheelEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseWheelEvent *self;
    PPCODE:
	self = (struct SDL_MouseWheelEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseWheelEvent", "SDL3::MouseWheelEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::MouseWheelEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseWheelEvent *self;
    PPCODE:
	self = (struct SDL_MouseWheelEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseWheelEvent", "SDL3::MouseWheelEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::MouseWheelEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseWheelEvent *self;
    PPCODE:
	self = (struct SDL_MouseWheelEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseWheelEvent", "SDL3::MouseWheelEvent::which");
	if (items > 1) {
		self->which = (SDL_MouseID)bg_in_uv(aTHX_ ST(1), "SDL3::MouseWheelEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseWheelEvent *self;
    PPCODE:
	self = (struct SDL_MouseWheelEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseWheelEvent", "SDL3::MouseWheelEvent::x");
	if (items > 1) {
		self->x = (float)bg_in_nv(aTHX_ ST(1), "SDL3::MouseWheelEvent::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseWheelEvent *self;
    PPCODE:
	self = (struct SDL_MouseWheelEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseWheelEvent", "SDL3::MouseWheelEvent::y");
	if (items > 1) {
		self->y = (float)bg_in_nv(aTHX_ ST(1), "SDL3::MouseWheelEvent::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->y)));
	XSRETURN(1);

void
direction(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseWheelEvent *self;
    PPCODE:
	self = (struct SDL_MouseWheelEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseWheelEvent", "SDL3::MouseWheelEvent::direction");
	if (items > 1) {
		self->direction = (SDL_MouseWheelDirection)bg_in_iv(aTHX_ ST(1), "SDL3::MouseWheelEvent::direction");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->direction)));
	XSRETURN(1);

void
mouse_x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseWheelEvent *self;
    PPCODE:
	self = (struct SDL_MouseWheelEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseWheelEvent", "SDL3::MouseWheelEvent::mouse_x");
	if (items > 1) {
		self->mouse_x = (float)bg_in_nv(aTHX_ ST(1), "SDL3::MouseWheelEvent::mouse_x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->mouse_x)));
	XSRETURN(1);

void
mouse_y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseWheelEvent *self;
    PPCODE:
	self = (struct SDL_MouseWheelEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseWheelEvent", "SDL3::MouseWheelEvent::mouse_y");
	if (items > 1) {
		self->mouse_y = (float)bg_in_nv(aTHX_ ST(1), "SDL3::MouseWheelEvent::mouse_y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->mouse_y)));
	XSRETURN(1);

void
integer_x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseWheelEvent *self;
    PPCODE:
	self = (struct SDL_MouseWheelEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseWheelEvent", "SDL3::MouseWheelEvent::integer_x");
	if (items > 1) {
		self->integer_x = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::MouseWheelEvent::integer_x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->integer_x)));
	XSRETURN(1);

void
integer_y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MouseWheelEvent *self;
    PPCODE:
	self = (struct SDL_MouseWheelEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MouseWheelEvent", "SDL3::MouseWheelEvent::integer_y");
	if (items > 1) {
		self->integer_y = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::MouseWheelEvent::integer_y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->integer_y)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::JoyAxisEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_JoyAxisEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_JoyAxisEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyAxisEvent *self;
    PPCODE:
	self = (struct SDL_JoyAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyAxisEvent", "SDL3::JoyAxisEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::JoyAxisEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyAxisEvent *self;
    PPCODE:
	self = (struct SDL_JoyAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyAxisEvent", "SDL3::JoyAxisEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::JoyAxisEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyAxisEvent *self;
    PPCODE:
	self = (struct SDL_JoyAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyAxisEvent", "SDL3::JoyAxisEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::JoyAxisEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyAxisEvent *self;
    PPCODE:
	self = (struct SDL_JoyAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyAxisEvent", "SDL3::JoyAxisEvent::which");
	if (items > 1) {
		self->which = (SDL_JoystickID)bg_in_uv(aTHX_ ST(1), "SDL3::JoyAxisEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
axis(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyAxisEvent *self;
    PPCODE:
	self = (struct SDL_JoyAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyAxisEvent", "SDL3::JoyAxisEvent::axis");
	if (items > 1) {
		self->axis = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::JoyAxisEvent::axis");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->axis)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyAxisEvent *self;
    PPCODE:
	self = (struct SDL_JoyAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyAxisEvent", "SDL3::JoyAxisEvent::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::JoyAxisEvent::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyAxisEvent *self;
    PPCODE:
	self = (struct SDL_JoyAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyAxisEvent", "SDL3::JoyAxisEvent::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::JoyAxisEvent::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

void
padding3(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyAxisEvent *self;
    PPCODE:
	self = (struct SDL_JoyAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyAxisEvent", "SDL3::JoyAxisEvent::padding3");
	if (items > 1) {
		self->padding3 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::JoyAxisEvent::padding3");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding3)));
	XSRETURN(1);

void
value(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyAxisEvent *self;
    PPCODE:
	self = (struct SDL_JoyAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyAxisEvent", "SDL3::JoyAxisEvent::value");
	if (items > 1) {
		self->value = (Sint16)bg_in_iv(aTHX_ ST(1), "SDL3::JoyAxisEvent::value");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->value)));
	XSRETURN(1);

void
padding4(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyAxisEvent *self;
    PPCODE:
	self = (struct SDL_JoyAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyAxisEvent", "SDL3::JoyAxisEvent::padding4");
	if (items > 1) {
		self->padding4 = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::JoyAxisEvent::padding4");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding4)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::JoyBallEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_JoyBallEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_JoyBallEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBallEvent *self;
    PPCODE:
	self = (struct SDL_JoyBallEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBallEvent", "SDL3::JoyBallEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::JoyBallEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBallEvent *self;
    PPCODE:
	self = (struct SDL_JoyBallEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBallEvent", "SDL3::JoyBallEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::JoyBallEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBallEvent *self;
    PPCODE:
	self = (struct SDL_JoyBallEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBallEvent", "SDL3::JoyBallEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::JoyBallEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBallEvent *self;
    PPCODE:
	self = (struct SDL_JoyBallEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBallEvent", "SDL3::JoyBallEvent::which");
	if (items > 1) {
		self->which = (SDL_JoystickID)bg_in_uv(aTHX_ ST(1), "SDL3::JoyBallEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
ball(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBallEvent *self;
    PPCODE:
	self = (struct SDL_JoyBallEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBallEvent", "SDL3::JoyBallEvent::ball");
	if (items > 1) {
		self->ball = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::JoyBallEvent::ball");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->ball)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBallEvent *self;
    PPCODE:
	self = (struct SDL_JoyBallEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBallEvent", "SDL3::JoyBallEvent::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::JoyBallEvent::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBallEvent *self;
    PPCODE:
	self = (struct SDL_JoyBallEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBallEvent", "SDL3::JoyBallEvent::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::JoyBallEvent::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

void
padding3(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBallEvent *self;
    PPCODE:
	self = (struct SDL_JoyBallEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBallEvent", "SDL3::JoyBallEvent::padding3");
	if (items > 1) {
		self->padding3 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::JoyBallEvent::padding3");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding3)));
	XSRETURN(1);

void
xrel(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBallEvent *self;
    PPCODE:
	self = (struct SDL_JoyBallEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBallEvent", "SDL3::JoyBallEvent::xrel");
	if (items > 1) {
		self->xrel = (Sint16)bg_in_iv(aTHX_ ST(1), "SDL3::JoyBallEvent::xrel");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->xrel)));
	XSRETURN(1);

void
yrel(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBallEvent *self;
    PPCODE:
	self = (struct SDL_JoyBallEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBallEvent", "SDL3::JoyBallEvent::yrel");
	if (items > 1) {
		self->yrel = (Sint16)bg_in_iv(aTHX_ ST(1), "SDL3::JoyBallEvent::yrel");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->yrel)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::JoyHatEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_JoyHatEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_JoyHatEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyHatEvent *self;
    PPCODE:
	self = (struct SDL_JoyHatEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyHatEvent", "SDL3::JoyHatEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::JoyHatEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyHatEvent *self;
    PPCODE:
	self = (struct SDL_JoyHatEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyHatEvent", "SDL3::JoyHatEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::JoyHatEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyHatEvent *self;
    PPCODE:
	self = (struct SDL_JoyHatEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyHatEvent", "SDL3::JoyHatEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::JoyHatEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyHatEvent *self;
    PPCODE:
	self = (struct SDL_JoyHatEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyHatEvent", "SDL3::JoyHatEvent::which");
	if (items > 1) {
		self->which = (SDL_JoystickID)bg_in_uv(aTHX_ ST(1), "SDL3::JoyHatEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
hat(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyHatEvent *self;
    PPCODE:
	self = (struct SDL_JoyHatEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyHatEvent", "SDL3::JoyHatEvent::hat");
	if (items > 1) {
		self->hat = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::JoyHatEvent::hat");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->hat)));
	XSRETURN(1);

void
value(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyHatEvent *self;
    PPCODE:
	self = (struct SDL_JoyHatEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyHatEvent", "SDL3::JoyHatEvent::value");
	if (items > 1) {
		self->value = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::JoyHatEvent::value");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->value)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyHatEvent *self;
    PPCODE:
	self = (struct SDL_JoyHatEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyHatEvent", "SDL3::JoyHatEvent::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::JoyHatEvent::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyHatEvent *self;
    PPCODE:
	self = (struct SDL_JoyHatEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyHatEvent", "SDL3::JoyHatEvent::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::JoyHatEvent::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::JoyButtonEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_JoyButtonEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_JoyButtonEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyButtonEvent *self;
    PPCODE:
	self = (struct SDL_JoyButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyButtonEvent", "SDL3::JoyButtonEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::JoyButtonEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyButtonEvent *self;
    PPCODE:
	self = (struct SDL_JoyButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyButtonEvent", "SDL3::JoyButtonEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::JoyButtonEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyButtonEvent *self;
    PPCODE:
	self = (struct SDL_JoyButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyButtonEvent", "SDL3::JoyButtonEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::JoyButtonEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyButtonEvent *self;
    PPCODE:
	self = (struct SDL_JoyButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyButtonEvent", "SDL3::JoyButtonEvent::which");
	if (items > 1) {
		self->which = (SDL_JoystickID)bg_in_uv(aTHX_ ST(1), "SDL3::JoyButtonEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
button(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyButtonEvent *self;
    PPCODE:
	self = (struct SDL_JoyButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyButtonEvent", "SDL3::JoyButtonEvent::button");
	if (items > 1) {
		self->button = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::JoyButtonEvent::button");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->button)));
	XSRETURN(1);

void
down(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyButtonEvent *self;
    PPCODE:
	self = (struct SDL_JoyButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyButtonEvent", "SDL3::JoyButtonEvent::down");
	if (items > 1) {
		self->down = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->down)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyButtonEvent *self;
    PPCODE:
	self = (struct SDL_JoyButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyButtonEvent", "SDL3::JoyButtonEvent::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::JoyButtonEvent::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyButtonEvent *self;
    PPCODE:
	self = (struct SDL_JoyButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyButtonEvent", "SDL3::JoyButtonEvent::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::JoyButtonEvent::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::JoyDeviceEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_JoyDeviceEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_JoyDeviceEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyDeviceEvent *self;
    PPCODE:
	self = (struct SDL_JoyDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyDeviceEvent", "SDL3::JoyDeviceEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::JoyDeviceEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyDeviceEvent *self;
    PPCODE:
	self = (struct SDL_JoyDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyDeviceEvent", "SDL3::JoyDeviceEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::JoyDeviceEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyDeviceEvent *self;
    PPCODE:
	self = (struct SDL_JoyDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyDeviceEvent", "SDL3::JoyDeviceEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::JoyDeviceEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyDeviceEvent *self;
    PPCODE:
	self = (struct SDL_JoyDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyDeviceEvent", "SDL3::JoyDeviceEvent::which");
	if (items > 1) {
		self->which = (SDL_JoystickID)bg_in_uv(aTHX_ ST(1), "SDL3::JoyDeviceEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::JoyBatteryEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_JoyBatteryEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_JoyBatteryEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBatteryEvent *self;
    PPCODE:
	self = (struct SDL_JoyBatteryEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBatteryEvent", "SDL3::JoyBatteryEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::JoyBatteryEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBatteryEvent *self;
    PPCODE:
	self = (struct SDL_JoyBatteryEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBatteryEvent", "SDL3::JoyBatteryEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::JoyBatteryEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBatteryEvent *self;
    PPCODE:
	self = (struct SDL_JoyBatteryEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBatteryEvent", "SDL3::JoyBatteryEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::JoyBatteryEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBatteryEvent *self;
    PPCODE:
	self = (struct SDL_JoyBatteryEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBatteryEvent", "SDL3::JoyBatteryEvent::which");
	if (items > 1) {
		self->which = (SDL_JoystickID)bg_in_uv(aTHX_ ST(1), "SDL3::JoyBatteryEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
state(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBatteryEvent *self;
    PPCODE:
	self = (struct SDL_JoyBatteryEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBatteryEvent", "SDL3::JoyBatteryEvent::state");
	if (items > 1) {
		self->state = (SDL_PowerState)bg_in_iv(aTHX_ ST(1), "SDL3::JoyBatteryEvent::state");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->state)));
	XSRETURN(1);

void
percent(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_JoyBatteryEvent *self;
    PPCODE:
	self = (struct SDL_JoyBatteryEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::JoyBatteryEvent", "SDL3::JoyBatteryEvent::percent");
	if (items > 1) {
		self->percent = (int)bg_in_iv(aTHX_ ST(1), "SDL3::JoyBatteryEvent::percent");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->percent)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GamepadAxisEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GamepadAxisEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GamepadAxisEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadAxisEvent *self;
    PPCODE:
	self = (struct SDL_GamepadAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadAxisEvent", "SDL3::GamepadAxisEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadAxisEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadAxisEvent *self;
    PPCODE:
	self = (struct SDL_GamepadAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadAxisEvent", "SDL3::GamepadAxisEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadAxisEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadAxisEvent *self;
    PPCODE:
	self = (struct SDL_GamepadAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadAxisEvent", "SDL3::GamepadAxisEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadAxisEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadAxisEvent *self;
    PPCODE:
	self = (struct SDL_GamepadAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadAxisEvent", "SDL3::GamepadAxisEvent::which");
	if (items > 1) {
		self->which = (SDL_JoystickID)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadAxisEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
axis(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadAxisEvent *self;
    PPCODE:
	self = (struct SDL_GamepadAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadAxisEvent", "SDL3::GamepadAxisEvent::axis");
	if (items > 1) {
		self->axis = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadAxisEvent::axis");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->axis)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadAxisEvent *self;
    PPCODE:
	self = (struct SDL_GamepadAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadAxisEvent", "SDL3::GamepadAxisEvent::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadAxisEvent::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadAxisEvent *self;
    PPCODE:
	self = (struct SDL_GamepadAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadAxisEvent", "SDL3::GamepadAxisEvent::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadAxisEvent::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

void
padding3(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadAxisEvent *self;
    PPCODE:
	self = (struct SDL_GamepadAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadAxisEvent", "SDL3::GamepadAxisEvent::padding3");
	if (items > 1) {
		self->padding3 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadAxisEvent::padding3");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding3)));
	XSRETURN(1);

void
value(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadAxisEvent *self;
    PPCODE:
	self = (struct SDL_GamepadAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadAxisEvent", "SDL3::GamepadAxisEvent::value");
	if (items > 1) {
		self->value = (Sint16)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadAxisEvent::value");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->value)));
	XSRETURN(1);

void
padding4(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadAxisEvent *self;
    PPCODE:
	self = (struct SDL_GamepadAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadAxisEvent", "SDL3::GamepadAxisEvent::padding4");
	if (items > 1) {
		self->padding4 = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadAxisEvent::padding4");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding4)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GamepadButtonEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GamepadButtonEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GamepadButtonEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadButtonEvent *self;
    PPCODE:
	self = (struct SDL_GamepadButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadButtonEvent", "SDL3::GamepadButtonEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadButtonEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadButtonEvent *self;
    PPCODE:
	self = (struct SDL_GamepadButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadButtonEvent", "SDL3::GamepadButtonEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadButtonEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadButtonEvent *self;
    PPCODE:
	self = (struct SDL_GamepadButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadButtonEvent", "SDL3::GamepadButtonEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadButtonEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadButtonEvent *self;
    PPCODE:
	self = (struct SDL_GamepadButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadButtonEvent", "SDL3::GamepadButtonEvent::which");
	if (items > 1) {
		self->which = (SDL_JoystickID)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadButtonEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
button(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadButtonEvent *self;
    PPCODE:
	self = (struct SDL_GamepadButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadButtonEvent", "SDL3::GamepadButtonEvent::button");
	if (items > 1) {
		self->button = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadButtonEvent::button");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->button)));
	XSRETURN(1);

void
down(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadButtonEvent *self;
    PPCODE:
	self = (struct SDL_GamepadButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadButtonEvent", "SDL3::GamepadButtonEvent::down");
	if (items > 1) {
		self->down = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->down)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadButtonEvent *self;
    PPCODE:
	self = (struct SDL_GamepadButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadButtonEvent", "SDL3::GamepadButtonEvent::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadButtonEvent::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadButtonEvent *self;
    PPCODE:
	self = (struct SDL_GamepadButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadButtonEvent", "SDL3::GamepadButtonEvent::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadButtonEvent::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GamepadDeviceEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GamepadDeviceEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GamepadDeviceEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadDeviceEvent *self;
    PPCODE:
	self = (struct SDL_GamepadDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadDeviceEvent", "SDL3::GamepadDeviceEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadDeviceEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadDeviceEvent *self;
    PPCODE:
	self = (struct SDL_GamepadDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadDeviceEvent", "SDL3::GamepadDeviceEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadDeviceEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadDeviceEvent *self;
    PPCODE:
	self = (struct SDL_GamepadDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadDeviceEvent", "SDL3::GamepadDeviceEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadDeviceEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadDeviceEvent *self;
    PPCODE:
	self = (struct SDL_GamepadDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadDeviceEvent", "SDL3::GamepadDeviceEvent::which");
	if (items > 1) {
		self->which = (SDL_JoystickID)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadDeviceEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GamepadTouchpadEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GamepadTouchpadEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GamepadTouchpadEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadTouchpadEvent *self;
    PPCODE:
	self = (struct SDL_GamepadTouchpadEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadTouchpadEvent", "SDL3::GamepadTouchpadEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadTouchpadEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadTouchpadEvent *self;
    PPCODE:
	self = (struct SDL_GamepadTouchpadEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadTouchpadEvent", "SDL3::GamepadTouchpadEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadTouchpadEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadTouchpadEvent *self;
    PPCODE:
	self = (struct SDL_GamepadTouchpadEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadTouchpadEvent", "SDL3::GamepadTouchpadEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadTouchpadEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadTouchpadEvent *self;
    PPCODE:
	self = (struct SDL_GamepadTouchpadEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadTouchpadEvent", "SDL3::GamepadTouchpadEvent::which");
	if (items > 1) {
		self->which = (SDL_JoystickID)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadTouchpadEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
touchpad(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadTouchpadEvent *self;
    PPCODE:
	self = (struct SDL_GamepadTouchpadEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadTouchpadEvent", "SDL3::GamepadTouchpadEvent::touchpad");
	if (items > 1) {
		self->touchpad = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadTouchpadEvent::touchpad");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->touchpad)));
	XSRETURN(1);

void
finger(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadTouchpadEvent *self;
    PPCODE:
	self = (struct SDL_GamepadTouchpadEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadTouchpadEvent", "SDL3::GamepadTouchpadEvent::finger");
	if (items > 1) {
		self->finger = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadTouchpadEvent::finger");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->finger)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadTouchpadEvent *self;
    PPCODE:
	self = (struct SDL_GamepadTouchpadEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadTouchpadEvent", "SDL3::GamepadTouchpadEvent::x");
	if (items > 1) {
		self->x = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GamepadTouchpadEvent::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadTouchpadEvent *self;
    PPCODE:
	self = (struct SDL_GamepadTouchpadEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadTouchpadEvent", "SDL3::GamepadTouchpadEvent::y");
	if (items > 1) {
		self->y = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GamepadTouchpadEvent::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->y)));
	XSRETURN(1);

void
pressure(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadTouchpadEvent *self;
    PPCODE:
	self = (struct SDL_GamepadTouchpadEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadTouchpadEvent", "SDL3::GamepadTouchpadEvent::pressure");
	if (items > 1) {
		self->pressure = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GamepadTouchpadEvent::pressure");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->pressure)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GamepadSensorEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GamepadSensorEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GamepadSensorEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadSensorEvent *self;
    PPCODE:
	self = (struct SDL_GamepadSensorEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadSensorEvent", "SDL3::GamepadSensorEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadSensorEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadSensorEvent *self;
    PPCODE:
	self = (struct SDL_GamepadSensorEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadSensorEvent", "SDL3::GamepadSensorEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadSensorEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadSensorEvent *self;
    PPCODE:
	self = (struct SDL_GamepadSensorEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadSensorEvent", "SDL3::GamepadSensorEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadSensorEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadSensorEvent *self;
    PPCODE:
	self = (struct SDL_GamepadSensorEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadSensorEvent", "SDL3::GamepadSensorEvent::which");
	if (items > 1) {
		self->which = (SDL_JoystickID)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadSensorEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
sensor(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadSensorEvent *self;
    PPCODE:
	self = (struct SDL_GamepadSensorEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadSensorEvent", "SDL3::GamepadSensorEvent::sensor");
	if (items > 1) {
		self->sensor = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadSensorEvent::sensor");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->sensor)));
	XSRETURN(1);

void
data(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadSensorEvent *self;
	Size_t bg_i;
    PPCODE:
	self = (struct SDL_GamepadSensorEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadSensorEvent", "SDL3::GamepadSensorEvent::data");
	if (items > 1) {
		if (items - 1 != 3) croak("%s expects 3 values, got %d", "SDL3::GamepadSensorEvent::data", (int)(items - 1));
		for (bg_i = 0; bg_i < 3; bg_i++) self->data[bg_i] = (float)bg_in_nv(aTHX_ ST(1 + bg_i), "SDL3::GamepadSensorEvent::data");
		XSRETURN(1);
	}
	EXTEND(SP, 3);
	for (bg_i = 0; bg_i < 3; bg_i++) mPUSHs(newSVnv((NV)(self->data[bg_i])));
	XSRETURN(3);

void
sensor_timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadSensorEvent *self;
    PPCODE:
	self = (struct SDL_GamepadSensorEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadSensorEvent", "SDL3::GamepadSensorEvent::sensor_timestamp");
	if (items > 1) {
		self->sensor_timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::GamepadSensorEvent::sensor_timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->sensor_timestamp)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::AudioDeviceEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_AudioDeviceEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_AudioDeviceEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AudioDeviceEvent *self;
    PPCODE:
	self = (struct SDL_AudioDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AudioDeviceEvent", "SDL3::AudioDeviceEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::AudioDeviceEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AudioDeviceEvent *self;
    PPCODE:
	self = (struct SDL_AudioDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AudioDeviceEvent", "SDL3::AudioDeviceEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::AudioDeviceEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AudioDeviceEvent *self;
    PPCODE:
	self = (struct SDL_AudioDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AudioDeviceEvent", "SDL3::AudioDeviceEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::AudioDeviceEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AudioDeviceEvent *self;
    PPCODE:
	self = (struct SDL_AudioDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AudioDeviceEvent", "SDL3::AudioDeviceEvent::which");
	if (items > 1) {
		self->which = (SDL_AudioDeviceID)bg_in_uv(aTHX_ ST(1), "SDL3::AudioDeviceEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
recording(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AudioDeviceEvent *self;
    PPCODE:
	self = (struct SDL_AudioDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AudioDeviceEvent", "SDL3::AudioDeviceEvent::recording");
	if (items > 1) {
		self->recording = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->recording)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AudioDeviceEvent *self;
    PPCODE:
	self = (struct SDL_AudioDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AudioDeviceEvent", "SDL3::AudioDeviceEvent::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::AudioDeviceEvent::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AudioDeviceEvent *self;
    PPCODE:
	self = (struct SDL_AudioDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AudioDeviceEvent", "SDL3::AudioDeviceEvent::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::AudioDeviceEvent::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

void
padding3(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AudioDeviceEvent *self;
    PPCODE:
	self = (struct SDL_AudioDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AudioDeviceEvent", "SDL3::AudioDeviceEvent::padding3");
	if (items > 1) {
		self->padding3 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::AudioDeviceEvent::padding3");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding3)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::CameraDeviceEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_CameraDeviceEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_CameraDeviceEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_CameraDeviceEvent *self;
    PPCODE:
	self = (struct SDL_CameraDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::CameraDeviceEvent", "SDL3::CameraDeviceEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::CameraDeviceEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_CameraDeviceEvent *self;
    PPCODE:
	self = (struct SDL_CameraDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::CameraDeviceEvent", "SDL3::CameraDeviceEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::CameraDeviceEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_CameraDeviceEvent *self;
    PPCODE:
	self = (struct SDL_CameraDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::CameraDeviceEvent", "SDL3::CameraDeviceEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::CameraDeviceEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_CameraDeviceEvent *self;
    PPCODE:
	self = (struct SDL_CameraDeviceEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::CameraDeviceEvent", "SDL3::CameraDeviceEvent::which");
	if (items > 1) {
		self->which = (SDL_CameraID)bg_in_uv(aTHX_ ST(1), "SDL3::CameraDeviceEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::RenderEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_RenderEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_RenderEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_RenderEvent *self;
    PPCODE:
	self = (struct SDL_RenderEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::RenderEvent", "SDL3::RenderEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::RenderEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_RenderEvent *self;
    PPCODE:
	self = (struct SDL_RenderEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::RenderEvent", "SDL3::RenderEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::RenderEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_RenderEvent *self;
    PPCODE:
	self = (struct SDL_RenderEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::RenderEvent", "SDL3::RenderEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::RenderEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_RenderEvent *self;
    PPCODE:
	self = (struct SDL_RenderEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::RenderEvent", "SDL3::RenderEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::RenderEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::TouchFingerEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_TouchFingerEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_TouchFingerEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TouchFingerEvent *self;
    PPCODE:
	self = (struct SDL_TouchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TouchFingerEvent", "SDL3::TouchFingerEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::TouchFingerEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TouchFingerEvent *self;
    PPCODE:
	self = (struct SDL_TouchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TouchFingerEvent", "SDL3::TouchFingerEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::TouchFingerEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TouchFingerEvent *self;
    PPCODE:
	self = (struct SDL_TouchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TouchFingerEvent", "SDL3::TouchFingerEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::TouchFingerEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
touchID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TouchFingerEvent *self;
    PPCODE:
	self = (struct SDL_TouchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TouchFingerEvent", "SDL3::TouchFingerEvent::touchID");
	if (items > 1) {
		self->touchID = (SDL_TouchID)bg_in_uv(aTHX_ ST(1), "SDL3::TouchFingerEvent::touchID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->touchID)));
	XSRETURN(1);

void
fingerID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TouchFingerEvent *self;
    PPCODE:
	self = (struct SDL_TouchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TouchFingerEvent", "SDL3::TouchFingerEvent::fingerID");
	if (items > 1) {
		self->fingerID = (SDL_FingerID)bg_in_uv(aTHX_ ST(1), "SDL3::TouchFingerEvent::fingerID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->fingerID)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TouchFingerEvent *self;
    PPCODE:
	self = (struct SDL_TouchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TouchFingerEvent", "SDL3::TouchFingerEvent::x");
	if (items > 1) {
		self->x = (float)bg_in_nv(aTHX_ ST(1), "SDL3::TouchFingerEvent::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TouchFingerEvent *self;
    PPCODE:
	self = (struct SDL_TouchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TouchFingerEvent", "SDL3::TouchFingerEvent::y");
	if (items > 1) {
		self->y = (float)bg_in_nv(aTHX_ ST(1), "SDL3::TouchFingerEvent::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->y)));
	XSRETURN(1);

void
dx(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TouchFingerEvent *self;
    PPCODE:
	self = (struct SDL_TouchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TouchFingerEvent", "SDL3::TouchFingerEvent::dx");
	if (items > 1) {
		self->dx = (float)bg_in_nv(aTHX_ ST(1), "SDL3::TouchFingerEvent::dx");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->dx)));
	XSRETURN(1);

void
dy(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TouchFingerEvent *self;
    PPCODE:
	self = (struct SDL_TouchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TouchFingerEvent", "SDL3::TouchFingerEvent::dy");
	if (items > 1) {
		self->dy = (float)bg_in_nv(aTHX_ ST(1), "SDL3::TouchFingerEvent::dy");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->dy)));
	XSRETURN(1);

void
pressure(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TouchFingerEvent *self;
    PPCODE:
	self = (struct SDL_TouchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TouchFingerEvent", "SDL3::TouchFingerEvent::pressure");
	if (items > 1) {
		self->pressure = (float)bg_in_nv(aTHX_ ST(1), "SDL3::TouchFingerEvent::pressure");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->pressure)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_TouchFingerEvent *self;
    PPCODE:
	self = (struct SDL_TouchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::TouchFingerEvent", "SDL3::TouchFingerEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::TouchFingerEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::PinchFingerEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_PinchFingerEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_PinchFingerEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PinchFingerEvent *self;
    PPCODE:
	self = (struct SDL_PinchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PinchFingerEvent", "SDL3::PinchFingerEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::PinchFingerEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PinchFingerEvent *self;
    PPCODE:
	self = (struct SDL_PinchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PinchFingerEvent", "SDL3::PinchFingerEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::PinchFingerEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PinchFingerEvent *self;
    PPCODE:
	self = (struct SDL_PinchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PinchFingerEvent", "SDL3::PinchFingerEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::PinchFingerEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
scale(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PinchFingerEvent *self;
    PPCODE:
	self = (struct SDL_PinchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PinchFingerEvent", "SDL3::PinchFingerEvent::scale");
	if (items > 1) {
		self->scale = (float)bg_in_nv(aTHX_ ST(1), "SDL3::PinchFingerEvent::scale");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->scale)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PinchFingerEvent *self;
    PPCODE:
	self = (struct SDL_PinchFingerEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PinchFingerEvent", "SDL3::PinchFingerEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::PinchFingerEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::PenProximityEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_PenProximityEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_PenProximityEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenProximityEvent *self;
    PPCODE:
	self = (struct SDL_PenProximityEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenProximityEvent", "SDL3::PenProximityEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::PenProximityEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenProximityEvent *self;
    PPCODE:
	self = (struct SDL_PenProximityEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenProximityEvent", "SDL3::PenProximityEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::PenProximityEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenProximityEvent *self;
    PPCODE:
	self = (struct SDL_PenProximityEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenProximityEvent", "SDL3::PenProximityEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::PenProximityEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenProximityEvent *self;
    PPCODE:
	self = (struct SDL_PenProximityEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenProximityEvent", "SDL3::PenProximityEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::PenProximityEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenProximityEvent *self;
    PPCODE:
	self = (struct SDL_PenProximityEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenProximityEvent", "SDL3::PenProximityEvent::which");
	if (items > 1) {
		self->which = (SDL_PenID)bg_in_uv(aTHX_ ST(1), "SDL3::PenProximityEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
pen_state(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenProximityEvent *self;
    PPCODE:
	self = (struct SDL_PenProximityEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenProximityEvent", "SDL3::PenProximityEvent::pen_state");
	if (items > 1) {
		self->pen_state = (SDL_PenInputFlags)bg_in_uv(aTHX_ ST(1), "SDL3::PenProximityEvent::pen_state");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->pen_state)));
	XSRETURN(1);

void
device_type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenProximityEvent *self;
    PPCODE:
	self = (struct SDL_PenProximityEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenProximityEvent", "SDL3::PenProximityEvent::device_type");
	if (items > 1) {
		self->device_type = (SDL_PenDeviceType)bg_in_iv(aTHX_ ST(1), "SDL3::PenProximityEvent::device_type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->device_type)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::PenMotionEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_PenMotionEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_PenMotionEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenMotionEvent *self;
    PPCODE:
	self = (struct SDL_PenMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenMotionEvent", "SDL3::PenMotionEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::PenMotionEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenMotionEvent *self;
    PPCODE:
	self = (struct SDL_PenMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenMotionEvent", "SDL3::PenMotionEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::PenMotionEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenMotionEvent *self;
    PPCODE:
	self = (struct SDL_PenMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenMotionEvent", "SDL3::PenMotionEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::PenMotionEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenMotionEvent *self;
    PPCODE:
	self = (struct SDL_PenMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenMotionEvent", "SDL3::PenMotionEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::PenMotionEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenMotionEvent *self;
    PPCODE:
	self = (struct SDL_PenMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenMotionEvent", "SDL3::PenMotionEvent::which");
	if (items > 1) {
		self->which = (SDL_PenID)bg_in_uv(aTHX_ ST(1), "SDL3::PenMotionEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
pen_state(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenMotionEvent *self;
    PPCODE:
	self = (struct SDL_PenMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenMotionEvent", "SDL3::PenMotionEvent::pen_state");
	if (items > 1) {
		self->pen_state = (SDL_PenInputFlags)bg_in_uv(aTHX_ ST(1), "SDL3::PenMotionEvent::pen_state");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->pen_state)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenMotionEvent *self;
    PPCODE:
	self = (struct SDL_PenMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenMotionEvent", "SDL3::PenMotionEvent::x");
	if (items > 1) {
		self->x = (float)bg_in_nv(aTHX_ ST(1), "SDL3::PenMotionEvent::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenMotionEvent *self;
    PPCODE:
	self = (struct SDL_PenMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenMotionEvent", "SDL3::PenMotionEvent::y");
	if (items > 1) {
		self->y = (float)bg_in_nv(aTHX_ ST(1), "SDL3::PenMotionEvent::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->y)));
	XSRETURN(1);

void
device_type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenMotionEvent *self;
    PPCODE:
	self = (struct SDL_PenMotionEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenMotionEvent", "SDL3::PenMotionEvent::device_type");
	if (items > 1) {
		self->device_type = (SDL_PenDeviceType)bg_in_iv(aTHX_ ST(1), "SDL3::PenMotionEvent::device_type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->device_type)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::PenTouchEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_PenTouchEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_PenTouchEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenTouchEvent *self;
    PPCODE:
	self = (struct SDL_PenTouchEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenTouchEvent", "SDL3::PenTouchEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::PenTouchEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenTouchEvent *self;
    PPCODE:
	self = (struct SDL_PenTouchEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenTouchEvent", "SDL3::PenTouchEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::PenTouchEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenTouchEvent *self;
    PPCODE:
	self = (struct SDL_PenTouchEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenTouchEvent", "SDL3::PenTouchEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::PenTouchEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenTouchEvent *self;
    PPCODE:
	self = (struct SDL_PenTouchEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenTouchEvent", "SDL3::PenTouchEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::PenTouchEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenTouchEvent *self;
    PPCODE:
	self = (struct SDL_PenTouchEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenTouchEvent", "SDL3::PenTouchEvent::which");
	if (items > 1) {
		self->which = (SDL_PenID)bg_in_uv(aTHX_ ST(1), "SDL3::PenTouchEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
pen_state(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenTouchEvent *self;
    PPCODE:
	self = (struct SDL_PenTouchEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenTouchEvent", "SDL3::PenTouchEvent::pen_state");
	if (items > 1) {
		self->pen_state = (SDL_PenInputFlags)bg_in_uv(aTHX_ ST(1), "SDL3::PenTouchEvent::pen_state");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->pen_state)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenTouchEvent *self;
    PPCODE:
	self = (struct SDL_PenTouchEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenTouchEvent", "SDL3::PenTouchEvent::x");
	if (items > 1) {
		self->x = (float)bg_in_nv(aTHX_ ST(1), "SDL3::PenTouchEvent::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenTouchEvent *self;
    PPCODE:
	self = (struct SDL_PenTouchEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenTouchEvent", "SDL3::PenTouchEvent::y");
	if (items > 1) {
		self->y = (float)bg_in_nv(aTHX_ ST(1), "SDL3::PenTouchEvent::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->y)));
	XSRETURN(1);

void
eraser(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenTouchEvent *self;
    PPCODE:
	self = (struct SDL_PenTouchEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenTouchEvent", "SDL3::PenTouchEvent::eraser");
	if (items > 1) {
		self->eraser = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->eraser)));
	XSRETURN(1);

void
down(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenTouchEvent *self;
    PPCODE:
	self = (struct SDL_PenTouchEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenTouchEvent", "SDL3::PenTouchEvent::down");
	if (items > 1) {
		self->down = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->down)));
	XSRETURN(1);

void
device_type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenTouchEvent *self;
    PPCODE:
	self = (struct SDL_PenTouchEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenTouchEvent", "SDL3::PenTouchEvent::device_type");
	if (items > 1) {
		self->device_type = (SDL_PenDeviceType)bg_in_iv(aTHX_ ST(1), "SDL3::PenTouchEvent::device_type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->device_type)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::PenButtonEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_PenButtonEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_PenButtonEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenButtonEvent *self;
    PPCODE:
	self = (struct SDL_PenButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenButtonEvent", "SDL3::PenButtonEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::PenButtonEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenButtonEvent *self;
    PPCODE:
	self = (struct SDL_PenButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenButtonEvent", "SDL3::PenButtonEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::PenButtonEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenButtonEvent *self;
    PPCODE:
	self = (struct SDL_PenButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenButtonEvent", "SDL3::PenButtonEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::PenButtonEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenButtonEvent *self;
    PPCODE:
	self = (struct SDL_PenButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenButtonEvent", "SDL3::PenButtonEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::PenButtonEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenButtonEvent *self;
    PPCODE:
	self = (struct SDL_PenButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenButtonEvent", "SDL3::PenButtonEvent::which");
	if (items > 1) {
		self->which = (SDL_PenID)bg_in_uv(aTHX_ ST(1), "SDL3::PenButtonEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
pen_state(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenButtonEvent *self;
    PPCODE:
	self = (struct SDL_PenButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenButtonEvent", "SDL3::PenButtonEvent::pen_state");
	if (items > 1) {
		self->pen_state = (SDL_PenInputFlags)bg_in_uv(aTHX_ ST(1), "SDL3::PenButtonEvent::pen_state");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->pen_state)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenButtonEvent *self;
    PPCODE:
	self = (struct SDL_PenButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenButtonEvent", "SDL3::PenButtonEvent::x");
	if (items > 1) {
		self->x = (float)bg_in_nv(aTHX_ ST(1), "SDL3::PenButtonEvent::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenButtonEvent *self;
    PPCODE:
	self = (struct SDL_PenButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenButtonEvent", "SDL3::PenButtonEvent::y");
	if (items > 1) {
		self->y = (float)bg_in_nv(aTHX_ ST(1), "SDL3::PenButtonEvent::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->y)));
	XSRETURN(1);

void
button(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenButtonEvent *self;
    PPCODE:
	self = (struct SDL_PenButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenButtonEvent", "SDL3::PenButtonEvent::button");
	if (items > 1) {
		self->button = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::PenButtonEvent::button");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->button)));
	XSRETURN(1);

void
down(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenButtonEvent *self;
    PPCODE:
	self = (struct SDL_PenButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenButtonEvent", "SDL3::PenButtonEvent::down");
	if (items > 1) {
		self->down = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->down)));
	XSRETURN(1);

void
device_type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenButtonEvent *self;
    PPCODE:
	self = (struct SDL_PenButtonEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenButtonEvent", "SDL3::PenButtonEvent::device_type");
	if (items > 1) {
		self->device_type = (SDL_PenDeviceType)bg_in_iv(aTHX_ ST(1), "SDL3::PenButtonEvent::device_type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->device_type)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::PenAxisEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_PenAxisEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_PenAxisEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenAxisEvent *self;
    PPCODE:
	self = (struct SDL_PenAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenAxisEvent", "SDL3::PenAxisEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::PenAxisEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenAxisEvent *self;
    PPCODE:
	self = (struct SDL_PenAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenAxisEvent", "SDL3::PenAxisEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::PenAxisEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenAxisEvent *self;
    PPCODE:
	self = (struct SDL_PenAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenAxisEvent", "SDL3::PenAxisEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::PenAxisEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenAxisEvent *self;
    PPCODE:
	self = (struct SDL_PenAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenAxisEvent", "SDL3::PenAxisEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::PenAxisEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenAxisEvent *self;
    PPCODE:
	self = (struct SDL_PenAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenAxisEvent", "SDL3::PenAxisEvent::which");
	if (items > 1) {
		self->which = (SDL_PenID)bg_in_uv(aTHX_ ST(1), "SDL3::PenAxisEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
pen_state(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenAxisEvent *self;
    PPCODE:
	self = (struct SDL_PenAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenAxisEvent", "SDL3::PenAxisEvent::pen_state");
	if (items > 1) {
		self->pen_state = (SDL_PenInputFlags)bg_in_uv(aTHX_ ST(1), "SDL3::PenAxisEvent::pen_state");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->pen_state)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenAxisEvent *self;
    PPCODE:
	self = (struct SDL_PenAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenAxisEvent", "SDL3::PenAxisEvent::x");
	if (items > 1) {
		self->x = (float)bg_in_nv(aTHX_ ST(1), "SDL3::PenAxisEvent::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenAxisEvent *self;
    PPCODE:
	self = (struct SDL_PenAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenAxisEvent", "SDL3::PenAxisEvent::y");
	if (items > 1) {
		self->y = (float)bg_in_nv(aTHX_ ST(1), "SDL3::PenAxisEvent::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->y)));
	XSRETURN(1);

void
axis(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenAxisEvent *self;
    PPCODE:
	self = (struct SDL_PenAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenAxisEvent", "SDL3::PenAxisEvent::axis");
	if (items > 1) {
		self->axis = (SDL_PenAxis)bg_in_iv(aTHX_ ST(1), "SDL3::PenAxisEvent::axis");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->axis)));
	XSRETURN(1);

void
value(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenAxisEvent *self;
    PPCODE:
	self = (struct SDL_PenAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenAxisEvent", "SDL3::PenAxisEvent::value");
	if (items > 1) {
		self->value = (float)bg_in_nv(aTHX_ ST(1), "SDL3::PenAxisEvent::value");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->value)));
	XSRETURN(1);

void
device_type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PenAxisEvent *self;
    PPCODE:
	self = (struct SDL_PenAxisEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PenAxisEvent", "SDL3::PenAxisEvent::device_type");
	if (items > 1) {
		self->device_type = (SDL_PenDeviceType)bg_in_iv(aTHX_ ST(1), "SDL3::PenAxisEvent::device_type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->device_type)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::DropEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_DropEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_DropEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DropEvent *self;
    PPCODE:
	self = (struct SDL_DropEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DropEvent", "SDL3::DropEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::DropEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DropEvent *self;
    PPCODE:
	self = (struct SDL_DropEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DropEvent", "SDL3::DropEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::DropEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DropEvent *self;
    PPCODE:
	self = (struct SDL_DropEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DropEvent", "SDL3::DropEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::DropEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DropEvent *self;
    PPCODE:
	self = (struct SDL_DropEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DropEvent", "SDL3::DropEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::DropEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DropEvent *self;
    PPCODE:
	self = (struct SDL_DropEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DropEvent", "SDL3::DropEvent::x");
	if (items > 1) {
		self->x = (float)bg_in_nv(aTHX_ ST(1), "SDL3::DropEvent::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DropEvent *self;
    PPCODE:
	self = (struct SDL_DropEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DropEvent", "SDL3::DropEvent::y");
	if (items > 1) {
		self->y = (float)bg_in_nv(aTHX_ ST(1), "SDL3::DropEvent::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->y)));
	XSRETURN(1);

void
source(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DropEvent *self;
    PPCODE:
	self = (struct SDL_DropEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DropEvent", "SDL3::DropEvent::source");
	if (items > 1) {
		self->source = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::DropEvent::source");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->source)));
	XSRETURN(1);

void
data(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DropEvent *self;
    PPCODE:
	self = (struct SDL_DropEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DropEvent", "SDL3::DropEvent::data");
	if (items > 1) {
		self->data = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::DropEvent::data");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->data)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::ClipboardEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_ClipboardEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_ClipboardEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_ClipboardEvent *self;
    PPCODE:
	self = (struct SDL_ClipboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::ClipboardEvent", "SDL3::ClipboardEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::ClipboardEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_ClipboardEvent *self;
    PPCODE:
	self = (struct SDL_ClipboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::ClipboardEvent", "SDL3::ClipboardEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::ClipboardEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_ClipboardEvent *self;
    PPCODE:
	self = (struct SDL_ClipboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::ClipboardEvent", "SDL3::ClipboardEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::ClipboardEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
owner(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_ClipboardEvent *self;
    PPCODE:
	self = (struct SDL_ClipboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::ClipboardEvent", "SDL3::ClipboardEvent::owner");
	if (items > 1) {
		self->owner = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->owner)));
	XSRETURN(1);

void
num_mime_types(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_ClipboardEvent *self;
    PPCODE:
	self = (struct SDL_ClipboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::ClipboardEvent", "SDL3::ClipboardEvent::num_mime_types");
	if (items > 1) {
		self->num_mime_types = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::ClipboardEvent::num_mime_types");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->num_mime_types)));
	XSRETURN(1);

void
mime_types(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_ClipboardEvent *self;
    PPCODE:
	self = (struct SDL_ClipboardEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::ClipboardEvent", "SDL3::ClipboardEvent::mime_types");
	if (items > 1) {
		self->mime_types = (const char **)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::ClipboardEvent::mime_types");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->mime_types), "SDL3::Pointer"));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::SensorEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_SensorEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_SensorEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_SensorEvent *self;
    PPCODE:
	self = (struct SDL_SensorEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::SensorEvent", "SDL3::SensorEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::SensorEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_SensorEvent *self;
    PPCODE:
	self = (struct SDL_SensorEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::SensorEvent", "SDL3::SensorEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::SensorEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_SensorEvent *self;
    PPCODE:
	self = (struct SDL_SensorEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::SensorEvent", "SDL3::SensorEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::SensorEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
which(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_SensorEvent *self;
    PPCODE:
	self = (struct SDL_SensorEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::SensorEvent", "SDL3::SensorEvent::which");
	if (items > 1) {
		self->which = (SDL_SensorID)bg_in_uv(aTHX_ ST(1), "SDL3::SensorEvent::which");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->which)));
	XSRETURN(1);

void
data(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_SensorEvent *self;
	Size_t bg_i;
    PPCODE:
	self = (struct SDL_SensorEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::SensorEvent", "SDL3::SensorEvent::data");
	if (items > 1) {
		if (items - 1 != 6) croak("%s expects 6 values, got %d", "SDL3::SensorEvent::data", (int)(items - 1));
		for (bg_i = 0; bg_i < 6; bg_i++) self->data[bg_i] = (float)bg_in_nv(aTHX_ ST(1 + bg_i), "SDL3::SensorEvent::data");
		XSRETURN(1);
	}
	EXTEND(SP, 6);
	for (bg_i = 0; bg_i < 6; bg_i++) mPUSHs(newSVnv((NV)(self->data[bg_i])));
	XSRETURN(6);

void
sensor_timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_SensorEvent *self;
    PPCODE:
	self = (struct SDL_SensorEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::SensorEvent", "SDL3::SensorEvent::sensor_timestamp");
	if (items > 1) {
		self->sensor_timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::SensorEvent::sensor_timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->sensor_timestamp)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::QuitEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_QuitEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_QuitEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_QuitEvent *self;
    PPCODE:
	self = (struct SDL_QuitEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::QuitEvent", "SDL3::QuitEvent::type");
	if (items > 1) {
		self->type = (SDL_EventType)bg_in_iv(aTHX_ ST(1), "SDL3::QuitEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_QuitEvent *self;
    PPCODE:
	self = (struct SDL_QuitEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::QuitEvent", "SDL3::QuitEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::QuitEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_QuitEvent *self;
    PPCODE:
	self = (struct SDL_QuitEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::QuitEvent", "SDL3::QuitEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::QuitEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::UserEvent

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_UserEvent), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_UserEvent)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_UserEvent *self;
    PPCODE:
	self = (struct SDL_UserEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::UserEvent", "SDL3::UserEvent::type");
	if (items > 1) {
		self->type = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::UserEvent::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->type)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_UserEvent *self;
    PPCODE:
	self = (struct SDL_UserEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::UserEvent", "SDL3::UserEvent::reserved");
	if (items > 1) {
		self->reserved = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::UserEvent::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->reserved)));
	XSRETURN(1);

void
timestamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_UserEvent *self;
    PPCODE:
	self = (struct SDL_UserEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::UserEvent", "SDL3::UserEvent::timestamp");
	if (items > 1) {
		self->timestamp = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::UserEvent::timestamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->timestamp)));
	XSRETURN(1);

void
windowID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_UserEvent *self;
    PPCODE:
	self = (struct SDL_UserEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::UserEvent", "SDL3::UserEvent::windowID");
	if (items > 1) {
		self->windowID = (SDL_WindowID)bg_in_uv(aTHX_ ST(1), "SDL3::UserEvent::windowID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->windowID)));
	XSRETURN(1);

void
code(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_UserEvent *self;
    PPCODE:
	self = (struct SDL_UserEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::UserEvent", "SDL3::UserEvent::code");
	if (items > 1) {
		self->code = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::UserEvent::code");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->code)));
	XSRETURN(1);

void
data1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_UserEvent *self;
    PPCODE:
	self = (struct SDL_UserEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::UserEvent", "SDL3::UserEvent::data1");
	if (items > 1) {
		self->data1 = (void *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::UserEvent::data1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->data1), "SDL3::Pointer"));
	XSRETURN(1);

void
data2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_UserEvent *self;
    PPCODE:
	self = (struct SDL_UserEvent *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::UserEvent", "SDL3::UserEvent::data2");
	if (items > 1) {
		self->data2 = (void *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::UserEvent::data2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->data2), "SDL3::Pointer"));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::Event

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(union SDL_Event), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(union SDL_Event)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::type");
	if (items > 1) {
		self->type = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::Event::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->type)));
	XSRETURN(1);

void
common(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::common");
	if (items > 1) {
		self->common = *(struct SDL_CommonEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::CommonEvent", "SDL3::Event::common");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->common), "SDL3::CommonEvent"));
	XSRETURN(1);

void
display(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::display");
	if (items > 1) {
		self->display = *(struct SDL_DisplayEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::DisplayEvent", "SDL3::Event::display");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->display), "SDL3::DisplayEvent"));
	XSRETURN(1);

void
window(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::window");
	if (items > 1) {
		self->window = *(struct SDL_WindowEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::WindowEvent", "SDL3::Event::window");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->window), "SDL3::WindowEvent"));
	XSRETURN(1);

void
kdevice(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::kdevice");
	if (items > 1) {
		self->kdevice = *(struct SDL_KeyboardDeviceEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::KeyboardDeviceEvent", "SDL3::Event::kdevice");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->kdevice), "SDL3::KeyboardDeviceEvent"));
	XSRETURN(1);

void
key(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::key");
	if (items > 1) {
		self->key = *(struct SDL_KeyboardEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::KeyboardEvent", "SDL3::Event::key");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->key), "SDL3::KeyboardEvent"));
	XSRETURN(1);

void
edit(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::edit");
	if (items > 1) {
		self->edit = *(struct SDL_TextEditingEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::TextEditingEvent", "SDL3::Event::edit");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->edit), "SDL3::TextEditingEvent"));
	XSRETURN(1);

void
edit_candidates(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::edit_candidates");
	if (items > 1) {
		self->edit_candidates = *(struct SDL_TextEditingCandidatesEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::TextEditingCandidatesEvent", "SDL3::Event::edit_candidates");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->edit_candidates), "SDL3::TextEditingCandidatesEvent"));
	XSRETURN(1);

void
text(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::text");
	if (items > 1) {
		self->text = *(struct SDL_TextInputEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::TextInputEvent", "SDL3::Event::text");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->text), "SDL3::TextInputEvent"));
	XSRETURN(1);

void
mdevice(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::mdevice");
	if (items > 1) {
		self->mdevice = *(struct SDL_MouseDeviceEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::MouseDeviceEvent", "SDL3::Event::mdevice");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->mdevice), "SDL3::MouseDeviceEvent"));
	XSRETURN(1);

void
motion(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::motion");
	if (items > 1) {
		self->motion = *(struct SDL_MouseMotionEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::MouseMotionEvent", "SDL3::Event::motion");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->motion), "SDL3::MouseMotionEvent"));
	XSRETURN(1);

void
button(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::button");
	if (items > 1) {
		self->button = *(struct SDL_MouseButtonEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::MouseButtonEvent", "SDL3::Event::button");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->button), "SDL3::MouseButtonEvent"));
	XSRETURN(1);

void
wheel(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::wheel");
	if (items > 1) {
		self->wheel = *(struct SDL_MouseWheelEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::MouseWheelEvent", "SDL3::Event::wheel");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->wheel), "SDL3::MouseWheelEvent"));
	XSRETURN(1);

void
jdevice(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::jdevice");
	if (items > 1) {
		self->jdevice = *(struct SDL_JoyDeviceEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::JoyDeviceEvent", "SDL3::Event::jdevice");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->jdevice), "SDL3::JoyDeviceEvent"));
	XSRETURN(1);

void
jaxis(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::jaxis");
	if (items > 1) {
		self->jaxis = *(struct SDL_JoyAxisEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::JoyAxisEvent", "SDL3::Event::jaxis");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->jaxis), "SDL3::JoyAxisEvent"));
	XSRETURN(1);

void
jball(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::jball");
	if (items > 1) {
		self->jball = *(struct SDL_JoyBallEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::JoyBallEvent", "SDL3::Event::jball");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->jball), "SDL3::JoyBallEvent"));
	XSRETURN(1);

void
jhat(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::jhat");
	if (items > 1) {
		self->jhat = *(struct SDL_JoyHatEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::JoyHatEvent", "SDL3::Event::jhat");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->jhat), "SDL3::JoyHatEvent"));
	XSRETURN(1);

void
jbutton(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::jbutton");
	if (items > 1) {
		self->jbutton = *(struct SDL_JoyButtonEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::JoyButtonEvent", "SDL3::Event::jbutton");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->jbutton), "SDL3::JoyButtonEvent"));
	XSRETURN(1);

void
jbattery(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::jbattery");
	if (items > 1) {
		self->jbattery = *(struct SDL_JoyBatteryEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::JoyBatteryEvent", "SDL3::Event::jbattery");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->jbattery), "SDL3::JoyBatteryEvent"));
	XSRETURN(1);

void
gdevice(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::gdevice");
	if (items > 1) {
		self->gdevice = *(struct SDL_GamepadDeviceEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GamepadDeviceEvent", "SDL3::Event::gdevice");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->gdevice), "SDL3::GamepadDeviceEvent"));
	XSRETURN(1);

void
gaxis(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::gaxis");
	if (items > 1) {
		self->gaxis = *(struct SDL_GamepadAxisEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GamepadAxisEvent", "SDL3::Event::gaxis");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->gaxis), "SDL3::GamepadAxisEvent"));
	XSRETURN(1);

void
gbutton(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::gbutton");
	if (items > 1) {
		self->gbutton = *(struct SDL_GamepadButtonEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GamepadButtonEvent", "SDL3::Event::gbutton");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->gbutton), "SDL3::GamepadButtonEvent"));
	XSRETURN(1);

void
gtouchpad(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::gtouchpad");
	if (items > 1) {
		self->gtouchpad = *(struct SDL_GamepadTouchpadEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GamepadTouchpadEvent", "SDL3::Event::gtouchpad");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->gtouchpad), "SDL3::GamepadTouchpadEvent"));
	XSRETURN(1);

void
gsensor(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::gsensor");
	if (items > 1) {
		self->gsensor = *(struct SDL_GamepadSensorEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GamepadSensorEvent", "SDL3::Event::gsensor");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->gsensor), "SDL3::GamepadSensorEvent"));
	XSRETURN(1);

void
adevice(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::adevice");
	if (items > 1) {
		self->adevice = *(struct SDL_AudioDeviceEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::AudioDeviceEvent", "SDL3::Event::adevice");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->adevice), "SDL3::AudioDeviceEvent"));
	XSRETURN(1);

void
cdevice(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::cdevice");
	if (items > 1) {
		self->cdevice = *(struct SDL_CameraDeviceEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::CameraDeviceEvent", "SDL3::Event::cdevice");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->cdevice), "SDL3::CameraDeviceEvent"));
	XSRETURN(1);

void
sensor(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::sensor");
	if (items > 1) {
		self->sensor = *(struct SDL_SensorEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::SensorEvent", "SDL3::Event::sensor");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->sensor), "SDL3::SensorEvent"));
	XSRETURN(1);

void
quit(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::quit");
	if (items > 1) {
		self->quit = *(struct SDL_QuitEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::QuitEvent", "SDL3::Event::quit");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->quit), "SDL3::QuitEvent"));
	XSRETURN(1);

void
user(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::user");
	if (items > 1) {
		self->user = *(struct SDL_UserEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::UserEvent", "SDL3::Event::user");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->user), "SDL3::UserEvent"));
	XSRETURN(1);

void
tfinger(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::tfinger");
	if (items > 1) {
		self->tfinger = *(struct SDL_TouchFingerEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::TouchFingerEvent", "SDL3::Event::tfinger");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->tfinger), "SDL3::TouchFingerEvent"));
	XSRETURN(1);

void
pinch(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::pinch");
	if (items > 1) {
		self->pinch = *(struct SDL_PinchFingerEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::PinchFingerEvent", "SDL3::Event::pinch");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->pinch), "SDL3::PinchFingerEvent"));
	XSRETURN(1);

void
pproximity(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::pproximity");
	if (items > 1) {
		self->pproximity = *(struct SDL_PenProximityEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::PenProximityEvent", "SDL3::Event::pproximity");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->pproximity), "SDL3::PenProximityEvent"));
	XSRETURN(1);

void
ptouch(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::ptouch");
	if (items > 1) {
		self->ptouch = *(struct SDL_PenTouchEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::PenTouchEvent", "SDL3::Event::ptouch");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->ptouch), "SDL3::PenTouchEvent"));
	XSRETURN(1);

void
pmotion(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::pmotion");
	if (items > 1) {
		self->pmotion = *(struct SDL_PenMotionEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::PenMotionEvent", "SDL3::Event::pmotion");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->pmotion), "SDL3::PenMotionEvent"));
	XSRETURN(1);

void
pbutton(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::pbutton");
	if (items > 1) {
		self->pbutton = *(struct SDL_PenButtonEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::PenButtonEvent", "SDL3::Event::pbutton");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->pbutton), "SDL3::PenButtonEvent"));
	XSRETURN(1);

void
paxis(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::paxis");
	if (items > 1) {
		self->paxis = *(struct SDL_PenAxisEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::PenAxisEvent", "SDL3::Event::paxis");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->paxis), "SDL3::PenAxisEvent"));
	XSRETURN(1);

void
render(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::render");
	if (items > 1) {
		self->render = *(struct SDL_RenderEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::RenderEvent", "SDL3::Event::render");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->render), "SDL3::RenderEvent"));
	XSRETURN(1);

void
drop(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::drop");
	if (items > 1) {
		self->drop = *(struct SDL_DropEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::DropEvent", "SDL3::Event::drop");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->drop), "SDL3::DropEvent"));
	XSRETURN(1);

void
clipboard(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::clipboard");
	if (items > 1) {
		self->clipboard = *(struct SDL_ClipboardEvent *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::ClipboardEvent", "SDL3::Event::clipboard");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->clipboard), "SDL3::ClipboardEvent"));
	XSRETURN(1);

void
padding(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_Event *self;
	Size_t bg_i;
    PPCODE:
	self = (union SDL_Event *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Event", "SDL3::Event::padding");
	if (items > 1) {
		if (items - 1 != 128) croak("%s expects 128 values, got %d", "SDL3::Event::padding", (int)(items - 1));
		for (bg_i = 0; bg_i < 128; bg_i++) self->padding[bg_i] = (Uint8)bg_in_uv(aTHX_ ST(1 + bg_i), "SDL3::Event::padding");
		XSRETURN(1);
	}
	EXTEND(SP, 128);
	for (bg_i = 0; bg_i < 128; bg_i++) mPUSHs(newSVuv((UV)(self->padding[bg_i])));
	XSRETURN(128);
