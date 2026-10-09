MODULE = SDL3  PACKAGE = SDL3::API::Error

void
SDL_SetError(sv_message)
	SV *sv_message
    PREINIT:
	const char *c_message;
	_Bool c_bg_ret;
    PPCODE:
	c_message = bg_in_string(aTHX_ sv_message, "SDL_SetError(message)");
	c_bg_ret = SDL_SetError("%s", (c_message ? c_message : ""));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_OutOfMemory()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_OutOfMemory();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetError()
    PREINIT:
	const char * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetError();
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_ClearError()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_ClearError();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);
