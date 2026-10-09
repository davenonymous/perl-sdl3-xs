MODULE = SDL3  PACKAGE = SDL3::API::Misc

void
SDL_OpenURL(sv_url)
	SV *sv_url
    PREINIT:
	const char * c_url;
	_Bool c_bg_ret;
    PPCODE:
	c_url = (const char *)bg_in_string(aTHX_ sv_url, "SDL_OpenURL(url)");
	c_bg_ret = SDL_OpenURL(c_url);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);
