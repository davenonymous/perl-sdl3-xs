MODULE = SDL3  PACKAGE = SDL3::API::System

void
SDL_SetLinuxThreadPriority(sv_threadID, sv_priority)
	SV *sv_threadID
	SV *sv_priority
    PREINIT:
	Sint64 c_threadID;
	int c_priority;
	_Bool c_bg_ret;
    PPCODE:
	c_threadID = (Sint64)bg_in_iv(aTHX_ sv_threadID, "SDL_SetLinuxThreadPriority(threadID)");
	c_priority = (int)bg_in_iv(aTHX_ sv_priority, "SDL_SetLinuxThreadPriority(priority)");
	c_bg_ret = SDL_SetLinuxThreadPriority(c_threadID, c_priority);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetLinuxThreadPriorityAndPolicy(sv_threadID, sv_sdlPriority, sv_schedPolicy)
	SV *sv_threadID
	SV *sv_sdlPriority
	SV *sv_schedPolicy
    PREINIT:
	Sint64 c_threadID;
	int c_sdlPriority;
	int c_schedPolicy;
	_Bool c_bg_ret;
    PPCODE:
	c_threadID = (Sint64)bg_in_iv(aTHX_ sv_threadID, "SDL_SetLinuxThreadPriorityAndPolicy(threadID)");
	c_sdlPriority = (int)bg_in_iv(aTHX_ sv_sdlPriority, "SDL_SetLinuxThreadPriorityAndPolicy(sdlPriority)");
	c_schedPolicy = (int)bg_in_iv(aTHX_ sv_schedPolicy, "SDL_SetLinuxThreadPriorityAndPolicy(schedPolicy)");
	c_bg_ret = SDL_SetLinuxThreadPriorityAndPolicy(c_threadID, c_sdlPriority, c_schedPolicy);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_IsTablet()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_IsTablet();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_IsTV()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_IsTV();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSandbox()
    PREINIT:
	SDL_Sandbox c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetSandbox();
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_OnApplicationWillTerminate()
    PPCODE:
	SDL_OnApplicationWillTerminate();
	XSRETURN(0);

void
SDL_OnApplicationDidReceiveMemoryWarning()
    PPCODE:
	SDL_OnApplicationDidReceiveMemoryWarning();
	XSRETURN(0);

void
SDL_OnApplicationWillEnterBackground()
    PPCODE:
	SDL_OnApplicationWillEnterBackground();
	XSRETURN(0);

void
SDL_OnApplicationDidEnterBackground()
    PPCODE:
	SDL_OnApplicationDidEnterBackground();
	XSRETURN(0);

void
SDL_OnApplicationWillEnterForeground()
    PPCODE:
	SDL_OnApplicationWillEnterForeground();
	XSRETURN(0);

void
SDL_OnApplicationDidEnterForeground()
    PPCODE:
	SDL_OnApplicationDidEnterForeground();
	XSRETURN(0);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::System", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_SANDBOX_NONE", BG_CONST_SV(SDL_SANDBOX_NONE));
	bg_export_constant(aTHX_ stash, "SDL_SANDBOX_UNKNOWN_CONTAINER", BG_CONST_SV(SDL_SANDBOX_UNKNOWN_CONTAINER));
	bg_export_constant(aTHX_ stash, "SDL_SANDBOX_FLATPAK", BG_CONST_SV(SDL_SANDBOX_FLATPAK));
	bg_export_constant(aTHX_ stash, "SDL_SANDBOX_SNAP", BG_CONST_SV(SDL_SANDBOX_SNAP));
	bg_export_constant(aTHX_ stash, "SDL_SANDBOX_MACOS", BG_CONST_SV(SDL_SANDBOX_MACOS));
	}

