MODULE = SDL3  PACKAGE = SDL3::API::Properties

void
SDL_GetGlobalProperties()
    PREINIT:
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetGlobalProperties();
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_CreateProperties()
    PREINIT:
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_CreateProperties();
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_CopyProperties(sv_src, sv_dst)
	SV *sv_src
	SV *sv_dst
    PREINIT:
	SDL_PropertiesID c_src;
	SDL_PropertiesID c_dst;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_src, "SDL_CopyProperties(src)");
	c_dst = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_dst, "SDL_CopyProperties(dst)");
	c_bg_ret = SDL_CopyProperties(c_src, c_dst);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_LockProperties(sv_props)
	SV *sv_props
    PREINIT:
	SDL_PropertiesID c_props;
	_Bool c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_LockProperties(props)");
	c_bg_ret = SDL_LockProperties(c_props);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_UnlockProperties(sv_props)
	SV *sv_props
    PREINIT:
	SDL_PropertiesID c_props;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_UnlockProperties(props)");
	SDL_UnlockProperties(c_props);
	XSRETURN(0);

void
SDL_SetPointerProperty(sv_props, sv_name, sv_value)
	SV *sv_props
	SV *sv_name
	SV *sv_value
    PREINIT:
	SDL_PropertiesID c_props;
	const char * c_name;
	void * c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_SetPointerProperty(props)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_SetPointerProperty(name)");
	c_value = (void *)bg_in_raw_ptr(aTHX_ sv_value, "SDL_SetPointerProperty(value)");
	c_bg_ret = SDL_SetPointerProperty(c_props, c_name, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetStringProperty(sv_props, sv_name, sv_value)
	SV *sv_props
	SV *sv_name
	SV *sv_value
    PREINIT:
	SDL_PropertiesID c_props;
	const char * c_name;
	const char * c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_SetStringProperty(props)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_SetStringProperty(name)");
	c_value = (const char *)bg_in_string(aTHX_ sv_value, "SDL_SetStringProperty(value)");
	c_bg_ret = SDL_SetStringProperty(c_props, c_name, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetNumberProperty(sv_props, sv_name, sv_value)
	SV *sv_props
	SV *sv_name
	SV *sv_value
    PREINIT:
	SDL_PropertiesID c_props;
	const char * c_name;
	Sint64 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_SetNumberProperty(props)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_SetNumberProperty(name)");
	c_value = (Sint64)bg_in_iv(aTHX_ sv_value, "SDL_SetNumberProperty(value)");
	c_bg_ret = SDL_SetNumberProperty(c_props, c_name, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetFloatProperty(sv_props, sv_name, sv_value)
	SV *sv_props
	SV *sv_name
	SV *sv_value
    PREINIT:
	SDL_PropertiesID c_props;
	const char * c_name;
	float c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_SetFloatProperty(props)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_SetFloatProperty(name)");
	c_value = (float)bg_in_nv(aTHX_ sv_value, "SDL_SetFloatProperty(value)");
	c_bg_ret = SDL_SetFloatProperty(c_props, c_name, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetBooleanProperty(sv_props, sv_name, sv_value)
	SV *sv_props
	SV *sv_name
	SV *sv_value
    PREINIT:
	SDL_PropertiesID c_props;
	const char * c_name;
	_Bool c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_SetBooleanProperty(props)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_SetBooleanProperty(name)");
	c_value = (_Bool)SvTRUE(sv_value);
	c_bg_ret = SDL_SetBooleanProperty(c_props, c_name, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasProperty(sv_props, sv_name)
	SV *sv_props
	SV *sv_name
    PREINIT:
	SDL_PropertiesID c_props;
	const char * c_name;
	_Bool c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_HasProperty(props)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_HasProperty(name)");
	c_bg_ret = SDL_HasProperty(c_props, c_name);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetPropertyType(sv_props, sv_name)
	SV *sv_props
	SV *sv_name
    PREINIT:
	SDL_PropertiesID c_props;
	const char * c_name;
	SDL_PropertyType c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_GetPropertyType(props)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_GetPropertyType(name)");
	c_bg_ret = SDL_GetPropertyType(c_props, c_name);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetPointerProperty(sv_props, sv_name, sv_default_value)
	SV *sv_props
	SV *sv_name
	SV *sv_default_value
    PREINIT:
	SDL_PropertiesID c_props;
	const char * c_name;
	void * c_default_value;
	void * c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_GetPointerProperty(props)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_GetPointerProperty(name)");
	c_default_value = (void *)bg_in_raw_ptr(aTHX_ sv_default_value, "SDL_GetPointerProperty(default_value)");
	c_bg_ret = SDL_GetPointerProperty(c_props, c_name, c_default_value);
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetStringProperty(sv_props, sv_name, sv_default_value)
	SV *sv_props
	SV *sv_name
	SV *sv_default_value
    PREINIT:
	SDL_PropertiesID c_props;
	const char * c_name;
	const char * c_default_value;
	const char * c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_GetStringProperty(props)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_GetStringProperty(name)");
	c_default_value = (const char *)bg_in_string(aTHX_ sv_default_value, "SDL_GetStringProperty(default_value)");
	c_bg_ret = SDL_GetStringProperty(c_props, c_name, c_default_value);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetNumberProperty(sv_props, sv_name, sv_default_value)
	SV *sv_props
	SV *sv_name
	SV *sv_default_value
    PREINIT:
	SDL_PropertiesID c_props;
	const char * c_name;
	Sint64 c_default_value;
	Sint64 c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_GetNumberProperty(props)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_GetNumberProperty(name)");
	c_default_value = (Sint64)bg_in_iv(aTHX_ sv_default_value, "SDL_GetNumberProperty(default_value)");
	c_bg_ret = SDL_GetNumberProperty(c_props, c_name, c_default_value);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetFloatProperty(sv_props, sv_name, sv_default_value)
	SV *sv_props
	SV *sv_name
	SV *sv_default_value
    PREINIT:
	SDL_PropertiesID c_props;
	const char * c_name;
	float c_default_value;
	float c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_GetFloatProperty(props)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_GetFloatProperty(name)");
	c_default_value = (float)bg_in_nv(aTHX_ sv_default_value, "SDL_GetFloatProperty(default_value)");
	c_bg_ret = SDL_GetFloatProperty(c_props, c_name, c_default_value);
	ST(0) = sv_2mortal(newSVnv((NV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetBooleanProperty(sv_props, sv_name, sv_default_value)
	SV *sv_props
	SV *sv_name
	SV *sv_default_value
    PREINIT:
	SDL_PropertiesID c_props;
	const char * c_name;
	_Bool c_default_value;
	_Bool c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_GetBooleanProperty(props)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_GetBooleanProperty(name)");
	c_default_value = (_Bool)SvTRUE(sv_default_value);
	c_bg_ret = SDL_GetBooleanProperty(c_props, c_name, c_default_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ClearProperty(sv_props, sv_name)
	SV *sv_props
	SV *sv_name
    PREINIT:
	SDL_PropertiesID c_props;
	const char * c_name;
	_Bool c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_ClearProperty(props)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_ClearProperty(name)");
	c_bg_ret = SDL_ClearProperty(c_props, c_name);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_EnumerateProperties(sv_props, sv_callback, sv_userdata)
	SV *sv_props
	SV *sv_callback
	SV *sv_userdata
    PREINIT:
	SDL_PropertiesID c_props;
	SDL_EnumeratePropertiesCallback c_callback;
	void * c_userdata;
	_Bool c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_EnumerateProperties(props)");
	c_callback = SvOK(sv_callback) ? (SDL_EnumeratePropertiesCallback)bg_tramp_SDL_EnumeratePropertiesCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_EnumerateProperties(userdata)") : NULL;
	c_bg_ret = SDL_EnumerateProperties(c_props, c_callback, c_userdata);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_DestroyProperties(sv_props)
	SV *sv_props
    PREINIT:
	SDL_PropertiesID c_props;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_DestroyProperties(props)");
	SDL_DestroyProperties(c_props);
	XSRETURN(0);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Properties", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_PROP_NAME_STRING", BG_CONST_SV(SDL_PROP_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROPERTY_TYPE_INVALID", BG_CONST_SV(SDL_PROPERTY_TYPE_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_PROPERTY_TYPE_POINTER", BG_CONST_SV(SDL_PROPERTY_TYPE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROPERTY_TYPE_STRING", BG_CONST_SV(SDL_PROPERTY_TYPE_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROPERTY_TYPE_NUMBER", BG_CONST_SV(SDL_PROPERTY_TYPE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROPERTY_TYPE_FLOAT", BG_CONST_SV(SDL_PROPERTY_TYPE_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROPERTY_TYPE_BOOLEAN", BG_CONST_SV(SDL_PROPERTY_TYPE_BOOLEAN));
	}
