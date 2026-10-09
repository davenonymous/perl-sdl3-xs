MODULE = SDL3  PACKAGE = SDL3::API::Log

void
SDL_SetLogPriorities(sv_priority)
	SV *sv_priority
    PREINIT:
	SDL_LogPriority c_priority;
    PPCODE:
	c_priority = (SDL_LogPriority)bg_in_iv(aTHX_ sv_priority, "SDL_SetLogPriorities(priority)");
	SDL_SetLogPriorities(c_priority);
	XSRETURN(0);

void
SDL_SetLogPriority(sv_category, sv_priority)
	SV *sv_category
	SV *sv_priority
    PREINIT:
	int c_category;
	SDL_LogPriority c_priority;
    PPCODE:
	c_category = (int)bg_in_iv(aTHX_ sv_category, "SDL_SetLogPriority(category)");
	c_priority = (SDL_LogPriority)bg_in_iv(aTHX_ sv_priority, "SDL_SetLogPriority(priority)");
	SDL_SetLogPriority(c_category, c_priority);
	XSRETURN(0);

void
SDL_GetLogPriority(sv_category)
	SV *sv_category
    PREINIT:
	int c_category;
	SDL_LogPriority c_bg_ret;
    PPCODE:
	c_category = (int)bg_in_iv(aTHX_ sv_category, "SDL_GetLogPriority(category)");
	c_bg_ret = SDL_GetLogPriority(c_category);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_ResetLogPriorities()
    PPCODE:
	SDL_ResetLogPriorities();
	XSRETURN(0);

void
SDL_SetLogPriorityPrefix(sv_priority, sv_prefix)
	SV *sv_priority
	SV *sv_prefix
    PREINIT:
	SDL_LogPriority c_priority;
	const char * c_prefix;
	_Bool c_bg_ret;
    PPCODE:
	c_priority = (SDL_LogPriority)bg_in_iv(aTHX_ sv_priority, "SDL_SetLogPriorityPrefix(priority)");
	c_prefix = (const char *)bg_in_string(aTHX_ sv_prefix, "SDL_SetLogPriorityPrefix(prefix)");
	c_bg_ret = SDL_SetLogPriorityPrefix(c_priority, c_prefix);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_Log(sv_message)
	SV *sv_message
    PREINIT:
	const char *c_message;
    PPCODE:
	c_message = bg_in_string(aTHX_ sv_message, "SDL_Log(message)");
	SDL_Log("%s", (c_message ? c_message : ""));
	XSRETURN(0);

void
SDL_LogTrace(sv_category, sv_message)
	SV *sv_category
	SV *sv_message
    PREINIT:
	int c_category;
	const char *c_message;
    PPCODE:
	c_category = (int)bg_in_iv(aTHX_ sv_category, "SDL_LogTrace(category)");
	c_message = bg_in_string(aTHX_ sv_message, "SDL_LogTrace(message)");
	SDL_LogTrace(c_category, "%s", (c_message ? c_message : ""));
	XSRETURN(0);

void
SDL_LogVerbose(sv_category, sv_message)
	SV *sv_category
	SV *sv_message
    PREINIT:
	int c_category;
	const char *c_message;
    PPCODE:
	c_category = (int)bg_in_iv(aTHX_ sv_category, "SDL_LogVerbose(category)");
	c_message = bg_in_string(aTHX_ sv_message, "SDL_LogVerbose(message)");
	SDL_LogVerbose(c_category, "%s", (c_message ? c_message : ""));
	XSRETURN(0);

void
SDL_LogDebug(sv_category, sv_message)
	SV *sv_category
	SV *sv_message
    PREINIT:
	int c_category;
	const char *c_message;
    PPCODE:
	c_category = (int)bg_in_iv(aTHX_ sv_category, "SDL_LogDebug(category)");
	c_message = bg_in_string(aTHX_ sv_message, "SDL_LogDebug(message)");
	SDL_LogDebug(c_category, "%s", (c_message ? c_message : ""));
	XSRETURN(0);

