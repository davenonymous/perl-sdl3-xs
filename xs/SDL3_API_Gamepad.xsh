MODULE = SDL3  PACKAGE = SDL3::API::Gamepad

void
SDL_AddGamepadMapping(sv_mapping)
	SV *sv_mapping
    PREINIT:
	const char * c_mapping;
	int c_bg_ret;
    PPCODE:
	c_mapping = (const char *)bg_in_string(aTHX_ sv_mapping, "SDL_AddGamepadMapping(mapping)");
	c_bg_ret = SDL_AddGamepadMapping(c_mapping);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_AddGamepadMappingsFromIO(sv_src, sv_closeio)
	SV *sv_src
	SV *sv_closeio
    PREINIT:
	SDL_IOStream * c_src;
	_Bool c_closeio;
	int c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_AddGamepadMappingsFromIO(src)");
	c_closeio = (_Bool)SvTRUE(sv_closeio);
	c_bg_ret = SDL_AddGamepadMappingsFromIO(c_src, c_closeio);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_AddGamepadMappingsFromFile(sv_file)
	SV *sv_file
    PREINIT:
	const char * c_file;
	int c_bg_ret;
    PPCODE:
	c_file = (const char *)bg_in_string(aTHX_ sv_file, "SDL_AddGamepadMappingsFromFile(file)");
	c_bg_ret = SDL_AddGamepadMappingsFromFile(c_file);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReloadGamepadMappings()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_ReloadGamepadMappings();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadMappings(sv_count)
	SV *sv_count
    PREINIT:
	int c_count; int * p_count; SV *t_count;
	char ** c_bg_ret;
    PPCODE:
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetGamepadMappings(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetGamepadMappings(count)");
	c_bg_ret = SDL_GetGamepadMappings(p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetGamepadMappingForGUID(sv_guid)
	SV *sv_guid
    PREINIT:
	struct SDL_GUID c_guid;
	char * c_bg_ret;
    PPCODE:
	c_guid = *(struct SDL_GUID *)bg_in_record_value_ptr(aTHX_ sv_guid, "SDL3::GUID", "SDL_GetGamepadMappingForGUID(guid)");
	c_bg_ret = SDL_GetGamepadMappingForGUID(c_guid);
	ST(0) = sv_2mortal(bg_out_owned_string(aTHX_ (char *)(c_bg_ret), (void (*)(void *))SDL_free));
	XSRETURN(1);

void
SDL_GetGamepadMapping(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	char * c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadMapping(gamepad)");
	c_bg_ret = SDL_GetGamepadMapping(c_gamepad);
	ST(0) = sv_2mortal(bg_out_owned_string(aTHX_ (char *)(c_bg_ret), (void (*)(void *))SDL_free));
	XSRETURN(1);

void
SDL_SetGamepadMapping(sv_instance_id, sv_mapping)
	SV *sv_instance_id
	SV *sv_mapping
    PREINIT:
	SDL_JoystickID c_instance_id;
	const char * c_mapping;
	_Bool c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_SetGamepadMapping(instance_id)");
	c_mapping = (const char *)bg_in_string(aTHX_ sv_mapping, "SDL_SetGamepadMapping(mapping)");
	c_bg_ret = SDL_SetGamepadMapping(c_instance_id, c_mapping);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasGamepad()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasGamepad();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepads(sv_count)
	SV *sv_count
    PREINIT:
	int c_count; int * p_count; SV *t_count;
	SDL_JoystickID * c_bg_ret;
    PPCODE:
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetGamepads(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetGamepads(count)");
	c_bg_ret = SDL_GetGamepads(p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_IsGamepad(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	_Bool c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_IsGamepad(instance_id)");
	c_bg_ret = SDL_IsGamepad(c_instance_id);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadNameForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	const char * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetGamepadNameForID(instance_id)");
	c_bg_ret = SDL_GetGamepadNameForID(c_instance_id);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadPathForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	const char * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetGamepadPathForID(instance_id)");
	c_bg_ret = SDL_GetGamepadPathForID(c_instance_id);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadPlayerIndexForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	int c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetGamepadPlayerIndexForID(instance_id)");
	c_bg_ret = SDL_GetGamepadPlayerIndexForID(c_instance_id);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadGUIDForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	struct SDL_GUID c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetGamepadGUIDForID(instance_id)");
	c_bg_ret = SDL_GetGamepadGUIDForID(c_instance_id);
	ST(0) = sv_2mortal(bg_out_record_copy(aTHX_ (const void *)&(c_bg_ret), sizeof(struct SDL_GUID), "SDL3::GUID"));
	XSRETURN(1);

void
SDL_GetGamepadVendorForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	Uint16 c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetGamepadVendorForID(instance_id)");
	c_bg_ret = SDL_GetGamepadVendorForID(c_instance_id);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadProductForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	Uint16 c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetGamepadProductForID(instance_id)");
	c_bg_ret = SDL_GetGamepadProductForID(c_instance_id);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadProductVersionForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	Uint16 c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetGamepadProductVersionForID(instance_id)");
	c_bg_ret = SDL_GetGamepadProductVersionForID(c_instance_id);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadTypeForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	SDL_GamepadType c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetGamepadTypeForID(instance_id)");
	c_bg_ret = SDL_GetGamepadTypeForID(c_instance_id);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRealGamepadTypeForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	SDL_GamepadType c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetRealGamepadTypeForID(instance_id)");
	c_bg_ret = SDL_GetRealGamepadTypeForID(c_instance_id);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadMappingForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	char * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetGamepadMappingForID(instance_id)");
	c_bg_ret = SDL_GetGamepadMappingForID(c_instance_id);
	ST(0) = sv_2mortal(bg_out_owned_string(aTHX_ (char *)(c_bg_ret), (void (*)(void *))SDL_free));
	XSRETURN(1);

void
SDL_OpenGamepad(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	SDL_Gamepad * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_OpenGamepad(instance_id)");
	c_bg_ret = SDL_OpenGamepad(c_instance_id);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Gamepad"));
	XSRETURN(1);

void
SDL_GetGamepadFromID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	SDL_Gamepad * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetGamepadFromID(instance_id)");
	c_bg_ret = SDL_GetGamepadFromID(c_instance_id);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Gamepad"));
	XSRETURN(1);

void
SDL_GetGamepadFromPlayerIndex(sv_player_index)
	SV *sv_player_index
    PREINIT:
	int c_player_index;
	SDL_Gamepad * c_bg_ret;
    PPCODE:
	c_player_index = (int)bg_in_iv(aTHX_ sv_player_index, "SDL_GetGamepadFromPlayerIndex(player_index)");
	c_bg_ret = SDL_GetGamepadFromPlayerIndex(c_player_index);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Gamepad"));
	XSRETURN(1);

void
SDL_GetGamepadProperties(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadProperties(gamepad)");
	c_bg_ret = SDL_GetGamepadProperties(c_gamepad);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadID(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_JoystickID c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadID(gamepad)");
	c_bg_ret = SDL_GetGamepadID(c_gamepad);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadName(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	const char * c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadName(gamepad)");
	c_bg_ret = SDL_GetGamepadName(c_gamepad);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadPath(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	const char * c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadPath(gamepad)");
	c_bg_ret = SDL_GetGamepadPath(c_gamepad);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadType(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_GamepadType c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadType(gamepad)");
	c_bg_ret = SDL_GetGamepadType(c_gamepad);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRealGamepadType(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_GamepadType c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetRealGamepadType(gamepad)");
	c_bg_ret = SDL_GetRealGamepadType(c_gamepad);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadPlayerIndex(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	int c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadPlayerIndex(gamepad)");
	c_bg_ret = SDL_GetGamepadPlayerIndex(c_gamepad);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetGamepadPlayerIndex(sv_gamepad, sv_player_index)
	SV *sv_gamepad
	SV *sv_player_index
    PREINIT:
	SDL_Gamepad * c_gamepad;
	int c_player_index;
	_Bool c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_SetGamepadPlayerIndex(gamepad)");
	c_player_index = (int)bg_in_iv(aTHX_ sv_player_index, "SDL_SetGamepadPlayerIndex(player_index)");
	c_bg_ret = SDL_SetGamepadPlayerIndex(c_gamepad, c_player_index);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadVendor(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	Uint16 c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadVendor(gamepad)");
	c_bg_ret = SDL_GetGamepadVendor(c_gamepad);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadProduct(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	Uint16 c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadProduct(gamepad)");
	c_bg_ret = SDL_GetGamepadProduct(c_gamepad);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadProductVersion(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	Uint16 c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadProductVersion(gamepad)");
	c_bg_ret = SDL_GetGamepadProductVersion(c_gamepad);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadFirmwareVersion(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	Uint16 c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadFirmwareVersion(gamepad)");
	c_bg_ret = SDL_GetGamepadFirmwareVersion(c_gamepad);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadSerial(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	const char * c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadSerial(gamepad)");
	c_bg_ret = SDL_GetGamepadSerial(c_gamepad);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadSteamHandle(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	Uint64 c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadSteamHandle(gamepad)");
	c_bg_ret = SDL_GetGamepadSteamHandle(c_gamepad);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadConnectionState(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_JoystickConnectionState c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadConnectionState(gamepad)");
	c_bg_ret = SDL_GetGamepadConnectionState(c_gamepad);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadPowerInfo(sv_gamepad, sv_percent)
	SV *sv_gamepad
	SV *sv_percent
    PREINIT:
	SDL_Gamepad * c_gamepad;
	int c_percent; int * p_percent; SV *t_percent;
	SDL_PowerState c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadPowerInfo(gamepad)");
	t_percent = bg_outref_target(aTHX_ sv_percent);
	c_percent = (t_percent && SvOK(t_percent)) ? (int)bg_in_iv(aTHX_ t_percent, "SDL_GetGamepadPowerInfo(percent)") : (int)0;
	p_percent = t_percent ? &c_percent : (int *)bg_outref_raw(aTHX_ sv_percent, "SDL_GetGamepadPowerInfo(percent)");
	c_bg_ret = SDL_GetGamepadPowerInfo(c_gamepad, p_percent);
	if (t_percent) sv_setsv(t_percent, sv_2mortal(newSViv((IV)(c_percent))));
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GamepadConnected(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	_Bool c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GamepadConnected(gamepad)");
	c_bg_ret = SDL_GamepadConnected(c_gamepad);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadJoystick(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_Joystick * c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadJoystick(gamepad)");
	c_bg_ret = SDL_GetGamepadJoystick(c_gamepad);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Joystick"));
	XSRETURN(1);

void
SDL_SetGamepadEventsEnabled(sv_enabled)
	SV *sv_enabled
    PREINIT:
	_Bool c_enabled;
    PPCODE:
	c_enabled = (_Bool)SvTRUE(sv_enabled);
	SDL_SetGamepadEventsEnabled(c_enabled);
	XSRETURN(0);

void
SDL_GamepadEventsEnabled()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GamepadEventsEnabled();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadBindings(sv_gamepad, sv_count)
	SV *sv_gamepad
	SV *sv_count
    PREINIT:
	SDL_Gamepad * c_gamepad;
	int c_count; int * p_count; SV *t_count;
	SDL_GamepadBinding ** c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadBindings(gamepad)");
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetGamepadBindings(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetGamepadBindings(count)");
	c_bg_ret = SDL_GetGamepadBindings(c_gamepad, p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_UpdateGamepads()
    PPCODE:
	SDL_UpdateGamepads();
	XSRETURN(0);

void
SDL_GetGamepadTypeFromString(sv_str)
	SV *sv_str
    PREINIT:
	const char * c_str;
	SDL_GamepadType c_bg_ret;
    PPCODE:
	c_str = (const char *)bg_in_string(aTHX_ sv_str, "SDL_GetGamepadTypeFromString(str)");
	c_bg_ret = SDL_GetGamepadTypeFromString(c_str);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadStringForType(sv_type)
	SV *sv_type
    PREINIT:
	SDL_GamepadType c_type;
	const char * c_bg_ret;
    PPCODE:
	c_type = (SDL_GamepadType)bg_in_iv(aTHX_ sv_type, "SDL_GetGamepadStringForType(type)");
	c_bg_ret = SDL_GetGamepadStringForType(c_type);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadAxisFromString(sv_str)
	SV *sv_str
    PREINIT:
	const char * c_str;
	SDL_GamepadAxis c_bg_ret;
    PPCODE:
	c_str = (const char *)bg_in_string(aTHX_ sv_str, "SDL_GetGamepadAxisFromString(str)");
	c_bg_ret = SDL_GetGamepadAxisFromString(c_str);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadStringForAxis(sv_axis)
	SV *sv_axis
    PREINIT:
	SDL_GamepadAxis c_axis;
	const char * c_bg_ret;
    PPCODE:
	c_axis = (SDL_GamepadAxis)bg_in_iv(aTHX_ sv_axis, "SDL_GetGamepadStringForAxis(axis)");
	c_bg_ret = SDL_GetGamepadStringForAxis(c_axis);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GamepadHasAxis(sv_gamepad, sv_axis)
	SV *sv_gamepad
	SV *sv_axis
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_GamepadAxis c_axis;
	_Bool c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GamepadHasAxis(gamepad)");
	c_axis = (SDL_GamepadAxis)bg_in_iv(aTHX_ sv_axis, "SDL_GamepadHasAxis(axis)");
	c_bg_ret = SDL_GamepadHasAxis(c_gamepad, c_axis);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadAxis(sv_gamepad, sv_axis)
	SV *sv_gamepad
	SV *sv_axis
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_GamepadAxis c_axis;
	Sint16 c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadAxis(gamepad)");
	c_axis = (SDL_GamepadAxis)bg_in_iv(aTHX_ sv_axis, "SDL_GetGamepadAxis(axis)");
	c_bg_ret = SDL_GetGamepadAxis(c_gamepad, c_axis);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadButtonFromString(sv_str)
	SV *sv_str
    PREINIT:
	const char * c_str;
	SDL_GamepadButton c_bg_ret;
    PPCODE:
	c_str = (const char *)bg_in_string(aTHX_ sv_str, "SDL_GetGamepadButtonFromString(str)");
	c_bg_ret = SDL_GetGamepadButtonFromString(c_str);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadStringForButton(sv_button)
	SV *sv_button
    PREINIT:
	SDL_GamepadButton c_button;
	const char * c_bg_ret;
    PPCODE:
	c_button = (SDL_GamepadButton)bg_in_iv(aTHX_ sv_button, "SDL_GetGamepadStringForButton(button)");
	c_bg_ret = SDL_GetGamepadStringForButton(c_button);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GamepadHasButton(sv_gamepad, sv_button)
	SV *sv_gamepad
	SV *sv_button
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_GamepadButton c_button;
	_Bool c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GamepadHasButton(gamepad)");
	c_button = (SDL_GamepadButton)bg_in_iv(aTHX_ sv_button, "SDL_GamepadHasButton(button)");
	c_bg_ret = SDL_GamepadHasButton(c_gamepad, c_button);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadButton(sv_gamepad, sv_button)
	SV *sv_gamepad
	SV *sv_button
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_GamepadButton c_button;
	_Bool c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadButton(gamepad)");
	c_button = (SDL_GamepadButton)bg_in_iv(aTHX_ sv_button, "SDL_GetGamepadButton(button)");
	c_bg_ret = SDL_GetGamepadButton(c_gamepad, c_button);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadButtonLabelForType(sv_type, sv_button)
	SV *sv_type
	SV *sv_button
    PREINIT:
	SDL_GamepadType c_type;
	SDL_GamepadButton c_button;
	SDL_GamepadButtonLabel c_bg_ret;
    PPCODE:
	c_type = (SDL_GamepadType)bg_in_iv(aTHX_ sv_type, "SDL_GetGamepadButtonLabelForType(type)");
	c_button = (SDL_GamepadButton)bg_in_iv(aTHX_ sv_button, "SDL_GetGamepadButtonLabelForType(button)");
	c_bg_ret = SDL_GetGamepadButtonLabelForType(c_type, c_button);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadButtonLabel(sv_gamepad, sv_button)
	SV *sv_gamepad
	SV *sv_button
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_GamepadButton c_button;
	SDL_GamepadButtonLabel c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadButtonLabel(gamepad)");
	c_button = (SDL_GamepadButton)bg_in_iv(aTHX_ sv_button, "SDL_GetGamepadButtonLabel(button)");
	c_bg_ret = SDL_GetGamepadButtonLabel(c_gamepad, c_button);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetNumGamepadTouchpads(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	int c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetNumGamepadTouchpads(gamepad)");
	c_bg_ret = SDL_GetNumGamepadTouchpads(c_gamepad);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetNumGamepadTouchpadFingers(sv_gamepad, sv_touchpad)
	SV *sv_gamepad
	SV *sv_touchpad
    PREINIT:
	SDL_Gamepad * c_gamepad;
	int c_touchpad;
	int c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetNumGamepadTouchpadFingers(gamepad)");
	c_touchpad = (int)bg_in_iv(aTHX_ sv_touchpad, "SDL_GetNumGamepadTouchpadFingers(touchpad)");
	c_bg_ret = SDL_GetNumGamepadTouchpadFingers(c_gamepad, c_touchpad);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadTouchpadFinger(sv_gamepad, sv_touchpad, sv_finger, sv_down, sv_x, sv_y, sv_pressure)
	SV *sv_gamepad
	SV *sv_touchpad
	SV *sv_finger
	SV *sv_down
	SV *sv_x
	SV *sv_y
	SV *sv_pressure
    PREINIT:
	SDL_Gamepad * c_gamepad;
	int c_touchpad;
	int c_finger;
	_Bool c_down; _Bool * p_down; SV *t_down;
	float c_x; float * p_x; SV *t_x;
	float c_y; float * p_y; SV *t_y;
	float c_pressure; float * p_pressure; SV *t_pressure;
	_Bool c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadTouchpadFinger(gamepad)");
	c_touchpad = (int)bg_in_iv(aTHX_ sv_touchpad, "SDL_GetGamepadTouchpadFinger(touchpad)");
	c_finger = (int)bg_in_iv(aTHX_ sv_finger, "SDL_GetGamepadTouchpadFinger(finger)");
	t_down = bg_outref_target(aTHX_ sv_down);
	c_down = (t_down && SvOK(t_down)) ? (_Bool)SvTRUE(t_down) : (_Bool)0;
	p_down = t_down ? &c_down : (_Bool *)bg_outref_raw(aTHX_ sv_down, "SDL_GetGamepadTouchpadFinger(down)");
	t_x = bg_outref_target(aTHX_ sv_x);
	c_x = (t_x && SvOK(t_x)) ? (float)bg_in_nv(aTHX_ t_x, "SDL_GetGamepadTouchpadFinger(x)") : (float)0;
	p_x = t_x ? &c_x : (float *)bg_outref_raw(aTHX_ sv_x, "SDL_GetGamepadTouchpadFinger(x)");
	t_y = bg_outref_target(aTHX_ sv_y);
	c_y = (t_y && SvOK(t_y)) ? (float)bg_in_nv(aTHX_ t_y, "SDL_GetGamepadTouchpadFinger(y)") : (float)0;
	p_y = t_y ? &c_y : (float *)bg_outref_raw(aTHX_ sv_y, "SDL_GetGamepadTouchpadFinger(y)");
	t_pressure = bg_outref_target(aTHX_ sv_pressure);
	c_pressure = (t_pressure && SvOK(t_pressure)) ? (float)bg_in_nv(aTHX_ t_pressure, "SDL_GetGamepadTouchpadFinger(pressure)") : (float)0;
	p_pressure = t_pressure ? &c_pressure : (float *)bg_outref_raw(aTHX_ sv_pressure, "SDL_GetGamepadTouchpadFinger(pressure)");
	c_bg_ret = SDL_GetGamepadTouchpadFinger(c_gamepad, c_touchpad, c_finger, p_down, p_x, p_y, p_pressure);
	if (t_down) sv_setsv(t_down, sv_2mortal(newSVsv(boolSV(c_down))));
	if (t_x) sv_setsv(t_x, sv_2mortal(newSVnv((NV)(c_x))));
	if (t_y) sv_setsv(t_y, sv_2mortal(newSVnv((NV)(c_y))));
	if (t_pressure) sv_setsv(t_pressure, sv_2mortal(newSVnv((NV)(c_pressure))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GamepadHasSensor(sv_gamepad, sv_type)
	SV *sv_gamepad
	SV *sv_type
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_SensorType c_type;
	_Bool c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GamepadHasSensor(gamepad)");
	c_type = (SDL_SensorType)bg_in_iv(aTHX_ sv_type, "SDL_GamepadHasSensor(type)");
	c_bg_ret = SDL_GamepadHasSensor(c_gamepad, c_type);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetGamepadSensorEnabled(sv_gamepad, sv_type, sv_enabled)
	SV *sv_gamepad
	SV *sv_type
	SV *sv_enabled
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_SensorType c_type;
	_Bool c_enabled;
	_Bool c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_SetGamepadSensorEnabled(gamepad)");
	c_type = (SDL_SensorType)bg_in_iv(aTHX_ sv_type, "SDL_SetGamepadSensorEnabled(type)");
	c_enabled = (_Bool)SvTRUE(sv_enabled);
	c_bg_ret = SDL_SetGamepadSensorEnabled(c_gamepad, c_type, c_enabled);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GamepadSensorEnabled(sv_gamepad, sv_type)
	SV *sv_gamepad
	SV *sv_type
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_SensorType c_type;
	_Bool c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GamepadSensorEnabled(gamepad)");
	c_type = (SDL_SensorType)bg_in_iv(aTHX_ sv_type, "SDL_GamepadSensorEnabled(type)");
	c_bg_ret = SDL_GamepadSensorEnabled(c_gamepad, c_type);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadSensorDataRate(sv_gamepad, sv_type)
	SV *sv_gamepad
	SV *sv_type
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_SensorType c_type;
	float c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadSensorDataRate(gamepad)");
	c_type = (SDL_SensorType)bg_in_iv(aTHX_ sv_type, "SDL_GetGamepadSensorDataRate(type)");
	c_bg_ret = SDL_GetGamepadSensorDataRate(c_gamepad, c_type);
	ST(0) = sv_2mortal(newSVnv((NV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadSensorData(sv_gamepad, sv_type, sv_data, sv_num_values)
	SV *sv_gamepad
	SV *sv_type
	SV *sv_data
	SV *sv_num_values
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_SensorType c_type;
	float c_data; float * p_data; SV *t_data;
	int c_num_values;
	_Bool c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadSensorData(gamepad)");
	c_type = (SDL_SensorType)bg_in_iv(aTHX_ sv_type, "SDL_GetGamepadSensorData(type)");
	t_data = bg_outref_target(aTHX_ sv_data);
	c_data = (t_data && SvOK(t_data)) ? (float)bg_in_nv(aTHX_ t_data, "SDL_GetGamepadSensorData(data)") : (float)0;
	p_data = t_data ? &c_data : (float *)bg_outref_raw(aTHX_ sv_data, "SDL_GetGamepadSensorData(data)");
	c_num_values = (int)bg_in_iv(aTHX_ sv_num_values, "SDL_GetGamepadSensorData(num_values)");
	c_bg_ret = SDL_GetGamepadSensorData(c_gamepad, c_type, p_data, c_num_values);
	if (t_data) sv_setsv(t_data, sv_2mortal(newSVnv((NV)(c_data))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RumbleGamepad(sv_gamepad, sv_low_frequency_rumble, sv_high_frequency_rumble, sv_duration_ms)
	SV *sv_gamepad
	SV *sv_low_frequency_rumble
	SV *sv_high_frequency_rumble
	SV *sv_duration_ms
    PREINIT:
	SDL_Gamepad * c_gamepad;
	Uint16 c_low_frequency_rumble;
	Uint16 c_high_frequency_rumble;
	Uint32 c_duration_ms;
	_Bool c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_RumbleGamepad(gamepad)");
	c_low_frequency_rumble = (Uint16)bg_in_uv(aTHX_ sv_low_frequency_rumble, "SDL_RumbleGamepad(low_frequency_rumble)");
	c_high_frequency_rumble = (Uint16)bg_in_uv(aTHX_ sv_high_frequency_rumble, "SDL_RumbleGamepad(high_frequency_rumble)");
	c_duration_ms = (Uint32)bg_in_uv(aTHX_ sv_duration_ms, "SDL_RumbleGamepad(duration_ms)");
	c_bg_ret = SDL_RumbleGamepad(c_gamepad, c_low_frequency_rumble, c_high_frequency_rumble, c_duration_ms);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RumbleGamepadTriggers(sv_gamepad, sv_left_rumble, sv_right_rumble, sv_duration_ms)
	SV *sv_gamepad
	SV *sv_left_rumble
	SV *sv_right_rumble
	SV *sv_duration_ms
    PREINIT:
	SDL_Gamepad * c_gamepad;
	Uint16 c_left_rumble;
	Uint16 c_right_rumble;
	Uint32 c_duration_ms;
	_Bool c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_RumbleGamepadTriggers(gamepad)");
	c_left_rumble = (Uint16)bg_in_uv(aTHX_ sv_left_rumble, "SDL_RumbleGamepadTriggers(left_rumble)");
	c_right_rumble = (Uint16)bg_in_uv(aTHX_ sv_right_rumble, "SDL_RumbleGamepadTriggers(right_rumble)");
	c_duration_ms = (Uint32)bg_in_uv(aTHX_ sv_duration_ms, "SDL_RumbleGamepadTriggers(duration_ms)");
	c_bg_ret = SDL_RumbleGamepadTriggers(c_gamepad, c_left_rumble, c_right_rumble, c_duration_ms);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetGamepadLED(sv_gamepad, sv_red, sv_green, sv_blue)
	SV *sv_gamepad
	SV *sv_red
	SV *sv_green
	SV *sv_blue
    PREINIT:
	SDL_Gamepad * c_gamepad;
	Uint8 c_red;
	Uint8 c_green;
	Uint8 c_blue;
	_Bool c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_SetGamepadLED(gamepad)");
	c_red = (Uint8)bg_in_uv(aTHX_ sv_red, "SDL_SetGamepadLED(red)");
	c_green = (Uint8)bg_in_uv(aTHX_ sv_green, "SDL_SetGamepadLED(green)");
	c_blue = (Uint8)bg_in_uv(aTHX_ sv_blue, "SDL_SetGamepadLED(blue)");
	c_bg_ret = SDL_SetGamepadLED(c_gamepad, c_red, c_green, c_blue);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SendGamepadEffect(sv_gamepad, sv_data, sv_size)
	SV *sv_gamepad
	SV *sv_data
	SV *sv_size
    PREINIT:
	SDL_Gamepad * c_gamepad;
	const void * c_data;
	int c_size;
	_Bool c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_SendGamepadEffect(gamepad)");
	c_data = (const void *)bg_in_raw_ptr(aTHX_ sv_data, "SDL_SendGamepadEffect(data)");
	c_size = (int)bg_in_iv(aTHX_ sv_size, "SDL_SendGamepadEffect(size)");
	c_bg_ret = SDL_SendGamepadEffect(c_gamepad, c_data, c_size);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CloseGamepad(sv_gamepad)
	SV *sv_gamepad
    PREINIT:
	SDL_Gamepad * c_gamepad;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_CloseGamepad(gamepad)");
	SDL_CloseGamepad(c_gamepad);
	XSRETURN(0);

void
SDL_GetGamepadAppleSFSymbolsNameForButton(sv_gamepad, sv_button)
	SV *sv_gamepad
	SV *sv_button
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_GamepadButton c_button;
	const char * c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadAppleSFSymbolsNameForButton(gamepad)");
	c_button = (SDL_GamepadButton)bg_in_iv(aTHX_ sv_button, "SDL_GetGamepadAppleSFSymbolsNameForButton(button)");
	c_bg_ret = SDL_GetGamepadAppleSFSymbolsNameForButton(c_gamepad, c_button);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGamepadAppleSFSymbolsNameForAxis(sv_gamepad, sv_axis)
	SV *sv_gamepad
	SV *sv_axis
    PREINIT:
	SDL_Gamepad * c_gamepad;
	SDL_GamepadAxis c_axis;
	const char * c_bg_ret;
    PPCODE:
	c_gamepad = (SDL_Gamepad *)bg_in_record_ptr(aTHX_ sv_gamepad, "SDL3::Gamepad", "SDL_GetGamepadAppleSFSymbolsNameForAxis(gamepad)");
	c_axis = (SDL_GamepadAxis)bg_in_iv(aTHX_ sv_axis, "SDL_GetGamepadAppleSFSymbolsNameForAxis(axis)");
	c_bg_ret = SDL_GetGamepadAppleSFSymbolsNameForAxis(c_gamepad, c_axis);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Gamepad", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_PROP_GAMEPAD_CAP_MONO_LED_BOOLEAN", BG_CONST_SV(SDL_PROP_GAMEPAD_CAP_MONO_LED_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GAMEPAD_CAP_PLAYER_LED_BOOLEAN", BG_CONST_SV(SDL_PROP_GAMEPAD_CAP_PLAYER_LED_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GAMEPAD_CAP_RGB_LED_BOOLEAN", BG_CONST_SV(SDL_PROP_GAMEPAD_CAP_RGB_LED_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GAMEPAD_CAP_RUMBLE_BOOLEAN", BG_CONST_SV(SDL_PROP_GAMEPAD_CAP_RUMBLE_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GAMEPAD_CAP_TRIGGER_RUMBLE_BOOLEAN", BG_CONST_SV(SDL_PROP_GAMEPAD_CAP_TRIGGER_RUMBLE_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_TYPE_UNKNOWN", BG_CONST_SV(SDL_GAMEPAD_TYPE_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_TYPE_STANDARD", BG_CONST_SV(SDL_GAMEPAD_TYPE_STANDARD));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_TYPE_XBOX360", BG_CONST_SV(SDL_GAMEPAD_TYPE_XBOX360));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_TYPE_XBOXONE", BG_CONST_SV(SDL_GAMEPAD_TYPE_XBOXONE));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_TYPE_PS3", BG_CONST_SV(SDL_GAMEPAD_TYPE_PS3));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_TYPE_PS4", BG_CONST_SV(SDL_GAMEPAD_TYPE_PS4));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_TYPE_PS5", BG_CONST_SV(SDL_GAMEPAD_TYPE_PS5));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO", BG_CONST_SV(SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT", BG_CONST_SV(SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT", BG_CONST_SV(SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR", BG_CONST_SV(SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_TYPE_GAMECUBE", BG_CONST_SV(SDL_GAMEPAD_TYPE_GAMECUBE));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_TYPE_STEAM", BG_CONST_SV(SDL_GAMEPAD_TYPE_STEAM));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_TYPE_COUNT", BG_CONST_SV(SDL_GAMEPAD_TYPE_COUNT));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_INVALID", BG_CONST_SV(SDL_GAMEPAD_BUTTON_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_SOUTH", BG_CONST_SV(SDL_GAMEPAD_BUTTON_SOUTH));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_EAST", BG_CONST_SV(SDL_GAMEPAD_BUTTON_EAST));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_WEST", BG_CONST_SV(SDL_GAMEPAD_BUTTON_WEST));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_NORTH", BG_CONST_SV(SDL_GAMEPAD_BUTTON_NORTH));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_BACK", BG_CONST_SV(SDL_GAMEPAD_BUTTON_BACK));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_GUIDE", BG_CONST_SV(SDL_GAMEPAD_BUTTON_GUIDE));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_START", BG_CONST_SV(SDL_GAMEPAD_BUTTON_START));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_LEFT_STICK", BG_CONST_SV(SDL_GAMEPAD_BUTTON_LEFT_STICK));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_RIGHT_STICK", BG_CONST_SV(SDL_GAMEPAD_BUTTON_RIGHT_STICK));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_LEFT_SHOULDER", BG_CONST_SV(SDL_GAMEPAD_BUTTON_LEFT_SHOULDER));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER", BG_CONST_SV(SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_DPAD_UP", BG_CONST_SV(SDL_GAMEPAD_BUTTON_DPAD_UP));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_DPAD_DOWN", BG_CONST_SV(SDL_GAMEPAD_BUTTON_DPAD_DOWN));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_DPAD_LEFT", BG_CONST_SV(SDL_GAMEPAD_BUTTON_DPAD_LEFT));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_DPAD_RIGHT", BG_CONST_SV(SDL_GAMEPAD_BUTTON_DPAD_RIGHT));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_MISC1", BG_CONST_SV(SDL_GAMEPAD_BUTTON_MISC1));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1", BG_CONST_SV(SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_LEFT_PADDLE1", BG_CONST_SV(SDL_GAMEPAD_BUTTON_LEFT_PADDLE1));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2", BG_CONST_SV(SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_LEFT_PADDLE2", BG_CONST_SV(SDL_GAMEPAD_BUTTON_LEFT_PADDLE2));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_TOUCHPAD", BG_CONST_SV(SDL_GAMEPAD_BUTTON_TOUCHPAD));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_MISC2", BG_CONST_SV(SDL_GAMEPAD_BUTTON_MISC2));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_MISC3", BG_CONST_SV(SDL_GAMEPAD_BUTTON_MISC3));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_MISC4", BG_CONST_SV(SDL_GAMEPAD_BUTTON_MISC4));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_MISC5", BG_CONST_SV(SDL_GAMEPAD_BUTTON_MISC5));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_MISC6", BG_CONST_SV(SDL_GAMEPAD_BUTTON_MISC6));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_COUNT", BG_CONST_SV(SDL_GAMEPAD_BUTTON_COUNT));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN", BG_CONST_SV(SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_LABEL_A", BG_CONST_SV(SDL_GAMEPAD_BUTTON_LABEL_A));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_LABEL_B", BG_CONST_SV(SDL_GAMEPAD_BUTTON_LABEL_B));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_LABEL_X", BG_CONST_SV(SDL_GAMEPAD_BUTTON_LABEL_X));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_LABEL_Y", BG_CONST_SV(SDL_GAMEPAD_BUTTON_LABEL_Y));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_LABEL_CROSS", BG_CONST_SV(SDL_GAMEPAD_BUTTON_LABEL_CROSS));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_LABEL_CIRCLE", BG_CONST_SV(SDL_GAMEPAD_BUTTON_LABEL_CIRCLE));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_LABEL_SQUARE", BG_CONST_SV(SDL_GAMEPAD_BUTTON_LABEL_SQUARE));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE", BG_CONST_SV(SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_AXIS_INVALID", BG_CONST_SV(SDL_GAMEPAD_AXIS_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_AXIS_LEFTX", BG_CONST_SV(SDL_GAMEPAD_AXIS_LEFTX));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_AXIS_LEFTY", BG_CONST_SV(SDL_GAMEPAD_AXIS_LEFTY));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_AXIS_RIGHTX", BG_CONST_SV(SDL_GAMEPAD_AXIS_RIGHTX));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_AXIS_RIGHTY", BG_CONST_SV(SDL_GAMEPAD_AXIS_RIGHTY));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_AXIS_LEFT_TRIGGER", BG_CONST_SV(SDL_GAMEPAD_AXIS_LEFT_TRIGGER));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_AXIS_RIGHT_TRIGGER", BG_CONST_SV(SDL_GAMEPAD_AXIS_RIGHT_TRIGGER));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_AXIS_COUNT", BG_CONST_SV(SDL_GAMEPAD_AXIS_COUNT));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BINDTYPE_NONE", BG_CONST_SV(SDL_GAMEPAD_BINDTYPE_NONE));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BINDTYPE_BUTTON", BG_CONST_SV(SDL_GAMEPAD_BINDTYPE_BUTTON));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BINDTYPE_AXIS", BG_CONST_SV(SDL_GAMEPAD_BINDTYPE_AXIS));
	bg_export_constant(aTHX_ stash, "SDL_GAMEPAD_BINDTYPE_HAT", BG_CONST_SV(SDL_GAMEPAD_BINDTYPE_HAT));
	}


MODULE = SDL3  PACKAGE = SDL3::GamepadBinding

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GamepadBinding), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GamepadBinding)));
	XSRETURN(1);

void
input_type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadBinding *self;
    PPCODE:
	self = (struct SDL_GamepadBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding", "SDL3::GamepadBinding::input_type");
	if (items > 1) {
		self->input_type = (SDL_GamepadBindingType)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadBinding::input_type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->input_type)));
	XSRETURN(1);

void
input(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadBinding *self;
    PPCODE:
	self = (struct SDL_GamepadBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding", "SDL3::GamepadBinding::input");
	if (items > 1) {
		self->input = *(__typeof__(((struct SDL_GamepadBinding *)0)->input) *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GamepadBinding::Input", "SDL3::GamepadBinding::input");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->input), "SDL3::GamepadBinding::Input"));
	XSRETURN(1);

void
output_type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadBinding *self;
    PPCODE:
	self = (struct SDL_GamepadBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding", "SDL3::GamepadBinding::output_type");
	if (items > 1) {
		self->output_type = (SDL_GamepadBindingType)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadBinding::output_type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->output_type)));
	XSRETURN(1);

void
output(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GamepadBinding *self;
    PPCODE:
	self = (struct SDL_GamepadBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding", "SDL3::GamepadBinding::output");
	if (items > 1) {
		self->output = *(__typeof__(((struct SDL_GamepadBinding *)0)->output) *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GamepadBinding::Output", "SDL3::GamepadBinding::output");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->output), "SDL3::GamepadBinding::Output"));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GamepadBinding::Input

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(__typeof__(((struct SDL_GamepadBinding *)0)->input)), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(__typeof__(((struct SDL_GamepadBinding *)0)->input))));
	XSRETURN(1);

void
button(sv_self, ...)
	SV *sv_self
    PREINIT:
	__typeof__(((struct SDL_GamepadBinding *)0)->input) *self;
    PPCODE:
	self = (__typeof__(((struct SDL_GamepadBinding *)0)->input) *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding::Input", "SDL3::GamepadBinding::Input::button");
	if (items > 1) {
		self->button = (int)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadBinding::Input::button");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->button)));
	XSRETURN(1);

void
axis(sv_self, ...)
	SV *sv_self
    PREINIT:
	__typeof__(((struct SDL_GamepadBinding *)0)->input) *self;
    PPCODE:
	self = (__typeof__(((struct SDL_GamepadBinding *)0)->input) *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding::Input", "SDL3::GamepadBinding::Input::axis");
	if (items > 1) {
		self->axis = *(__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->axis) *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GamepadBinding::Input::Axis", "SDL3::GamepadBinding::Input::axis");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->axis), "SDL3::GamepadBinding::Input::Axis"));
	XSRETURN(1);

void
hat(sv_self, ...)
	SV *sv_self
    PREINIT:
	__typeof__(((struct SDL_GamepadBinding *)0)->input) *self;
    PPCODE:
	self = (__typeof__(((struct SDL_GamepadBinding *)0)->input) *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding::Input", "SDL3::GamepadBinding::Input::hat");
	if (items > 1) {
		self->hat = *(__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->hat) *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GamepadBinding::Input::Hat", "SDL3::GamepadBinding::Input::hat");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->hat), "SDL3::GamepadBinding::Input::Hat"));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GamepadBinding::Input::Axis

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->axis)), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->axis))));
	XSRETURN(1);

void
axis(sv_self, ...)
	SV *sv_self
    PREINIT:
	__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->axis) *self;
    PPCODE:
	self = (__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->axis) *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding::Input::Axis", "SDL3::GamepadBinding::Input::Axis::axis");
	if (items > 1) {
		self->axis = (int)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadBinding::Input::Axis::axis");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->axis)));
	XSRETURN(1);

void
axis_min(sv_self, ...)
	SV *sv_self
    PREINIT:
	__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->axis) *self;
    PPCODE:
	self = (__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->axis) *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding::Input::Axis", "SDL3::GamepadBinding::Input::Axis::axis_min");
	if (items > 1) {
		self->axis_min = (int)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadBinding::Input::Axis::axis_min");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->axis_min)));
	XSRETURN(1);

void
axis_max(sv_self, ...)
	SV *sv_self
    PREINIT:
	__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->axis) *self;
    PPCODE:
	self = (__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->axis) *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding::Input::Axis", "SDL3::GamepadBinding::Input::Axis::axis_max");
	if (items > 1) {
		self->axis_max = (int)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadBinding::Input::Axis::axis_max");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->axis_max)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GamepadBinding::Input::Hat

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->hat)), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->hat))));
	XSRETURN(1);

void
hat(sv_self, ...)
	SV *sv_self
    PREINIT:
	__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->hat) *self;
    PPCODE:
	self = (__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->hat) *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding::Input::Hat", "SDL3::GamepadBinding::Input::Hat::hat");
	if (items > 1) {
		self->hat = (int)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadBinding::Input::Hat::hat");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->hat)));
	XSRETURN(1);

void
hat_mask(sv_self, ...)
	SV *sv_self
    PREINIT:
	__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->hat) *self;
    PPCODE:
	self = (__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->input) *)0)->hat) *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding::Input::Hat", "SDL3::GamepadBinding::Input::Hat::hat_mask");
	if (items > 1) {
		self->hat_mask = (int)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadBinding::Input::Hat::hat_mask");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->hat_mask)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GamepadBinding::Output

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(__typeof__(((struct SDL_GamepadBinding *)0)->output)), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(__typeof__(((struct SDL_GamepadBinding *)0)->output))));
	XSRETURN(1);

void
button(sv_self, ...)
	SV *sv_self
    PREINIT:
	__typeof__(((struct SDL_GamepadBinding *)0)->output) *self;
    PPCODE:
	self = (__typeof__(((struct SDL_GamepadBinding *)0)->output) *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding::Output", "SDL3::GamepadBinding::Output::button");
	if (items > 1) {
		self->button = (SDL_GamepadButton)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadBinding::Output::button");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->button)));
	XSRETURN(1);

void
axis(sv_self, ...)
	SV *sv_self
    PREINIT:
	__typeof__(((struct SDL_GamepadBinding *)0)->output) *self;
    PPCODE:
	self = (__typeof__(((struct SDL_GamepadBinding *)0)->output) *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding::Output", "SDL3::GamepadBinding::Output::axis");
	if (items > 1) {
		self->axis = *(__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->output) *)0)->axis) *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GamepadBinding::Output::Axis", "SDL3::GamepadBinding::Output::axis");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->axis), "SDL3::GamepadBinding::Output::Axis"));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GamepadBinding::Output::Axis

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->output) *)0)->axis)), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->output) *)0)->axis))));
	XSRETURN(1);

