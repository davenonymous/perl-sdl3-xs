MODULE = SDL3  PACKAGE = SDL3::API::PlatformDefines

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::PlatformDefines", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_PLATFORM_LINUX", BG_CONST_SV(SDL_PLATFORM_LINUX));
	bg_export_constant(aTHX_ stash, "SDL_PLATFORM_UNIX", BG_CONST_SV(SDL_PLATFORM_UNIX));
	}