void
SDL_LogInfo(sv_category, sv_message)
	SV *sv_category
	SV *sv_message
    PREINIT:
	int c_category;
	const char *c_message;
    PPCODE:
	c_category = (int)bg_in_iv(aTHX_ sv_category, "SDL_LogInfo(category)");
	c_message = bg_in_string(aTHX_ sv_message, "SDL_LogInfo(message)");
	SDL_LogInfo(c_category, "%s", (c_message ? c_message : ""));
	XSRETURN(0);

void
SDL_LogWarn(sv_category, sv_message)
	SV *sv_category
	SV *sv_message
    PREINIT:
	int c_category;
	const char *c_message;
    PPCODE:
	c_category = (int)bg_in_iv(aTHX_ sv_category, "SDL_LogWarn(category)");
	c_message = bg_in_string(aTHX_ sv_message, "SDL_LogWarn(message)");
	SDL_LogWarn(c_category, "%s", (c_message ? c_message : ""));
	XSRETURN(0);

void
SDL_LogError(sv_category, sv_message)
	SV *sv_category
	SV *sv_message
    PREINIT:
	int c_category;
	const char *c_message;
    PPCODE:
	c_category = (int)bg_in_iv(aTHX_ sv_category, "SDL_LogError(category)");
	c_message = bg_in_string(aTHX_ sv_message, "SDL_LogError(message)");
	SDL_LogError(c_category, "%s", (c_message ? c_message : ""));
	XSRETURN(0);

void
SDL_LogCritical(sv_category, sv_message)
	SV *sv_category
	SV *sv_message
    PREINIT:
	int c_category;
	const char *c_message;
    PPCODE:
	c_category = (int)bg_in_iv(aTHX_ sv_category, "SDL_LogCritical(category)");
	c_message = bg_in_string(aTHX_ sv_message, "SDL_LogCritical(message)");
	SDL_LogCritical(c_category, "%s", (c_message ? c_message : ""));
	XSRETURN(0);

void
SDL_LogMessage(sv_category, sv_priority, sv_message)
	SV *sv_category
	SV *sv_priority
	SV *sv_message
    PREINIT:
	int c_category;
	SDL_LogPriority c_priority;
	const char *c_message;
    PPCODE:
	c_category = (int)bg_in_iv(aTHX_ sv_category, "SDL_LogMessage(category)");
	c_priority = (SDL_LogPriority)bg_in_iv(aTHX_ sv_priority, "SDL_LogMessage(priority)");
	c_message = bg_in_string(aTHX_ sv_message, "SDL_LogMessage(message)");
	SDL_LogMessage(c_category, c_priority, "%s", (c_message ? c_message : ""));
	XSRETURN(0);

void
SDL_GetDefaultLogOutputFunction()
    PREINIT:
	SDL_LogOutputFunction c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetDefaultLogOutputFunction();
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetLogOutputFunction(sv_callback, sv_userdata)
	SV *sv_callback
	SV *sv_userdata
    PREINIT:
	SDL_LogOutputFunction c_callback; SDL_LogOutputFunction * p_callback; SV *t_callback;
	void * c_userdata; void ** p_userdata; SV *t_userdata;
    PPCODE:
	t_callback = bg_outref_target(aTHX_ sv_callback);
	c_callback = (t_callback && SvOK(t_callback)) ? (SDL_LogOutputFunction)bg_in_raw_ptr(aTHX_ t_callback, "SDL_GetLogOutputFunction(callback)") : (SDL_LogOutputFunction)0;
	p_callback = t_callback ? &c_callback : (SDL_LogOutputFunction *)bg_outref_raw(aTHX_ sv_callback, "SDL_GetLogOutputFunction(callback)");
	t_userdata = bg_outref_target(aTHX_ sv_userdata);
	c_userdata = (t_userdata && SvOK(t_userdata)) ? (void *)bg_in_raw_ptr(aTHX_ t_userdata, "SDL_GetLogOutputFunction(userdata)") : (void *)0;
	p_userdata = t_userdata ? &c_userdata : (void **)bg_outref_raw(aTHX_ sv_userdata, "SDL_GetLogOutputFunction(userdata)");
	SDL_GetLogOutputFunction(p_callback, p_userdata);
	if (t_callback) sv_setsv(t_callback, sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_callback), "SDL3::Pointer")));
	if (t_userdata) sv_setsv(t_userdata, sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_userdata), "SDL3::Pointer")));
	XSRETURN(0);

