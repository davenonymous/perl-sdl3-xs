MODULE = SDL3  PACKAGE = SDL3::API::Version

void
SDL_GetVersion()
    PREINIT:
	int c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetVersion();
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRevision()
    PREINIT:
	const char * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetRevision();
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Version", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_MAJOR_VERSION", BG_CONST_SV(SDL_MAJOR_VERSION));
	bg_export_constant(aTHX_ stash, "SDL_MICRO_VERSION", BG_CONST_SV(SDL_MICRO_VERSION));
	bg_export_constant(aTHX_ stash, "SDL_MINOR_VERSION", BG_CONST_SV(SDL_MINOR_VERSION));
	bg_export_constant(aTHX_ stash, "SDL_VERSION", BG_CONST_SV(SDL_VERSION));
	}
