MODULE = SDL3  PACKAGE = SDL3::API::Pen

void
SDL_GetPenDeviceType(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_PenID c_instance_id;
	SDL_PenDeviceType c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_PenID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetPenDeviceType(instance_id)");
	c_bg_ret = SDL_GetPenDeviceType(c_instance_id);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Pen", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_PEN_INPUT_BUTTON_1", BG_CONST_SV(SDL_PEN_INPUT_BUTTON_1));
	bg_export_constant(aTHX_ stash, "SDL_PEN_INPUT_BUTTON_2", BG_CONST_SV(SDL_PEN_INPUT_BUTTON_2));
	bg_export_constant(aTHX_ stash, "SDL_PEN_INPUT_BUTTON_3", BG_CONST_SV(SDL_PEN_INPUT_BUTTON_3));
	bg_export_constant(aTHX_ stash, "SDL_PEN_INPUT_BUTTON_4", BG_CONST_SV(SDL_PEN_INPUT_BUTTON_4));
	bg_export_constant(aTHX_ stash, "SDL_PEN_INPUT_BUTTON_5", BG_CONST_SV(SDL_PEN_INPUT_BUTTON_5));
	bg_export_constant(aTHX_ stash, "SDL_PEN_INPUT_DOWN", BG_CONST_SV(SDL_PEN_INPUT_DOWN));
	bg_export_constant(aTHX_ stash, "SDL_PEN_INPUT_ERASER_TIP", BG_CONST_SV(SDL_PEN_INPUT_ERASER_TIP));
	bg_export_constant(aTHX_ stash, "SDL_PEN_INPUT_IN_PROXIMITY", BG_CONST_SV(SDL_PEN_INPUT_IN_PROXIMITY));
	bg_export_constant(aTHX_ stash, "SDL_PEN_MOUSEID", BG_CONST_SV(SDL_PEN_MOUSEID));
	bg_export_constant(aTHX_ stash, "SDL_PEN_TOUCHID", BG_CONST_SV(SDL_PEN_TOUCHID));
	bg_export_constant(aTHX_ stash, "SDL_PEN_AXIS_PRESSURE", BG_CONST_SV(SDL_PEN_AXIS_PRESSURE));
	bg_export_constant(aTHX_ stash, "SDL_PEN_AXIS_XTILT", BG_CONST_SV(SDL_PEN_AXIS_XTILT));
	bg_export_constant(aTHX_ stash, "SDL_PEN_AXIS_YTILT", BG_CONST_SV(SDL_PEN_AXIS_YTILT));
	bg_export_constant(aTHX_ stash, "SDL_PEN_AXIS_DISTANCE", BG_CONST_SV(SDL_PEN_AXIS_DISTANCE));
	bg_export_constant(aTHX_ stash, "SDL_PEN_AXIS_ROTATION", BG_CONST_SV(SDL_PEN_AXIS_ROTATION));
	bg_export_constant(aTHX_ stash, "SDL_PEN_AXIS_SLIDER", BG_CONST_SV(SDL_PEN_AXIS_SLIDER));
	bg_export_constant(aTHX_ stash, "SDL_PEN_AXIS_TANGENTIAL_PRESSURE", BG_CONST_SV(SDL_PEN_AXIS_TANGENTIAL_PRESSURE));
	bg_export_constant(aTHX_ stash, "SDL_PEN_AXIS_COUNT", BG_CONST_SV(SDL_PEN_AXIS_COUNT));
	bg_export_constant(aTHX_ stash, "SDL_PEN_DEVICE_TYPE_INVALID", BG_CONST_SV(SDL_PEN_DEVICE_TYPE_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_PEN_DEVICE_TYPE_UNKNOWN", BG_CONST_SV(SDL_PEN_DEVICE_TYPE_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_PEN_DEVICE_TYPE_DIRECT", BG_CONST_SV(SDL_PEN_DEVICE_TYPE_DIRECT));
	bg_export_constant(aTHX_ stash, "SDL_PEN_DEVICE_TYPE_INDIRECT", BG_CONST_SV(SDL_PEN_DEVICE_TYPE_INDIRECT));
	}