void
SDL_SetLogOutputFunction(sv_callback, sv_userdata)
	SV *sv_callback
	SV *sv_userdata
    PREINIT:
	SDL_LogOutputFunction c_callback;
	void * c_userdata;
    PPCODE:
	c_callback = SvOK(sv_callback) ? (SDL_LogOutputFunction)bg_tramp_SDL_LogOutputFunction : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_SetLogOutputFunction(userdata)") : NULL;
	SDL_SetLogOutputFunction(c_callback, c_userdata);
	XSRETURN(0);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Log", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_APPLICATION", BG_CONST_SV(SDL_LOG_CATEGORY_APPLICATION));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_ERROR", BG_CONST_SV(SDL_LOG_CATEGORY_ERROR));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_ASSERT", BG_CONST_SV(SDL_LOG_CATEGORY_ASSERT));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_SYSTEM", BG_CONST_SV(SDL_LOG_CATEGORY_SYSTEM));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_AUDIO", BG_CONST_SV(SDL_LOG_CATEGORY_AUDIO));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_VIDEO", BG_CONST_SV(SDL_LOG_CATEGORY_VIDEO));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_RENDER", BG_CONST_SV(SDL_LOG_CATEGORY_RENDER));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_INPUT", BG_CONST_SV(SDL_LOG_CATEGORY_INPUT));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_TEST", BG_CONST_SV(SDL_LOG_CATEGORY_TEST));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_GPU", BG_CONST_SV(SDL_LOG_CATEGORY_GPU));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_RESERVED2", BG_CONST_SV(SDL_LOG_CATEGORY_RESERVED2));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_RESERVED3", BG_CONST_SV(SDL_LOG_CATEGORY_RESERVED3));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_RESERVED4", BG_CONST_SV(SDL_LOG_CATEGORY_RESERVED4));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_RESERVED5", BG_CONST_SV(SDL_LOG_CATEGORY_RESERVED5));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_RESERVED6", BG_CONST_SV(SDL_LOG_CATEGORY_RESERVED6));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_RESERVED7", BG_CONST_SV(SDL_LOG_CATEGORY_RESERVED7));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_RESERVED8", BG_CONST_SV(SDL_LOG_CATEGORY_RESERVED8));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_RESERVED9", BG_CONST_SV(SDL_LOG_CATEGORY_RESERVED9));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_RESERVED10", BG_CONST_SV(SDL_LOG_CATEGORY_RESERVED10));
	bg_export_constant(aTHX_ stash, "SDL_LOG_CATEGORY_CUSTOM", BG_CONST_SV(SDL_LOG_CATEGORY_CUSTOM));
	bg_export_constant(aTHX_ stash, "SDL_LOG_PRIORITY_INVALID", BG_CONST_SV(SDL_LOG_PRIORITY_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_LOG_PRIORITY_TRACE", BG_CONST_SV(SDL_LOG_PRIORITY_TRACE));
	bg_export_constant(aTHX_ stash, "SDL_LOG_PRIORITY_VERBOSE", BG_CONST_SV(SDL_LOG_PRIORITY_VERBOSE));
	bg_export_constant(aTHX_ stash, "SDL_LOG_PRIORITY_DEBUG", BG_CONST_SV(SDL_LOG_PRIORITY_DEBUG));
	bg_export_constant(aTHX_ stash, "SDL_LOG_PRIORITY_INFO", BG_CONST_SV(SDL_LOG_PRIORITY_INFO));
	bg_export_constant(aTHX_ stash, "SDL_LOG_PRIORITY_WARN", BG_CONST_SV(SDL_LOG_PRIORITY_WARN));
	bg_export_constant(aTHX_ stash, "SDL_LOG_PRIORITY_ERROR", BG_CONST_SV(SDL_LOG_PRIORITY_ERROR));
	bg_export_constant(aTHX_ stash, "SDL_LOG_PRIORITY_CRITICAL", BG_CONST_SV(SDL_LOG_PRIORITY_CRITICAL));
	bg_export_constant(aTHX_ stash, "SDL_LOG_PRIORITY_COUNT", BG_CONST_SV(SDL_LOG_PRIORITY_COUNT));
	}
