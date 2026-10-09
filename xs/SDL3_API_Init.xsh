MODULE = SDL3  PACKAGE = SDL3::API::Init

void
SDL_Init(sv_flags)
	SV *sv_flags
    PREINIT:
	SDL_InitFlags c_flags;
	_Bool c_bg_ret;
    PPCODE:
	c_flags = (SDL_InitFlags)bg_in_uv(aTHX_ sv_flags, "SDL_Init(flags)");
	c_bg_ret = SDL_Init(c_flags);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_InitSubSystem(sv_flags)
	SV *sv_flags
    PREINIT:
	SDL_InitFlags c_flags;
	_Bool c_bg_ret;
    PPCODE:
	c_flags = (SDL_InitFlags)bg_in_uv(aTHX_ sv_flags, "SDL_InitSubSystem(flags)");
	c_bg_ret = SDL_InitSubSystem(c_flags);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_QuitSubSystem(sv_flags)
	SV *sv_flags
    PREINIT:
	SDL_InitFlags c_flags;
    PPCODE:
	c_flags = (SDL_InitFlags)bg_in_uv(aTHX_ sv_flags, "SDL_QuitSubSystem(flags)");
	SDL_QuitSubSystem(c_flags);
	XSRETURN(0);

void
SDL_WasInit(sv_flags)
	SV *sv_flags
    PREINIT:
	SDL_InitFlags c_flags;
	SDL_InitFlags c_bg_ret;
    PPCODE:
	c_flags = (SDL_InitFlags)bg_in_uv(aTHX_ sv_flags, "SDL_WasInit(flags)");
	c_bg_ret = SDL_WasInit(c_flags);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_Quit()
    PPCODE:
	SDL_Quit();
	XSRETURN(0);

void
SDL_IsMainThread()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_IsMainThread();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RunOnMainThread(sv_callback, sv_userdata, sv_wait_complete)
	SV *sv_callback
	SV *sv_userdata
	SV *sv_wait_complete
    PREINIT:
	SDL_MainThreadCallback c_callback;
	void * c_userdata;
	_Bool c_wait_complete;
	_Bool c_bg_ret;
    PPCODE:
	c_callback = SvOK(sv_callback) ? (SDL_MainThreadCallback)bg_tramp_SDL_MainThreadCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_RunOnMainThread(userdata)") : NULL;
	c_wait_complete = (_Bool)SvTRUE(sv_wait_complete);
	c_bg_ret = SDL_RunOnMainThread(c_callback, c_userdata, c_wait_complete);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetAppMetadata(sv_appname, sv_appversion, sv_appidentifier)
	SV *sv_appname
	SV *sv_appversion
	SV *sv_appidentifier
    PREINIT:
	const char * c_appname;
	const char * c_appversion;
	const char * c_appidentifier;
	_Bool c_bg_ret;
    PPCODE:
	c_appname = (const char *)bg_in_string(aTHX_ sv_appname, "SDL_SetAppMetadata(appname)");
	c_appversion = (const char *)bg_in_string(aTHX_ sv_appversion, "SDL_SetAppMetadata(appversion)");
	c_appidentifier = (const char *)bg_in_string(aTHX_ sv_appidentifier, "SDL_SetAppMetadata(appidentifier)");
	c_bg_ret = SDL_SetAppMetadata(c_appname, c_appversion, c_appidentifier);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetAppMetadataProperty(sv_name, sv_value)
	SV *sv_name
	SV *sv_value
    PREINIT:
	const char * c_name;
	const char * c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_SetAppMetadataProperty(name)");
	c_value = (const char *)bg_in_string(aTHX_ sv_value, "SDL_SetAppMetadataProperty(value)");
	c_bg_ret = SDL_SetAppMetadataProperty(c_name, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAppMetadataProperty(sv_name)
	SV *sv_name
    PREINIT:
	const char * c_name;
	const char * c_bg_ret;
    PPCODE:
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_GetAppMetadataProperty(name)");
	c_bg_ret = SDL_GetAppMetadataProperty(c_name);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Init", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_INIT_AUDIO", BG_CONST_SV(SDL_INIT_AUDIO));
	bg_export_constant(aTHX_ stash, "SDL_INIT_CAMERA", BG_CONST_SV(SDL_INIT_CAMERA));
	bg_export_constant(aTHX_ stash, "SDL_INIT_EVENTS", BG_CONST_SV(SDL_INIT_EVENTS));
	bg_export_constant(aTHX_ stash, "SDL_INIT_GAMEPAD", BG_CONST_SV(SDL_INIT_GAMEPAD));
	bg_export_constant(aTHX_ stash, "SDL_INIT_HAPTIC", BG_CONST_SV(SDL_INIT_HAPTIC));
	bg_export_constant(aTHX_ stash, "SDL_INIT_JOYSTICK", BG_CONST_SV(SDL_INIT_JOYSTICK));
	bg_export_constant(aTHX_ stash, "SDL_INIT_SENSOR", BG_CONST_SV(SDL_INIT_SENSOR));
	bg_export_constant(aTHX_ stash, "SDL_INIT_VIDEO", BG_CONST_SV(SDL_INIT_VIDEO));
	bg_export_constant(aTHX_ stash, "SDL_PROP_APP_METADATA_COPYRIGHT_STRING", BG_CONST_SV(SDL_PROP_APP_METADATA_COPYRIGHT_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_APP_METADATA_CREATOR_STRING", BG_CONST_SV(SDL_PROP_APP_METADATA_CREATOR_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_APP_METADATA_IDENTIFIER_STRING", BG_CONST_SV(SDL_PROP_APP_METADATA_IDENTIFIER_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_APP_METADATA_NAME_STRING", BG_CONST_SV(SDL_PROP_APP_METADATA_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_APP_METADATA_TYPE_STRING", BG_CONST_SV(SDL_PROP_APP_METADATA_TYPE_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_APP_METADATA_URL_STRING", BG_CONST_SV(SDL_PROP_APP_METADATA_URL_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_APP_METADATA_VERSION_STRING", BG_CONST_SV(SDL_PROP_APP_METADATA_VERSION_STRING));
	bg_export_constant(aTHX_ stash, "SDL_APP_CONTINUE", BG_CONST_SV(SDL_APP_CONTINUE));
	bg_export_constant(aTHX_ stash, "SDL_APP_SUCCESS", BG_CONST_SV(SDL_APP_SUCCESS));
	bg_export_constant(aTHX_ stash, "SDL_APP_FAILURE", BG_CONST_SV(SDL_APP_FAILURE));
	}
