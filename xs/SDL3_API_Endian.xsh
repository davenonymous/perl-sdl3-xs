MODULE = SDL3  PACKAGE = SDL3::API::Endian

void
SDL_SwapFloat(sv_x)
	SV *sv_x
    PREINIT:
	float c_x;
	float c_bg_ret;
    PPCODE:
	c_x = (float)bg_in_nv(aTHX_ sv_x, "SDL_SwapFloat(x)");
	c_bg_ret = SDL_SwapFloat(c_x);
	ST(0) = sv_2mortal(newSVnv((NV)(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Endian", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_BIG_ENDIAN", BG_CONST_SV(SDL_BIG_ENDIAN));
	bg_export_constant(aTHX_ stash, "SDL_BYTEORDER", BG_CONST_SV(SDL_BYTEORDER));
	bg_export_constant(aTHX_ stash, "SDL_FLOATWORDORDER", BG_CONST_SV(SDL_FLOATWORDORDER));
	bg_export_constant(aTHX_ stash, "SDL_LIL_ENDIAN", BG_CONST_SV(SDL_LIL_ENDIAN));
	}
