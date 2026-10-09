static SDL_AssertState bg_tramp_SDL_AssertionHandler(const SDL_AssertData * a0, void * a1) {
	bg_callback_holder *holder = (bg_callback_holder *)a1;
	dTHXa(holder->perl);
	dSP;
	int count;
	SDL_AssertState c_bg_ret;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 2);
	mPUSHs(bg_out_record_ptr(aTHX_ (void *)(a0), "SDL3::AssertData"));
	PUSHs(holder->data);
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_SCALAR);
	SPAGAIN;
	memset(&c_bg_ret, 0, sizeof(c_bg_ret));
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_AssertionHandler died: %" SVf, SVfARG(ERRSV));
	}
	else if (count > 0) {
		c_bg_ret = (SDL_AssertState)bg_in_iv(aTHX_ POPs, "callback SDL_AssertionHandler return value");
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
	return c_bg_ret;
}

static void bg_tramp_SDL_AudioPostmixCallback(void * a0, const SDL_AudioSpec * a1, float * a2, int a3) {
	bg_callback_holder *holder = (bg_callback_holder *)a0;
	dTHXa(holder->perl);
	dSP;
	int count;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 4);
	PUSHs(holder->data);
	mPUSHs(bg_out_record_ptr(aTHX_ (void *)(a1), "SDL3::AudioSpec"));
	mPUSHs(bg_out_raw_ptr(aTHX_ (void *)(a2), "SDL3::Pointer"));
	mPUSHs(newSViv((IV)(a3)));
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_DISCARD);
	SPAGAIN;
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_AudioPostmixCallback died: %" SVf, SVfARG(ERRSV));
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
}

static void bg_tramp_SDL_AudioStreamCallback(void * a0, SDL_AudioStream * a1, int a2, int a3) {
	bg_callback_holder *holder = (bg_callback_holder *)a0;
	dTHXa(holder->perl);
	dSP;
	int count;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 4);
	PUSHs(holder->data);
	mPUSHs(bg_out_record_ptr(aTHX_ (void *)(a1), "SDL3::AudioStream"));
	mPUSHs(newSViv((IV)(a2)));
	mPUSHs(newSViv((IV)(a3)));
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_DISCARD);
	SPAGAIN;
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_AudioStreamCallback died: %" SVf, SVfARG(ERRSV));
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
}

static void bg_tramp_SDL_AudioStreamDataCompleteCallback(void * a0, const void * a1, int a2) {
	bg_callback_holder *holder = (bg_callback_holder *)a0;
	dTHXa(holder->perl);
	dSP;
	int count;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 3);
	PUSHs(holder->data);
	mPUSHs(bg_out_raw_ptr(aTHX_ (void *)(a1), "SDL3::Pointer"));
	mPUSHs(newSViv((IV)(a2)));
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_DISCARD);
	SPAGAIN;
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_AudioStreamDataCompleteCallback died: %" SVf, SVfARG(ERRSV));
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
}

static void bg_tramp_SDL_DialogFileCallback(void * a0, const char * const * a1, int a2) {
	bg_callback_holder *holder = (bg_callback_holder *)a0;
	dTHXa(holder->perl);
	dSP;
	int count;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 3);
	PUSHs(holder->data);
	mPUSHs(bg_out_raw_ptr(aTHX_ (void *)(a1), "SDL3::Pointer"));
	mPUSHs(newSViv((IV)(a2)));
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_DISCARD);
	SPAGAIN;
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_DialogFileCallback died: %" SVf, SVfARG(ERRSV));
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
}

