MODULE = SDL3  PACKAGE = SDL3::API::Render

void
SDL_GetNumRenderDrivers()
    PREINIT:
	int c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetNumRenderDrivers();
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderDriver(sv_index)
	SV *sv_index
    PREINIT:
	int c_index;
	const char * c_bg_ret;
    PPCODE:
	c_index = (int)bg_in_iv(aTHX_ sv_index, "SDL_GetRenderDriver(index)");
	c_bg_ret = SDL_GetRenderDriver(c_index);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_CreateWindowAndRenderer(sv_title, sv_width, sv_height, sv_window_flags, sv_window, sv_renderer)
	SV *sv_title
	SV *sv_width
	SV *sv_height
	SV *sv_window_flags
	SV *sv_window
	SV *sv_renderer
    PREINIT:
	const char * c_title;
	int c_width;
	int c_height;
	SDL_WindowFlags c_window_flags;
	SDL_Window * c_window; SDL_Window ** p_window; SV *t_window;
	SDL_Renderer * c_renderer; SDL_Renderer ** p_renderer; SV *t_renderer;
	_Bool c_bg_ret;
    PPCODE:
	c_title = (const char *)bg_in_string(aTHX_ sv_title, "SDL_CreateWindowAndRenderer(title)");
	c_width = (int)bg_in_iv(aTHX_ sv_width, "SDL_CreateWindowAndRenderer(width)");
	c_height = (int)bg_in_iv(aTHX_ sv_height, "SDL_CreateWindowAndRenderer(height)");
	c_window_flags = (SDL_WindowFlags)bg_in_uv(aTHX_ sv_window_flags, "SDL_CreateWindowAndRenderer(window_flags)");
	t_window = bg_outref_target(aTHX_ sv_window);
	c_window = (t_window && SvOK(t_window)) ? (SDL_Window *)bg_in_record_ptr(aTHX_ t_window, "SDL3::Window", "SDL_CreateWindowAndRenderer(window)") : (SDL_Window *)0;
	p_window = t_window ? &c_window : (SDL_Window **)bg_outref_raw(aTHX_ sv_window, "SDL_CreateWindowAndRenderer(window)");
	t_renderer = bg_outref_target(aTHX_ sv_renderer);
	c_renderer = (t_renderer && SvOK(t_renderer)) ? (SDL_Renderer *)bg_in_record_ptr(aTHX_ t_renderer, "SDL3::Renderer", "SDL_CreateWindowAndRenderer(renderer)") : (SDL_Renderer *)0;
	p_renderer = t_renderer ? &c_renderer : (SDL_Renderer **)bg_outref_raw(aTHX_ sv_renderer, "SDL_CreateWindowAndRenderer(renderer)");
	c_bg_ret = SDL_CreateWindowAndRenderer(c_title, c_width, c_height, c_window_flags, p_window, p_renderer);
	if (t_window) sv_setsv(t_window, sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_window), "SDL3::Window")));
	if (t_renderer) sv_setsv(t_renderer, sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_renderer), "SDL3::Renderer")));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CreateRenderer(sv_window, sv_name)
	SV *sv_window
	SV *sv_name
    PREINIT:
	SDL_Window * c_window;
	const char * c_name;
	SDL_Renderer * c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_CreateRenderer(window)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_CreateRenderer(name)");
	c_bg_ret = SDL_CreateRenderer(c_window, c_name);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Renderer"));
	XSRETURN(1);

void
SDL_CreateRendererWithProperties(sv_props)
	SV *sv_props
    PREINIT:
	SDL_PropertiesID c_props;
	SDL_Renderer * c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_CreateRendererWithProperties(props)");
	c_bg_ret = SDL_CreateRendererWithProperties(c_props);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Renderer"));
	XSRETURN(1);

void
SDL_CreateGPURenderer(sv_device, sv_window)
	SV *sv_device
	SV *sv_window
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_Window * c_window;
	SDL_Renderer * c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_CreateGPURenderer(device)");
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_CreateGPURenderer(window)");
	c_bg_ret = SDL_CreateGPURenderer(c_device, c_window);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Renderer"));
	XSRETURN(1);

void
SDL_GetGPURendererDevice(sv_renderer)
	SV *sv_renderer
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_GPUDevice * c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetGPURendererDevice(renderer)");
	c_bg_ret = SDL_GetGPURendererDevice(c_renderer);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPUDevice"));
	XSRETURN(1);

void
SDL_CreateSoftwareRenderer(sv_surface)
	SV *sv_surface
    PREINIT:
	SDL_Surface * c_surface;
	SDL_Renderer * c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_CreateSoftwareRenderer(surface)");
	c_bg_ret = SDL_CreateSoftwareRenderer(c_surface);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Renderer"));
	XSRETURN(1);

