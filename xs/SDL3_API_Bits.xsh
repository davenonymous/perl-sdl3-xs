MODULE = SDL3  PACKAGE = SDL3::API::Bits

void
SDL_MostSignificantBitIndex32(sv_x)
	SV *sv_x
    PREINIT:
	Uint32 c_x;
	int c_bg_ret;
    PPCODE:
	c_x = (Uint32)bg_in_uv(aTHX_ sv_x, "SDL_MostSignificantBitIndex32(x)");
	c_bg_ret = SDL_MostSignificantBitIndex32(c_x);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasExactlyOneBitSet32(sv_x)
	SV *sv_x
    PREINIT:
	Uint32 c_x;
	_Bool c_bg_ret;
    PPCODE:
	c_x = (Uint32)bg_in_uv(aTHX_ sv_x, "SDL_HasExactlyOneBitSet32(x)");
	c_bg_ret = SDL_HasExactlyOneBitSet32(c_x);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);
