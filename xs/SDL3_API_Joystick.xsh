MODULE = SDL3  PACKAGE = SDL3::API::Joystick

void
SDL_LockJoysticks()
    PPCODE:
	SDL_LockJoysticks();
	XSRETURN(0);

void
SDL_UnlockJoysticks()
    PPCODE:
	SDL_UnlockJoysticks();
	XSRETURN(0);

void
SDL_HasJoystick()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasJoystick();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoysticks(sv_count)
	SV *sv_count
    PREINIT:
	int c_count; int * p_count; SV *t_count;
	SDL_JoystickID * c_bg_ret;
    PPCODE:
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetJoysticks(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetJoysticks(count)");
	c_bg_ret = SDL_GetJoysticks(p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetJoystickNameForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	const char * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetJoystickNameForID(instance_id)");
	c_bg_ret = SDL_GetJoystickNameForID(c_instance_id);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickPathForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	const char * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetJoystickPathForID(instance_id)");
	c_bg_ret = SDL_GetJoystickPathForID(c_instance_id);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickPlayerIndexForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	int c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetJoystickPlayerIndexForID(instance_id)");
	c_bg_ret = SDL_GetJoystickPlayerIndexForID(c_instance_id);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickGUIDForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	struct SDL_GUID c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetJoystickGUIDForID(instance_id)");
	c_bg_ret = SDL_GetJoystickGUIDForID(c_instance_id);
	ST(0) = sv_2mortal(bg_out_record_copy(aTHX_ (const void *)&(c_bg_ret), sizeof(struct SDL_GUID), "SDL3::GUID"));
	XSRETURN(1);

void
SDL_GetJoystickVendorForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	Uint16 c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetJoystickVendorForID(instance_id)");
	c_bg_ret = SDL_GetJoystickVendorForID(c_instance_id);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickProductForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	Uint16 c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetJoystickProductForID(instance_id)");
	c_bg_ret = SDL_GetJoystickProductForID(c_instance_id);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickProductVersionForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	Uint16 c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetJoystickProductVersionForID(instance_id)");
	c_bg_ret = SDL_GetJoystickProductVersionForID(c_instance_id);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickTypeForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	SDL_JoystickType c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetJoystickTypeForID(instance_id)");
	c_bg_ret = SDL_GetJoystickTypeForID(c_instance_id);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_OpenJoystick(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	SDL_Joystick * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_OpenJoystick(instance_id)");
	c_bg_ret = SDL_OpenJoystick(c_instance_id);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Joystick"));
	XSRETURN(1);

void
SDL_GetJoystickFromID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	SDL_Joystick * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetJoystickFromID(instance_id)");
	c_bg_ret = SDL_GetJoystickFromID(c_instance_id);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Joystick"));
	XSRETURN(1);

void
SDL_GetJoystickFromPlayerIndex(sv_player_index)
	SV *sv_player_index
    PREINIT:
	int c_player_index;
	SDL_Joystick * c_bg_ret;
    PPCODE:
	c_player_index = (int)bg_in_iv(aTHX_ sv_player_index, "SDL_GetJoystickFromPlayerIndex(player_index)");
	c_bg_ret = SDL_GetJoystickFromPlayerIndex(c_player_index);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Joystick"));
	XSRETURN(1);

void
SDL_AttachVirtualJoystick(sv_desc)
	SV *sv_desc
    PREINIT:
	const SDL_VirtualJoystickDesc * c_desc;
	SDL_JoystickID c_bg_ret;
    PPCODE:
	c_desc = (const SDL_VirtualJoystickDesc *)bg_in_record_ptr(aTHX_ sv_desc, "SDL3::VirtualJoystickDesc", "SDL_AttachVirtualJoystick(desc)");
	c_bg_ret = SDL_AttachVirtualJoystick(c_desc);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_DetachVirtualJoystick(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	_Bool c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_DetachVirtualJoystick(instance_id)");
	c_bg_ret = SDL_DetachVirtualJoystick(c_instance_id);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_IsJoystickVirtual(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_JoystickID c_instance_id;
	_Bool c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_JoystickID)bg_in_uv(aTHX_ sv_instance_id, "SDL_IsJoystickVirtual(instance_id)");
	c_bg_ret = SDL_IsJoystickVirtual(c_instance_id);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetJoystickVirtualAxis(sv_joystick, sv_axis, sv_value)
	SV *sv_joystick
	SV *sv_axis
	SV *sv_value
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_axis;
	Sint16 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_SetJoystickVirtualAxis(joystick)");
	c_axis = (int)bg_in_iv(aTHX_ sv_axis, "SDL_SetJoystickVirtualAxis(axis)");
	c_value = (Sint16)bg_in_iv(aTHX_ sv_value, "SDL_SetJoystickVirtualAxis(value)");
	c_bg_ret = SDL_SetJoystickVirtualAxis(c_joystick, c_axis, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetJoystickVirtualBall(sv_joystick, sv_ball, sv_xrel, sv_yrel)
	SV *sv_joystick
	SV *sv_ball
	SV *sv_xrel
	SV *sv_yrel
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_ball;
	Sint16 c_xrel;
	Sint16 c_yrel;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_SetJoystickVirtualBall(joystick)");
	c_ball = (int)bg_in_iv(aTHX_ sv_ball, "SDL_SetJoystickVirtualBall(ball)");
	c_xrel = (Sint16)bg_in_iv(aTHX_ sv_xrel, "SDL_SetJoystickVirtualBall(xrel)");
	c_yrel = (Sint16)bg_in_iv(aTHX_ sv_yrel, "SDL_SetJoystickVirtualBall(yrel)");
	c_bg_ret = SDL_SetJoystickVirtualBall(c_joystick, c_ball, c_xrel, c_yrel);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetJoystickVirtualButton(sv_joystick, sv_button, sv_down)
	SV *sv_joystick
	SV *sv_button
	SV *sv_down
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_button;
	_Bool c_down;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_SetJoystickVirtualButton(joystick)");
	c_button = (int)bg_in_iv(aTHX_ sv_button, "SDL_SetJoystickVirtualButton(button)");
	c_down = (_Bool)SvTRUE(sv_down);
	c_bg_ret = SDL_SetJoystickVirtualButton(c_joystick, c_button, c_down);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetJoystickVirtualHat(sv_joystick, sv_hat, sv_value)
	SV *sv_joystick
	SV *sv_hat
	SV *sv_value
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_hat;
	Uint8 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_SetJoystickVirtualHat(joystick)");
	c_hat = (int)bg_in_iv(aTHX_ sv_hat, "SDL_SetJoystickVirtualHat(hat)");
	c_value = (Uint8)bg_in_uv(aTHX_ sv_value, "SDL_SetJoystickVirtualHat(value)");
	c_bg_ret = SDL_SetJoystickVirtualHat(c_joystick, c_hat, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetJoystickVirtualTouchpad(sv_joystick, sv_touchpad, sv_finger, sv_down, sv_x, sv_y, sv_pressure)
	SV *sv_joystick
	SV *sv_touchpad
	SV *sv_finger
	SV *sv_down
	SV *sv_x
	SV *sv_y
	SV *sv_pressure
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_touchpad;
	int c_finger;
	_Bool c_down;
	float c_x;
	float c_y;
	float c_pressure;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_SetJoystickVirtualTouchpad(joystick)");
	c_touchpad = (int)bg_in_iv(aTHX_ sv_touchpad, "SDL_SetJoystickVirtualTouchpad(touchpad)");
	c_finger = (int)bg_in_iv(aTHX_ sv_finger, "SDL_SetJoystickVirtualTouchpad(finger)");
	c_down = (_Bool)SvTRUE(sv_down);
	c_x = (float)bg_in_nv(aTHX_ sv_x, "SDL_SetJoystickVirtualTouchpad(x)");
	c_y = (float)bg_in_nv(aTHX_ sv_y, "SDL_SetJoystickVirtualTouchpad(y)");
	c_pressure = (float)bg_in_nv(aTHX_ sv_pressure, "SDL_SetJoystickVirtualTouchpad(pressure)");
	c_bg_ret = SDL_SetJoystickVirtualTouchpad(c_joystick, c_touchpad, c_finger, c_down, c_x, c_y, c_pressure);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SendJoystickVirtualSensorData(sv_joystick, sv_type, sv_sensor_timestamp, sv_data, sv_num_values)
	SV *sv_joystick
	SV *sv_type
	SV *sv_sensor_timestamp
	SV *sv_data
	SV *sv_num_values
    PREINIT:
	SDL_Joystick * c_joystick;
	SDL_SensorType c_type;
	Uint64 c_sensor_timestamp;
	const float * c_data;
	int c_num_values;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_SendJoystickVirtualSensorData(joystick)");
	c_type = (SDL_SensorType)bg_in_iv(aTHX_ sv_type, "SDL_SendJoystickVirtualSensorData(type)");
	c_sensor_timestamp = (Uint64)bg_in_uv(aTHX_ sv_sensor_timestamp, "SDL_SendJoystickVirtualSensorData(sensor_timestamp)");
	c_data = (const float *)bg_in_raw_ptr(aTHX_ sv_data, "SDL_SendJoystickVirtualSensorData(data)");
	c_num_values = (int)bg_in_iv(aTHX_ sv_num_values, "SDL_SendJoystickVirtualSensorData(num_values)");
	c_bg_ret = SDL_SendJoystickVirtualSensorData(c_joystick, c_type, c_sensor_timestamp, c_data, c_num_values);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickProperties(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickProperties(joystick)");
	c_bg_ret = SDL_GetJoystickProperties(c_joystick);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickName(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	const char * c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickName(joystick)");
	c_bg_ret = SDL_GetJoystickName(c_joystick);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickPath(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	const char * c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickPath(joystick)");
	c_bg_ret = SDL_GetJoystickPath(c_joystick);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickPlayerIndex(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickPlayerIndex(joystick)");
	c_bg_ret = SDL_GetJoystickPlayerIndex(c_joystick);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetJoystickPlayerIndex(sv_joystick, sv_player_index)
	SV *sv_joystick
	SV *sv_player_index
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_player_index;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_SetJoystickPlayerIndex(joystick)");
	c_player_index = (int)bg_in_iv(aTHX_ sv_player_index, "SDL_SetJoystickPlayerIndex(player_index)");
	c_bg_ret = SDL_SetJoystickPlayerIndex(c_joystick, c_player_index);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickGUID(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	struct SDL_GUID c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickGUID(joystick)");
	c_bg_ret = SDL_GetJoystickGUID(c_joystick);
	ST(0) = sv_2mortal(bg_out_record_copy(aTHX_ (const void *)&(c_bg_ret), sizeof(struct SDL_GUID), "SDL3::GUID"));
	XSRETURN(1);

void
SDL_GetJoystickVendor(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	Uint16 c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickVendor(joystick)");
	c_bg_ret = SDL_GetJoystickVendor(c_joystick);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickProduct(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	Uint16 c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickProduct(joystick)");
	c_bg_ret = SDL_GetJoystickProduct(c_joystick);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickProductVersion(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	Uint16 c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickProductVersion(joystick)");
	c_bg_ret = SDL_GetJoystickProductVersion(c_joystick);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickFirmwareVersion(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	Uint16 c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickFirmwareVersion(joystick)");
	c_bg_ret = SDL_GetJoystickFirmwareVersion(c_joystick);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickSerial(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	const char * c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickSerial(joystick)");
	c_bg_ret = SDL_GetJoystickSerial(c_joystick);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickType(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	SDL_JoystickType c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickType(joystick)");
	c_bg_ret = SDL_GetJoystickType(c_joystick);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickGUIDInfo(sv_guid, sv_vendor, sv_product, sv_version, sv_crc16)
	SV *sv_guid
	SV *sv_vendor
	SV *sv_product
	SV *sv_version
	SV *sv_crc16
    PREINIT:
	struct SDL_GUID c_guid;
	Uint16 c_vendor; Uint16 * p_vendor; SV *t_vendor;
	Uint16 c_product; Uint16 * p_product; SV *t_product;
	Uint16 c_version; Uint16 * p_version; SV *t_version;
	Uint16 c_crc16; Uint16 * p_crc16; SV *t_crc16;
    PPCODE:
	c_guid = *(struct SDL_GUID *)bg_in_record_value_ptr(aTHX_ sv_guid, "SDL3::GUID", "SDL_GetJoystickGUIDInfo(guid)");
	t_vendor = bg_outref_target(aTHX_ sv_vendor);
	c_vendor = (t_vendor && SvOK(t_vendor)) ? (Uint16)bg_in_uv(aTHX_ t_vendor, "SDL_GetJoystickGUIDInfo(vendor)") : (Uint16)0;
	p_vendor = t_vendor ? &c_vendor : (Uint16 *)bg_outref_raw(aTHX_ sv_vendor, "SDL_GetJoystickGUIDInfo(vendor)");
	t_product = bg_outref_target(aTHX_ sv_product);
	c_product = (t_product && SvOK(t_product)) ? (Uint16)bg_in_uv(aTHX_ t_product, "SDL_GetJoystickGUIDInfo(product)") : (Uint16)0;
	p_product = t_product ? &c_product : (Uint16 *)bg_outref_raw(aTHX_ sv_product, "SDL_GetJoystickGUIDInfo(product)");
	t_version = bg_outref_target(aTHX_ sv_version);
	c_version = (t_version && SvOK(t_version)) ? (Uint16)bg_in_uv(aTHX_ t_version, "SDL_GetJoystickGUIDInfo(version)") : (Uint16)0;
	p_version = t_version ? &c_version : (Uint16 *)bg_outref_raw(aTHX_ sv_version, "SDL_GetJoystickGUIDInfo(version)");
	t_crc16 = bg_outref_target(aTHX_ sv_crc16);
	c_crc16 = (t_crc16 && SvOK(t_crc16)) ? (Uint16)bg_in_uv(aTHX_ t_crc16, "SDL_GetJoystickGUIDInfo(crc16)") : (Uint16)0;
	p_crc16 = t_crc16 ? &c_crc16 : (Uint16 *)bg_outref_raw(aTHX_ sv_crc16, "SDL_GetJoystickGUIDInfo(crc16)");
	SDL_GetJoystickGUIDInfo(c_guid, p_vendor, p_product, p_version, p_crc16);
	if (t_vendor) sv_setsv(t_vendor, sv_2mortal(newSVuv((UV)(c_vendor))));
	if (t_product) sv_setsv(t_product, sv_2mortal(newSVuv((UV)(c_product))));
	if (t_version) sv_setsv(t_version, sv_2mortal(newSVuv((UV)(c_version))));
	if (t_crc16) sv_setsv(t_crc16, sv_2mortal(newSVuv((UV)(c_crc16))));
	XSRETURN(0);

void
SDL_JoystickConnected(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_JoystickConnected(joystick)");
	c_bg_ret = SDL_JoystickConnected(c_joystick);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickID(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	SDL_JoystickID c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickID(joystick)");
	c_bg_ret = SDL_GetJoystickID(c_joystick);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetNumJoystickAxes(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetNumJoystickAxes(joystick)");
	c_bg_ret = SDL_GetNumJoystickAxes(c_joystick);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetNumJoystickBalls(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetNumJoystickBalls(joystick)");
	c_bg_ret = SDL_GetNumJoystickBalls(c_joystick);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetNumJoystickHats(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetNumJoystickHats(joystick)");
	c_bg_ret = SDL_GetNumJoystickHats(c_joystick);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetNumJoystickButtons(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetNumJoystickButtons(joystick)");
	c_bg_ret = SDL_GetNumJoystickButtons(c_joystick);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetJoystickEventsEnabled(sv_enabled)
	SV *sv_enabled
    PREINIT:
	_Bool c_enabled;
    PPCODE:
	c_enabled = (_Bool)SvTRUE(sv_enabled);
	SDL_SetJoystickEventsEnabled(c_enabled);
	XSRETURN(0);

void
SDL_JoystickEventsEnabled()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_JoystickEventsEnabled();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_UpdateJoysticks()
    PPCODE:
	SDL_UpdateJoysticks();
	XSRETURN(0);

void
SDL_GetJoystickAxis(sv_joystick, sv_axis)
	SV *sv_joystick
	SV *sv_axis
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_axis;
	Sint16 c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickAxis(joystick)");
	c_axis = (int)bg_in_iv(aTHX_ sv_axis, "SDL_GetJoystickAxis(axis)");
	c_bg_ret = SDL_GetJoystickAxis(c_joystick, c_axis);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickAxisInitialState(sv_joystick, sv_axis, sv_state)
	SV *sv_joystick
	SV *sv_axis
	SV *sv_state
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_axis;
	Sint16 c_state; Sint16 * p_state; SV *t_state;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickAxisInitialState(joystick)");
	c_axis = (int)bg_in_iv(aTHX_ sv_axis, "SDL_GetJoystickAxisInitialState(axis)");
	t_state = bg_outref_target(aTHX_ sv_state);
	c_state = (t_state && SvOK(t_state)) ? (Sint16)bg_in_iv(aTHX_ t_state, "SDL_GetJoystickAxisInitialState(state)") : (Sint16)0;
	p_state = t_state ? &c_state : (Sint16 *)bg_outref_raw(aTHX_ sv_state, "SDL_GetJoystickAxisInitialState(state)");
	c_bg_ret = SDL_GetJoystickAxisInitialState(c_joystick, c_axis, p_state);
	if (t_state) sv_setsv(t_state, sv_2mortal(newSViv((IV)(c_state))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickBall(sv_joystick, sv_ball, sv_dx, sv_dy)
	SV *sv_joystick
	SV *sv_ball
	SV *sv_dx
	SV *sv_dy
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_ball;
	int c_dx; int * p_dx; SV *t_dx;
	int c_dy; int * p_dy; SV *t_dy;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickBall(joystick)");
	c_ball = (int)bg_in_iv(aTHX_ sv_ball, "SDL_GetJoystickBall(ball)");
	t_dx = bg_outref_target(aTHX_ sv_dx);
	c_dx = (t_dx && SvOK(t_dx)) ? (int)bg_in_iv(aTHX_ t_dx, "SDL_GetJoystickBall(dx)") : (int)0;
	p_dx = t_dx ? &c_dx : (int *)bg_outref_raw(aTHX_ sv_dx, "SDL_GetJoystickBall(dx)");
	t_dy = bg_outref_target(aTHX_ sv_dy);
	c_dy = (t_dy && SvOK(t_dy)) ? (int)bg_in_iv(aTHX_ t_dy, "SDL_GetJoystickBall(dy)") : (int)0;
	p_dy = t_dy ? &c_dy : (int *)bg_outref_raw(aTHX_ sv_dy, "SDL_GetJoystickBall(dy)");
	c_bg_ret = SDL_GetJoystickBall(c_joystick, c_ball, p_dx, p_dy);
	if (t_dx) sv_setsv(t_dx, sv_2mortal(newSViv((IV)(c_dx))));
	if (t_dy) sv_setsv(t_dy, sv_2mortal(newSViv((IV)(c_dy))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickHat(sv_joystick, sv_hat)
	SV *sv_joystick
	SV *sv_hat
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_hat;
	Uint8 c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickHat(joystick)");
	c_hat = (int)bg_in_iv(aTHX_ sv_hat, "SDL_GetJoystickHat(hat)");
	c_bg_ret = SDL_GetJoystickHat(c_joystick, c_hat);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickButton(sv_joystick, sv_button)
	SV *sv_joystick
	SV *sv_button
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_button;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickButton(joystick)");
	c_button = (int)bg_in_iv(aTHX_ sv_button, "SDL_GetJoystickButton(button)");
	c_bg_ret = SDL_GetJoystickButton(c_joystick, c_button);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RumbleJoystick(sv_joystick, sv_low_frequency_rumble, sv_high_frequency_rumble, sv_duration_ms)
	SV *sv_joystick
	SV *sv_low_frequency_rumble
	SV *sv_high_frequency_rumble
	SV *sv_duration_ms
    PREINIT:
	SDL_Joystick * c_joystick;
	Uint16 c_low_frequency_rumble;
	Uint16 c_high_frequency_rumble;
	Uint32 c_duration_ms;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_RumbleJoystick(joystick)");
	c_low_frequency_rumble = (Uint16)bg_in_uv(aTHX_ sv_low_frequency_rumble, "SDL_RumbleJoystick(low_frequency_rumble)");
	c_high_frequency_rumble = (Uint16)bg_in_uv(aTHX_ sv_high_frequency_rumble, "SDL_RumbleJoystick(high_frequency_rumble)");
	c_duration_ms = (Uint32)bg_in_uv(aTHX_ sv_duration_ms, "SDL_RumbleJoystick(duration_ms)");
	c_bg_ret = SDL_RumbleJoystick(c_joystick, c_low_frequency_rumble, c_high_frequency_rumble, c_duration_ms);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RumbleJoystickTriggers(sv_joystick, sv_left_rumble, sv_right_rumble, sv_duration_ms)
	SV *sv_joystick
	SV *sv_left_rumble
	SV *sv_right_rumble
	SV *sv_duration_ms
    PREINIT:
	SDL_Joystick * c_joystick;
	Uint16 c_left_rumble;
	Uint16 c_right_rumble;
	Uint32 c_duration_ms;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_RumbleJoystickTriggers(joystick)");
	c_left_rumble = (Uint16)bg_in_uv(aTHX_ sv_left_rumble, "SDL_RumbleJoystickTriggers(left_rumble)");
	c_right_rumble = (Uint16)bg_in_uv(aTHX_ sv_right_rumble, "SDL_RumbleJoystickTriggers(right_rumble)");
	c_duration_ms = (Uint32)bg_in_uv(aTHX_ sv_duration_ms, "SDL_RumbleJoystickTriggers(duration_ms)");
	c_bg_ret = SDL_RumbleJoystickTriggers(c_joystick, c_left_rumble, c_right_rumble, c_duration_ms);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetJoystickLED(sv_joystick, sv_red, sv_green, sv_blue)
	SV *sv_joystick
	SV *sv_red
	SV *sv_green
	SV *sv_blue
    PREINIT:
	SDL_Joystick * c_joystick;
	Uint8 c_red;
	Uint8 c_green;
	Uint8 c_blue;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_SetJoystickLED(joystick)");
	c_red = (Uint8)bg_in_uv(aTHX_ sv_red, "SDL_SetJoystickLED(red)");
	c_green = (Uint8)bg_in_uv(aTHX_ sv_green, "SDL_SetJoystickLED(green)");
	c_blue = (Uint8)bg_in_uv(aTHX_ sv_blue, "SDL_SetJoystickLED(blue)");
	c_bg_ret = SDL_SetJoystickLED(c_joystick, c_red, c_green, c_blue);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SendJoystickEffect(sv_joystick, sv_data, sv_size)
	SV *sv_joystick
	SV *sv_data
	SV *sv_size
    PREINIT:
	SDL_Joystick * c_joystick;
	const void * c_data;
	int c_size;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_SendJoystickEffect(joystick)");
	c_data = (const void *)bg_in_raw_ptr(aTHX_ sv_data, "SDL_SendJoystickEffect(data)");
	c_size = (int)bg_in_iv(aTHX_ sv_size, "SDL_SendJoystickEffect(size)");
	c_bg_ret = SDL_SendJoystickEffect(c_joystick, c_data, c_size);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CloseJoystick(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_CloseJoystick(joystick)");
	SDL_CloseJoystick(c_joystick);
	XSRETURN(0);

void
SDL_GetJoystickConnectionState(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	SDL_JoystickConnectionState c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickConnectionState(joystick)");
	c_bg_ret = SDL_GetJoystickConnectionState(c_joystick);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetJoystickPowerInfo(sv_joystick, sv_percent)
	SV *sv_joystick
	SV *sv_percent
    PREINIT:
	SDL_Joystick * c_joystick;
	int c_percent; int * p_percent; SV *t_percent;
	SDL_PowerState c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_GetJoystickPowerInfo(joystick)");
	t_percent = bg_outref_target(aTHX_ sv_percent);
	c_percent = (t_percent && SvOK(t_percent)) ? (int)bg_in_iv(aTHX_ t_percent, "SDL_GetJoystickPowerInfo(percent)") : (int)0;
	p_percent = t_percent ? &c_percent : (int *)bg_outref_raw(aTHX_ sv_percent, "SDL_GetJoystickPowerInfo(percent)");
	c_bg_ret = SDL_GetJoystickPowerInfo(c_joystick, p_percent);
	if (t_percent) sv_setsv(t_percent, sv_2mortal(newSViv((IV)(c_percent))));
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Joystick", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_HAT_CENTERED", BG_CONST_SV(SDL_HAT_CENTERED));
	bg_export_constant(aTHX_ stash, "SDL_HAT_DOWN", BG_CONST_SV(SDL_HAT_DOWN));
	bg_export_constant(aTHX_ stash, "SDL_HAT_LEFT", BG_CONST_SV(SDL_HAT_LEFT));
	bg_export_constant(aTHX_ stash, "SDL_HAT_LEFTDOWN", BG_CONST_SV(SDL_HAT_LEFTDOWN));
	bg_export_constant(aTHX_ stash, "SDL_HAT_LEFTUP", BG_CONST_SV(SDL_HAT_LEFTUP));
	bg_export_constant(aTHX_ stash, "SDL_HAT_RIGHT", BG_CONST_SV(SDL_HAT_RIGHT));
	bg_export_constant(aTHX_ stash, "SDL_HAT_RIGHTDOWN", BG_CONST_SV(SDL_HAT_RIGHTDOWN));
	bg_export_constant(aTHX_ stash, "SDL_HAT_RIGHTUP", BG_CONST_SV(SDL_HAT_RIGHTUP));
	bg_export_constant(aTHX_ stash, "SDL_HAT_UP", BG_CONST_SV(SDL_HAT_UP));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_AXIS_MAX", BG_CONST_SV(SDL_JOYSTICK_AXIS_MAX));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_AXIS_MIN", BG_CONST_SV(SDL_JOYSTICK_AXIS_MIN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN", BG_CONST_SV(SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN", BG_CONST_SV(SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN", BG_CONST_SV(SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN", BG_CONST_SV(SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN", BG_CONST_SV(SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_TYPE_UNKNOWN", BG_CONST_SV(SDL_JOYSTICK_TYPE_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_TYPE_GAMEPAD", BG_CONST_SV(SDL_JOYSTICK_TYPE_GAMEPAD));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_TYPE_WHEEL", BG_CONST_SV(SDL_JOYSTICK_TYPE_WHEEL));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_TYPE_ARCADE_STICK", BG_CONST_SV(SDL_JOYSTICK_TYPE_ARCADE_STICK));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_TYPE_FLIGHT_STICK", BG_CONST_SV(SDL_JOYSTICK_TYPE_FLIGHT_STICK));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_TYPE_DANCE_PAD", BG_CONST_SV(SDL_JOYSTICK_TYPE_DANCE_PAD));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_TYPE_GUITAR", BG_CONST_SV(SDL_JOYSTICK_TYPE_GUITAR));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_TYPE_DRUM_KIT", BG_CONST_SV(SDL_JOYSTICK_TYPE_DRUM_KIT));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_TYPE_ARCADE_PAD", BG_CONST_SV(SDL_JOYSTICK_TYPE_ARCADE_PAD));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_TYPE_THROTTLE", BG_CONST_SV(SDL_JOYSTICK_TYPE_THROTTLE));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_TYPE_COUNT", BG_CONST_SV(SDL_JOYSTICK_TYPE_COUNT));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_CONNECTION_INVALID", BG_CONST_SV(SDL_JOYSTICK_CONNECTION_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_CONNECTION_UNKNOWN", BG_CONST_SV(SDL_JOYSTICK_CONNECTION_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_CONNECTION_WIRED", BG_CONST_SV(SDL_JOYSTICK_CONNECTION_WIRED));
	bg_export_constant(aTHX_ stash, "SDL_JOYSTICK_CONNECTION_WIRELESS", BG_CONST_SV(SDL_JOYSTICK_CONNECTION_WIRELESS));
	}


MODULE = SDL3  PACKAGE = SDL3::VirtualJoystickTouchpadDesc

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_VirtualJoystickTouchpadDesc), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_VirtualJoystickTouchpadDesc)));
	XSRETURN(1);

void
nfingers(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickTouchpadDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickTouchpadDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickTouchpadDesc", "SDL3::VirtualJoystickTouchpadDesc::nfingers");
	if (items > 1) {
		self->nfingers = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::VirtualJoystickTouchpadDesc::nfingers");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->nfingers)));
	XSRETURN(1);

void
padding(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickTouchpadDesc *self;
	Size_t bg_i;
    PPCODE:
	self = (struct SDL_VirtualJoystickTouchpadDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickTouchpadDesc", "SDL3::VirtualJoystickTouchpadDesc::padding");
	if (items > 1) {
		if (items - 1 != 3) croak("%s expects 3 values, got %d", "SDL3::VirtualJoystickTouchpadDesc::padding", (int)(items - 1));
		for (bg_i = 0; bg_i < 3; bg_i++) self->padding[bg_i] = (Uint16)bg_in_uv(aTHX_ ST(1 + bg_i), "SDL3::VirtualJoystickTouchpadDesc::padding");
		XSRETURN(1);
	}
	EXTEND(SP, 3);
	for (bg_i = 0; bg_i < 3; bg_i++) mPUSHs(newSVuv((UV)(self->padding[bg_i])));
	XSRETURN(3);

MODULE = SDL3  PACKAGE = SDL3::VirtualJoystickSensorDesc

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_VirtualJoystickSensorDesc), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_VirtualJoystickSensorDesc)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickSensorDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickSensorDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickSensorDesc", "SDL3::VirtualJoystickSensorDesc::type");
	if (items > 1) {
		self->type = (SDL_SensorType)bg_in_iv(aTHX_ ST(1), "SDL3::VirtualJoystickSensorDesc::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
rate(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickSensorDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickSensorDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickSensorDesc", "SDL3::VirtualJoystickSensorDesc::rate");
	if (items > 1) {
		self->rate = (float)bg_in_nv(aTHX_ ST(1), "SDL3::VirtualJoystickSensorDesc::rate");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->rate)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::VirtualJoystickDesc

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_VirtualJoystickDesc), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_VirtualJoystickDesc)));
	XSRETURN(1);

void
version(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::version");
	if (items > 1) {
		self->version = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::version");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->version)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::type");
	if (items > 1) {
		self->type = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->type)));
	XSRETURN(1);

void
padding(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::padding");
	if (items > 1) {
		self->padding = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::padding");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding)));
	XSRETURN(1);

void
vendor_id(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::vendor_id");
	if (items > 1) {
		self->vendor_id = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::vendor_id");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->vendor_id)));
	XSRETURN(1);

void
product_id(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::product_id");
	if (items > 1) {
		self->product_id = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::product_id");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->product_id)));
	XSRETURN(1);

void
naxes(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::naxes");
	if (items > 1) {
		self->naxes = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::naxes");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->naxes)));
	XSRETURN(1);

void
nbuttons(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::nbuttons");
	if (items > 1) {
		self->nbuttons = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::nbuttons");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->nbuttons)));
	XSRETURN(1);

void
nballs(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::nballs");
	if (items > 1) {
		self->nballs = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::nballs");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->nballs)));
	XSRETURN(1);

void
nhats(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::nhats");
	if (items > 1) {
		self->nhats = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::nhats");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->nhats)));
	XSRETURN(1);

void
ntouchpads(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::ntouchpads");
	if (items > 1) {
		self->ntouchpads = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::ntouchpads");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->ntouchpads)));
	XSRETURN(1);

void
nsensors(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::nsensors");
	if (items > 1) {
		self->nsensors = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::nsensors");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->nsensors)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
	Size_t bg_i;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::padding2");
	if (items > 1) {
		if (items - 1 != 2) croak("%s expects 2 values, got %d", "SDL3::VirtualJoystickDesc::padding2", (int)(items - 1));
		for (bg_i = 0; bg_i < 2; bg_i++) self->padding2[bg_i] = (Uint16)bg_in_uv(aTHX_ ST(1 + bg_i), "SDL3::VirtualJoystickDesc::padding2");
		XSRETURN(1);
	}
	EXTEND(SP, 2);
	for (bg_i = 0; bg_i < 2; bg_i++) mPUSHs(newSVuv((UV)(self->padding2[bg_i])));
	XSRETURN(2);

void
button_mask(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::button_mask");
	if (items > 1) {
		self->button_mask = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::button_mask");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->button_mask)));
	XSRETURN(1);

void
axis_mask(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::axis_mask");
	if (items > 1) {
		self->axis_mask = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::axis_mask");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->axis_mask)));
	XSRETURN(1);

void
name(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::name");
	if (items > 1) {
		self->name = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::name");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->name)));
	XSRETURN(1);

void
touchpads(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::touchpads");
	if (items > 1) {
		self->touchpads = (const SDL_VirtualJoystickTouchpadDesc *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::VirtualJoystickTouchpadDesc", "SDL3::VirtualJoystickDesc::touchpads");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->touchpads), "SDL3::VirtualJoystickTouchpadDesc"));
	XSRETURN(1);

void
sensors(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::sensors");
	if (items > 1) {
		self->sensors = (const SDL_VirtualJoystickSensorDesc *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::VirtualJoystickSensorDesc", "SDL3::VirtualJoystickDesc::sensors");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->sensors), "SDL3::VirtualJoystickSensorDesc"));
	XSRETURN(1);

void
userdata(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::userdata");
	if (items > 1) {
		self->userdata = (void *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::userdata");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->userdata), "SDL3::Pointer"));
	XSRETURN(1);

void
Update(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::Update");
	if (items > 1) {
		self->Update = (void (*)(void *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::Update");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->Update), "SDL3::Pointer"));
	XSRETURN(1);

void
SetPlayerIndex(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::SetPlayerIndex");
	if (items > 1) {
		self->SetPlayerIndex = (void (*)(void *, int))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::SetPlayerIndex");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->SetPlayerIndex), "SDL3::Pointer"));
	XSRETURN(1);

void
Rumble(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::Rumble");
	if (items > 1) {
		self->Rumble = (_Bool (*)(void *, Uint16, Uint16))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::Rumble");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->Rumble), "SDL3::Pointer"));
	XSRETURN(1);

void
RumbleTriggers(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::RumbleTriggers");
	if (items > 1) {
		self->RumbleTriggers = (_Bool (*)(void *, Uint16, Uint16))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::RumbleTriggers");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->RumbleTriggers), "SDL3::Pointer"));
	XSRETURN(1);

void
SetLED(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::SetLED");
	if (items > 1) {
		self->SetLED = (_Bool (*)(void *, Uint8, Uint8, Uint8))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::SetLED");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->SetLED), "SDL3::Pointer"));
	XSRETURN(1);

void
SendEffect(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::SendEffect");
	if (items > 1) {
		self->SendEffect = (_Bool (*)(void *, const void *, int))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::SendEffect");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->SendEffect), "SDL3::Pointer"));
	XSRETURN(1);

void
SetSensorsEnabled(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::SetSensorsEnabled");
	if (items > 1) {
		self->SetSensorsEnabled = (_Bool (*)(void *, _Bool))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::SetSensorsEnabled");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->SetSensorsEnabled), "SDL3::Pointer"));
	XSRETURN(1);

void
Cleanup(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_VirtualJoystickDesc *self;
    PPCODE:
	self = (struct SDL_VirtualJoystickDesc *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::VirtualJoystickDesc", "SDL3::VirtualJoystickDesc::Cleanup");
	if (items > 1) {
		self->Cleanup = (void (*)(void *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::VirtualJoystickDesc::Cleanup");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->Cleanup), "SDL3::Pointer"));
	XSRETURN(1);