void
SDL_GetRenderer(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	SDL_Renderer * c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetRenderer(window)");
	c_bg_ret = SDL_GetRenderer(c_window);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Renderer"));
	XSRETURN(1);

void
SDL_GetRenderWindow(sv_renderer)
	SV *sv_renderer
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Window * c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderWindow(renderer)");
	c_bg_ret = SDL_GetRenderWindow(c_renderer);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Window"));
	XSRETURN(1);

void
SDL_GetRendererName(sv_renderer)
	SV *sv_renderer
    PREINIT:
	SDL_Renderer * c_renderer;
	const char * c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRendererName(renderer)");
	c_bg_ret = SDL_GetRendererName(c_renderer);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRendererProperties(sv_renderer)
	SV *sv_renderer
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRendererProperties(renderer)");
	c_bg_ret = SDL_GetRendererProperties(c_renderer);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderOutputSize(sv_renderer, sv_w, sv_h)
	SV *sv_renderer
	SV *sv_w
	SV *sv_h
    PREINIT:
	SDL_Renderer * c_renderer;
	int c_w; int * p_w; SV *t_w;
	int c_h; int * p_h; SV *t_h;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderOutputSize(renderer)");
	t_w = bg_outref_target(aTHX_ sv_w);
	c_w = (t_w && SvOK(t_w)) ? (int)bg_in_iv(aTHX_ t_w, "SDL_GetRenderOutputSize(w)") : (int)0;
	p_w = t_w ? &c_w : (int *)bg_outref_raw(aTHX_ sv_w, "SDL_GetRenderOutputSize(w)");
	t_h = bg_outref_target(aTHX_ sv_h);
	c_h = (t_h && SvOK(t_h)) ? (int)bg_in_iv(aTHX_ t_h, "SDL_GetRenderOutputSize(h)") : (int)0;
	p_h = t_h ? &c_h : (int *)bg_outref_raw(aTHX_ sv_h, "SDL_GetRenderOutputSize(h)");
	c_bg_ret = SDL_GetRenderOutputSize(c_renderer, p_w, p_h);
	if (t_w) sv_setsv(t_w, sv_2mortal(newSViv((IV)(c_w))));
	if (t_h) sv_setsv(t_h, sv_2mortal(newSViv((IV)(c_h))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetCurrentRenderOutputSize(sv_renderer, sv_w, sv_h)
	SV *sv_renderer
	SV *sv_w
	SV *sv_h
    PREINIT:
	SDL_Renderer * c_renderer;
	int c_w; int * p_w; SV *t_w;
	int c_h; int * p_h; SV *t_h;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetCurrentRenderOutputSize(renderer)");
	t_w = bg_outref_target(aTHX_ sv_w);
	c_w = (t_w && SvOK(t_w)) ? (int)bg_in_iv(aTHX_ t_w, "SDL_GetCurrentRenderOutputSize(w)") : (int)0;
	p_w = t_w ? &c_w : (int *)bg_outref_raw(aTHX_ sv_w, "SDL_GetCurrentRenderOutputSize(w)");
	t_h = bg_outref_target(aTHX_ sv_h);
	c_h = (t_h && SvOK(t_h)) ? (int)bg_in_iv(aTHX_ t_h, "SDL_GetCurrentRenderOutputSize(h)") : (int)0;
	p_h = t_h ? &c_h : (int *)bg_outref_raw(aTHX_ sv_h, "SDL_GetCurrentRenderOutputSize(h)");
	c_bg_ret = SDL_GetCurrentRenderOutputSize(c_renderer, p_w, p_h);
	if (t_w) sv_setsv(t_w, sv_2mortal(newSViv((IV)(c_w))));
	if (t_h) sv_setsv(t_h, sv_2mortal(newSViv((IV)(c_h))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CreateTexture(sv_renderer, sv_format, sv_access, sv_w, sv_h)
	SV *sv_renderer
	SV *sv_format
	SV *sv_access
	SV *sv_w
	SV *sv_h
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_PixelFormat c_format;
	SDL_TextureAccess c_access;
	int c_w;
	int c_h;
	SDL_Texture * c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_CreateTexture(renderer)");
	c_format = (SDL_PixelFormat)bg_in_iv(aTHX_ sv_format, "SDL_CreateTexture(format)");
	c_access = (SDL_TextureAccess)bg_in_iv(aTHX_ sv_access, "SDL_CreateTexture(access)");
	c_w = (int)bg_in_iv(aTHX_ sv_w, "SDL_CreateTexture(w)");
	c_h = (int)bg_in_iv(aTHX_ sv_h, "SDL_CreateTexture(h)");
	c_bg_ret = SDL_CreateTexture(c_renderer, c_format, c_access, c_w, c_h);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Texture"));
	XSRETURN(1);

void
SDL_CreateTextureFromSurface(sv_renderer, sv_surface)
	SV *sv_renderer
	SV *sv_surface
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Surface * c_surface;
	SDL_Texture * c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_CreateTextureFromSurface(renderer)");
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_CreateTextureFromSurface(surface)");
	c_bg_ret = SDL_CreateTextureFromSurface(c_renderer, c_surface);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Texture"));
	XSRETURN(1);

void
SDL_CreateTextureWithProperties(sv_renderer, sv_props)
	SV *sv_renderer
	SV *sv_props
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_PropertiesID c_props;
	SDL_Texture * c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_CreateTextureWithProperties(renderer)");
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_CreateTextureWithProperties(props)");
	c_bg_ret = SDL_CreateTextureWithProperties(c_renderer, c_props);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Texture"));
	XSRETURN(1);

void
SDL_GetTextureProperties(sv_texture)
	SV *sv_texture
    PREINIT:
	SDL_Texture * c_texture;
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_GetTextureProperties(texture)");
	c_bg_ret = SDL_GetTextureProperties(c_texture);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRendererFromTexture(sv_texture)
	SV *sv_texture
    PREINIT:
	SDL_Texture * c_texture;
	SDL_Renderer * c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_GetRendererFromTexture(texture)");
	c_bg_ret = SDL_GetRendererFromTexture(c_texture);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Renderer"));
	XSRETURN(1);

void
SDL_GetTextureSize(sv_texture, sv_w, sv_h)
	SV *sv_texture
	SV *sv_w
	SV *sv_h
    PREINIT:
	SDL_Texture * c_texture;
	float c_w; float * p_w; SV *t_w;
	float c_h; float * p_h; SV *t_h;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_GetTextureSize(texture)");
	t_w = bg_outref_target(aTHX_ sv_w);
	c_w = (t_w && SvOK(t_w)) ? (float)bg_in_nv(aTHX_ t_w, "SDL_GetTextureSize(w)") : (float)0;
	p_w = t_w ? &c_w : (float *)bg_outref_raw(aTHX_ sv_w, "SDL_GetTextureSize(w)");
	t_h = bg_outref_target(aTHX_ sv_h);
	c_h = (t_h && SvOK(t_h)) ? (float)bg_in_nv(aTHX_ t_h, "SDL_GetTextureSize(h)") : (float)0;
	p_h = t_h ? &c_h : (float *)bg_outref_raw(aTHX_ sv_h, "SDL_GetTextureSize(h)");
	c_bg_ret = SDL_GetTextureSize(c_texture, p_w, p_h);
	if (t_w) sv_setsv(t_w, sv_2mortal(newSVnv((NV)(c_w))));
	if (t_h) sv_setsv(t_h, sv_2mortal(newSVnv((NV)(c_h))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetTexturePalette(sv_texture, sv_palette)
	SV *sv_texture
	SV *sv_palette
    PREINIT:
	SDL_Texture * c_texture;
	SDL_Palette * c_palette;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_SetTexturePalette(texture)");
	c_palette = (SDL_Palette *)bg_in_record_ptr(aTHX_ sv_palette, "SDL3::Palette", "SDL_SetTexturePalette(palette)");
	c_bg_ret = SDL_SetTexturePalette(c_texture, c_palette);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetTexturePalette(sv_texture)
	SV *sv_texture
    PREINIT:
	SDL_Texture * c_texture;
	SDL_Palette * c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_GetTexturePalette(texture)");
	c_bg_ret = SDL_GetTexturePalette(c_texture);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Palette"));
	XSRETURN(1);

void
SDL_SetTextureColorMod(sv_texture, sv_r, sv_g, sv_b)
	SV *sv_texture
	SV *sv_r
	SV *sv_g
	SV *sv_b
    PREINIT:
	SDL_Texture * c_texture;
	Uint8 c_r;
	Uint8 c_g;
	Uint8 c_b;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_SetTextureColorMod(texture)");
	c_r = (Uint8)bg_in_uv(aTHX_ sv_r, "SDL_SetTextureColorMod(r)");
	c_g = (Uint8)bg_in_uv(aTHX_ sv_g, "SDL_SetTextureColorMod(g)");
	c_b = (Uint8)bg_in_uv(aTHX_ sv_b, "SDL_SetTextureColorMod(b)");
	c_bg_ret = SDL_SetTextureColorMod(c_texture, c_r, c_g, c_b);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetTextureColorModFloat(sv_texture, sv_r, sv_g, sv_b)
	SV *sv_texture
	SV *sv_r
	SV *sv_g
	SV *sv_b
    PREINIT:
	SDL_Texture * c_texture;
	float c_r;
	float c_g;
	float c_b;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_SetTextureColorModFloat(texture)");
	c_r = (float)bg_in_nv(aTHX_ sv_r, "SDL_SetTextureColorModFloat(r)");
	c_g = (float)bg_in_nv(aTHX_ sv_g, "SDL_SetTextureColorModFloat(g)");
	c_b = (float)bg_in_nv(aTHX_ sv_b, "SDL_SetTextureColorModFloat(b)");
	c_bg_ret = SDL_SetTextureColorModFloat(c_texture, c_r, c_g, c_b);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetTextureColorMod(sv_texture, sv_r, sv_g, sv_b)
	SV *sv_texture
	SV *sv_r
	SV *sv_g
	SV *sv_b
    PREINIT:
	SDL_Texture * c_texture;
	Uint8 c_r; Uint8 * p_r; SV *t_r;
	Uint8 c_g; Uint8 * p_g; SV *t_g;
	Uint8 c_b; Uint8 * p_b; SV *t_b;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_GetTextureColorMod(texture)");
	t_r = bg_outref_target(aTHX_ sv_r);
	c_r = (t_r && SvOK(t_r)) ? (Uint8)bg_in_uv(aTHX_ t_r, "SDL_GetTextureColorMod(r)") : (Uint8)0;
	p_r = t_r ? &c_r : (Uint8 *)bg_outref_raw(aTHX_ sv_r, "SDL_GetTextureColorMod(r)");
	t_g = bg_outref_target(aTHX_ sv_g);
	c_g = (t_g && SvOK(t_g)) ? (Uint8)bg_in_uv(aTHX_ t_g, "SDL_GetTextureColorMod(g)") : (Uint8)0;
	p_g = t_g ? &c_g : (Uint8 *)bg_outref_raw(aTHX_ sv_g, "SDL_GetTextureColorMod(g)");
	t_b = bg_outref_target(aTHX_ sv_b);
	c_b = (t_b && SvOK(t_b)) ? (Uint8)bg_in_uv(aTHX_ t_b, "SDL_GetTextureColorMod(b)") : (Uint8)0;
	p_b = t_b ? &c_b : (Uint8 *)bg_outref_raw(aTHX_ sv_b, "SDL_GetTextureColorMod(b)");
	c_bg_ret = SDL_GetTextureColorMod(c_texture, p_r, p_g, p_b);
	if (t_r) sv_setsv(t_r, sv_2mortal(newSVuv((UV)(c_r))));
	if (t_g) sv_setsv(t_g, sv_2mortal(newSVuv((UV)(c_g))));
	if (t_b) sv_setsv(t_b, sv_2mortal(newSVuv((UV)(c_b))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetTextureColorModFloat(sv_texture, sv_r, sv_g, sv_b)
	SV *sv_texture
	SV *sv_r
	SV *sv_g
	SV *sv_b
    PREINIT:
	SDL_Texture * c_texture;
	float c_r; float * p_r; SV *t_r;
	float c_g; float * p_g; SV *t_g;
	float c_b; float * p_b; SV *t_b;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_GetTextureColorModFloat(texture)");
	t_r = bg_outref_target(aTHX_ sv_r);
	c_r = (t_r && SvOK(t_r)) ? (float)bg_in_nv(aTHX_ t_r, "SDL_GetTextureColorModFloat(r)") : (float)0;
	p_r = t_r ? &c_r : (float *)bg_outref_raw(aTHX_ sv_r, "SDL_GetTextureColorModFloat(r)");
	t_g = bg_outref_target(aTHX_ sv_g);
	c_g = (t_g && SvOK(t_g)) ? (float)bg_in_nv(aTHX_ t_g, "SDL_GetTextureColorModFloat(g)") : (float)0;
	p_g = t_g ? &c_g : (float *)bg_outref_raw(aTHX_ sv_g, "SDL_GetTextureColorModFloat(g)");
	t_b = bg_outref_target(aTHX_ sv_b);
	c_b = (t_b && SvOK(t_b)) ? (float)bg_in_nv(aTHX_ t_b, "SDL_GetTextureColorModFloat(b)") : (float)0;
	p_b = t_b ? &c_b : (float *)bg_outref_raw(aTHX_ sv_b, "SDL_GetTextureColorModFloat(b)");
	c_bg_ret = SDL_GetTextureColorModFloat(c_texture, p_r, p_g, p_b);
	if (t_r) sv_setsv(t_r, sv_2mortal(newSVnv((NV)(c_r))));
	if (t_g) sv_setsv(t_g, sv_2mortal(newSVnv((NV)(c_g))));
	if (t_b) sv_setsv(t_b, sv_2mortal(newSVnv((NV)(c_b))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetTextureAlphaMod(sv_texture, sv_alpha)
	SV *sv_texture
	SV *sv_alpha
    PREINIT:
	SDL_Texture * c_texture;
	Uint8 c_alpha;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_SetTextureAlphaMod(texture)");
	c_alpha = (Uint8)bg_in_uv(aTHX_ sv_alpha, "SDL_SetTextureAlphaMod(alpha)");
	c_bg_ret = SDL_SetTextureAlphaMod(c_texture, c_alpha);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetTextureAlphaModFloat(sv_texture, sv_alpha)
	SV *sv_texture
	SV *sv_alpha
    PREINIT:
	SDL_Texture * c_texture;
	float c_alpha;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_SetTextureAlphaModFloat(texture)");
	c_alpha = (float)bg_in_nv(aTHX_ sv_alpha, "SDL_SetTextureAlphaModFloat(alpha)");
	c_bg_ret = SDL_SetTextureAlphaModFloat(c_texture, c_alpha);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetTextureAlphaMod(sv_texture, sv_alpha)
	SV *sv_texture
	SV *sv_alpha
    PREINIT:
	SDL_Texture * c_texture;
	Uint8 c_alpha; Uint8 * p_alpha; SV *t_alpha;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_GetTextureAlphaMod(texture)");
	t_alpha = bg_outref_target(aTHX_ sv_alpha);
	c_alpha = (t_alpha && SvOK(t_alpha)) ? (Uint8)bg_in_uv(aTHX_ t_alpha, "SDL_GetTextureAlphaMod(alpha)") : (Uint8)0;
	p_alpha = t_alpha ? &c_alpha : (Uint8 *)bg_outref_raw(aTHX_ sv_alpha, "SDL_GetTextureAlphaMod(alpha)");
	c_bg_ret = SDL_GetTextureAlphaMod(c_texture, p_alpha);
	if (t_alpha) sv_setsv(t_alpha, sv_2mortal(newSVuv((UV)(c_alpha))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetTextureAlphaModFloat(sv_texture, sv_alpha)
	SV *sv_texture
	SV *sv_alpha
    PREINIT:
	SDL_Texture * c_texture;
	float c_alpha; float * p_alpha; SV *t_alpha;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_GetTextureAlphaModFloat(texture)");
	t_alpha = bg_outref_target(aTHX_ sv_alpha);
	c_alpha = (t_alpha && SvOK(t_alpha)) ? (float)bg_in_nv(aTHX_ t_alpha, "SDL_GetTextureAlphaModFloat(alpha)") : (float)0;
	p_alpha = t_alpha ? &c_alpha : (float *)bg_outref_raw(aTHX_ sv_alpha, "SDL_GetTextureAlphaModFloat(alpha)");
	c_bg_ret = SDL_GetTextureAlphaModFloat(c_texture, p_alpha);
	if (t_alpha) sv_setsv(t_alpha, sv_2mortal(newSVnv((NV)(c_alpha))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetTextureBlendMode(sv_texture, sv_blendMode)
	SV *sv_texture
	SV *sv_blendMode
    PREINIT:
	SDL_Texture * c_texture;
	SDL_BlendMode c_blendMode;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_SetTextureBlendMode(texture)");
	c_blendMode = (SDL_BlendMode)bg_in_uv(aTHX_ sv_blendMode, "SDL_SetTextureBlendMode(blendMode)");
	c_bg_ret = SDL_SetTextureBlendMode(c_texture, c_blendMode);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetTextureBlendMode(sv_texture, sv_blendMode)
	SV *sv_texture
	SV *sv_blendMode
    PREINIT:
	SDL_Texture * c_texture;
	SDL_BlendMode c_blendMode; SDL_BlendMode * p_blendMode; SV *t_blendMode;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_GetTextureBlendMode(texture)");
	t_blendMode = bg_outref_target(aTHX_ sv_blendMode);
	c_blendMode = (t_blendMode && SvOK(t_blendMode)) ? (SDL_BlendMode)bg_in_uv(aTHX_ t_blendMode, "SDL_GetTextureBlendMode(blendMode)") : (SDL_BlendMode)0;
	p_blendMode = t_blendMode ? &c_blendMode : (SDL_BlendMode *)bg_outref_raw(aTHX_ sv_blendMode, "SDL_GetTextureBlendMode(blendMode)");
	c_bg_ret = SDL_GetTextureBlendMode(c_texture, p_blendMode);
	if (t_blendMode) sv_setsv(t_blendMode, sv_2mortal(newSVuv((UV)(c_blendMode))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetTextureScaleMode(sv_texture, sv_scaleMode)
	SV *sv_texture
	SV *sv_scaleMode
    PREINIT:
	SDL_Texture * c_texture;
	SDL_ScaleMode c_scaleMode;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_SetTextureScaleMode(texture)");
	c_scaleMode = (SDL_ScaleMode)bg_in_iv(aTHX_ sv_scaleMode, "SDL_SetTextureScaleMode(scaleMode)");
	c_bg_ret = SDL_SetTextureScaleMode(c_texture, c_scaleMode);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetTextureScaleMode(sv_texture, sv_scaleMode)
	SV *sv_texture
	SV *sv_scaleMode
    PREINIT:
	SDL_Texture * c_texture;
	SDL_ScaleMode c_scaleMode; SDL_ScaleMode * p_scaleMode; SV *t_scaleMode;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_GetTextureScaleMode(texture)");
	t_scaleMode = bg_outref_target(aTHX_ sv_scaleMode);
	c_scaleMode = (t_scaleMode && SvOK(t_scaleMode)) ? (SDL_ScaleMode)bg_in_iv(aTHX_ t_scaleMode, "SDL_GetTextureScaleMode(scaleMode)") : (SDL_ScaleMode)0;
	p_scaleMode = t_scaleMode ? &c_scaleMode : (SDL_ScaleMode *)bg_outref_raw(aTHX_ sv_scaleMode, "SDL_GetTextureScaleMode(scaleMode)");
	c_bg_ret = SDL_GetTextureScaleMode(c_texture, p_scaleMode);
	if (t_scaleMode) sv_setsv(t_scaleMode, sv_2mortal(newSViv((IV)(c_scaleMode))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_UpdateTexture(sv_texture, sv_rect, sv_pixels, sv_pitch)
	SV *sv_texture
	SV *sv_rect
	SV *sv_pixels
	SV *sv_pitch
    PREINIT:
	SDL_Texture * c_texture;
	const SDL_Rect * c_rect;
	const void * c_pixels;
	int c_pitch;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_UpdateTexture(texture)");
	c_rect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_UpdateTexture(rect)");
	c_pixels = (const void *)bg_in_raw_ptr(aTHX_ sv_pixels, "SDL_UpdateTexture(pixels)");
	c_pitch = (int)bg_in_iv(aTHX_ sv_pitch, "SDL_UpdateTexture(pitch)");
	c_bg_ret = SDL_UpdateTexture(c_texture, c_rect, c_pixels, c_pitch);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_UpdateYUVTexture(sv_texture, sv_rect, sv_Yplane, sv_Ypitch, sv_Uplane, sv_Upitch, sv_Vplane, sv_Vpitch)
	SV *sv_texture
	SV *sv_rect
	SV *sv_Yplane
	SV *sv_Ypitch
	SV *sv_Uplane
	SV *sv_Upitch
	SV *sv_Vplane
	SV *sv_Vpitch
    PREINIT:
	SDL_Texture * c_texture;
	const SDL_Rect * c_rect;
	Uint8 c_Yplane; const Uint8 * p_Yplane; SV *t_Yplane;
	int c_Ypitch;
	Uint8 c_Uplane; const Uint8 * p_Uplane; SV *t_Uplane;
	int c_Upitch;
	Uint8 c_Vplane; const Uint8 * p_Vplane; SV *t_Vplane;
	int c_Vpitch;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_UpdateYUVTexture(texture)");
	c_rect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_UpdateYUVTexture(rect)");
	t_Yplane = bg_outref_target(aTHX_ sv_Yplane);
	c_Yplane = (t_Yplane && SvOK(t_Yplane)) ? (Uint8)bg_in_uv(aTHX_ t_Yplane, "SDL_UpdateYUVTexture(Yplane)") : (Uint8)0;
	p_Yplane = t_Yplane ? &c_Yplane : (const Uint8 *)bg_outref_raw(aTHX_ sv_Yplane, "SDL_UpdateYUVTexture(Yplane)");
	c_Ypitch = (int)bg_in_iv(aTHX_ sv_Ypitch, "SDL_UpdateYUVTexture(Ypitch)");
	t_Uplane = bg_outref_target(aTHX_ sv_Uplane);
	c_Uplane = (t_Uplane && SvOK(t_Uplane)) ? (Uint8)bg_in_uv(aTHX_ t_Uplane, "SDL_UpdateYUVTexture(Uplane)") : (Uint8)0;
	p_Uplane = t_Uplane ? &c_Uplane : (const Uint8 *)bg_outref_raw(aTHX_ sv_Uplane, "SDL_UpdateYUVTexture(Uplane)");
	c_Upitch = (int)bg_in_iv(aTHX_ sv_Upitch, "SDL_UpdateYUVTexture(Upitch)");
	t_Vplane = bg_outref_target(aTHX_ sv_Vplane);
	c_Vplane = (t_Vplane && SvOK(t_Vplane)) ? (Uint8)bg_in_uv(aTHX_ t_Vplane, "SDL_UpdateYUVTexture(Vplane)") : (Uint8)0;
	p_Vplane = t_Vplane ? &c_Vplane : (const Uint8 *)bg_outref_raw(aTHX_ sv_Vplane, "SDL_UpdateYUVTexture(Vplane)");
	c_Vpitch = (int)bg_in_iv(aTHX_ sv_Vpitch, "SDL_UpdateYUVTexture(Vpitch)");
	c_bg_ret = SDL_UpdateYUVTexture(c_texture, c_rect, p_Yplane, c_Ypitch, p_Uplane, c_Upitch, p_Vplane, c_Vpitch);
	if (t_Yplane) sv_setsv(t_Yplane, sv_2mortal(newSVuv((UV)(c_Yplane))));
	if (t_Uplane) sv_setsv(t_Uplane, sv_2mortal(newSVuv((UV)(c_Uplane))));
	if (t_Vplane) sv_setsv(t_Vplane, sv_2mortal(newSVuv((UV)(c_Vplane))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_UpdateNVTexture(sv_texture, sv_rect, sv_Yplane, sv_Ypitch, sv_UVplane, sv_UVpitch)
	SV *sv_texture
	SV *sv_rect
	SV *sv_Yplane
	SV *sv_Ypitch
	SV *sv_UVplane
	SV *sv_UVpitch
    PREINIT:
	SDL_Texture * c_texture;
	const SDL_Rect * c_rect;
	Uint8 c_Yplane; const Uint8 * p_Yplane; SV *t_Yplane;
	int c_Ypitch;
	Uint8 c_UVplane; const Uint8 * p_UVplane; SV *t_UVplane;
	int c_UVpitch;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_UpdateNVTexture(texture)");
	c_rect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_UpdateNVTexture(rect)");
	t_Yplane = bg_outref_target(aTHX_ sv_Yplane);
	c_Yplane = (t_Yplane && SvOK(t_Yplane)) ? (Uint8)bg_in_uv(aTHX_ t_Yplane, "SDL_UpdateNVTexture(Yplane)") : (Uint8)0;
	p_Yplane = t_Yplane ? &c_Yplane : (const Uint8 *)bg_outref_raw(aTHX_ sv_Yplane, "SDL_UpdateNVTexture(Yplane)");
	c_Ypitch = (int)bg_in_iv(aTHX_ sv_Ypitch, "SDL_UpdateNVTexture(Ypitch)");
	t_UVplane = bg_outref_target(aTHX_ sv_UVplane);
	c_UVplane = (t_UVplane && SvOK(t_UVplane)) ? (Uint8)bg_in_uv(aTHX_ t_UVplane, "SDL_UpdateNVTexture(UVplane)") : (Uint8)0;
	p_UVplane = t_UVplane ? &c_UVplane : (const Uint8 *)bg_outref_raw(aTHX_ sv_UVplane, "SDL_UpdateNVTexture(UVplane)");
	c_UVpitch = (int)bg_in_iv(aTHX_ sv_UVpitch, "SDL_UpdateNVTexture(UVpitch)");
	c_bg_ret = SDL_UpdateNVTexture(c_texture, c_rect, p_Yplane, c_Ypitch, p_UVplane, c_UVpitch);
	if (t_Yplane) sv_setsv(t_Yplane, sv_2mortal(newSVuv((UV)(c_Yplane))));
	if (t_UVplane) sv_setsv(t_UVplane, sv_2mortal(newSVuv((UV)(c_UVplane))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_LockTexture(sv_texture, sv_rect, sv_pixels, sv_pitch)
	SV *sv_texture
	SV *sv_rect
	SV *sv_pixels
	SV *sv_pitch
    PREINIT:
	SDL_Texture * c_texture;
	const SDL_Rect * c_rect;
	void * c_pixels; void ** p_pixels; SV *t_pixels;
	int c_pitch; int * p_pitch; SV *t_pitch;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_LockTexture(texture)");
	c_rect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_LockTexture(rect)");
	t_pixels = bg_outref_target(aTHX_ sv_pixels);
	c_pixels = (t_pixels && SvOK(t_pixels)) ? (void *)bg_in_raw_ptr(aTHX_ t_pixels, "SDL_LockTexture(pixels)") : (void *)0;
	p_pixels = t_pixels ? &c_pixels : (void **)bg_outref_raw(aTHX_ sv_pixels, "SDL_LockTexture(pixels)");
	t_pitch = bg_outref_target(aTHX_ sv_pitch);
	c_pitch = (t_pitch && SvOK(t_pitch)) ? (int)bg_in_iv(aTHX_ t_pitch, "SDL_LockTexture(pitch)") : (int)0;
	p_pitch = t_pitch ? &c_pitch : (int *)bg_outref_raw(aTHX_ sv_pitch, "SDL_LockTexture(pitch)");
	c_bg_ret = SDL_LockTexture(c_texture, c_rect, p_pixels, p_pitch);
	if (t_pixels) sv_setsv(t_pixels, sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_pixels), "SDL3::Pointer")));
	if (t_pitch) sv_setsv(t_pitch, sv_2mortal(newSViv((IV)(c_pitch))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_LockTextureToSurface(sv_texture, sv_rect, sv_surface)
	SV *sv_texture
	SV *sv_rect
	SV *sv_surface
    PREINIT:
	SDL_Texture * c_texture;
	const SDL_Rect * c_rect;
	SDL_Surface * c_surface; SDL_Surface ** p_surface; SV *t_surface;
	_Bool c_bg_ret;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_LockTextureToSurface(texture)");
	c_rect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_LockTextureToSurface(rect)");
	t_surface = bg_outref_target(aTHX_ sv_surface);
	c_surface = (t_surface && SvOK(t_surface)) ? (SDL_Surface *)bg_in_record_ptr(aTHX_ t_surface, "SDL3::Surface", "SDL_LockTextureToSurface(surface)") : (SDL_Surface *)0;
	p_surface = t_surface ? &c_surface : (SDL_Surface **)bg_outref_raw(aTHX_ sv_surface, "SDL_LockTextureToSurface(surface)");
	c_bg_ret = SDL_LockTextureToSurface(c_texture, c_rect, p_surface);
	if (t_surface) sv_setsv(t_surface, sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_surface), "SDL3::Surface")));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_UnlockTexture(sv_texture)
	SV *sv_texture
    PREINIT:
	SDL_Texture * c_texture;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_UnlockTexture(texture)");
	SDL_UnlockTexture(c_texture);
	XSRETURN(0);

void
SDL_SetRenderTarget(sv_renderer, sv_texture)
	SV *sv_renderer
	SV *sv_texture
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Texture * c_texture;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_SetRenderTarget(renderer)");
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_SetRenderTarget(texture)");
	c_bg_ret = SDL_SetRenderTarget(c_renderer, c_texture);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderTarget(sv_renderer)
	SV *sv_renderer
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Texture * c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderTarget(renderer)");
	c_bg_ret = SDL_GetRenderTarget(c_renderer);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Texture"));
	XSRETURN(1);

void
SDL_SetRenderLogicalPresentation(sv_renderer, sv_w, sv_h, sv_mode)
	SV *sv_renderer
	SV *sv_w
	SV *sv_h
	SV *sv_mode
    PREINIT:
	SDL_Renderer * c_renderer;
	int c_w;
	int c_h;
	SDL_RendererLogicalPresentation c_mode;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_SetRenderLogicalPresentation(renderer)");
	c_w = (int)bg_in_iv(aTHX_ sv_w, "SDL_SetRenderLogicalPresentation(w)");
	c_h = (int)bg_in_iv(aTHX_ sv_h, "SDL_SetRenderLogicalPresentation(h)");
	c_mode = (SDL_RendererLogicalPresentation)bg_in_iv(aTHX_ sv_mode, "SDL_SetRenderLogicalPresentation(mode)");
	c_bg_ret = SDL_SetRenderLogicalPresentation(c_renderer, c_w, c_h, c_mode);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderLogicalPresentation(sv_renderer, sv_w, sv_h, sv_mode)
	SV *sv_renderer
	SV *sv_w
	SV *sv_h
	SV *sv_mode
    PREINIT:
	SDL_Renderer * c_renderer;
	int c_w; int * p_w; SV *t_w;
	int c_h; int * p_h; SV *t_h;
	SDL_RendererLogicalPresentation c_mode; SDL_RendererLogicalPresentation * p_mode; SV *t_mode;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderLogicalPresentation(renderer)");
	t_w = bg_outref_target(aTHX_ sv_w);
	c_w = (t_w && SvOK(t_w)) ? (int)bg_in_iv(aTHX_ t_w, "SDL_GetRenderLogicalPresentation(w)") : (int)0;
	p_w = t_w ? &c_w : (int *)bg_outref_raw(aTHX_ sv_w, "SDL_GetRenderLogicalPresentation(w)");
	t_h = bg_outref_target(aTHX_ sv_h);
	c_h = (t_h && SvOK(t_h)) ? (int)bg_in_iv(aTHX_ t_h, "SDL_GetRenderLogicalPresentation(h)") : (int)0;
	p_h = t_h ? &c_h : (int *)bg_outref_raw(aTHX_ sv_h, "SDL_GetRenderLogicalPresentation(h)");
	t_mode = bg_outref_target(aTHX_ sv_mode);
	c_mode = (t_mode && SvOK(t_mode)) ? (SDL_RendererLogicalPresentation)bg_in_iv(aTHX_ t_mode, "SDL_GetRenderLogicalPresentation(mode)") : (SDL_RendererLogicalPresentation)0;
	p_mode = t_mode ? &c_mode : (SDL_RendererLogicalPresentation *)bg_outref_raw(aTHX_ sv_mode, "SDL_GetRenderLogicalPresentation(mode)");
	c_bg_ret = SDL_GetRenderLogicalPresentation(c_renderer, p_w, p_h, p_mode);
	if (t_w) sv_setsv(t_w, sv_2mortal(newSViv((IV)(c_w))));
	if (t_h) sv_setsv(t_h, sv_2mortal(newSViv((IV)(c_h))));
	if (t_mode) sv_setsv(t_mode, sv_2mortal(newSViv((IV)(c_mode))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderLogicalPresentationRect(sv_renderer, sv_rect)
	SV *sv_renderer
	SV *sv_rect
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_FRect * c_rect;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderLogicalPresentationRect(renderer)");
	c_rect = (SDL_FRect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::FRect", "SDL_GetRenderLogicalPresentationRect(rect)");
	c_bg_ret = SDL_GetRenderLogicalPresentationRect(c_renderer, c_rect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderCoordinatesFromWindow(sv_renderer, sv_window_x, sv_window_y, sv_x, sv_y)
	SV *sv_renderer
	SV *sv_window_x
	SV *sv_window_y
	SV *sv_x
	SV *sv_y
    PREINIT:
	SDL_Renderer * c_renderer;
	float c_window_x;
	float c_window_y;
	float c_x; float * p_x; SV *t_x;
	float c_y; float * p_y; SV *t_y;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderCoordinatesFromWindow(renderer)");
	c_window_x = (float)bg_in_nv(aTHX_ sv_window_x, "SDL_RenderCoordinatesFromWindow(window_x)");
	c_window_y = (float)bg_in_nv(aTHX_ sv_window_y, "SDL_RenderCoordinatesFromWindow(window_y)");
	t_x = bg_outref_target(aTHX_ sv_x);
	c_x = (t_x && SvOK(t_x)) ? (float)bg_in_nv(aTHX_ t_x, "SDL_RenderCoordinatesFromWindow(x)") : (float)0;
	p_x = t_x ? &c_x : (float *)bg_outref_raw(aTHX_ sv_x, "SDL_RenderCoordinatesFromWindow(x)");
	t_y = bg_outref_target(aTHX_ sv_y);
	c_y = (t_y && SvOK(t_y)) ? (float)bg_in_nv(aTHX_ t_y, "SDL_RenderCoordinatesFromWindow(y)") : (float)0;
	p_y = t_y ? &c_y : (float *)bg_outref_raw(aTHX_ sv_y, "SDL_RenderCoordinatesFromWindow(y)");
	c_bg_ret = SDL_RenderCoordinatesFromWindow(c_renderer, c_window_x, c_window_y, p_x, p_y);
	if (t_x) sv_setsv(t_x, sv_2mortal(newSVnv((NV)(c_x))));
	if (t_y) sv_setsv(t_y, sv_2mortal(newSVnv((NV)(c_y))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderCoordinatesToWindow(sv_renderer, sv_x, sv_y, sv_window_x, sv_window_y)
	SV *sv_renderer
	SV *sv_x
	SV *sv_y
	SV *sv_window_x
	SV *sv_window_y
    PREINIT:
	SDL_Renderer * c_renderer;
	float c_x;
	float c_y;
	float c_window_x; float * p_window_x; SV *t_window_x;
	float c_window_y; float * p_window_y; SV *t_window_y;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderCoordinatesToWindow(renderer)");
	c_x = (float)bg_in_nv(aTHX_ sv_x, "SDL_RenderCoordinatesToWindow(x)");
	c_y = (float)bg_in_nv(aTHX_ sv_y, "SDL_RenderCoordinatesToWindow(y)");
	t_window_x = bg_outref_target(aTHX_ sv_window_x);
	c_window_x = (t_window_x && SvOK(t_window_x)) ? (float)bg_in_nv(aTHX_ t_window_x, "SDL_RenderCoordinatesToWindow(window_x)") : (float)0;
	p_window_x = t_window_x ? &c_window_x : (float *)bg_outref_raw(aTHX_ sv_window_x, "SDL_RenderCoordinatesToWindow(window_x)");
	t_window_y = bg_outref_target(aTHX_ sv_window_y);
	c_window_y = (t_window_y && SvOK(t_window_y)) ? (float)bg_in_nv(aTHX_ t_window_y, "SDL_RenderCoordinatesToWindow(window_y)") : (float)0;
	p_window_y = t_window_y ? &c_window_y : (float *)bg_outref_raw(aTHX_ sv_window_y, "SDL_RenderCoordinatesToWindow(window_y)");
	c_bg_ret = SDL_RenderCoordinatesToWindow(c_renderer, c_x, c_y, p_window_x, p_window_y);
	if (t_window_x) sv_setsv(t_window_x, sv_2mortal(newSVnv((NV)(c_window_x))));
	if (t_window_y) sv_setsv(t_window_y, sv_2mortal(newSVnv((NV)(c_window_y))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ConvertEventToRenderCoordinates(sv_renderer, sv_event)
	SV *sv_renderer
	SV *sv_event
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Event * c_event;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_ConvertEventToRenderCoordinates(renderer)");
	c_event = (SDL_Event *)bg_in_record_ptr(aTHX_ sv_event, "SDL3::Event", "SDL_ConvertEventToRenderCoordinates(event)");
	c_bg_ret = SDL_ConvertEventToRenderCoordinates(c_renderer, c_event);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetRenderViewport(sv_renderer, sv_rect)
	SV *sv_renderer
	SV *sv_rect
    PREINIT:
	SDL_Renderer * c_renderer;
	const SDL_Rect * c_rect;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_SetRenderViewport(renderer)");
	c_rect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_SetRenderViewport(rect)");
	c_bg_ret = SDL_SetRenderViewport(c_renderer, c_rect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderViewport(sv_renderer, sv_rect)
	SV *sv_renderer
	SV *sv_rect
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Rect * c_rect;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderViewport(renderer)");
	c_rect = (SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_GetRenderViewport(rect)");
	c_bg_ret = SDL_GetRenderViewport(c_renderer, c_rect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderViewportSet(sv_renderer)
	SV *sv_renderer
    PREINIT:
	SDL_Renderer * c_renderer;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderViewportSet(renderer)");
	c_bg_ret = SDL_RenderViewportSet(c_renderer);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderSafeArea(sv_renderer, sv_rect)
	SV *sv_renderer
	SV *sv_rect
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Rect * c_rect;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderSafeArea(renderer)");
	c_rect = (SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_GetRenderSafeArea(rect)");
	c_bg_ret = SDL_GetRenderSafeArea(c_renderer, c_rect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetRenderClipRect(sv_renderer, sv_rect)
	SV *sv_renderer
	SV *sv_rect
    PREINIT:
	SDL_Renderer * c_renderer;
	const SDL_Rect * c_rect;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_SetRenderClipRect(renderer)");
	c_rect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_SetRenderClipRect(rect)");
	c_bg_ret = SDL_SetRenderClipRect(c_renderer, c_rect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderClipRect(sv_renderer, sv_rect)
	SV *sv_renderer
	SV *sv_rect
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Rect * c_rect;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderClipRect(renderer)");
	c_rect = (SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_GetRenderClipRect(rect)");
	c_bg_ret = SDL_GetRenderClipRect(c_renderer, c_rect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderClipEnabled(sv_renderer)
	SV *sv_renderer
    PREINIT:
	SDL_Renderer * c_renderer;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderClipEnabled(renderer)");
	c_bg_ret = SDL_RenderClipEnabled(c_renderer);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetRenderScale(sv_renderer, sv_scaleX, sv_scaleY)
	SV *sv_renderer
	SV *sv_scaleX
	SV *sv_scaleY
    PREINIT:
	SDL_Renderer * c_renderer;
	float c_scaleX;
	float c_scaleY;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_SetRenderScale(renderer)");
	c_scaleX = (float)bg_in_nv(aTHX_ sv_scaleX, "SDL_SetRenderScale(scaleX)");
	c_scaleY = (float)bg_in_nv(aTHX_ sv_scaleY, "SDL_SetRenderScale(scaleY)");
	c_bg_ret = SDL_SetRenderScale(c_renderer, c_scaleX, c_scaleY);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderScale(sv_renderer, sv_scaleX, sv_scaleY)
	SV *sv_renderer
	SV *sv_scaleX
	SV *sv_scaleY
    PREINIT:
	SDL_Renderer * c_renderer;
	float c_scaleX; float * p_scaleX; SV *t_scaleX;
	float c_scaleY; float * p_scaleY; SV *t_scaleY;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderScale(renderer)");
	t_scaleX = bg_outref_target(aTHX_ sv_scaleX);
	c_scaleX = (t_scaleX && SvOK(t_scaleX)) ? (float)bg_in_nv(aTHX_ t_scaleX, "SDL_GetRenderScale(scaleX)") : (float)0;
	p_scaleX = t_scaleX ? &c_scaleX : (float *)bg_outref_raw(aTHX_ sv_scaleX, "SDL_GetRenderScale(scaleX)");
	t_scaleY = bg_outref_target(aTHX_ sv_scaleY);
	c_scaleY = (t_scaleY && SvOK(t_scaleY)) ? (float)bg_in_nv(aTHX_ t_scaleY, "SDL_GetRenderScale(scaleY)") : (float)0;
	p_scaleY = t_scaleY ? &c_scaleY : (float *)bg_outref_raw(aTHX_ sv_scaleY, "SDL_GetRenderScale(scaleY)");
	c_bg_ret = SDL_GetRenderScale(c_renderer, p_scaleX, p_scaleY);
	if (t_scaleX) sv_setsv(t_scaleX, sv_2mortal(newSVnv((NV)(c_scaleX))));
	if (t_scaleY) sv_setsv(t_scaleY, sv_2mortal(newSVnv((NV)(c_scaleY))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetRenderDrawColor(sv_renderer, sv_r, sv_g, sv_b, sv_a)
	SV *sv_renderer
	SV *sv_r
	SV *sv_g
	SV *sv_b
	SV *sv_a
    PREINIT:
	SDL_Renderer * c_renderer;
	Uint8 c_r;
	Uint8 c_g;
	Uint8 c_b;
	Uint8 c_a;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_SetRenderDrawColor(renderer)");
	c_r = (Uint8)bg_in_uv(aTHX_ sv_r, "SDL_SetRenderDrawColor(r)");
	c_g = (Uint8)bg_in_uv(aTHX_ sv_g, "SDL_SetRenderDrawColor(g)");
	c_b = (Uint8)bg_in_uv(aTHX_ sv_b, "SDL_SetRenderDrawColor(b)");
	c_a = (Uint8)bg_in_uv(aTHX_ sv_a, "SDL_SetRenderDrawColor(a)");
	c_bg_ret = SDL_SetRenderDrawColor(c_renderer, c_r, c_g, c_b, c_a);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetRenderDrawColorFloat(sv_renderer, sv_r, sv_g, sv_b, sv_a)
	SV *sv_renderer
	SV *sv_r
	SV *sv_g
	SV *sv_b
	SV *sv_a
    PREINIT:
	SDL_Renderer * c_renderer;
	float c_r;
	float c_g;
	float c_b;
	float c_a;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_SetRenderDrawColorFloat(renderer)");
	c_r = (float)bg_in_nv(aTHX_ sv_r, "SDL_SetRenderDrawColorFloat(r)");
	c_g = (float)bg_in_nv(aTHX_ sv_g, "SDL_SetRenderDrawColorFloat(g)");
	c_b = (float)bg_in_nv(aTHX_ sv_b, "SDL_SetRenderDrawColorFloat(b)");
	c_a = (float)bg_in_nv(aTHX_ sv_a, "SDL_SetRenderDrawColorFloat(a)");
	c_bg_ret = SDL_SetRenderDrawColorFloat(c_renderer, c_r, c_g, c_b, c_a);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderDrawColor(sv_renderer, sv_r, sv_g, sv_b, sv_a)
	SV *sv_renderer
	SV *sv_r
	SV *sv_g
	SV *sv_b
	SV *sv_a
    PREINIT:
	SDL_Renderer * c_renderer;
	Uint8 c_r; Uint8 * p_r; SV *t_r;
	Uint8 c_g; Uint8 * p_g; SV *t_g;
	Uint8 c_b; Uint8 * p_b; SV *t_b;
	Uint8 c_a; Uint8 * p_a; SV *t_a;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderDrawColor(renderer)");
	t_r = bg_outref_target(aTHX_ sv_r);
	c_r = (t_r && SvOK(t_r)) ? (Uint8)bg_in_uv(aTHX_ t_r, "SDL_GetRenderDrawColor(r)") : (Uint8)0;
	p_r = t_r ? &c_r : (Uint8 *)bg_outref_raw(aTHX_ sv_r, "SDL_GetRenderDrawColor(r)");
	t_g = bg_outref_target(aTHX_ sv_g);
	c_g = (t_g && SvOK(t_g)) ? (Uint8)bg_in_uv(aTHX_ t_g, "SDL_GetRenderDrawColor(g)") : (Uint8)0;
	p_g = t_g ? &c_g : (Uint8 *)bg_outref_raw(aTHX_ sv_g, "SDL_GetRenderDrawColor(g)");
	t_b = bg_outref_target(aTHX_ sv_b);
	c_b = (t_b && SvOK(t_b)) ? (Uint8)bg_in_uv(aTHX_ t_b, "SDL_GetRenderDrawColor(b)") : (Uint8)0;
	p_b = t_b ? &c_b : (Uint8 *)bg_outref_raw(aTHX_ sv_b, "SDL_GetRenderDrawColor(b)");
	t_a = bg_outref_target(aTHX_ sv_a);
	c_a = (t_a && SvOK(t_a)) ? (Uint8)bg_in_uv(aTHX_ t_a, "SDL_GetRenderDrawColor(a)") : (Uint8)0;
	p_a = t_a ? &c_a : (Uint8 *)bg_outref_raw(aTHX_ sv_a, "SDL_GetRenderDrawColor(a)");
	c_bg_ret = SDL_GetRenderDrawColor(c_renderer, p_r, p_g, p_b, p_a);
	if (t_r) sv_setsv(t_r, sv_2mortal(newSVuv((UV)(c_r))));
	if (t_g) sv_setsv(t_g, sv_2mortal(newSVuv((UV)(c_g))));
	if (t_b) sv_setsv(t_b, sv_2mortal(newSVuv((UV)(c_b))));
	if (t_a) sv_setsv(t_a, sv_2mortal(newSVuv((UV)(c_a))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderDrawColorFloat(sv_renderer, sv_r, sv_g, sv_b, sv_a)
	SV *sv_renderer
	SV *sv_r
	SV *sv_g
	SV *sv_b
	SV *sv_a
    PREINIT:
	SDL_Renderer * c_renderer;
	float c_r; float * p_r; SV *t_r;
	float c_g; float * p_g; SV *t_g;
	float c_b; float * p_b; SV *t_b;
	float c_a; float * p_a; SV *t_a;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderDrawColorFloat(renderer)");
	t_r = bg_outref_target(aTHX_ sv_r);
	c_r = (t_r && SvOK(t_r)) ? (float)bg_in_nv(aTHX_ t_r, "SDL_GetRenderDrawColorFloat(r)") : (float)0;
	p_r = t_r ? &c_r : (float *)bg_outref_raw(aTHX_ sv_r, "SDL_GetRenderDrawColorFloat(r)");
	t_g = bg_outref_target(aTHX_ sv_g);
	c_g = (t_g && SvOK(t_g)) ? (float)bg_in_nv(aTHX_ t_g, "SDL_GetRenderDrawColorFloat(g)") : (float)0;
	p_g = t_g ? &c_g : (float *)bg_outref_raw(aTHX_ sv_g, "SDL_GetRenderDrawColorFloat(g)");
	t_b = bg_outref_target(aTHX_ sv_b);
	c_b = (t_b && SvOK(t_b)) ? (float)bg_in_nv(aTHX_ t_b, "SDL_GetRenderDrawColorFloat(b)") : (float)0;
	p_b = t_b ? &c_b : (float *)bg_outref_raw(aTHX_ sv_b, "SDL_GetRenderDrawColorFloat(b)");
	t_a = bg_outref_target(aTHX_ sv_a);
	c_a = (t_a && SvOK(t_a)) ? (float)bg_in_nv(aTHX_ t_a, "SDL_GetRenderDrawColorFloat(a)") : (float)0;
	p_a = t_a ? &c_a : (float *)bg_outref_raw(aTHX_ sv_a, "SDL_GetRenderDrawColorFloat(a)");
	c_bg_ret = SDL_GetRenderDrawColorFloat(c_renderer, p_r, p_g, p_b, p_a);
	if (t_r) sv_setsv(t_r, sv_2mortal(newSVnv((NV)(c_r))));
	if (t_g) sv_setsv(t_g, sv_2mortal(newSVnv((NV)(c_g))));
	if (t_b) sv_setsv(t_b, sv_2mortal(newSVnv((NV)(c_b))));
	if (t_a) sv_setsv(t_a, sv_2mortal(newSVnv((NV)(c_a))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetRenderColorScale(sv_renderer, sv_scale)
	SV *sv_renderer
	SV *sv_scale
    PREINIT:
	SDL_Renderer * c_renderer;
	float c_scale;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_SetRenderColorScale(renderer)");
	c_scale = (float)bg_in_nv(aTHX_ sv_scale, "SDL_SetRenderColorScale(scale)");
	c_bg_ret = SDL_SetRenderColorScale(c_renderer, c_scale);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderColorScale(sv_renderer, sv_scale)
	SV *sv_renderer
	SV *sv_scale
    PREINIT:
	SDL_Renderer * c_renderer;
	float c_scale; float * p_scale; SV *t_scale;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderColorScale(renderer)");
	t_scale = bg_outref_target(aTHX_ sv_scale);
	c_scale = (t_scale && SvOK(t_scale)) ? (float)bg_in_nv(aTHX_ t_scale, "SDL_GetRenderColorScale(scale)") : (float)0;
	p_scale = t_scale ? &c_scale : (float *)bg_outref_raw(aTHX_ sv_scale, "SDL_GetRenderColorScale(scale)");
	c_bg_ret = SDL_GetRenderColorScale(c_renderer, p_scale);
	if (t_scale) sv_setsv(t_scale, sv_2mortal(newSVnv((NV)(c_scale))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetRenderDrawBlendMode(sv_renderer, sv_blendMode)
	SV *sv_renderer
	SV *sv_blendMode
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_BlendMode c_blendMode;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_SetRenderDrawBlendMode(renderer)");
	c_blendMode = (SDL_BlendMode)bg_in_uv(aTHX_ sv_blendMode, "SDL_SetRenderDrawBlendMode(blendMode)");
	c_bg_ret = SDL_SetRenderDrawBlendMode(c_renderer, c_blendMode);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderDrawBlendMode(sv_renderer, sv_blendMode)
	SV *sv_renderer
	SV *sv_blendMode
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_BlendMode c_blendMode; SDL_BlendMode * p_blendMode; SV *t_blendMode;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderDrawBlendMode(renderer)");
	t_blendMode = bg_outref_target(aTHX_ sv_blendMode);
	c_blendMode = (t_blendMode && SvOK(t_blendMode)) ? (SDL_BlendMode)bg_in_uv(aTHX_ t_blendMode, "SDL_GetRenderDrawBlendMode(blendMode)") : (SDL_BlendMode)0;
	p_blendMode = t_blendMode ? &c_blendMode : (SDL_BlendMode *)bg_outref_raw(aTHX_ sv_blendMode, "SDL_GetRenderDrawBlendMode(blendMode)");
	c_bg_ret = SDL_GetRenderDrawBlendMode(c_renderer, p_blendMode);
	if (t_blendMode) sv_setsv(t_blendMode, sv_2mortal(newSVuv((UV)(c_blendMode))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderClear(sv_renderer)
	SV *sv_renderer
    PREINIT:
	SDL_Renderer * c_renderer;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderClear(renderer)");
	c_bg_ret = SDL_RenderClear(c_renderer);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderPoint(sv_renderer, sv_x, sv_y)
	SV *sv_renderer
	SV *sv_x
	SV *sv_y
    PREINIT:
	SDL_Renderer * c_renderer;
	float c_x;
	float c_y;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderPoint(renderer)");
	c_x = (float)bg_in_nv(aTHX_ sv_x, "SDL_RenderPoint(x)");
	c_y = (float)bg_in_nv(aTHX_ sv_y, "SDL_RenderPoint(y)");
	c_bg_ret = SDL_RenderPoint(c_renderer, c_x, c_y);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderPoints(sv_renderer, sv_points, sv_count)
	SV *sv_renderer
	SV *sv_points
	SV *sv_count
    PREINIT:
	SDL_Renderer * c_renderer;
	const SDL_FPoint * c_points;
	int c_count;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderPoints(renderer)");
	c_points = (const SDL_FPoint *)bg_in_record_ptr(aTHX_ sv_points, "SDL3::FPoint", "SDL_RenderPoints(points)");
	c_count = (int)bg_in_iv(aTHX_ sv_count, "SDL_RenderPoints(count)");
	c_bg_ret = SDL_RenderPoints(c_renderer, c_points, c_count);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderLine(sv_renderer, sv_x1, sv_y1, sv_x2, sv_y2)
	SV *sv_renderer
	SV *sv_x1
	SV *sv_y1
	SV *sv_x2
	SV *sv_y2
    PREINIT:
	SDL_Renderer * c_renderer;
	float c_x1;
	float c_y1;
	float c_x2;
	float c_y2;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderLine(renderer)");
	c_x1 = (float)bg_in_nv(aTHX_ sv_x1, "SDL_RenderLine(x1)");
	c_y1 = (float)bg_in_nv(aTHX_ sv_y1, "SDL_RenderLine(y1)");
	c_x2 = (float)bg_in_nv(aTHX_ sv_x2, "SDL_RenderLine(x2)");
	c_y2 = (float)bg_in_nv(aTHX_ sv_y2, "SDL_RenderLine(y2)");
	c_bg_ret = SDL_RenderLine(c_renderer, c_x1, c_y1, c_x2, c_y2);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderLines(sv_renderer, sv_points, sv_count)
	SV *sv_renderer
	SV *sv_points
	SV *sv_count
    PREINIT:
	SDL_Renderer * c_renderer;
	const SDL_FPoint * c_points;
	int c_count;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderLines(renderer)");
	c_points = (const SDL_FPoint *)bg_in_record_ptr(aTHX_ sv_points, "SDL3::FPoint", "SDL_RenderLines(points)");
	c_count = (int)bg_in_iv(aTHX_ sv_count, "SDL_RenderLines(count)");
	c_bg_ret = SDL_RenderLines(c_renderer, c_points, c_count);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderRect(sv_renderer, sv_rect)
	SV *sv_renderer
	SV *sv_rect
    PREINIT:
	SDL_Renderer * c_renderer;
	const SDL_FRect * c_rect;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderRect(renderer)");
	c_rect = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::FRect", "SDL_RenderRect(rect)");
	c_bg_ret = SDL_RenderRect(c_renderer, c_rect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderRects(sv_renderer, sv_rects, sv_count)
	SV *sv_renderer
	SV *sv_rects
	SV *sv_count
    PREINIT:
	SDL_Renderer * c_renderer;
	const SDL_FRect * c_rects;
	int c_count;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderRects(renderer)");
	c_rects = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_rects, "SDL3::FRect", "SDL_RenderRects(rects)");
	c_count = (int)bg_in_iv(aTHX_ sv_count, "SDL_RenderRects(count)");
	c_bg_ret = SDL_RenderRects(c_renderer, c_rects, c_count);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderFillRect(sv_renderer, sv_rect)
	SV *sv_renderer
	SV *sv_rect
    PREINIT:
	SDL_Renderer * c_renderer;
	const SDL_FRect * c_rect;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderFillRect(renderer)");
	c_rect = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::FRect", "SDL_RenderFillRect(rect)");
	c_bg_ret = SDL_RenderFillRect(c_renderer, c_rect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderFillRects(sv_renderer, sv_rects, sv_count)
	SV *sv_renderer
	SV *sv_rects
	SV *sv_count
    PREINIT:
	SDL_Renderer * c_renderer;
	const SDL_FRect * c_rects;
	int c_count;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderFillRects(renderer)");
	c_rects = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_rects, "SDL3::FRect", "SDL_RenderFillRects(rects)");
	c_count = (int)bg_in_iv(aTHX_ sv_count, "SDL_RenderFillRects(count)");
	c_bg_ret = SDL_RenderFillRects(c_renderer, c_rects, c_count);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderTexture(sv_renderer, sv_texture, sv_srcrect, sv_dstrect)
	SV *sv_renderer
	SV *sv_texture
	SV *sv_srcrect
	SV *sv_dstrect
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Texture * c_texture;
	const SDL_FRect * c_srcrect;
	const SDL_FRect * c_dstrect;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderTexture(renderer)");
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_RenderTexture(texture)");
	c_srcrect = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_srcrect, "SDL3::FRect", "SDL_RenderTexture(srcrect)");
	c_dstrect = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_dstrect, "SDL3::FRect", "SDL_RenderTexture(dstrect)");
	c_bg_ret = SDL_RenderTexture(c_renderer, c_texture, c_srcrect, c_dstrect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderTextureRotated(sv_renderer, sv_texture, sv_srcrect, sv_dstrect, sv_angle, sv_center, sv_flip)
	SV *sv_renderer
	SV *sv_texture
	SV *sv_srcrect
	SV *sv_dstrect
	SV *sv_angle
	SV *sv_center
	SV *sv_flip
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Texture * c_texture;
	const SDL_FRect * c_srcrect;
	const SDL_FRect * c_dstrect;
	double c_angle;
	const SDL_FPoint * c_center;
	SDL_FlipMode c_flip;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderTextureRotated(renderer)");
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_RenderTextureRotated(texture)");
	c_srcrect = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_srcrect, "SDL3::FRect", "SDL_RenderTextureRotated(srcrect)");
	c_dstrect = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_dstrect, "SDL3::FRect", "SDL_RenderTextureRotated(dstrect)");
	c_angle = (double)bg_in_nv(aTHX_ sv_angle, "SDL_RenderTextureRotated(angle)");
	c_center = (const SDL_FPoint *)bg_in_record_ptr(aTHX_ sv_center, "SDL3::FPoint", "SDL_RenderTextureRotated(center)");
	c_flip = (SDL_FlipMode)bg_in_iv(aTHX_ sv_flip, "SDL_RenderTextureRotated(flip)");
	c_bg_ret = SDL_RenderTextureRotated(c_renderer, c_texture, c_srcrect, c_dstrect, c_angle, c_center, c_flip);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderTextureAffine(sv_renderer, sv_texture, sv_srcrect, sv_origin, sv_right, sv_down)
	SV *sv_renderer
	SV *sv_texture
	SV *sv_srcrect
	SV *sv_origin
	SV *sv_right
	SV *sv_down
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Texture * c_texture;
	const SDL_FRect * c_srcrect;
	const SDL_FPoint * c_origin;
	const SDL_FPoint * c_right;
	const SDL_FPoint * c_down;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderTextureAffine(renderer)");
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_RenderTextureAffine(texture)");
	c_srcrect = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_srcrect, "SDL3::FRect", "SDL_RenderTextureAffine(srcrect)");
	c_origin = (const SDL_FPoint *)bg_in_record_ptr(aTHX_ sv_origin, "SDL3::FPoint", "SDL_RenderTextureAffine(origin)");
	c_right = (const SDL_FPoint *)bg_in_record_ptr(aTHX_ sv_right, "SDL3::FPoint", "SDL_RenderTextureAffine(right)");
	c_down = (const SDL_FPoint *)bg_in_record_ptr(aTHX_ sv_down, "SDL3::FPoint", "SDL_RenderTextureAffine(down)");
	c_bg_ret = SDL_RenderTextureAffine(c_renderer, c_texture, c_srcrect, c_origin, c_right, c_down);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderTextureTiled(sv_renderer, sv_texture, sv_srcrect, sv_scale, sv_dstrect)
	SV *sv_renderer
	SV *sv_texture
	SV *sv_srcrect
	SV *sv_scale
	SV *sv_dstrect
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Texture * c_texture;
	const SDL_FRect * c_srcrect;
	float c_scale;
	const SDL_FRect * c_dstrect;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderTextureTiled(renderer)");
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_RenderTextureTiled(texture)");
	c_srcrect = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_srcrect, "SDL3::FRect", "SDL_RenderTextureTiled(srcrect)");
	c_scale = (float)bg_in_nv(aTHX_ sv_scale, "SDL_RenderTextureTiled(scale)");
	c_dstrect = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_dstrect, "SDL3::FRect", "SDL_RenderTextureTiled(dstrect)");
	c_bg_ret = SDL_RenderTextureTiled(c_renderer, c_texture, c_srcrect, c_scale, c_dstrect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderTexture9Grid(sv_renderer, sv_texture, sv_srcrect, sv_left_width, sv_right_width, sv_top_height, sv_bottom_height, sv_scale, sv_dstrect)
	SV *sv_renderer
	SV *sv_texture
	SV *sv_srcrect
	SV *sv_left_width
	SV *sv_right_width
	SV *sv_top_height
	SV *sv_bottom_height
	SV *sv_scale
	SV *sv_dstrect
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Texture * c_texture;
	const SDL_FRect * c_srcrect;
	float c_left_width;
	float c_right_width;
	float c_top_height;
	float c_bottom_height;
	float c_scale;
	const SDL_FRect * c_dstrect;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderTexture9Grid(renderer)");
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_RenderTexture9Grid(texture)");
	c_srcrect = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_srcrect, "SDL3::FRect", "SDL_RenderTexture9Grid(srcrect)");
	c_left_width = (float)bg_in_nv(aTHX_ sv_left_width, "SDL_RenderTexture9Grid(left_width)");
	c_right_width = (float)bg_in_nv(aTHX_ sv_right_width, "SDL_RenderTexture9Grid(right_width)");
	c_top_height = (float)bg_in_nv(aTHX_ sv_top_height, "SDL_RenderTexture9Grid(top_height)");
	c_bottom_height = (float)bg_in_nv(aTHX_ sv_bottom_height, "SDL_RenderTexture9Grid(bottom_height)");
	c_scale = (float)bg_in_nv(aTHX_ sv_scale, "SDL_RenderTexture9Grid(scale)");
	c_dstrect = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_dstrect, "SDL3::FRect", "SDL_RenderTexture9Grid(dstrect)");
	c_bg_ret = SDL_RenderTexture9Grid(c_renderer, c_texture, c_srcrect, c_left_width, c_right_width, c_top_height, c_bottom_height, c_scale, c_dstrect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderTexture9GridTiled(sv_renderer, sv_texture, sv_srcrect, sv_left_width, sv_right_width, sv_top_height, sv_bottom_height, sv_scale, sv_dstrect, sv_tileScale)
	SV *sv_renderer
	SV *sv_texture
	SV *sv_srcrect
	SV *sv_left_width
	SV *sv_right_width
	SV *sv_top_height
	SV *sv_bottom_height
	SV *sv_scale
	SV *sv_dstrect
	SV *sv_tileScale
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Texture * c_texture;
	const SDL_FRect * c_srcrect;
	float c_left_width;
	float c_right_width;
	float c_top_height;
	float c_bottom_height;
	float c_scale;
	const SDL_FRect * c_dstrect;
	float c_tileScale;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderTexture9GridTiled(renderer)");
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_RenderTexture9GridTiled(texture)");
	c_srcrect = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_srcrect, "SDL3::FRect", "SDL_RenderTexture9GridTiled(srcrect)");
	c_left_width = (float)bg_in_nv(aTHX_ sv_left_width, "SDL_RenderTexture9GridTiled(left_width)");
	c_right_width = (float)bg_in_nv(aTHX_ sv_right_width, "SDL_RenderTexture9GridTiled(right_width)");
	c_top_height = (float)bg_in_nv(aTHX_ sv_top_height, "SDL_RenderTexture9GridTiled(top_height)");
	c_bottom_height = (float)bg_in_nv(aTHX_ sv_bottom_height, "SDL_RenderTexture9GridTiled(bottom_height)");
	c_scale = (float)bg_in_nv(aTHX_ sv_scale, "SDL_RenderTexture9GridTiled(scale)");
	c_dstrect = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_dstrect, "SDL3::FRect", "SDL_RenderTexture9GridTiled(dstrect)");
	c_tileScale = (float)bg_in_nv(aTHX_ sv_tileScale, "SDL_RenderTexture9GridTiled(tileScale)");
	c_bg_ret = SDL_RenderTexture9GridTiled(c_renderer, c_texture, c_srcrect, c_left_width, c_right_width, c_top_height, c_bottom_height, c_scale, c_dstrect, c_tileScale);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderGeometry(sv_renderer, sv_texture, sv_vertices, sv_num_vertices, sv_indices, sv_num_indices)
	SV *sv_renderer
	SV *sv_texture
	SV *sv_vertices
	SV *sv_num_vertices
	SV *sv_indices
	SV *sv_num_indices
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Texture * c_texture;
	const SDL_Vertex * c_vertices;
	int c_num_vertices;
	const int * c_indices;
	int c_num_indices;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderGeometry(renderer)");
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_RenderGeometry(texture)");
	c_vertices = (const SDL_Vertex *)bg_in_record_ptr(aTHX_ sv_vertices, "SDL3::Vertex", "SDL_RenderGeometry(vertices)");
	c_num_vertices = (int)bg_in_iv(aTHX_ sv_num_vertices, "SDL_RenderGeometry(num_vertices)");
	c_indices = (const int *)bg_in_raw_ptr(aTHX_ sv_indices, "SDL_RenderGeometry(indices)");
	c_num_indices = (int)bg_in_iv(aTHX_ sv_num_indices, "SDL_RenderGeometry(num_indices)");
	c_bg_ret = SDL_RenderGeometry(c_renderer, c_texture, c_vertices, c_num_vertices, c_indices, c_num_indices);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderGeometryRaw(sv_renderer, sv_texture, sv_xy, sv_xy_stride, sv_color, sv_color_stride, sv_uv, sv_uv_stride, sv_num_vertices, sv_indices, sv_num_indices, sv_size_indices)
	SV *sv_renderer
	SV *sv_texture
	SV *sv_xy
	SV *sv_xy_stride
	SV *sv_color
	SV *sv_color_stride
	SV *sv_uv
	SV *sv_uv_stride
	SV *sv_num_vertices
	SV *sv_indices
	SV *sv_num_indices
	SV *sv_size_indices
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_Texture * c_texture;
	const float * c_xy;
	int c_xy_stride;
	const SDL_FColor * c_color;
	int c_color_stride;
	const float * c_uv;
	int c_uv_stride;
	int c_num_vertices;
	const void * c_indices;
	int c_num_indices;
	int c_size_indices;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderGeometryRaw(renderer)");
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_RenderGeometryRaw(texture)");
	c_xy = (const float *)bg_in_raw_ptr(aTHX_ sv_xy, "SDL_RenderGeometryRaw(xy)");
	c_xy_stride = (int)bg_in_iv(aTHX_ sv_xy_stride, "SDL_RenderGeometryRaw(xy_stride)");
	c_color = (const SDL_FColor *)bg_in_record_ptr(aTHX_ sv_color, "SDL3::FColor", "SDL_RenderGeometryRaw(color)");
	c_color_stride = (int)bg_in_iv(aTHX_ sv_color_stride, "SDL_RenderGeometryRaw(color_stride)");
	c_uv = (const float *)bg_in_raw_ptr(aTHX_ sv_uv, "SDL_RenderGeometryRaw(uv)");
	c_uv_stride = (int)bg_in_iv(aTHX_ sv_uv_stride, "SDL_RenderGeometryRaw(uv_stride)");
	c_num_vertices = (int)bg_in_iv(aTHX_ sv_num_vertices, "SDL_RenderGeometryRaw(num_vertices)");
	c_indices = (const void *)bg_in_raw_ptr(aTHX_ sv_indices, "SDL_RenderGeometryRaw(indices)");
	c_num_indices = (int)bg_in_iv(aTHX_ sv_num_indices, "SDL_RenderGeometryRaw(num_indices)");
	c_size_indices = (int)bg_in_iv(aTHX_ sv_size_indices, "SDL_RenderGeometryRaw(size_indices)");
	c_bg_ret = SDL_RenderGeometryRaw(c_renderer, c_texture, c_xy, c_xy_stride, c_color, c_color_stride, c_uv, c_uv_stride, c_num_vertices, c_indices, c_num_indices, c_size_indices);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetRenderTextureAddressMode(sv_renderer, sv_u_mode, sv_v_mode)
	SV *sv_renderer
	SV *sv_u_mode
	SV *sv_v_mode
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_TextureAddressMode c_u_mode;
	SDL_TextureAddressMode c_v_mode;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_SetRenderTextureAddressMode(renderer)");
	c_u_mode = (SDL_TextureAddressMode)bg_in_iv(aTHX_ sv_u_mode, "SDL_SetRenderTextureAddressMode(u_mode)");
	c_v_mode = (SDL_TextureAddressMode)bg_in_iv(aTHX_ sv_v_mode, "SDL_SetRenderTextureAddressMode(v_mode)");
	c_bg_ret = SDL_SetRenderTextureAddressMode(c_renderer, c_u_mode, c_v_mode);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderTextureAddressMode(sv_renderer, sv_u_mode, sv_v_mode)
	SV *sv_renderer
	SV *sv_u_mode
	SV *sv_v_mode
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_TextureAddressMode c_u_mode; SDL_TextureAddressMode * p_u_mode; SV *t_u_mode;
	SDL_TextureAddressMode c_v_mode; SDL_TextureAddressMode * p_v_mode; SV *t_v_mode;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderTextureAddressMode(renderer)");
	t_u_mode = bg_outref_target(aTHX_ sv_u_mode);
	c_u_mode = (t_u_mode && SvOK(t_u_mode)) ? (SDL_TextureAddressMode)bg_in_iv(aTHX_ t_u_mode, "SDL_GetRenderTextureAddressMode(u_mode)") : (SDL_TextureAddressMode)0;
	p_u_mode = t_u_mode ? &c_u_mode : (SDL_TextureAddressMode *)bg_outref_raw(aTHX_ sv_u_mode, "SDL_GetRenderTextureAddressMode(u_mode)");
	t_v_mode = bg_outref_target(aTHX_ sv_v_mode);
	c_v_mode = (t_v_mode && SvOK(t_v_mode)) ? (SDL_TextureAddressMode)bg_in_iv(aTHX_ t_v_mode, "SDL_GetRenderTextureAddressMode(v_mode)") : (SDL_TextureAddressMode)0;
	p_v_mode = t_v_mode ? &c_v_mode : (SDL_TextureAddressMode *)bg_outref_raw(aTHX_ sv_v_mode, "SDL_GetRenderTextureAddressMode(v_mode)");
	c_bg_ret = SDL_GetRenderTextureAddressMode(c_renderer, p_u_mode, p_v_mode);
	if (t_u_mode) sv_setsv(t_u_mode, sv_2mortal(newSViv((IV)(c_u_mode))));
	if (t_v_mode) sv_setsv(t_v_mode, sv_2mortal(newSViv((IV)(c_v_mode))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderReadPixels(sv_renderer, sv_rect)
	SV *sv_renderer
	SV *sv_rect
    PREINIT:
	SDL_Renderer * c_renderer;
	const SDL_Rect * c_rect;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderReadPixels(renderer)");
	c_rect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_RenderReadPixels(rect)");
	c_bg_ret = SDL_RenderReadPixels(c_renderer, c_rect);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_RenderPresent(sv_renderer)
	SV *sv_renderer
    PREINIT:
	SDL_Renderer * c_renderer;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderPresent(renderer)");
	c_bg_ret = SDL_RenderPresent(c_renderer);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_DestroyTexture(sv_texture)
	SV *sv_texture
    PREINIT:
	SDL_Texture * c_texture;
    PPCODE:
	c_texture = (SDL_Texture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::Texture", "SDL_DestroyTexture(texture)");
	SDL_DestroyTexture(c_texture);
	XSRETURN(0);

void
SDL_DestroyRenderer(sv_renderer)
	SV *sv_renderer
    PREINIT:
	SDL_Renderer * c_renderer;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_DestroyRenderer(renderer)");
	SDL_DestroyRenderer(c_renderer);
	XSRETURN(0);

void
SDL_FlushRenderer(sv_renderer)
	SV *sv_renderer
    PREINIT:
	SDL_Renderer * c_renderer;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_FlushRenderer(renderer)");
	c_bg_ret = SDL_FlushRenderer(c_renderer);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderMetalLayer(sv_renderer)
	SV *sv_renderer
    PREINIT:
	SDL_Renderer * c_renderer;
	void * c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderMetalLayer(renderer)");
	c_bg_ret = SDL_GetRenderMetalLayer(c_renderer);
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetRenderMetalCommandEncoder(sv_renderer)
	SV *sv_renderer
    PREINIT:
	SDL_Renderer * c_renderer;
	void * c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderMetalCommandEncoder(renderer)");
	c_bg_ret = SDL_GetRenderMetalCommandEncoder(c_renderer);
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_AddVulkanRenderSemaphores(sv_renderer, sv_wait_stage_mask, sv_wait_semaphore, sv_signal_semaphore)
	SV *sv_renderer
	SV *sv_wait_stage_mask
	SV *sv_wait_semaphore
	SV *sv_signal_semaphore
    PREINIT:
	SDL_Renderer * c_renderer;
	Uint32 c_wait_stage_mask;
	Sint64 c_wait_semaphore;
	Sint64 c_signal_semaphore;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_AddVulkanRenderSemaphores(renderer)");
	c_wait_stage_mask = (Uint32)bg_in_uv(aTHX_ sv_wait_stage_mask, "SDL_AddVulkanRenderSemaphores(wait_stage_mask)");
	c_wait_semaphore = (Sint64)bg_in_iv(aTHX_ sv_wait_semaphore, "SDL_AddVulkanRenderSemaphores(wait_semaphore)");
	c_signal_semaphore = (Sint64)bg_in_iv(aTHX_ sv_signal_semaphore, "SDL_AddVulkanRenderSemaphores(signal_semaphore)");
	c_bg_ret = SDL_AddVulkanRenderSemaphores(c_renderer, c_wait_stage_mask, c_wait_semaphore, c_signal_semaphore);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetRenderVSync(sv_renderer, sv_vsync)
	SV *sv_renderer
	SV *sv_vsync
    PREINIT:
	SDL_Renderer * c_renderer;
	int c_vsync;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_SetRenderVSync(renderer)");
	c_vsync = (int)bg_in_iv(aTHX_ sv_vsync, "SDL_SetRenderVSync(vsync)");
	c_bg_ret = SDL_SetRenderVSync(c_renderer, c_vsync);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRenderVSync(sv_renderer, sv_vsync)
	SV *sv_renderer
	SV *sv_vsync
    PREINIT:
	SDL_Renderer * c_renderer;
	int c_vsync; int * p_vsync; SV *t_vsync;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetRenderVSync(renderer)");
	t_vsync = bg_outref_target(aTHX_ sv_vsync);
	c_vsync = (t_vsync && SvOK(t_vsync)) ? (int)bg_in_iv(aTHX_ t_vsync, "SDL_GetRenderVSync(vsync)") : (int)0;
	p_vsync = t_vsync ? &c_vsync : (int *)bg_outref_raw(aTHX_ sv_vsync, "SDL_GetRenderVSync(vsync)");
	c_bg_ret = SDL_GetRenderVSync(c_renderer, p_vsync);
	if (t_vsync) sv_setsv(t_vsync, sv_2mortal(newSViv((IV)(c_vsync))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderDebugText(sv_renderer, sv_x, sv_y, sv_str)
	SV *sv_renderer
	SV *sv_x
	SV *sv_y
	SV *sv_str
    PREINIT:
	SDL_Renderer * c_renderer;
	float c_x;
	float c_y;
	const char * c_str;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderDebugText(renderer)");
	c_x = (float)bg_in_nv(aTHX_ sv_x, "SDL_RenderDebugText(x)");
	c_y = (float)bg_in_nv(aTHX_ sv_y, "SDL_RenderDebugText(y)");
	c_str = (const char *)bg_in_string(aTHX_ sv_str, "SDL_RenderDebugText(str)");
	c_bg_ret = SDL_RenderDebugText(c_renderer, c_x, c_y, c_str);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenderDebugTextFormat(sv_renderer, sv_x, sv_y, sv_message)
	SV *sv_renderer
	SV *sv_x
	SV *sv_y
	SV *sv_message
    PREINIT:
	SDL_Renderer * c_renderer;
	float c_x;
	float c_y;
	const char *c_message;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_RenderDebugTextFormat(renderer)");
	c_x = (float)bg_in_nv(aTHX_ sv_x, "SDL_RenderDebugTextFormat(x)");
	c_y = (float)bg_in_nv(aTHX_ sv_y, "SDL_RenderDebugTextFormat(y)");
	c_message = bg_in_string(aTHX_ sv_message, "SDL_RenderDebugTextFormat(message)");
	c_bg_ret = SDL_RenderDebugTextFormat(c_renderer, c_x, c_y, "%s", (c_message ? c_message : ""));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetDefaultTextureScaleMode(sv_renderer, sv_scale_mode)
	SV *sv_renderer
	SV *sv_scale_mode
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_ScaleMode c_scale_mode;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_SetDefaultTextureScaleMode(renderer)");
	c_scale_mode = (SDL_ScaleMode)bg_in_iv(aTHX_ sv_scale_mode, "SDL_SetDefaultTextureScaleMode(scale_mode)");
	c_bg_ret = SDL_SetDefaultTextureScaleMode(c_renderer, c_scale_mode);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetDefaultTextureScaleMode(sv_renderer, sv_scale_mode)
	SV *sv_renderer
	SV *sv_scale_mode
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_ScaleMode c_scale_mode; SDL_ScaleMode * p_scale_mode; SV *t_scale_mode;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_GetDefaultTextureScaleMode(renderer)");
	t_scale_mode = bg_outref_target(aTHX_ sv_scale_mode);
	c_scale_mode = (t_scale_mode && SvOK(t_scale_mode)) ? (SDL_ScaleMode)bg_in_iv(aTHX_ t_scale_mode, "SDL_GetDefaultTextureScaleMode(scale_mode)") : (SDL_ScaleMode)0;
	p_scale_mode = t_scale_mode ? &c_scale_mode : (SDL_ScaleMode *)bg_outref_raw(aTHX_ sv_scale_mode, "SDL_GetDefaultTextureScaleMode(scale_mode)");
	c_bg_ret = SDL_GetDefaultTextureScaleMode(c_renderer, p_scale_mode);
	if (t_scale_mode) sv_setsv(t_scale_mode, sv_2mortal(newSViv((IV)(c_scale_mode))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CreateGPURenderState(sv_renderer, sv_createinfo)
	SV *sv_renderer
	SV *sv_createinfo
    PREINIT:
	SDL_Renderer * c_renderer;
	const SDL_GPURenderStateCreateInfo * c_createinfo;
	SDL_GPURenderState * c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_CreateGPURenderState(renderer)");
	c_createinfo = (const SDL_GPURenderStateCreateInfo *)bg_in_record_ptr(aTHX_ sv_createinfo, "SDL3::GPURenderStateCreateInfo", "SDL_CreateGPURenderState(createinfo)");
	c_bg_ret = SDL_CreateGPURenderState(c_renderer, c_createinfo);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPURenderState"));
	XSRETURN(1);

void
SDL_SetGPURenderStateFragmentUniforms(sv_state, sv_slot_index, sv_data, sv_length)
	SV *sv_state
	SV *sv_slot_index
	SV *sv_data
	SV *sv_length
    PREINIT:
	SDL_GPURenderState * c_state;
	Uint32 c_slot_index;
	const void * c_data;
	Uint32 c_length;
	_Bool c_bg_ret;
    PPCODE:
	c_state = (SDL_GPURenderState *)bg_in_record_ptr(aTHX_ sv_state, "SDL3::GPURenderState", "SDL_SetGPURenderStateFragmentUniforms(state)");
	c_slot_index = (Uint32)bg_in_uv(aTHX_ sv_slot_index, "SDL_SetGPURenderStateFragmentUniforms(slot_index)");
	c_data = (const void *)bg_in_raw_ptr(aTHX_ sv_data, "SDL_SetGPURenderStateFragmentUniforms(data)");
	c_length = (Uint32)bg_in_uv(aTHX_ sv_length, "SDL_SetGPURenderStateFragmentUniforms(length)");
	c_bg_ret = SDL_SetGPURenderStateFragmentUniforms(c_state, c_slot_index, c_data, c_length);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetGPURenderState(sv_renderer, sv_state)
	SV *sv_renderer
	SV *sv_state
    PREINIT:
	SDL_Renderer * c_renderer;
	SDL_GPURenderState * c_state;
	_Bool c_bg_ret;
    PPCODE:
	c_renderer = (SDL_Renderer *)bg_in_record_ptr(aTHX_ sv_renderer, "SDL3::Renderer", "SDL_SetGPURenderState(renderer)");
	c_state = (SDL_GPURenderState *)bg_in_record_ptr(aTHX_ sv_state, "SDL3::GPURenderState", "SDL_SetGPURenderState(state)");
	c_bg_ret = SDL_SetGPURenderState(c_renderer, c_state);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_DestroyGPURenderState(sv_state)
	SV *sv_state
    PREINIT:
	SDL_GPURenderState * c_state;
    PPCODE:
	c_state = (SDL_GPURenderState *)bg_in_record_ptr(aTHX_ sv_state, "SDL3::GPURenderState", "SDL_DestroyGPURenderState(state)");
	SDL_DestroyGPURenderState(c_state);
	XSRETURN(0);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Render", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE", BG_CONST_SV(SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_RENDERER", BG_CONST_SV(SDL_GPU_RENDERER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_CREATE_GPU_DEVICE_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_CREATE_GPU_DEVICE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_CREATE_GPU_SHADERS_DXIL_BOOLEAN", BG_CONST_SV(SDL_PROP_RENDERER_CREATE_GPU_SHADERS_DXIL_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_CREATE_GPU_SHADERS_MSL_BOOLEAN", BG_CONST_SV(SDL_PROP_RENDERER_CREATE_GPU_SHADERS_MSL_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_CREATE_GPU_SHADERS_SPIRV_BOOLEAN", BG_CONST_SV(SDL_PROP_RENDERER_CREATE_GPU_SHADERS_SPIRV_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_CREATE_NAME_STRING", BG_CONST_SV(SDL_PROP_RENDERER_CREATE_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER", BG_CONST_SV(SDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER", BG_CONST_SV(SDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_CREATE_SURFACE_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_CREATE_SURFACE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER", BG_CONST_SV(SDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER", BG_CONST_SV(SDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER", BG_CONST_SV(SDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_CREATE_WINDOW_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_CREATE_WINDOW_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_D3D11_DEVICE_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_D3D11_DEVICE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_D3D12_DEVICE_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_D3D12_DEVICE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_D3D9_DEVICE_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_D3D9_DEVICE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_GPU_DEVICE_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_GPU_DEVICE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN", BG_CONST_SV(SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT", BG_CONST_SV(SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER", BG_CONST_SV(SDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_NAME_STRING", BG_CONST_SV(SDL_PROP_RENDERER_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER", BG_CONST_SV(SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT", BG_CONST_SV(SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_SURFACE_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_SURFACE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN", BG_CONST_SV(SDL_PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_VSYNC_NUMBER", BG_CONST_SV(SDL_PROP_RENDERER_VSYNC_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_VULKAN_DEVICE_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_VULKAN_DEVICE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER", BG_CONST_SV(SDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER", BG_CONST_SV(SDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER", BG_CONST_SV(SDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER", BG_CONST_SV(SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_RENDERER_WINDOW_POINTER", BG_CONST_SV(SDL_PROP_RENDERER_WINDOW_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_ACCESS_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_ACCESS_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_COLORSPACE_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_COLORSPACE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_UV_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_UV_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_U_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_U_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_V_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_V_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_PALETTE_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_PALETTE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_VULKAN_LAYOUT_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_VULKAN_LAYOUT_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_FORMAT_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_FORMAT_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_GPU_TEXTURE_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_GPU_TEXTURE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_GPU_TEXTURE_UV_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_GPU_TEXTURE_UV_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_GPU_TEXTURE_U_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_GPU_TEXTURE_U_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_GPU_TEXTURE_V_POINTER", BG_CONST_SV(SDL_PROP_TEXTURE_GPU_TEXTURE_V_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT", BG_CONST_SV(SDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_HEIGHT_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_HEIGHT_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT", BG_CONST_SV(SDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT", BG_CONST_SV(SDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT", BG_CONST_SV(SDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTURE_WIDTH_NUMBER", BG_CONST_SV(SDL_PROP_TEXTURE_WIDTH_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_RENDERER_VSYNC_ADAPTIVE", BG_CONST_SV(SDL_RENDERER_VSYNC_ADAPTIVE));
	bg_export_constant(aTHX_ stash, "SDL_RENDERER_VSYNC_DISABLED", BG_CONST_SV(SDL_RENDERER_VSYNC_DISABLED));
	bg_export_constant(aTHX_ stash, "SDL_SOFTWARE_RENDERER", BG_CONST_SV(SDL_SOFTWARE_RENDERER));
	bg_export_constant(aTHX_ stash, "SDL_TEXTUREACCESS_STATIC", BG_CONST_SV(SDL_TEXTUREACCESS_STATIC));
	bg_export_constant(aTHX_ stash, "SDL_TEXTUREACCESS_STREAMING", BG_CONST_SV(SDL_TEXTUREACCESS_STREAMING));
	bg_export_constant(aTHX_ stash, "SDL_TEXTUREACCESS_TARGET", BG_CONST_SV(SDL_TEXTUREACCESS_TARGET));
	bg_export_constant(aTHX_ stash, "SDL_TEXTURE_ADDRESS_INVALID", BG_CONST_SV(SDL_TEXTURE_ADDRESS_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_TEXTURE_ADDRESS_AUTO", BG_CONST_SV(SDL_TEXTURE_ADDRESS_AUTO));
	bg_export_constant(aTHX_ stash, "SDL_TEXTURE_ADDRESS_CLAMP", BG_CONST_SV(SDL_TEXTURE_ADDRESS_CLAMP));
	bg_export_constant(aTHX_ stash, "SDL_TEXTURE_ADDRESS_WRAP", BG_CONST_SV(SDL_TEXTURE_ADDRESS_WRAP));
	bg_export_constant(aTHX_ stash, "SDL_LOGICAL_PRESENTATION_DISABLED", BG_CONST_SV(SDL_LOGICAL_PRESENTATION_DISABLED));
	bg_export_constant(aTHX_ stash, "SDL_LOGICAL_PRESENTATION_STRETCH", BG_CONST_SV(SDL_LOGICAL_PRESENTATION_STRETCH));
	bg_export_constant(aTHX_ stash, "SDL_LOGICAL_PRESENTATION_LETTERBOX", BG_CONST_SV(SDL_LOGICAL_PRESENTATION_LETTERBOX));
	bg_export_constant(aTHX_ stash, "SDL_LOGICAL_PRESENTATION_OVERSCAN", BG_CONST_SV(SDL_LOGICAL_PRESENTATION_OVERSCAN));
	bg_export_constant(aTHX_ stash, "SDL_LOGICAL_PRESENTATION_INTEGER_SCALE", BG_CONST_SV(SDL_LOGICAL_PRESENTATION_INTEGER_SCALE));
	}

MODULE = SDL3  PACKAGE = SDL3::Vertex

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_Vertex), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_Vertex)));
	XSRETURN(1);

void
position(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Vertex *self;
    PPCODE:
	self = (struct SDL_Vertex *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Vertex", "SDL3::Vertex::position");
	if (items > 1) {
		self->position = *(struct SDL_FPoint *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::FPoint", "SDL3::Vertex::position");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->position), "SDL3::FPoint"));
	XSRETURN(1);

void
color(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Vertex *self;
    PPCODE:
	self = (struct SDL_Vertex *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Vertex", "SDL3::Vertex::color");
	if (items > 1) {
		self->color = *(struct SDL_FColor *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::FColor", "SDL3::Vertex::color");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->color), "SDL3::FColor"));
	XSRETURN(1);

void
tex_coord(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Vertex *self;
    PPCODE:
	self = (struct SDL_Vertex *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Vertex", "SDL3::Vertex::tex_coord");
	if (items > 1) {
		self->tex_coord = *(struct SDL_FPoint *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::FPoint", "SDL3::Vertex::tex_coord");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->tex_coord), "SDL3::FPoint"));
	XSRETURN(1);


MODULE = SDL3  PACKAGE = SDL3::Texture

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_Texture), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_Texture)));
	XSRETURN(1);

void
format(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Texture *self;
    PPCODE:
	self = (struct SDL_Texture *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Texture", "SDL3::Texture::format");
	if (items > 1) {
		self->format = (SDL_PixelFormat)bg_in_iv(aTHX_ ST(1), "SDL3::Texture::format");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->format)));
	XSRETURN(1);

void
w(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Texture *self;
    PPCODE:
	self = (struct SDL_Texture *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Texture", "SDL3::Texture::w");
	if (items > 1) {
		self->w = (int)bg_in_iv(aTHX_ ST(1), "SDL3::Texture::w");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->w)));
	XSRETURN(1);

void
h(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Texture *self;
    PPCODE:
	self = (struct SDL_Texture *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Texture", "SDL3::Texture::h");
	if (items > 1) {
		self->h = (int)bg_in_iv(aTHX_ ST(1), "SDL3::Texture::h");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->h)));
	XSRETURN(1);

void
refcount(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Texture *self;
    PPCODE:
	self = (struct SDL_Texture *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Texture", "SDL3::Texture::refcount");
	if (items > 1) {
		self->refcount = (int)bg_in_iv(aTHX_ ST(1), "SDL3::Texture::refcount");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->refcount)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPURenderStateCreateInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPURenderStateCreateInfo), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPURenderStateCreateInfo)));
	XSRETURN(1);

void
fragment_shader(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURenderStateCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPURenderStateCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURenderStateCreateInfo", "SDL3::GPURenderStateCreateInfo::fragment_shader");
	if (items > 1) {
		self->fragment_shader = (SDL_GPUShader *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUShader", "SDL3::GPURenderStateCreateInfo::fragment_shader");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->fragment_shader), "SDL3::GPUShader"));
	XSRETURN(1);

void
num_sampler_bindings(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURenderStateCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPURenderStateCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURenderStateCreateInfo", "SDL3::GPURenderStateCreateInfo::num_sampler_bindings");
	if (items > 1) {
		self->num_sampler_bindings = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::GPURenderStateCreateInfo::num_sampler_bindings");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->num_sampler_bindings)));
	XSRETURN(1);

void
sampler_bindings(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURenderStateCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPURenderStateCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURenderStateCreateInfo", "SDL3::GPURenderStateCreateInfo::sampler_bindings");
	if (items > 1) {
		self->sampler_bindings = (const SDL_GPUTextureSamplerBinding *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUTextureSamplerBinding", "SDL3::GPURenderStateCreateInfo::sampler_bindings");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->sampler_bindings), "SDL3::GPUTextureSamplerBinding"));
	XSRETURN(1);

void
num_storage_textures(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURenderStateCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPURenderStateCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURenderStateCreateInfo", "SDL3::GPURenderStateCreateInfo::num_storage_textures");
	if (items > 1) {
		self->num_storage_textures = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::GPURenderStateCreateInfo::num_storage_textures");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->num_storage_textures)));
	XSRETURN(1);

void
storage_textures(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURenderStateCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPURenderStateCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURenderStateCreateInfo", "SDL3::GPURenderStateCreateInfo::storage_textures");
	if (items > 1) {
		self->storage_textures = (SDL_GPUTexture * const *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::GPURenderStateCreateInfo::storage_textures");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->storage_textures), "SDL3::Pointer"));
	XSRETURN(1);

void
num_storage_buffers(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURenderStateCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPURenderStateCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURenderStateCreateInfo", "SDL3::GPURenderStateCreateInfo::num_storage_buffers");
	if (items > 1) {
		self->num_storage_buffers = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::GPURenderStateCreateInfo::num_storage_buffers");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->num_storage_buffers)));
	XSRETURN(1);

void
storage_buffers(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURenderStateCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPURenderStateCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURenderStateCreateInfo", "SDL3::GPURenderStateCreateInfo::storage_buffers");
	if (items > 1) {
		self->storage_buffers = (SDL_GPUBuffer * const *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::GPURenderStateCreateInfo::storage_buffers");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->storage_buffers), "SDL3::Pointer"));
	XSRETURN(1);

void
props(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURenderStateCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPURenderStateCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURenderStateCreateInfo", "SDL3::GPURenderStateCreateInfo::props");
	if (items > 1) {
		self->props = (SDL_PropertiesID)bg_in_uv(aTHX_ ST(1), "SDL3::GPURenderStateCreateInfo::props");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->props)));
	XSRETURN(1);

