MODULE = SDL3  PACKAGE = SDL3::API::Camera

void
SDL_GetNumCameraDrivers()
    PREINIT:
	int c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetNumCameraDrivers();
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetCameraDriver(sv_index)
	SV *sv_index
    PREINIT:
	int c_index;
	const char * c_bg_ret;
    PPCODE:
	c_index = (int)bg_in_iv(aTHX_ sv_index, "SDL_GetCameraDriver(index)");
	c_bg_ret = SDL_GetCameraDriver(c_index);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetCurrentCameraDriver()
    PREINIT:
	const char * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetCurrentCameraDriver();
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetCameras(sv_count)
	SV *sv_count
    PREINIT:
	int c_count; int * p_count; SV *t_count;
	SDL_CameraID * c_bg_ret;
    PPCODE:
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetCameras(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetCameras(count)");
	c_bg_ret = SDL_GetCameras(p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetCameraSupportedFormats(sv_instance_id, sv_count)
	SV *sv_instance_id
	SV *sv_count
    PREINIT:
	SDL_CameraID c_instance_id;
	int c_count; int * p_count; SV *t_count;
	SDL_CameraSpec ** c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_CameraID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetCameraSupportedFormats(instance_id)");
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetCameraSupportedFormats(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetCameraSupportedFormats(count)");
	c_bg_ret = SDL_GetCameraSupportedFormats(c_instance_id, p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetCameraName(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_CameraID c_instance_id;
	const char * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_CameraID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetCameraName(instance_id)");
	c_bg_ret = SDL_GetCameraName(c_instance_id);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetCameraPosition(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_CameraID c_instance_id;
	SDL_CameraPosition c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_CameraID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetCameraPosition(instance_id)");
	c_bg_ret = SDL_GetCameraPosition(c_instance_id);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_OpenCamera(sv_instance_id, sv_spec)
	SV *sv_instance_id
	SV *sv_spec
    PREINIT:
	SDL_CameraID c_instance_id;
	const SDL_CameraSpec * c_spec;
	SDL_Camera * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_CameraID)bg_in_uv(aTHX_ sv_instance_id, "SDL_OpenCamera(instance_id)");
	c_spec = (const SDL_CameraSpec *)bg_in_record_ptr(aTHX_ sv_spec, "SDL3::CameraSpec", "SDL_OpenCamera(spec)");
	c_bg_ret = SDL_OpenCamera(c_instance_id, c_spec);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Camera"));
	XSRETURN(1);

void
SDL_GetCameraPermissionState(sv_camera)
	SV *sv_camera
    PREINIT:
	SDL_Camera * c_camera;
	SDL_CameraPermissionState c_bg_ret;
    PPCODE:
	c_camera = (SDL_Camera *)bg_in_record_ptr(aTHX_ sv_camera, "SDL3::Camera", "SDL_GetCameraPermissionState(camera)");
	c_bg_ret = SDL_GetCameraPermissionState(c_camera);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetCameraID(sv_camera)
	SV *sv_camera
    PREINIT:
	SDL_Camera * c_camera;
	SDL_CameraID c_bg_ret;
    PPCODE:
	c_camera = (SDL_Camera *)bg_in_record_ptr(aTHX_ sv_camera, "SDL3::Camera", "SDL_GetCameraID(camera)");
	c_bg_ret = SDL_GetCameraID(c_camera);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetCameraProperties(sv_camera)
	SV *sv_camera
    PREINIT:
	SDL_Camera * c_camera;
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_camera = (SDL_Camera *)bg_in_record_ptr(aTHX_ sv_camera, "SDL3::Camera", "SDL_GetCameraProperties(camera)");
	c_bg_ret = SDL_GetCameraProperties(c_camera);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetCameraFormat(sv_camera, sv_spec)
	SV *sv_camera
	SV *sv_spec
    PREINIT:
	SDL_Camera * c_camera;
	SDL_CameraSpec * c_spec;
	_Bool c_bg_ret;
    PPCODE:
	c_camera = (SDL_Camera *)bg_in_record_ptr(aTHX_ sv_camera, "SDL3::Camera", "SDL_GetCameraFormat(camera)");
	c_spec = (SDL_CameraSpec *)bg_in_record_ptr(aTHX_ sv_spec, "SDL3::CameraSpec", "SDL_GetCameraFormat(spec)");
	c_bg_ret = SDL_GetCameraFormat(c_camera, c_spec);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_AcquireCameraFrame(sv_camera, sv_timestampNS)
	SV *sv_camera
	SV *sv_timestampNS
    PREINIT:
	SDL_Camera * c_camera;
	Uint64 c_timestampNS; Uint64 * p_timestampNS; SV *t_timestampNS;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_camera = (SDL_Camera *)bg_in_record_ptr(aTHX_ sv_camera, "SDL3::Camera", "SDL_AcquireCameraFrame(camera)");
	t_timestampNS = bg_outref_target(aTHX_ sv_timestampNS);
	c_timestampNS = (t_timestampNS && SvOK(t_timestampNS)) ? (Uint64)bg_in_uv(aTHX_ t_timestampNS, "SDL_AcquireCameraFrame(timestampNS)") : (Uint64)0;
	p_timestampNS = t_timestampNS ? &c_timestampNS : (Uint64 *)bg_outref_raw(aTHX_ sv_timestampNS, "SDL_AcquireCameraFrame(timestampNS)");
	c_bg_ret = SDL_AcquireCameraFrame(c_camera, p_timestampNS);
	if (t_timestampNS) sv_setsv(t_timestampNS, sv_2mortal(newSVuv((UV)(c_timestampNS))));
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_ReleaseCameraFrame(sv_camera, sv_frame)
	SV *sv_camera
	SV *sv_frame
    PREINIT:
	SDL_Camera * c_camera;
	SDL_Surface * c_frame;
    PPCODE:
	c_camera = (SDL_Camera *)bg_in_record_ptr(aTHX_ sv_camera, "SDL3::Camera", "SDL_ReleaseCameraFrame(camera)");
	c_frame = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_frame, "SDL3::Surface", "SDL_ReleaseCameraFrame(frame)");
	SDL_ReleaseCameraFrame(c_camera, c_frame);
	XSRETURN(0);

void
SDL_CloseCamera(sv_camera)
	SV *sv_camera
    PREINIT:
	SDL_Camera * c_camera;
    PPCODE:
	c_camera = (SDL_Camera *)bg_in_record_ptr(aTHX_ sv_camera, "SDL3::Camera", "SDL_CloseCamera(camera)");
	SDL_CloseCamera(c_camera);
	XSRETURN(0);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Camera", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_CAMERA_POSITION_UNKNOWN", BG_CONST_SV(SDL_CAMERA_POSITION_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_CAMERA_POSITION_FRONT_FACING", BG_CONST_SV(SDL_CAMERA_POSITION_FRONT_FACING));
	bg_export_constant(aTHX_ stash, "SDL_CAMERA_POSITION_BACK_FACING", BG_CONST_SV(SDL_CAMERA_POSITION_BACK_FACING));
	bg_export_constant(aTHX_ stash, "SDL_CAMERA_PERMISSION_STATE_DENIED", BG_CONST_SV(SDL_CAMERA_PERMISSION_STATE_DENIED));
	bg_export_constant(aTHX_ stash, "SDL_CAMERA_PERMISSION_STATE_PENDING", BG_CONST_SV(SDL_CAMERA_PERMISSION_STATE_PENDING));
	bg_export_constant(aTHX_ stash, "SDL_CAMERA_PERMISSION_STATE_APPROVED", BG_CONST_SV(SDL_CAMERA_PERMISSION_STATE_APPROVED));
	}


MODULE = SDL3  PACKAGE = SDL3::CameraSpec

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_CameraSpec), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_CameraSpec)));
	XSRETURN(1);

