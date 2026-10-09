MODULE = SDL3  PACKAGE = SDL3::API::Clipboard

void
SDL_SetClipboardText(sv_text)
	SV *sv_text
    PREINIT:
	const char * c_text;
	_Bool c_bg_ret;
    PPCODE:
	c_text = (const char *)bg_in_string(aTHX_ sv_text, "SDL_SetClipboardText(text)");
	c_bg_ret = SDL_SetClipboardText(c_text);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetClipboardText()
    PREINIT:
	char * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetClipboardText();
	ST(0) = sv_2mortal(bg_out_owned_string(aTHX_ (char *)(c_bg_ret), (void (*)(void *))SDL_free));
	XSRETURN(1);

void
SDL_HasClipboardText()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasClipboardText();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetPrimarySelectionText(sv_text)
	SV *sv_text
    PREINIT:
	const char * c_text;
	_Bool c_bg_ret;
    PPCODE:
	c_text = (const char *)bg_in_string(aTHX_ sv_text, "SDL_SetPrimarySelectionText(text)");
	c_bg_ret = SDL_SetPrimarySelectionText(c_text);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetPrimarySelectionText()
    PREINIT:
	char * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetPrimarySelectionText();
	ST(0) = sv_2mortal(bg_out_owned_string(aTHX_ (char *)(c_bg_ret), (void (*)(void *))SDL_free));
	XSRETURN(1);

void
SDL_HasPrimarySelectionText()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasPrimarySelectionText();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ClearClipboardData()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_ClearClipboardData();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetClipboardData(sv_mime_type, sv_size)
	SV *sv_mime_type
	SV *sv_size
    PREINIT:
	const char * c_mime_type;
	size_t c_size; size_t * p_size; SV *t_size;
	void * c_bg_ret;
    PPCODE:
	c_mime_type = (const char *)bg_in_string(aTHX_ sv_mime_type, "SDL_GetClipboardData(mime_type)");
	t_size = bg_outref_target(aTHX_ sv_size);
	c_size = (t_size && SvOK(t_size)) ? (size_t)bg_in_uv(aTHX_ t_size, "SDL_GetClipboardData(size)") : (size_t)0;
	p_size = t_size ? &c_size : (size_t *)bg_outref_raw(aTHX_ sv_size, "SDL_GetClipboardData(size)");
	c_bg_ret = SDL_GetClipboardData(c_mime_type, p_size);
	if (t_size) sv_setsv(t_size, sv_2mortal(newSVuv((UV)(c_size))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_HasClipboardData(sv_mime_type)
	SV *sv_mime_type
    PREINIT:
	const char * c_mime_type;
	_Bool c_bg_ret;
    PPCODE:
	c_mime_type = (const char *)bg_in_string(aTHX_ sv_mime_type, "SDL_HasClipboardData(mime_type)");
	c_bg_ret = SDL_HasClipboardData(c_mime_type);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetClipboardMimeTypes(sv_num_mime_types)
	SV *sv_num_mime_types
    PREINIT:
	size_t c_num_mime_types; size_t * p_num_mime_types; SV *t_num_mime_types;
	char ** c_bg_ret;
    PPCODE:
	t_num_mime_types = bg_outref_target(aTHX_ sv_num_mime_types);
	c_num_mime_types = (t_num_mime_types && SvOK(t_num_mime_types)) ? (size_t)bg_in_uv(aTHX_ t_num_mime_types, "SDL_GetClipboardMimeTypes(num_mime_types)") : (size_t)0;
	p_num_mime_types = t_num_mime_types ? &c_num_mime_types : (size_t *)bg_outref_raw(aTHX_ sv_num_mime_types, "SDL_GetClipboardMimeTypes(num_mime_types)");
	c_bg_ret = SDL_GetClipboardMimeTypes(p_num_mime_types);
	if (t_num_mime_types) sv_setsv(t_num_mime_types, sv_2mortal(newSVuv((UV)(c_num_mime_types))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);
