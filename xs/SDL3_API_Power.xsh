MODULE = SDL3  PACKAGE = SDL3::API::Power

void
SDL_GetPowerInfo(sv_seconds, sv_percent)
	SV *sv_seconds
	SV *sv_percent
    PREINIT:
	int c_seconds; int * p_seconds; SV *t_seconds;
	int c_percent; int * p_percent; SV *t_percent;
	SDL_PowerState c_bg_ret;
    PPCODE:
	t_seconds = bg_outref_target(aTHX_ sv_seconds);
	c_seconds = (t_seconds && SvOK(t_seconds)) ? (int)bg_in_iv(aTHX_ t_seconds, "SDL_GetPowerInfo(seconds)") : (int)0;
	p_seconds = t_seconds ? &c_seconds : (int *)bg_outref_raw(aTHX_ sv_seconds, "SDL_GetPowerInfo(seconds)");
	t_percent = bg_outref_target(aTHX_ sv_percent);
	c_percent = (t_percent && SvOK(t_percent)) ? (int)bg_in_iv(aTHX_ t_percent, "SDL_GetPowerInfo(percent)") : (int)0;
	p_percent = t_percent ? &c_percent : (int *)bg_outref_raw(aTHX_ sv_percent, "SDL_GetPowerInfo(percent)");
	c_bg_ret = SDL_GetPowerInfo(p_seconds, p_percent);
	if (t_seconds) sv_setsv(t_seconds, sv_2mortal(newSViv((IV)(c_seconds))));
	if (t_percent) sv_setsv(t_percent, sv_2mortal(newSViv((IV)(c_percent))));
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Power", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_POWERSTATE_ERROR", BG_CONST_SV(SDL_POWERSTATE_ERROR));
	bg_export_constant(aTHX_ stash, "SDL_POWERSTATE_UNKNOWN", BG_CONST_SV(SDL_POWERSTATE_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_POWERSTATE_ON_BATTERY", BG_CONST_SV(SDL_POWERSTATE_ON_BATTERY));
	bg_export_constant(aTHX_ stash, "SDL_POWERSTATE_NO_BATTERY", BG_CONST_SV(SDL_POWERSTATE_NO_BATTERY));
	bg_export_constant(aTHX_ stash, "SDL_POWERSTATE_CHARGING", BG_CONST_SV(SDL_POWERSTATE_CHARGING));
	bg_export_constant(aTHX_ stash, "SDL_POWERSTATE_CHARGED", BG_CONST_SV(SDL_POWERSTATE_CHARGED));
	}
