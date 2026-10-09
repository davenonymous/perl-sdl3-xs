MODULE = SDL3  PACKAGE = SDL3::API::Touch

void
SDL_GetTouchDevices(sv_count)
	SV *sv_count
    PREINIT:
	int c_count; int * p_count; SV *t_count;
	SDL_TouchID * c_bg_ret;
    PPCODE:
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetTouchDevices(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetTouchDevices(count)");
	c_bg_ret = SDL_GetTouchDevices(p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetTouchDeviceName(sv_touchID)
	SV *sv_touchID
    PREINIT:
	SDL_TouchID c_touchID;
	const char * c_bg_ret;
    PPCODE:
	c_touchID = (SDL_TouchID)bg_in_uv(aTHX_ sv_touchID, "SDL_GetTouchDeviceName(touchID)");
	c_bg_ret = SDL_GetTouchDeviceName(c_touchID);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetTouchDeviceType(sv_touchID)
	SV *sv_touchID
    PREINIT:
	SDL_TouchID c_touchID;
	SDL_TouchDeviceType c_bg_ret;
    PPCODE:
	c_touchID = (SDL_TouchID)bg_in_uv(aTHX_ sv_touchID, "SDL_GetTouchDeviceType(touchID)");
	c_bg_ret = SDL_GetTouchDeviceType(c_touchID);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetTouchFingers(sv_touchID, sv_count)
	SV *sv_touchID
	SV *sv_count
    PREINIT:
	SDL_TouchID c_touchID;
	int c_count; int * p_count; SV *t_count;
	SDL_Finger ** c_bg_ret;
    PPCODE:
	c_touchID = (SDL_TouchID)bg_in_uv(aTHX_ sv_touchID, "SDL_GetTouchFingers(touchID)");
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetTouchFingers(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetTouchFingers(count)");
	c_bg_ret = SDL_GetTouchFingers(c_touchID, p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Touch", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_MOUSE_TOUCHID", BG_CONST_SV(SDL_MOUSE_TOUCHID));
	bg_export_constant(aTHX_ stash, "SDL_TOUCH_MOUSEID", BG_CONST_SV(SDL_TOUCH_MOUSEID));
	bg_export_constant(aTHX_ stash, "SDL_TOUCH_DEVICE_INVALID", BG_CONST_SV(SDL_TOUCH_DEVICE_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_TOUCH_DEVICE_DIRECT", BG_CONST_SV(SDL_TOUCH_DEVICE_DIRECT));
	bg_export_constant(aTHX_ stash, "SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE", BG_CONST_SV(SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE));
	bg_export_constant(aTHX_ stash, "SDL_TOUCH_DEVICE_INDIRECT_RELATIVE", BG_CONST_SV(SDL_TOUCH_DEVICE_INDIRECT_RELATIVE));
	}

MODULE = SDL3  PACKAGE = SDL3::Finger

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_Finger), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_Finger)));
	XSRETURN(1);

void
id(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Finger *self;
    PPCODE:
	self = (struct SDL_Finger *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Finger", "SDL3::Finger::id");
	if (items > 1) {
		self->id = (SDL_FingerID)bg_in_uv(aTHX_ ST(1), "SDL3::Finger::id");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->id)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Finger *self;
    PPCODE:
	self = (struct SDL_Finger *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Finger", "SDL3::Finger::x");
	if (items > 1) {
		self->x = (float)bg_in_nv(aTHX_ ST(1), "SDL3::Finger::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Finger *self;
    PPCODE:
	self = (struct SDL_Finger *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Finger", "SDL3::Finger::y");
	if (items > 1) {
		self->y = (float)bg_in_nv(aTHX_ ST(1), "SDL3::Finger::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->y)));
	XSRETURN(1);

void
pressure(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Finger *self;
    PPCODE:
	self = (struct SDL_Finger *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Finger", "SDL3::Finger::pressure");
	if (items > 1) {
		self->pressure = (float)bg_in_nv(aTHX_ ST(1), "SDL3::Finger::pressure");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->pressure)));
	XSRETURN(1);