void
format(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_CameraSpec *self;
    PPCODE:
	self = (struct SDL_CameraSpec *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::CameraSpec", "SDL3::CameraSpec::format");
	if (items > 1) {
		self->format = (SDL_PixelFormat)bg_in_iv(aTHX_ ST(1), "SDL3::CameraSpec::format");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->format)));
	XSRETURN(1);

void
colorspace(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_CameraSpec *self;
    PPCODE:
	self = (struct SDL_CameraSpec *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::CameraSpec", "SDL3::CameraSpec::colorspace");
	if (items > 1) {
		self->colorspace = (SDL_Colorspace)bg_in_iv(aTHX_ ST(1), "SDL3::CameraSpec::colorspace");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->colorspace)));
	XSRETURN(1);

void
width(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_CameraSpec *self;
    PPCODE:
	self = (struct SDL_CameraSpec *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::CameraSpec", "SDL3::CameraSpec::width");
	if (items > 1) {
		self->width = (int)bg_in_iv(aTHX_ ST(1), "SDL3::CameraSpec::width");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->width)));
	XSRETURN(1);

void
height(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_CameraSpec *self;
    PPCODE:
	self = (struct SDL_CameraSpec *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::CameraSpec", "SDL3::CameraSpec::height");
	if (items > 1) {
		self->height = (int)bg_in_iv(aTHX_ ST(1), "SDL3::CameraSpec::height");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->height)));
	XSRETURN(1);

void
framerate_numerator(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_CameraSpec *self;
    PPCODE:
	self = (struct SDL_CameraSpec *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::CameraSpec", "SDL3::CameraSpec::framerate_numerator");
	if (items > 1) {
		self->framerate_numerator = (int)bg_in_iv(aTHX_ ST(1), "SDL3::CameraSpec::framerate_numerator");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->framerate_numerator)));
	XSRETURN(1);

void
framerate_denominator(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_CameraSpec *self;
    PPCODE:
	self = (struct SDL_CameraSpec *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::CameraSpec", "SDL3::CameraSpec::framerate_denominator");
	if (items > 1) {
		self->framerate_denominator = (int)bg_in_iv(aTHX_ ST(1), "SDL3::CameraSpec::framerate_denominator");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->framerate_denominator)));
	XSRETURN(1);