void
axis(sv_self, ...)
	SV *sv_self
    PREINIT:
	__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->output) *)0)->axis) *self;
    PPCODE:
	self = (__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->output) *)0)->axis) *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding::Output::Axis", "SDL3::GamepadBinding::Output::Axis::axis");
	if (items > 1) {
		self->axis = (SDL_GamepadAxis)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadBinding::Output::Axis::axis");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->axis)));
	XSRETURN(1);

void
axis_min(sv_self, ...)
	SV *sv_self
    PREINIT:
	__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->output) *)0)->axis) *self;
    PPCODE:
	self = (__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->output) *)0)->axis) *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding::Output::Axis", "SDL3::GamepadBinding::Output::Axis::axis_min");
	if (items > 1) {
		self->axis_min = (int)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadBinding::Output::Axis::axis_min");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->axis_min)));
	XSRETURN(1);

void
axis_max(sv_self, ...)
	SV *sv_self
    PREINIT:
	__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->output) *)0)->axis) *self;
    PPCODE:
	self = (__typeof__(((__typeof__(((struct SDL_GamepadBinding *)0)->output) *)0)->axis) *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GamepadBinding::Output::Axis", "SDL3::GamepadBinding::Output::Axis::axis_max");
	if (items > 1) {
		self->axis_max = (int)bg_in_iv(aTHX_ ST(1), "SDL3::GamepadBinding::Output::Axis::axis_max");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->axis_max)));
	XSRETURN(1);
