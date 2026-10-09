MODULE = SDL3  PACKAGE = SDL3::API::Timer

void
SDL_GetTicks()
    PREINIT:
	Uint64 c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetTicks();
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetTicksNS()
    PREINIT:
	Uint64 c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetTicksNS();
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetPerformanceCounter()
    PREINIT:
	Uint64 c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetPerformanceCounter();
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetPerformanceFrequency()
    PREINIT:
	Uint64 c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetPerformanceFrequency();
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_Delay(sv_ms)
	SV *sv_ms
    PREINIT:
	Uint32 c_ms;
    PPCODE:
	c_ms = (Uint32)bg_in_uv(aTHX_ sv_ms, "SDL_Delay(ms)");
	SDL_Delay(c_ms);
	XSRETURN(0);

void
SDL_DelayNS(sv_ns)
	SV *sv_ns
    PREINIT:
	Uint64 c_ns;
    PPCODE:
	c_ns = (Uint64)bg_in_uv(aTHX_ sv_ns, "SDL_DelayNS(ns)");
	SDL_DelayNS(c_ns);
	XSRETURN(0);

void
SDL_DelayPrecise(sv_ns)
	SV *sv_ns
    PREINIT:
	Uint64 c_ns;
    PPCODE:
	c_ns = (Uint64)bg_in_uv(aTHX_ sv_ns, "SDL_DelayPrecise(ns)");
	SDL_DelayPrecise(c_ns);
	XSRETURN(0);

void
SDL_AddTimer(sv_interval, sv_callback, sv_userdata)
	SV *sv_interval
	SV *sv_callback
	SV *sv_userdata
    PREINIT:
	Uint32 c_interval;
	SDL_TimerCallback c_callback;
	void * c_userdata;
	SDL_TimerID c_bg_ret;
    PPCODE:
	c_interval = (Uint32)bg_in_uv(aTHX_ sv_interval, "SDL_AddTimer(interval)");
	c_callback = SvOK(sv_callback) ? (SDL_TimerCallback)bg_tramp_SDL_TimerCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_AddTimer(userdata)") : NULL;
	c_bg_ret = SDL_AddTimer(c_interval, c_callback, c_userdata);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_AddTimerNS(sv_interval, sv_callback, sv_userdata)
	SV *sv_interval
	SV *sv_callback
	SV *sv_userdata
    PREINIT:
	Uint64 c_interval;
	SDL_NSTimerCallback c_callback;
	void * c_userdata;
	SDL_TimerID c_bg_ret;
    PPCODE:
	c_interval = (Uint64)bg_in_uv(aTHX_ sv_interval, "SDL_AddTimerNS(interval)");
	c_callback = SvOK(sv_callback) ? (SDL_NSTimerCallback)bg_tramp_SDL_NSTimerCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_AddTimerNS(userdata)") : NULL;
	c_bg_ret = SDL_AddTimerNS(c_interval, c_callback, c_userdata);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_RemoveTimer(sv_id)
	SV *sv_id
    PREINIT:
	SDL_TimerID c_id;
	_Bool c_bg_ret;
    PPCODE:
	c_id = (SDL_TimerID)bg_in_uv(aTHX_ sv_id, "SDL_RemoveTimer(id)");
	c_bg_ret = SDL_RemoveTimer(c_id);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Timer", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_MS_PER_SECOND", BG_CONST_SV(SDL_MS_PER_SECOND));
	bg_export_constant(aTHX_ stash, "SDL_NS_PER_MS", BG_CONST_SV(SDL_NS_PER_MS));
	bg_export_constant(aTHX_ stash, "SDL_NS_PER_SECOND", BG_CONST_SV(SDL_NS_PER_SECOND));
	bg_export_constant(aTHX_ stash, "SDL_NS_PER_US", BG_CONST_SV(SDL_NS_PER_US));
	bg_export_constant(aTHX_ stash, "SDL_US_PER_SECOND", BG_CONST_SV(SDL_US_PER_SECOND));
	}
