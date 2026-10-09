MODULE = SDL3  PACKAGE = SDL3::API::Platform

void
SDL_GetPlatform()
    PREINIT:
	const char * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetPlatform();
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);