static SDL_EnumerationResult bg_tramp_SDL_EnumerateDirectoryCallback(void * a0, const char * a1, const char * a2) {
	bg_callback_holder *holder = (bg_callback_holder *)a0;
	dTHXa(holder->perl);
	dSP;
	int count;
	SDL_EnumerationResult c_bg_ret;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 3);
	PUSHs(holder->data);
	mPUSHs(bg_out_string(aTHX_ (const char *)(a1)));
	mPUSHs(bg_out_string(aTHX_ (const char *)(a2)));
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_SCALAR);
	SPAGAIN;
	memset(&c_bg_ret, 0, sizeof(c_bg_ret));
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_EnumerateDirectoryCallback died: %" SVf, SVfARG(ERRSV));
	}
	else if (count > 0) {
		c_bg_ret = (SDL_EnumerationResult)bg_in_iv(aTHX_ POPs, "callback SDL_EnumerateDirectoryCallback return value");
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
	return c_bg_ret;
}

static void bg_tramp_SDL_EnumeratePropertiesCallback(void * a0, SDL_PropertiesID a1, const char * a2) {
	bg_callback_holder *holder = (bg_callback_holder *)a0;
	dTHXa(holder->perl);
	dSP;
	int count;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 3);
	PUSHs(holder->data);
	mPUSHs(newSVuv((UV)(a1)));
	mPUSHs(bg_out_string(aTHX_ (const char *)(a2)));
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_DISCARD);
	SPAGAIN;
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_EnumeratePropertiesCallback died: %" SVf, SVfARG(ERRSV));
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
}

static _Bool bg_tramp_SDL_EventFilter(void * a0, SDL_Event * a1) {
	bg_callback_holder *holder = (bg_callback_holder *)a0;
	dTHXa(holder->perl);
	dSP;
	int count;
	_Bool c_bg_ret;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 2);
	PUSHs(holder->data);
	mPUSHs(bg_out_record_ptr(aTHX_ (void *)(a1), "SDL3::Event"));
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_SCALAR);
	SPAGAIN;
	memset(&c_bg_ret, 0, sizeof(c_bg_ret));
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_EventFilter died: %" SVf, SVfARG(ERRSV));
	}
	else if (count > 0) {
		c_bg_ret = (_Bool)SvTRUE(POPs);
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
	return c_bg_ret;
}

static void bg_tramp_SDL_HintCallback(void * a0, const char * a1, const char * a2, const char * a3) {
	bg_callback_holder *holder = (bg_callback_holder *)a0;
	dTHXa(holder->perl);
	dSP;
	int count;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 4);
	PUSHs(holder->data);
	mPUSHs(bg_out_string(aTHX_ (const char *)(a1)));
	mPUSHs(bg_out_string(aTHX_ (const char *)(a2)));
	mPUSHs(bg_out_string(aTHX_ (const char *)(a3)));
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_DISCARD);
	SPAGAIN;
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_HintCallback died: %" SVf, SVfARG(ERRSV));
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
}

static SDL_HitTestResult bg_tramp_SDL_HitTest(SDL_Window * a0, const SDL_Point * a1, void * a2) {
	bg_callback_holder *holder = (bg_callback_holder *)a2;
	dTHXa(holder->perl);
	dSP;
	int count;
	SDL_HitTestResult c_bg_ret;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 3);
	mPUSHs(bg_out_record_ptr(aTHX_ (void *)(a0), "SDL3::Window"));
	mPUSHs(bg_out_record_ptr(aTHX_ (void *)(a1), "SDL3::Point"));
	PUSHs(holder->data);
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_SCALAR);
	SPAGAIN;
	memset(&c_bg_ret, 0, sizeof(c_bg_ret));
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_HitTest died: %" SVf, SVfARG(ERRSV));
	}
	else if (count > 0) {
		c_bg_ret = (SDL_HitTestResult)bg_in_iv(aTHX_ POPs, "callback SDL_HitTest return value");
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
	return c_bg_ret;
}

static void bg_tramp_SDL_LogOutputFunction(void * a0, int a1, SDL_LogPriority a2, const char * a3) {
	bg_callback_holder *holder = (bg_callback_holder *)a0;
	dTHXa(holder->perl);
	dSP;
	int count;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 4);
	PUSHs(holder->data);
	mPUSHs(newSViv((IV)(a1)));
	mPUSHs(newSViv((IV)(a2)));
	mPUSHs(bg_out_string(aTHX_ (const char *)(a3)));
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_DISCARD);
	SPAGAIN;
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_LogOutputFunction died: %" SVf, SVfARG(ERRSV));
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
}

