MODULE = SDL3  PACKAGE = SDL3::API::Sensor

void
SDL_GetSensors(sv_count)
	SV *sv_count
    PREINIT:
	int c_count; int * p_count; SV *t_count;
	SDL_SensorID * c_bg_ret;
    PPCODE:
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetSensors(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetSensors(count)");
	c_bg_ret = SDL_GetSensors(p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetSensorNameForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_SensorID c_instance_id;
	const char * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_SensorID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetSensorNameForID(instance_id)");
	c_bg_ret = SDL_GetSensorNameForID(c_instance_id);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSensorTypeForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_SensorID c_instance_id;
	SDL_SensorType c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_SensorID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetSensorTypeForID(instance_id)");
	c_bg_ret = SDL_GetSensorTypeForID(c_instance_id);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSensorNonPortableTypeForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_SensorID c_instance_id;
	int c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_SensorID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetSensorNonPortableTypeForID(instance_id)");
	c_bg_ret = SDL_GetSensorNonPortableTypeForID(c_instance_id);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_OpenSensor(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_SensorID c_instance_id;
	SDL_Sensor * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_SensorID)bg_in_uv(aTHX_ sv_instance_id, "SDL_OpenSensor(instance_id)");
	c_bg_ret = SDL_OpenSensor(c_instance_id);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Sensor"));
	XSRETURN(1);

void
SDL_GetSensorFromID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_SensorID c_instance_id;
	SDL_Sensor * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_SensorID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetSensorFromID(instance_id)");
	c_bg_ret = SDL_GetSensorFromID(c_instance_id);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Sensor"));
	XSRETURN(1);

void
SDL_GetSensorProperties(sv_sensor)
	SV *sv_sensor
    PREINIT:
	SDL_Sensor * c_sensor;
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_sensor = (SDL_Sensor *)bg_in_record_ptr(aTHX_ sv_sensor, "SDL3::Sensor", "SDL_GetSensorProperties(sensor)");
	c_bg_ret = SDL_GetSensorProperties(c_sensor);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSensorName(sv_sensor)
	SV *sv_sensor
    PREINIT:
	SDL_Sensor * c_sensor;
	const char * c_bg_ret;
    PPCODE:
	c_sensor = (SDL_Sensor *)bg_in_record_ptr(aTHX_ sv_sensor, "SDL3::Sensor", "SDL_GetSensorName(sensor)");
	c_bg_ret = SDL_GetSensorName(c_sensor);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSensorType(sv_sensor)
	SV *sv_sensor
    PREINIT:
	SDL_Sensor * c_sensor;
	SDL_SensorType c_bg_ret;
    PPCODE:
	c_sensor = (SDL_Sensor *)bg_in_record_ptr(aTHX_ sv_sensor, "SDL3::Sensor", "SDL_GetSensorType(sensor)");
	c_bg_ret = SDL_GetSensorType(c_sensor);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSensorNonPortableType(sv_sensor)
	SV *sv_sensor
    PREINIT:
	SDL_Sensor * c_sensor;
	int c_bg_ret;
    PPCODE:
	c_sensor = (SDL_Sensor *)bg_in_record_ptr(aTHX_ sv_sensor, "SDL3::Sensor", "SDL_GetSensorNonPortableType(sensor)");
	c_bg_ret = SDL_GetSensorNonPortableType(c_sensor);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSensorID(sv_sensor)
	SV *sv_sensor
    PREINIT:
	SDL_Sensor * c_sensor;
	SDL_SensorID c_bg_ret;
    PPCODE:
	c_sensor = (SDL_Sensor *)bg_in_record_ptr(aTHX_ sv_sensor, "SDL3::Sensor", "SDL_GetSensorID(sensor)");
	c_bg_ret = SDL_GetSensorID(c_sensor);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSensorData(sv_sensor, sv_data, sv_num_values)
	SV *sv_sensor
	SV *sv_data
	SV *sv_num_values
    PREINIT:
	SDL_Sensor * c_sensor;
	float c_data; float * p_data; SV *t_data;
	int c_num_values;
	_Bool c_bg_ret;
    PPCODE:
	c_sensor = (SDL_Sensor *)bg_in_record_ptr(aTHX_ sv_sensor, "SDL3::Sensor", "SDL_GetSensorData(sensor)");
	t_data = bg_outref_target(aTHX_ sv_data);
	c_data = (t_data && SvOK(t_data)) ? (float)bg_in_nv(aTHX_ t_data, "SDL_GetSensorData(data)") : (float)0;
	p_data = t_data ? &c_data : (float *)bg_outref_raw(aTHX_ sv_data, "SDL_GetSensorData(data)");
	c_num_values = (int)bg_in_iv(aTHX_ sv_num_values, "SDL_GetSensorData(num_values)");
	c_bg_ret = SDL_GetSensorData(c_sensor, p_data, c_num_values);
	if (t_data) sv_setsv(t_data, sv_2mortal(newSVnv((NV)(c_data))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CloseSensor(sv_sensor)
	SV *sv_sensor
    PREINIT:
	SDL_Sensor * c_sensor;
    PPCODE:
	c_sensor = (SDL_Sensor *)bg_in_record_ptr(aTHX_ sv_sensor, "SDL3::Sensor", "SDL_CloseSensor(sensor)");
	SDL_CloseSensor(c_sensor);
	XSRETURN(0);

void
SDL_UpdateSensors()
    PPCODE:
	SDL_UpdateSensors();
	XSRETURN(0);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Sensor", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_STANDARD_GRAVITY", BG_CONST_SV(SDL_STANDARD_GRAVITY));
	bg_export_constant(aTHX_ stash, "SDL_SENSOR_INVALID", BG_CONST_SV(SDL_SENSOR_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_SENSOR_UNKNOWN", BG_CONST_SV(SDL_SENSOR_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_SENSOR_ACCEL", BG_CONST_SV(SDL_SENSOR_ACCEL));
	bg_export_constant(aTHX_ stash, "SDL_SENSOR_GYRO", BG_CONST_SV(SDL_SENSOR_GYRO));
	bg_export_constant(aTHX_ stash, "SDL_SENSOR_ACCEL_L", BG_CONST_SV(SDL_SENSOR_ACCEL_L));
	bg_export_constant(aTHX_ stash, "SDL_SENSOR_GYRO_L", BG_CONST_SV(SDL_SENSOR_GYRO_L));
	bg_export_constant(aTHX_ stash, "SDL_SENSOR_ACCEL_R", BG_CONST_SV(SDL_SENSOR_ACCEL_R));
	bg_export_constant(aTHX_ stash, "SDL_SENSOR_GYRO_R", BG_CONST_SV(SDL_SENSOR_GYRO_R));
	bg_export_constant(aTHX_ stash, "SDL_SENSOR_COUNT", BG_CONST_SV(SDL_SENSOR_COUNT));
	}

