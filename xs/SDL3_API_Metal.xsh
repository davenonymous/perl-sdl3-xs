MODULE = SDL3  PACKAGE = SDL3::API::Metal

void
SDL_Metal_CreateView(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	SDL_MetalView c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_Metal_CreateView(window)");
	c_bg_ret = SDL_Metal_CreateView(c_window);
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_Metal_DestroyView(sv_view)
	SV *sv_view
    PREINIT:
	SDL_MetalView c_view;
    PPCODE:
	c_view = (SDL_MetalView)bg_in_raw_ptr(aTHX_ sv_view, "SDL_Metal_DestroyView(view)");
	SDL_Metal_DestroyView(c_view);
	XSRETURN(0);

void
SDL_Metal_GetLayer(sv_view)
	SV *sv_view
    PREINIT:
	SDL_MetalView c_view;
	void * c_bg_ret;
    PPCODE:
	c_view = (SDL_MetalView)bg_in_raw_ptr(aTHX_ sv_view, "SDL_Metal_GetLayer(view)");
	c_bg_ret = SDL_Metal_GetLayer(c_view);
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);
