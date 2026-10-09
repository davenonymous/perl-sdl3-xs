MODULE = SDL3  PACKAGE = SDL3::API::Thread

void
SDL_GetThreadName(sv_thread)
	SV *sv_thread
    PREINIT:
	SDL_Thread * c_thread;
	const char * c_bg_ret;
    PPCODE:
	c_thread = (SDL_Thread *)bg_in_record_ptr(aTHX_ sv_thread, "SDL3::Thread", "SDL_GetThreadName(thread)");
	c_bg_ret = SDL_GetThreadName(c_thread);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetCurrentThreadID()
    PREINIT:
	SDL_ThreadID c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetCurrentThreadID();
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetThreadID(sv_thread)
	SV *sv_thread
    PREINIT:
	SDL_Thread * c_thread;
	SDL_ThreadID c_bg_ret;
    PPCODE:
	c_thread = (SDL_Thread *)bg_in_record_ptr(aTHX_ sv_thread, "SDL3::Thread", "SDL_GetThreadID(thread)");
	c_bg_ret = SDL_GetThreadID(c_thread);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetCurrentThreadPriority(sv_priority)
	SV *sv_priority
    PREINIT:
	SDL_ThreadPriority c_priority;
	_Bool c_bg_ret;
    PPCODE:
	c_priority = (SDL_ThreadPriority)bg_in_iv(aTHX_ sv_priority, "SDL_SetCurrentThreadPriority(priority)");
	c_bg_ret = SDL_SetCurrentThreadPriority(c_priority);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WaitThread(sv_thread, sv_status)
	SV *sv_thread
	SV *sv_status
    PREINIT:
	SDL_Thread * c_thread;
	int c_status; int * p_status; SV *t_status;
    PPCODE:
	c_thread = (SDL_Thread *)bg_in_record_ptr(aTHX_ sv_thread, "SDL3::Thread", "SDL_WaitThread(thread)");
	t_status = bg_outref_target(aTHX_ sv_status);
	c_status = (t_status && SvOK(t_status)) ? (int)bg_in_iv(aTHX_ t_status, "SDL_WaitThread(status)") : (int)0;
	p_status = t_status ? &c_status : (int *)bg_outref_raw(aTHX_ sv_status, "SDL_WaitThread(status)");
	SDL_WaitThread(c_thread, p_status);
	if (t_status) sv_setsv(t_status, sv_2mortal(newSViv((IV)(c_status))));
	XSRETURN(0);

void
SDL_GetThreadState(sv_thread)
	SV *sv_thread
    PREINIT:
	SDL_Thread * c_thread;
	SDL_ThreadState c_bg_ret;
    PPCODE:
	c_thread = (SDL_Thread *)bg_in_record_ptr(aTHX_ sv_thread, "SDL3::Thread", "SDL_GetThreadState(thread)");
	c_bg_ret = SDL_GetThreadState(c_thread);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_DetachThread(sv_thread)
	SV *sv_thread
    PREINIT:
	SDL_Thread * c_thread;
    PPCODE:
	c_thread = (SDL_Thread *)bg_in_record_ptr(aTHX_ sv_thread, "SDL3::Thread", "SDL_DetachThread(thread)");
	SDL_DetachThread(c_thread);
	XSRETURN(0);

void
SDL_GetTLS(sv_id)
	SV *sv_id
    PREINIT:
	SDL_TLSID * c_id;
	void * c_bg_ret;
    PPCODE:
	c_id = (SDL_TLSID *)bg_in_record_ptr(aTHX_ sv_id, "SDL3::AtomicInt", "SDL_GetTLS(id)");
	c_bg_ret = SDL_GetTLS(c_id);
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_CleanupTLS()
    PPCODE:
	SDL_CleanupTLS();
	XSRETURN(0);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Thread", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER", BG_CONST_SV(SDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_THREAD_CREATE_NAME_STRING", BG_CONST_SV(SDL_PROP_THREAD_CREATE_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_THREAD_CREATE_STACKSIZE_NUMBER", BG_CONST_SV(SDL_PROP_THREAD_CREATE_STACKSIZE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_THREAD_CREATE_USERDATA_POINTER", BG_CONST_SV(SDL_PROP_THREAD_CREATE_USERDATA_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_THREAD_PRIORITY_LOW", BG_CONST_SV(SDL_THREAD_PRIORITY_LOW));
	bg_export_constant(aTHX_ stash, "SDL_THREAD_PRIORITY_NORMAL", BG_CONST_SV(SDL_THREAD_PRIORITY_NORMAL));
	bg_export_constant(aTHX_ stash, "SDL_THREAD_PRIORITY_HIGH", BG_CONST_SV(SDL_THREAD_PRIORITY_HIGH));
	bg_export_constant(aTHX_ stash, "SDL_THREAD_PRIORITY_TIME_CRITICAL", BG_CONST_SV(SDL_THREAD_PRIORITY_TIME_CRITICAL));
	bg_export_constant(aTHX_ stash, "SDL_THREAD_UNKNOWN", BG_CONST_SV(SDL_THREAD_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_THREAD_ALIVE", BG_CONST_SV(SDL_THREAD_ALIVE));
	bg_export_constant(aTHX_ stash, "SDL_THREAD_DETACHED", BG_CONST_SV(SDL_THREAD_DETACHED));
	bg_export_constant(aTHX_ stash, "SDL_THREAD_COMPLETE", BG_CONST_SV(SDL_THREAD_COMPLETE));
	}