static void bg_tramp_SDL_MainThreadCallback(void * a0) {
	bg_callback_holder *holder = (bg_callback_holder *)a0;
	dTHXa(holder->perl);
	dSP;
	int count;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 1);
	PUSHs(holder->data);
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_DISCARD);
	SPAGAIN;
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_MainThreadCallback died: %" SVf, SVfARG(ERRSV));
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
}

static void bg_tramp_SDL_MouseMotionTransformCallback(void * a0, Uint64 a1, SDL_Window * a2, SDL_MouseID a3, float * a4, float * a5) {
	bg_callback_holder *holder = (bg_callback_holder *)a0;
	dTHXa(holder->perl);
	dSP;
	int count;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 6);
	PUSHs(holder->data);
	mPUSHs(newSVuv((UV)(a1)));
	mPUSHs(bg_out_record_ptr(aTHX_ (void *)(a2), "SDL3::Window"));
	mPUSHs(newSVuv((UV)(a3)));
	mPUSHs(bg_out_raw_ptr(aTHX_ (void *)(a4), "SDL3::Pointer"));
	mPUSHs(bg_out_raw_ptr(aTHX_ (void *)(a5), "SDL3::Pointer"));
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_DISCARD);
	SPAGAIN;
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_MouseMotionTransformCallback died: %" SVf, SVfARG(ERRSV));
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
}

static Uint64 bg_tramp_SDL_NSTimerCallback(void * a0, SDL_TimerID a1, Uint64 a2) {
	bg_callback_holder *holder = (bg_callback_holder *)a0;
	dTHXa(holder->perl);
	dSP;
	int count;
	Uint64 c_bg_ret;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 3);
	PUSHs(holder->data);
	mPUSHs(newSVuv((UV)(a1)));
	mPUSHs(newSVuv((UV)(a2)));
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_SCALAR);
	SPAGAIN;
	memset(&c_bg_ret, 0, sizeof(c_bg_ret));
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_NSTimerCallback died: %" SVf, SVfARG(ERRSV));
	}
	else if (count > 0) {
		c_bg_ret = (Uint64)bg_in_uv(aTHX_ POPs, "callback SDL_NSTimerCallback return value");
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
	return c_bg_ret;
}

static Uint32 bg_tramp_SDL_TimerCallback(void * a0, SDL_TimerID a1, Uint32 a2) {
	bg_callback_holder *holder = (bg_callback_holder *)a0;
	dTHXa(holder->perl);
	dSP;
	int count;
	Uint32 c_bg_ret;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 3);
	PUSHs(holder->data);
	mPUSHs(newSVuv((UV)(a1)));
	mPUSHs(newSVuv((UV)(a2)));
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_SCALAR);
	SPAGAIN;
	memset(&c_bg_ret, 0, sizeof(c_bg_ret));
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_TimerCallback died: %" SVf, SVfARG(ERRSV));
	}
	else if (count > 0) {
		c_bg_ret = (Uint32)bg_in_uv(aTHX_ POPs, "callback SDL_TimerCallback return value");
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
	return c_bg_ret;
}

static void bg_tramp_SDL_TrayCallback(void * a0, SDL_TrayEntry * a1) {
	bg_callback_holder *holder = (bg_callback_holder *)a0;
	dTHXa(holder->perl);
	dSP;
	int count;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	EXTEND(SP, 2);
	PUSHs(holder->data);
	mPUSHs(bg_out_record_ptr(aTHX_ (void *)(a1), "SDL3::TrayEntry"));
	PUTBACK;
	count = call_sv(holder->code, G_EVAL | G_DISCARD);
	SPAGAIN;
	if (SvTRUE(ERRSV)) {
		warn("callback SDL_TrayCallback died: %" SVf, SVfARG(ERRSV));
	}
	PUTBACK;
	FREETMPS;
	LEAVE;
}

