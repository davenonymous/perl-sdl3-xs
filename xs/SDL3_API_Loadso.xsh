MODULE = SDL3  PACKAGE = SDL3::API::Loadso

void
SDL_LoadObject(sv_sofile)
	SV *sv_sofile
    PREINIT:
	const char * c_sofile;
	SDL_SharedObject * c_bg_ret;
    PPCODE:
	c_sofile = (const char *)bg_in_string(aTHX_ sv_sofile, "SDL_LoadObject(sofile)");
	c_bg_ret = SDL_LoadObject(c_sofile);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::SharedObject"));
	XSRETURN(1);

void
SDL_LoadFunction(sv_handle, sv_name)
	SV *sv_handle
	SV *sv_name
    PREINIT:
	SDL_SharedObject * c_handle;
	const char * c_name;
	SDL_FunctionPointer c_bg_ret;
    PPCODE:
	c_handle = (SDL_SharedObject *)bg_in_record_ptr(aTHX_ sv_handle, "SDL3::SharedObject", "SDL_LoadFunction(handle)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_LoadFunction(name)");
	c_bg_ret = SDL_LoadFunction(c_handle, c_name);
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_UnloadObject(sv_handle)
	SV *sv_handle
    PREINIT:
	SDL_SharedObject * c_handle;
    PPCODE:
	c_handle = (SDL_SharedObject *)bg_in_record_ptr(aTHX_ sv_handle, "SDL3::SharedObject", "SDL_UnloadObject(handle)");
	SDL_UnloadObject(c_handle);
	XSRETURN(0);

