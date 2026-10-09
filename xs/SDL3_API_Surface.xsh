MODULE = SDL3  PACKAGE = SDL3::API::Surface

void
SDL_CreateSurface(sv_width, sv_height, sv_format)
	SV *sv_width
	SV *sv_height
	SV *sv_format
    PREINIT:
	int c_width;
	int c_height;
	SDL_PixelFormat c_format;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_width = (int)bg_in_iv(aTHX_ sv_width, "SDL_CreateSurface(width)");
	c_height = (int)bg_in_iv(aTHX_ sv_height, "SDL_CreateSurface(height)");
	c_format = (SDL_PixelFormat)bg_in_iv(aTHX_ sv_format, "SDL_CreateSurface(format)");
	c_bg_ret = SDL_CreateSurface(c_width, c_height, c_format);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_CreateSurfaceFrom(sv_width, sv_height, sv_format, sv_pixels, sv_pitch)
	SV *sv_width
	SV *sv_height
	SV *sv_format
	SV *sv_pixels
	SV *sv_pitch
    PREINIT:
	int c_width;
	int c_height;
	SDL_PixelFormat c_format;
	void * c_pixels;
	int c_pitch;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_width = (int)bg_in_iv(aTHX_ sv_width, "SDL_CreateSurfaceFrom(width)");
	c_height = (int)bg_in_iv(aTHX_ sv_height, "SDL_CreateSurfaceFrom(height)");
	c_format = (SDL_PixelFormat)bg_in_iv(aTHX_ sv_format, "SDL_CreateSurfaceFrom(format)");
	c_pixels = (void *)bg_in_raw_ptr(aTHX_ sv_pixels, "SDL_CreateSurfaceFrom(pixels)");
	c_pitch = (int)bg_in_iv(aTHX_ sv_pitch, "SDL_CreateSurfaceFrom(pitch)");
	c_bg_ret = SDL_CreateSurfaceFrom(c_width, c_height, c_format, c_pixels, c_pitch);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_DestroySurface(sv_surface)
	SV *sv_surface
    PREINIT:
	SDL_Surface * c_surface;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_DestroySurface(surface)");
	SDL_DestroySurface(c_surface);
	XSRETURN(0);

void
SDL_GetSurfaceProperties(sv_surface)
	SV *sv_surface
    PREINIT:
	SDL_Surface * c_surface;
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_GetSurfaceProperties(surface)");
	c_bg_ret = SDL_GetSurfaceProperties(c_surface);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetSurfaceColorspace(sv_surface, sv_colorspace)
	SV *sv_surface
	SV *sv_colorspace
    PREINIT:
	SDL_Surface * c_surface;
	SDL_Colorspace c_colorspace;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_SetSurfaceColorspace(surface)");
	c_colorspace = (SDL_Colorspace)bg_in_iv(aTHX_ sv_colorspace, "SDL_SetSurfaceColorspace(colorspace)");
	c_bg_ret = SDL_SetSurfaceColorspace(c_surface, c_colorspace);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSurfaceColorspace(sv_surface)
	SV *sv_surface
    PREINIT:
	SDL_Surface * c_surface;
	SDL_Colorspace c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_GetSurfaceColorspace(surface)");
	c_bg_ret = SDL_GetSurfaceColorspace(c_surface);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_CreateSurfacePalette(sv_surface)
	SV *sv_surface
    PREINIT:
	SDL_Surface * c_surface;
	SDL_Palette * c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_CreateSurfacePalette(surface)");
	c_bg_ret = SDL_CreateSurfacePalette(c_surface);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Palette"));
	XSRETURN(1);

void
SDL_SetSurfacePalette(sv_surface, sv_palette)
	SV *sv_surface
	SV *sv_palette
    PREINIT:
	SDL_Surface * c_surface;
	SDL_Palette * c_palette;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_SetSurfacePalette(surface)");
	c_palette = (SDL_Palette *)bg_in_record_ptr(aTHX_ sv_palette, "SDL3::Palette", "SDL_SetSurfacePalette(palette)");
	c_bg_ret = SDL_SetSurfacePalette(c_surface, c_palette);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSurfacePalette(sv_surface)
	SV *sv_surface
    PREINIT:
	SDL_Surface * c_surface;
	SDL_Palette * c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_GetSurfacePalette(surface)");
	c_bg_ret = SDL_GetSurfacePalette(c_surface);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Palette"));
	XSRETURN(1);

void
SDL_AddSurfaceAlternateImage(sv_surface, sv_image)
	SV *sv_surface
	SV *sv_image
    PREINIT:
	SDL_Surface * c_surface;
	SDL_Surface * c_image;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_AddSurfaceAlternateImage(surface)");
	c_image = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_image, "SDL3::Surface", "SDL_AddSurfaceAlternateImage(image)");
	c_bg_ret = SDL_AddSurfaceAlternateImage(c_surface, c_image);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SurfaceHasAlternateImages(sv_surface)
	SV *sv_surface
    PREINIT:
	SDL_Surface * c_surface;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_SurfaceHasAlternateImages(surface)");
	c_bg_ret = SDL_SurfaceHasAlternateImages(c_surface);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSurfaceImages(sv_surface, sv_count)
	SV *sv_surface
	SV *sv_count
    PREINIT:
	SDL_Surface * c_surface;
	int c_count; int * p_count; SV *t_count;
	SDL_Surface ** c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_GetSurfaceImages(surface)");
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetSurfaceImages(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetSurfaceImages(count)");
	c_bg_ret = SDL_GetSurfaceImages(c_surface, p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_RemoveSurfaceAlternateImages(sv_surface)
	SV *sv_surface
    PREINIT:
	SDL_Surface * c_surface;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_RemoveSurfaceAlternateImages(surface)");
	SDL_RemoveSurfaceAlternateImages(c_surface);
	XSRETURN(0);

void
SDL_LockSurface(sv_surface)
	SV *sv_surface
    PREINIT:
	SDL_Surface * c_surface;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_LockSurface(surface)");
	c_bg_ret = SDL_LockSurface(c_surface);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_UnlockSurface(sv_surface)
	SV *sv_surface
    PREINIT:
	SDL_Surface * c_surface;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_UnlockSurface(surface)");
	SDL_UnlockSurface(c_surface);
	XSRETURN(0);

void
SDL_LoadSurface_IO(sv_src, sv_closeio)
	SV *sv_src
	SV *sv_closeio
    PREINIT:
	SDL_IOStream * c_src;
	_Bool c_closeio;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_LoadSurface_IO(src)");
	c_closeio = (_Bool)SvTRUE(sv_closeio);
	c_bg_ret = SDL_LoadSurface_IO(c_src, c_closeio);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_LoadSurface(sv_file)
	SV *sv_file
    PREINIT:
	const char * c_file;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_file = (const char *)bg_in_string(aTHX_ sv_file, "SDL_LoadSurface(file)");
	c_bg_ret = SDL_LoadSurface(c_file);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_LoadBMP_IO(sv_src, sv_closeio)
	SV *sv_src
	SV *sv_closeio
    PREINIT:
	SDL_IOStream * c_src;
	_Bool c_closeio;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_LoadBMP_IO(src)");
	c_closeio = (_Bool)SvTRUE(sv_closeio);
	c_bg_ret = SDL_LoadBMP_IO(c_src, c_closeio);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_LoadBMP(sv_file)
	SV *sv_file
    PREINIT:
	const char * c_file;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_file = (const char *)bg_in_string(aTHX_ sv_file, "SDL_LoadBMP(file)");
	c_bg_ret = SDL_LoadBMP(c_file);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_SaveBMP_IO(sv_surface, sv_dst, sv_closeio)
	SV *sv_surface
	SV *sv_dst
	SV *sv_closeio
    PREINIT:
	SDL_Surface * c_surface;
	SDL_IOStream * c_dst;
	_Bool c_closeio;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_SaveBMP_IO(surface)");
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_SaveBMP_IO(dst)");
	c_closeio = (_Bool)SvTRUE(sv_closeio);
	c_bg_ret = SDL_SaveBMP_IO(c_surface, c_dst, c_closeio);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SaveBMP(sv_surface, sv_file)
	SV *sv_surface
	SV *sv_file
    PREINIT:
	SDL_Surface * c_surface;
	const char * c_file;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_SaveBMP(surface)");
	c_file = (const char *)bg_in_string(aTHX_ sv_file, "SDL_SaveBMP(file)");
	c_bg_ret = SDL_SaveBMP(c_surface, c_file);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_LoadPNG_IO(sv_src, sv_closeio)
	SV *sv_src
	SV *sv_closeio
    PREINIT:
	SDL_IOStream * c_src;
	_Bool c_closeio;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_LoadPNG_IO(src)");
	c_closeio = (_Bool)SvTRUE(sv_closeio);
	c_bg_ret = SDL_LoadPNG_IO(c_src, c_closeio);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_LoadPNG(sv_file)
	SV *sv_file
    PREINIT:
	const char * c_file;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_file = (const char *)bg_in_string(aTHX_ sv_file, "SDL_LoadPNG(file)");
	c_bg_ret = SDL_LoadPNG(c_file);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_SavePNG_IO(sv_surface, sv_dst, sv_closeio)
	SV *sv_surface
	SV *sv_dst
	SV *sv_closeio
    PREINIT:
	SDL_Surface * c_surface;
	SDL_IOStream * c_dst;
	_Bool c_closeio;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_SavePNG_IO(surface)");
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_SavePNG_IO(dst)");
	c_closeio = (_Bool)SvTRUE(sv_closeio);
	c_bg_ret = SDL_SavePNG_IO(c_surface, c_dst, c_closeio);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SavePNG(sv_surface, sv_file)
	SV *sv_surface
	SV *sv_file
    PREINIT:
	SDL_Surface * c_surface;
	const char * c_file;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_SavePNG(surface)");
	c_file = (const char *)bg_in_string(aTHX_ sv_file, "SDL_SavePNG(file)");
	c_bg_ret = SDL_SavePNG(c_surface, c_file);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetSurfaceRLE(sv_surface, sv_enabled)
	SV *sv_surface
	SV *sv_enabled
    PREINIT:
	SDL_Surface * c_surface;
	_Bool c_enabled;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_SetSurfaceRLE(surface)");
	c_enabled = (_Bool)SvTRUE(sv_enabled);
	c_bg_ret = SDL_SetSurfaceRLE(c_surface, c_enabled);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SurfaceHasRLE(sv_surface)
	SV *sv_surface
    PREINIT:
	SDL_Surface * c_surface;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_SurfaceHasRLE(surface)");
	c_bg_ret = SDL_SurfaceHasRLE(c_surface);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetSurfaceColorKey(sv_surface, sv_enabled, sv_key)
	SV *sv_surface
	SV *sv_enabled
	SV *sv_key
    PREINIT:
	SDL_Surface * c_surface;
	_Bool c_enabled;
	Uint32 c_key;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_SetSurfaceColorKey(surface)");
	c_enabled = (_Bool)SvTRUE(sv_enabled);
	c_key = (Uint32)bg_in_uv(aTHX_ sv_key, "SDL_SetSurfaceColorKey(key)");
	c_bg_ret = SDL_SetSurfaceColorKey(c_surface, c_enabled, c_key);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SurfaceHasColorKey(sv_surface)
	SV *sv_surface
    PREINIT:
	SDL_Surface * c_surface;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_SurfaceHasColorKey(surface)");
	c_bg_ret = SDL_SurfaceHasColorKey(c_surface);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSurfaceColorKey(sv_surface, sv_key)
	SV *sv_surface
	SV *sv_key
    PREINIT:
	SDL_Surface * c_surface;
	Uint32 c_key; Uint32 * p_key; SV *t_key;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_GetSurfaceColorKey(surface)");
	t_key = bg_outref_target(aTHX_ sv_key);
	c_key = (t_key && SvOK(t_key)) ? (Uint32)bg_in_uv(aTHX_ t_key, "SDL_GetSurfaceColorKey(key)") : (Uint32)0;
	p_key = t_key ? &c_key : (Uint32 *)bg_outref_raw(aTHX_ sv_key, "SDL_GetSurfaceColorKey(key)");
	c_bg_ret = SDL_GetSurfaceColorKey(c_surface, p_key);
	if (t_key) sv_setsv(t_key, sv_2mortal(newSVuv((UV)(c_key))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetSurfaceColorMod(sv_surface, sv_r, sv_g, sv_b)
	SV *sv_surface
	SV *sv_r
	SV *sv_g
	SV *sv_b
    PREINIT:
	SDL_Surface * c_surface;
	Uint8 c_r;
	Uint8 c_g;
	Uint8 c_b;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_SetSurfaceColorMod(surface)");
	c_r = (Uint8)bg_in_uv(aTHX_ sv_r, "SDL_SetSurfaceColorMod(r)");
	c_g = (Uint8)bg_in_uv(aTHX_ sv_g, "SDL_SetSurfaceColorMod(g)");
	c_b = (Uint8)bg_in_uv(aTHX_ sv_b, "SDL_SetSurfaceColorMod(b)");
	c_bg_ret = SDL_SetSurfaceColorMod(c_surface, c_r, c_g, c_b);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSurfaceColorMod(sv_surface, sv_r, sv_g, sv_b)
	SV *sv_surface
	SV *sv_r
	SV *sv_g
	SV *sv_b
    PREINIT:
	SDL_Surface * c_surface;
	Uint8 c_r; Uint8 * p_r; SV *t_r;
	Uint8 c_g; Uint8 * p_g; SV *t_g;
	Uint8 c_b; Uint8 * p_b; SV *t_b;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_GetSurfaceColorMod(surface)");
	t_r = bg_outref_target(aTHX_ sv_r);
	c_r = (t_r && SvOK(t_r)) ? (Uint8)bg_in_uv(aTHX_ t_r, "SDL_GetSurfaceColorMod(r)") : (Uint8)0;
	p_r = t_r ? &c_r : (Uint8 *)bg_outref_raw(aTHX_ sv_r, "SDL_GetSurfaceColorMod(r)");
	t_g = bg_outref_target(aTHX_ sv_g);
	c_g = (t_g && SvOK(t_g)) ? (Uint8)bg_in_uv(aTHX_ t_g, "SDL_GetSurfaceColorMod(g)") : (Uint8)0;
	p_g = t_g ? &c_g : (Uint8 *)bg_outref_raw(aTHX_ sv_g, "SDL_GetSurfaceColorMod(g)");
	t_b = bg_outref_target(aTHX_ sv_b);
	c_b = (t_b && SvOK(t_b)) ? (Uint8)bg_in_uv(aTHX_ t_b, "SDL_GetSurfaceColorMod(b)") : (Uint8)0;
	p_b = t_b ? &c_b : (Uint8 *)bg_outref_raw(aTHX_ sv_b, "SDL_GetSurfaceColorMod(b)");
	c_bg_ret = SDL_GetSurfaceColorMod(c_surface, p_r, p_g, p_b);
	if (t_r) sv_setsv(t_r, sv_2mortal(newSVuv((UV)(c_r))));
	if (t_g) sv_setsv(t_g, sv_2mortal(newSVuv((UV)(c_g))));
	if (t_b) sv_setsv(t_b, sv_2mortal(newSVuv((UV)(c_b))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetSurfaceAlphaMod(sv_surface, sv_alpha)
	SV *sv_surface
	SV *sv_alpha
    PREINIT:
	SDL_Surface * c_surface;
	Uint8 c_alpha;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_SetSurfaceAlphaMod(surface)");
	c_alpha = (Uint8)bg_in_uv(aTHX_ sv_alpha, "SDL_SetSurfaceAlphaMod(alpha)");
	c_bg_ret = SDL_SetSurfaceAlphaMod(c_surface, c_alpha);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSurfaceAlphaMod(sv_surface, sv_alpha)
	SV *sv_surface
	SV *sv_alpha
    PREINIT:
	SDL_Surface * c_surface;
	Uint8 c_alpha; Uint8 * p_alpha; SV *t_alpha;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_GetSurfaceAlphaMod(surface)");
	t_alpha = bg_outref_target(aTHX_ sv_alpha);
	c_alpha = (t_alpha && SvOK(t_alpha)) ? (Uint8)bg_in_uv(aTHX_ t_alpha, "SDL_GetSurfaceAlphaMod(alpha)") : (Uint8)0;
	p_alpha = t_alpha ? &c_alpha : (Uint8 *)bg_outref_raw(aTHX_ sv_alpha, "SDL_GetSurfaceAlphaMod(alpha)");
	c_bg_ret = SDL_GetSurfaceAlphaMod(c_surface, p_alpha);
	if (t_alpha) sv_setsv(t_alpha, sv_2mortal(newSVuv((UV)(c_alpha))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetSurfaceBlendMode(sv_surface, sv_blendMode)
	SV *sv_surface
	SV *sv_blendMode
    PREINIT:
	SDL_Surface * c_surface;
	SDL_BlendMode c_blendMode;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_SetSurfaceBlendMode(surface)");
	c_blendMode = (SDL_BlendMode)bg_in_uv(aTHX_ sv_blendMode, "SDL_SetSurfaceBlendMode(blendMode)");
	c_bg_ret = SDL_SetSurfaceBlendMode(c_surface, c_blendMode);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSurfaceBlendMode(sv_surface, sv_blendMode)
	SV *sv_surface
	SV *sv_blendMode
    PREINIT:
	SDL_Surface * c_surface;
	SDL_BlendMode c_blendMode; SDL_BlendMode * p_blendMode; SV *t_blendMode;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_GetSurfaceBlendMode(surface)");
	t_blendMode = bg_outref_target(aTHX_ sv_blendMode);
	c_blendMode = (t_blendMode && SvOK(t_blendMode)) ? (SDL_BlendMode)bg_in_uv(aTHX_ t_blendMode, "SDL_GetSurfaceBlendMode(blendMode)") : (SDL_BlendMode)0;
	p_blendMode = t_blendMode ? &c_blendMode : (SDL_BlendMode *)bg_outref_raw(aTHX_ sv_blendMode, "SDL_GetSurfaceBlendMode(blendMode)");
	c_bg_ret = SDL_GetSurfaceBlendMode(c_surface, p_blendMode);
	if (t_blendMode) sv_setsv(t_blendMode, sv_2mortal(newSVuv((UV)(c_blendMode))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetSurfaceClipRect(sv_surface, sv_rect)
	SV *sv_surface
	SV *sv_rect
    PREINIT:
	SDL_Surface * c_surface;
	const SDL_Rect * c_rect;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_SetSurfaceClipRect(surface)");
	c_rect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_SetSurfaceClipRect(rect)");
	c_bg_ret = SDL_SetSurfaceClipRect(c_surface, c_rect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSurfaceClipRect(sv_surface, sv_rect)
	SV *sv_surface
	SV *sv_rect
    PREINIT:
	SDL_Surface * c_surface;
	SDL_Rect * c_rect;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_GetSurfaceClipRect(surface)");
	c_rect = (SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_GetSurfaceClipRect(rect)");
	c_bg_ret = SDL_GetSurfaceClipRect(c_surface, c_rect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_FlipSurface(sv_surface, sv_flip)
	SV *sv_surface
	SV *sv_flip
    PREINIT:
	SDL_Surface * c_surface;
	SDL_FlipMode c_flip;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_FlipSurface(surface)");
	c_flip = (SDL_FlipMode)bg_in_iv(aTHX_ sv_flip, "SDL_FlipSurface(flip)");
	c_bg_ret = SDL_FlipSurface(c_surface, c_flip);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RotateSurface(sv_surface, sv_angle)
	SV *sv_surface
	SV *sv_angle
    PREINIT:
	SDL_Surface * c_surface;
	float c_angle;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_RotateSurface(surface)");
	c_angle = (float)bg_in_nv(aTHX_ sv_angle, "SDL_RotateSurface(angle)");
	c_bg_ret = SDL_RotateSurface(c_surface, c_angle);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_DuplicateSurface(sv_surface)
	SV *sv_surface
    PREINIT:
	SDL_Surface * c_surface;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_DuplicateSurface(surface)");
	c_bg_ret = SDL_DuplicateSurface(c_surface);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_ScaleSurface(sv_surface, sv_width, sv_height, sv_scaleMode)
	SV *sv_surface
	SV *sv_width
	SV *sv_height
	SV *sv_scaleMode
    PREINIT:
	SDL_Surface * c_surface;
	int c_width;
	int c_height;
	SDL_ScaleMode c_scaleMode;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_ScaleSurface(surface)");
	c_width = (int)bg_in_iv(aTHX_ sv_width, "SDL_ScaleSurface(width)");
	c_height = (int)bg_in_iv(aTHX_ sv_height, "SDL_ScaleSurface(height)");
	c_scaleMode = (SDL_ScaleMode)bg_in_iv(aTHX_ sv_scaleMode, "SDL_ScaleSurface(scaleMode)");
	c_bg_ret = SDL_ScaleSurface(c_surface, c_width, c_height, c_scaleMode);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_ConvertSurface(sv_surface, sv_format)
	SV *sv_surface
	SV *sv_format
    PREINIT:
	SDL_Surface * c_surface;
	SDL_PixelFormat c_format;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_ConvertSurface(surface)");
	c_format = (SDL_PixelFormat)bg_in_iv(aTHX_ sv_format, "SDL_ConvertSurface(format)");
	c_bg_ret = SDL_ConvertSurface(c_surface, c_format);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_ConvertSurfaceAndColorspace(sv_surface, sv_format, sv_palette, sv_colorspace, sv_props)
	SV *sv_surface
	SV *sv_format
	SV *sv_palette
	SV *sv_colorspace
	SV *sv_props
    PREINIT:
	SDL_Surface * c_surface;
	SDL_PixelFormat c_format;
	SDL_Palette * c_palette;
	SDL_Colorspace c_colorspace;
	SDL_PropertiesID c_props;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_ConvertSurfaceAndColorspace(surface)");
	c_format = (SDL_PixelFormat)bg_in_iv(aTHX_ sv_format, "SDL_ConvertSurfaceAndColorspace(format)");
	c_palette = (SDL_Palette *)bg_in_record_ptr(aTHX_ sv_palette, "SDL3::Palette", "SDL_ConvertSurfaceAndColorspace(palette)");
	c_colorspace = (SDL_Colorspace)bg_in_iv(aTHX_ sv_colorspace, "SDL_ConvertSurfaceAndColorspace(colorspace)");
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_ConvertSurfaceAndColorspace(props)");
	c_bg_ret = SDL_ConvertSurfaceAndColorspace(c_surface, c_format, c_palette, c_colorspace, c_props);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_ConvertPixels(sv_width, sv_height, sv_src_format, sv_src, sv_src_pitch, sv_dst_format, sv_dst, sv_dst_pitch)
	SV *sv_width
	SV *sv_height
	SV *sv_src_format
	SV *sv_src
	SV *sv_src_pitch
	SV *sv_dst_format
	SV *sv_dst
	SV *sv_dst_pitch
    PREINIT:
	int c_width;
	int c_height;
	SDL_PixelFormat c_src_format;
	const void * c_src;
	int c_src_pitch;
	SDL_PixelFormat c_dst_format;
	void * c_dst;
	int c_dst_pitch;
	_Bool c_bg_ret;
    PPCODE:
	c_width = (int)bg_in_iv(aTHX_ sv_width, "SDL_ConvertPixels(width)");
	c_height = (int)bg_in_iv(aTHX_ sv_height, "SDL_ConvertPixels(height)");
	c_src_format = (SDL_PixelFormat)bg_in_iv(aTHX_ sv_src_format, "SDL_ConvertPixels(src_format)");
	c_src = (const void *)bg_in_raw_ptr(aTHX_ sv_src, "SDL_ConvertPixels(src)");
	c_src_pitch = (int)bg_in_iv(aTHX_ sv_src_pitch, "SDL_ConvertPixels(src_pitch)");
	c_dst_format = (SDL_PixelFormat)bg_in_iv(aTHX_ sv_dst_format, "SDL_ConvertPixels(dst_format)");
	c_dst = (void *)bg_in_raw_ptr(aTHX_ sv_dst, "SDL_ConvertPixels(dst)");
	c_dst_pitch = (int)bg_in_iv(aTHX_ sv_dst_pitch, "SDL_ConvertPixels(dst_pitch)");
	c_bg_ret = SDL_ConvertPixels(c_width, c_height, c_src_format, c_src, c_src_pitch, c_dst_format, c_dst, c_dst_pitch);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ConvertPixelsAndColorspace(sv_width, sv_height, sv_src_format, sv_src_colorspace, sv_src_properties, sv_src, sv_src_pitch, sv_dst_format, sv_dst_colorspace, sv_dst_properties, sv_dst, sv_dst_pitch)
	SV *sv_width
	SV *sv_height
	SV *sv_src_format
	SV *sv_src_colorspace
	SV *sv_src_properties
	SV *sv_src
	SV *sv_src_pitch
	SV *sv_dst_format
	SV *sv_dst_colorspace
	SV *sv_dst_properties
	SV *sv_dst
	SV *sv_dst_pitch
    PREINIT:
	int c_width;
	int c_height;
	SDL_PixelFormat c_src_format;
	SDL_Colorspace c_src_colorspace;
	SDL_PropertiesID c_src_properties;
	const void * c_src;
	int c_src_pitch;
	SDL_PixelFormat c_dst_format;
	SDL_Colorspace c_dst_colorspace;
	SDL_PropertiesID c_dst_properties;
	void * c_dst;
	int c_dst_pitch;
	_Bool c_bg_ret;
    PPCODE:
	c_width = (int)bg_in_iv(aTHX_ sv_width, "SDL_ConvertPixelsAndColorspace(width)");
	c_height = (int)bg_in_iv(aTHX_ sv_height, "SDL_ConvertPixelsAndColorspace(height)");
	c_src_format = (SDL_PixelFormat)bg_in_iv(aTHX_ sv_src_format, "SDL_ConvertPixelsAndColorspace(src_format)");
	c_src_colorspace = (SDL_Colorspace)bg_in_iv(aTHX_ sv_src_colorspace, "SDL_ConvertPixelsAndColorspace(src_colorspace)");
	c_src_properties = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_src_properties, "SDL_ConvertPixelsAndColorspace(src_properties)");
	c_src = (const void *)bg_in_raw_ptr(aTHX_ sv_src, "SDL_ConvertPixelsAndColorspace(src)");
	c_src_pitch = (int)bg_in_iv(aTHX_ sv_src_pitch, "SDL_ConvertPixelsAndColorspace(src_pitch)");
	c_dst_format = (SDL_PixelFormat)bg_in_iv(aTHX_ sv_dst_format, "SDL_ConvertPixelsAndColorspace(dst_format)");
	c_dst_colorspace = (SDL_Colorspace)bg_in_iv(aTHX_ sv_dst_colorspace, "SDL_ConvertPixelsAndColorspace(dst_colorspace)");
	c_dst_properties = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_dst_properties, "SDL_ConvertPixelsAndColorspace(dst_properties)");
	c_dst = (void *)bg_in_raw_ptr(aTHX_ sv_dst, "SDL_ConvertPixelsAndColorspace(dst)");
	c_dst_pitch = (int)bg_in_iv(aTHX_ sv_dst_pitch, "SDL_ConvertPixelsAndColorspace(dst_pitch)");
	c_bg_ret = SDL_ConvertPixelsAndColorspace(c_width, c_height, c_src_format, c_src_colorspace, c_src_properties, c_src, c_src_pitch, c_dst_format, c_dst_colorspace, c_dst_properties, c_dst, c_dst_pitch);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_PremultiplyAlpha(sv_width, sv_height, sv_src_format, sv_src, sv_src_pitch, sv_dst_format, sv_dst, sv_dst_pitch, sv_linear)
	SV *sv_width
	SV *sv_height
	SV *sv_src_format
	SV *sv_src
	SV *sv_src_pitch
	SV *sv_dst_format
	SV *sv_dst
	SV *sv_dst_pitch
	SV *sv_linear
    PREINIT:
	int c_width;
	int c_height;
	SDL_PixelFormat c_src_format;
	const void * c_src;
	int c_src_pitch;
	SDL_PixelFormat c_dst_format;
	void * c_dst;
	int c_dst_pitch;
	_Bool c_linear;
	_Bool c_bg_ret;
    PPCODE:
	c_width = (int)bg_in_iv(aTHX_ sv_width, "SDL_PremultiplyAlpha(width)");
	c_height = (int)bg_in_iv(aTHX_ sv_height, "SDL_PremultiplyAlpha(height)");
	c_src_format = (SDL_PixelFormat)bg_in_iv(aTHX_ sv_src_format, "SDL_PremultiplyAlpha(src_format)");
	c_src = (const void *)bg_in_raw_ptr(aTHX_ sv_src, "SDL_PremultiplyAlpha(src)");
	c_src_pitch = (int)bg_in_iv(aTHX_ sv_src_pitch, "SDL_PremultiplyAlpha(src_pitch)");
	c_dst_format = (SDL_PixelFormat)bg_in_iv(aTHX_ sv_dst_format, "SDL_PremultiplyAlpha(dst_format)");
	c_dst = (void *)bg_in_raw_ptr(aTHX_ sv_dst, "SDL_PremultiplyAlpha(dst)");
	c_dst_pitch = (int)bg_in_iv(aTHX_ sv_dst_pitch, "SDL_PremultiplyAlpha(dst_pitch)");
	c_linear = (_Bool)SvTRUE(sv_linear);
	c_bg_ret = SDL_PremultiplyAlpha(c_width, c_height, c_src_format, c_src, c_src_pitch, c_dst_format, c_dst, c_dst_pitch, c_linear);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_PremultiplySurfaceAlpha(sv_surface, sv_linear)
	SV *sv_surface
	SV *sv_linear
    PREINIT:
	SDL_Surface * c_surface;
	_Bool c_linear;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_PremultiplySurfaceAlpha(surface)");
	c_linear = (_Bool)SvTRUE(sv_linear);
	c_bg_ret = SDL_PremultiplySurfaceAlpha(c_surface, c_linear);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ClearSurface(sv_surface, sv_r, sv_g, sv_b, sv_a)
	SV *sv_surface
	SV *sv_r
	SV *sv_g
	SV *sv_b
	SV *sv_a
    PREINIT:
	SDL_Surface * c_surface;
	float c_r;
	float c_g;
	float c_b;
	float c_a;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_ClearSurface(surface)");
	c_r = (float)bg_in_nv(aTHX_ sv_r, "SDL_ClearSurface(r)");
	c_g = (float)bg_in_nv(aTHX_ sv_g, "SDL_ClearSurface(g)");
	c_b = (float)bg_in_nv(aTHX_ sv_b, "SDL_ClearSurface(b)");
	c_a = (float)bg_in_nv(aTHX_ sv_a, "SDL_ClearSurface(a)");
	c_bg_ret = SDL_ClearSurface(c_surface, c_r, c_g, c_b, c_a);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_FillSurfaceRect(sv_dst, sv_rect, sv_color)
	SV *sv_dst
	SV *sv_rect
	SV *sv_color
    PREINIT:
	SDL_Surface * c_dst;
	const SDL_Rect * c_rect;
	Uint32 c_color;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::Surface", "SDL_FillSurfaceRect(dst)");
	c_rect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_FillSurfaceRect(rect)");
	c_color = (Uint32)bg_in_uv(aTHX_ sv_color, "SDL_FillSurfaceRect(color)");
	c_bg_ret = SDL_FillSurfaceRect(c_dst, c_rect, c_color);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_FillSurfaceRects(sv_dst, sv_rects, sv_count, sv_color)
	SV *sv_dst
	SV *sv_rects
	SV *sv_count
	SV *sv_color
    PREINIT:
	SDL_Surface * c_dst;
	const SDL_Rect * c_rects;
	int c_count;
	Uint32 c_color;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::Surface", "SDL_FillSurfaceRects(dst)");
	c_rects = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rects, "SDL3::Rect", "SDL_FillSurfaceRects(rects)");
	c_count = (int)bg_in_iv(aTHX_ sv_count, "SDL_FillSurfaceRects(count)");
	c_color = (Uint32)bg_in_uv(aTHX_ sv_color, "SDL_FillSurfaceRects(color)");
	c_bg_ret = SDL_FillSurfaceRects(c_dst, c_rects, c_count, c_color);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_BlitSurface(sv_src, sv_srcrect, sv_dst, sv_dstrect)
	SV *sv_src
	SV *sv_srcrect
	SV *sv_dst
	SV *sv_dstrect
    PREINIT:
	SDL_Surface * c_src;
	const SDL_Rect * c_srcrect;
	SDL_Surface * c_dst;
	const SDL_Rect * c_dstrect;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::Surface", "SDL_BlitSurface(src)");
	c_srcrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_srcrect, "SDL3::Rect", "SDL_BlitSurface(srcrect)");
	c_dst = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::Surface", "SDL_BlitSurface(dst)");
	c_dstrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_dstrect, "SDL3::Rect", "SDL_BlitSurface(dstrect)");
	c_bg_ret = SDL_BlitSurface(c_src, c_srcrect, c_dst, c_dstrect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_BlitSurfaceUnchecked(sv_src, sv_srcrect, sv_dst, sv_dstrect)
	SV *sv_src
	SV *sv_srcrect
	SV *sv_dst
	SV *sv_dstrect
    PREINIT:
	SDL_Surface * c_src;
	const SDL_Rect * c_srcrect;
	SDL_Surface * c_dst;
	const SDL_Rect * c_dstrect;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::Surface", "SDL_BlitSurfaceUnchecked(src)");
	c_srcrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_srcrect, "SDL3::Rect", "SDL_BlitSurfaceUnchecked(srcrect)");
	c_dst = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::Surface", "SDL_BlitSurfaceUnchecked(dst)");
	c_dstrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_dstrect, "SDL3::Rect", "SDL_BlitSurfaceUnchecked(dstrect)");
	c_bg_ret = SDL_BlitSurfaceUnchecked(c_src, c_srcrect, c_dst, c_dstrect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_BlitSurfaceScaled(sv_src, sv_srcrect, sv_dst, sv_dstrect, sv_scaleMode)
	SV *sv_src
	SV *sv_srcrect
	SV *sv_dst
	SV *sv_dstrect
	SV *sv_scaleMode
    PREINIT:
	SDL_Surface * c_src;
	const SDL_Rect * c_srcrect;
	SDL_Surface * c_dst;
	const SDL_Rect * c_dstrect;
	SDL_ScaleMode c_scaleMode;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::Surface", "SDL_BlitSurfaceScaled(src)");
	c_srcrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_srcrect, "SDL3::Rect", "SDL_BlitSurfaceScaled(srcrect)");
	c_dst = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::Surface", "SDL_BlitSurfaceScaled(dst)");
	c_dstrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_dstrect, "SDL3::Rect", "SDL_BlitSurfaceScaled(dstrect)");
	c_scaleMode = (SDL_ScaleMode)bg_in_iv(aTHX_ sv_scaleMode, "SDL_BlitSurfaceScaled(scaleMode)");
	c_bg_ret = SDL_BlitSurfaceScaled(c_src, c_srcrect, c_dst, c_dstrect, c_scaleMode);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_BlitSurfaceUncheckedScaled(sv_src, sv_srcrect, sv_dst, sv_dstrect, sv_scaleMode)
	SV *sv_src
	SV *sv_srcrect
	SV *sv_dst
	SV *sv_dstrect
	SV *sv_scaleMode
    PREINIT:
	SDL_Surface * c_src;
	const SDL_Rect * c_srcrect;
	SDL_Surface * c_dst;
	const SDL_Rect * c_dstrect;
	SDL_ScaleMode c_scaleMode;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::Surface", "SDL_BlitSurfaceUncheckedScaled(src)");
	c_srcrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_srcrect, "SDL3::Rect", "SDL_BlitSurfaceUncheckedScaled(srcrect)");
	c_dst = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::Surface", "SDL_BlitSurfaceUncheckedScaled(dst)");
	c_dstrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_dstrect, "SDL3::Rect", "SDL_BlitSurfaceUncheckedScaled(dstrect)");
	c_scaleMode = (SDL_ScaleMode)bg_in_iv(aTHX_ sv_scaleMode, "SDL_BlitSurfaceUncheckedScaled(scaleMode)");
	c_bg_ret = SDL_BlitSurfaceUncheckedScaled(c_src, c_srcrect, c_dst, c_dstrect, c_scaleMode);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_StretchSurface(sv_src, sv_srcrect, sv_dst, sv_dstrect, sv_scaleMode)
	SV *sv_src
	SV *sv_srcrect
	SV *sv_dst
	SV *sv_dstrect
	SV *sv_scaleMode
    PREINIT:
	SDL_Surface * c_src;
	const SDL_Rect * c_srcrect;
	SDL_Surface * c_dst;
	const SDL_Rect * c_dstrect;
	SDL_ScaleMode c_scaleMode;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::Surface", "SDL_StretchSurface(src)");
	c_srcrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_srcrect, "SDL3::Rect", "SDL_StretchSurface(srcrect)");
	c_dst = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::Surface", "SDL_StretchSurface(dst)");
	c_dstrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_dstrect, "SDL3::Rect", "SDL_StretchSurface(dstrect)");
	c_scaleMode = (SDL_ScaleMode)bg_in_iv(aTHX_ sv_scaleMode, "SDL_StretchSurface(scaleMode)");
	c_bg_ret = SDL_StretchSurface(c_src, c_srcrect, c_dst, c_dstrect, c_scaleMode);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_BlitSurfaceTiled(sv_src, sv_srcrect, sv_dst, sv_dstrect)
	SV *sv_src
	SV *sv_srcrect
	SV *sv_dst
	SV *sv_dstrect
    PREINIT:
	SDL_Surface * c_src;
	const SDL_Rect * c_srcrect;
	SDL_Surface * c_dst;
	const SDL_Rect * c_dstrect;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::Surface", "SDL_BlitSurfaceTiled(src)");
	c_srcrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_srcrect, "SDL3::Rect", "SDL_BlitSurfaceTiled(srcrect)");
	c_dst = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::Surface", "SDL_BlitSurfaceTiled(dst)");
	c_dstrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_dstrect, "SDL3::Rect", "SDL_BlitSurfaceTiled(dstrect)");
	c_bg_ret = SDL_BlitSurfaceTiled(c_src, c_srcrect, c_dst, c_dstrect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_BlitSurfaceTiledWithScale(sv_src, sv_srcrect, sv_scale, sv_scaleMode, sv_dst, sv_dstrect)
	SV *sv_src
	SV *sv_srcrect
	SV *sv_scale
	SV *sv_scaleMode
	SV *sv_dst
	SV *sv_dstrect
    PREINIT:
	SDL_Surface * c_src;
	const SDL_Rect * c_srcrect;
	float c_scale;
	SDL_ScaleMode c_scaleMode;
	SDL_Surface * c_dst;
	const SDL_Rect * c_dstrect;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::Surface", "SDL_BlitSurfaceTiledWithScale(src)");
	c_srcrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_srcrect, "SDL3::Rect", "SDL_BlitSurfaceTiledWithScale(srcrect)");
	c_scale = (float)bg_in_nv(aTHX_ sv_scale, "SDL_BlitSurfaceTiledWithScale(scale)");
	c_scaleMode = (SDL_ScaleMode)bg_in_iv(aTHX_ sv_scaleMode, "SDL_BlitSurfaceTiledWithScale(scaleMode)");
	c_dst = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::Surface", "SDL_BlitSurfaceTiledWithScale(dst)");
	c_dstrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_dstrect, "SDL3::Rect", "SDL_BlitSurfaceTiledWithScale(dstrect)");
	c_bg_ret = SDL_BlitSurfaceTiledWithScale(c_src, c_srcrect, c_scale, c_scaleMode, c_dst, c_dstrect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_BlitSurface9Grid(sv_src, sv_srcrect, sv_left_width, sv_right_width, sv_top_height, sv_bottom_height, sv_scale, sv_scaleMode, sv_dst, sv_dstrect)
	SV *sv_src
	SV *sv_srcrect
	SV *sv_left_width
	SV *sv_right_width
	SV *sv_top_height
	SV *sv_bottom_height
	SV *sv_scale
	SV *sv_scaleMode
	SV *sv_dst
	SV *sv_dstrect
    PREINIT:
	SDL_Surface * c_src;
	const SDL_Rect * c_srcrect;
	int c_left_width;
	int c_right_width;
	int c_top_height;
	int c_bottom_height;
	float c_scale;
	SDL_ScaleMode c_scaleMode;
	SDL_Surface * c_dst;
	const SDL_Rect * c_dstrect;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::Surface", "SDL_BlitSurface9Grid(src)");
	c_srcrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_srcrect, "SDL3::Rect", "SDL_BlitSurface9Grid(srcrect)");
	c_left_width = (int)bg_in_iv(aTHX_ sv_left_width, "SDL_BlitSurface9Grid(left_width)");
	c_right_width = (int)bg_in_iv(aTHX_ sv_right_width, "SDL_BlitSurface9Grid(right_width)");
	c_top_height = (int)bg_in_iv(aTHX_ sv_top_height, "SDL_BlitSurface9Grid(top_height)");
	c_bottom_height = (int)bg_in_iv(aTHX_ sv_bottom_height, "SDL_BlitSurface9Grid(bottom_height)");
	c_scale = (float)bg_in_nv(aTHX_ sv_scale, "SDL_BlitSurface9Grid(scale)");
	c_scaleMode = (SDL_ScaleMode)bg_in_iv(aTHX_ sv_scaleMode, "SDL_BlitSurface9Grid(scaleMode)");
	c_dst = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::Surface", "SDL_BlitSurface9Grid(dst)");
	c_dstrect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_dstrect, "SDL3::Rect", "SDL_BlitSurface9Grid(dstrect)");
	c_bg_ret = SDL_BlitSurface9Grid(c_src, c_srcrect, c_left_width, c_right_width, c_top_height, c_bottom_height, c_scale, c_scaleMode, c_dst, c_dstrect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_MapSurfaceRGB(sv_surface, sv_r, sv_g, sv_b)
	SV *sv_surface
	SV *sv_r
	SV *sv_g
	SV *sv_b
    PREINIT:
	SDL_Surface * c_surface;
	Uint8 c_r;
	Uint8 c_g;
	Uint8 c_b;
	Uint32 c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_MapSurfaceRGB(surface)");
	c_r = (Uint8)bg_in_uv(aTHX_ sv_r, "SDL_MapSurfaceRGB(r)");
	c_g = (Uint8)bg_in_uv(aTHX_ sv_g, "SDL_MapSurfaceRGB(g)");
	c_b = (Uint8)bg_in_uv(aTHX_ sv_b, "SDL_MapSurfaceRGB(b)");
	c_bg_ret = SDL_MapSurfaceRGB(c_surface, c_r, c_g, c_b);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_MapSurfaceRGBA(sv_surface, sv_r, sv_g, sv_b, sv_a)
	SV *sv_surface
	SV *sv_r
	SV *sv_g
	SV *sv_b
	SV *sv_a
    PREINIT:
	SDL_Surface * c_surface;
	Uint8 c_r;
	Uint8 c_g;
	Uint8 c_b;
	Uint8 c_a;
	Uint32 c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_MapSurfaceRGBA(surface)");
	c_r = (Uint8)bg_in_uv(aTHX_ sv_r, "SDL_MapSurfaceRGBA(r)");
	c_g = (Uint8)bg_in_uv(aTHX_ sv_g, "SDL_MapSurfaceRGBA(g)");
	c_b = (Uint8)bg_in_uv(aTHX_ sv_b, "SDL_MapSurfaceRGBA(b)");
	c_a = (Uint8)bg_in_uv(aTHX_ sv_a, "SDL_MapSurfaceRGBA(a)");
	c_bg_ret = SDL_MapSurfaceRGBA(c_surface, c_r, c_g, c_b, c_a);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadSurfacePixel(sv_surface, sv_x, sv_y, sv_r, sv_g, sv_b, sv_a)
	SV *sv_surface
	SV *sv_x
	SV *sv_y
	SV *sv_r
	SV *sv_g
	SV *sv_b
	SV *sv_a
    PREINIT:
	SDL_Surface * c_surface;
	int c_x;
	int c_y;
	Uint8 c_r; Uint8 * p_r; SV *t_r;
	Uint8 c_g; Uint8 * p_g; SV *t_g;
	Uint8 c_b; Uint8 * p_b; SV *t_b;
	Uint8 c_a; Uint8 * p_a; SV *t_a;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_ReadSurfacePixel(surface)");
	c_x = (int)bg_in_iv(aTHX_ sv_x, "SDL_ReadSurfacePixel(x)");
	c_y = (int)bg_in_iv(aTHX_ sv_y, "SDL_ReadSurfacePixel(y)");
	t_r = bg_outref_target(aTHX_ sv_r);
	c_r = (t_r && SvOK(t_r)) ? (Uint8)bg_in_uv(aTHX_ t_r, "SDL_ReadSurfacePixel(r)") : (Uint8)0;
	p_r = t_r ? &c_r : (Uint8 *)bg_outref_raw(aTHX_ sv_r, "SDL_ReadSurfacePixel(r)");
	t_g = bg_outref_target(aTHX_ sv_g);
	c_g = (t_g && SvOK(t_g)) ? (Uint8)bg_in_uv(aTHX_ t_g, "SDL_ReadSurfacePixel(g)") : (Uint8)0;
	p_g = t_g ? &c_g : (Uint8 *)bg_outref_raw(aTHX_ sv_g, "SDL_ReadSurfacePixel(g)");
	t_b = bg_outref_target(aTHX_ sv_b);
	c_b = (t_b && SvOK(t_b)) ? (Uint8)bg_in_uv(aTHX_ t_b, "SDL_ReadSurfacePixel(b)") : (Uint8)0;
	p_b = t_b ? &c_b : (Uint8 *)bg_outref_raw(aTHX_ sv_b, "SDL_ReadSurfacePixel(b)");
	t_a = bg_outref_target(aTHX_ sv_a);
	c_a = (t_a && SvOK(t_a)) ? (Uint8)bg_in_uv(aTHX_ t_a, "SDL_ReadSurfacePixel(a)") : (Uint8)0;
	p_a = t_a ? &c_a : (Uint8 *)bg_outref_raw(aTHX_ sv_a, "SDL_ReadSurfacePixel(a)");
	c_bg_ret = SDL_ReadSurfacePixel(c_surface, c_x, c_y, p_r, p_g, p_b, p_a);
	if (t_r) sv_setsv(t_r, sv_2mortal(newSVuv((UV)(c_r))));
	if (t_g) sv_setsv(t_g, sv_2mortal(newSVuv((UV)(c_g))));
	if (t_b) sv_setsv(t_b, sv_2mortal(newSVuv((UV)(c_b))));
	if (t_a) sv_setsv(t_a, sv_2mortal(newSVuv((UV)(c_a))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadSurfacePixelFloat(sv_surface, sv_x, sv_y, sv_r, sv_g, sv_b, sv_a)
	SV *sv_surface
	SV *sv_x
	SV *sv_y
	SV *sv_r
	SV *sv_g
	SV *sv_b
	SV *sv_a
    PREINIT:
	SDL_Surface * c_surface;
	int c_x;
	int c_y;
	float c_r; float * p_r; SV *t_r;
	float c_g; float * p_g; SV *t_g;
	float c_b; float * p_b; SV *t_b;
	float c_a; float * p_a; SV *t_a;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_ReadSurfacePixelFloat(surface)");
	c_x = (int)bg_in_iv(aTHX_ sv_x, "SDL_ReadSurfacePixelFloat(x)");
	c_y = (int)bg_in_iv(aTHX_ sv_y, "SDL_ReadSurfacePixelFloat(y)");
	t_r = bg_outref_target(aTHX_ sv_r);
	c_r = (t_r && SvOK(t_r)) ? (float)bg_in_nv(aTHX_ t_r, "SDL_ReadSurfacePixelFloat(r)") : (float)0;
	p_r = t_r ? &c_r : (float *)bg_outref_raw(aTHX_ sv_r, "SDL_ReadSurfacePixelFloat(r)");
	t_g = bg_outref_target(aTHX_ sv_g);
	c_g = (t_g && SvOK(t_g)) ? (float)bg_in_nv(aTHX_ t_g, "SDL_ReadSurfacePixelFloat(g)") : (float)0;
	p_g = t_g ? &c_g : (float *)bg_outref_raw(aTHX_ sv_g, "SDL_ReadSurfacePixelFloat(g)");
	t_b = bg_outref_target(aTHX_ sv_b);
	c_b = (t_b && SvOK(t_b)) ? (float)bg_in_nv(aTHX_ t_b, "SDL_ReadSurfacePixelFloat(b)") : (float)0;
	p_b = t_b ? &c_b : (float *)bg_outref_raw(aTHX_ sv_b, "SDL_ReadSurfacePixelFloat(b)");
	t_a = bg_outref_target(aTHX_ sv_a);
	c_a = (t_a && SvOK(t_a)) ? (float)bg_in_nv(aTHX_ t_a, "SDL_ReadSurfacePixelFloat(a)") : (float)0;
	p_a = t_a ? &c_a : (float *)bg_outref_raw(aTHX_ sv_a, "SDL_ReadSurfacePixelFloat(a)");
	c_bg_ret = SDL_ReadSurfacePixelFloat(c_surface, c_x, c_y, p_r, p_g, p_b, p_a);
	if (t_r) sv_setsv(t_r, sv_2mortal(newSVnv((NV)(c_r))));
	if (t_g) sv_setsv(t_g, sv_2mortal(newSVnv((NV)(c_g))));
	if (t_b) sv_setsv(t_b, sv_2mortal(newSVnv((NV)(c_b))));
	if (t_a) sv_setsv(t_a, sv_2mortal(newSVnv((NV)(c_a))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteSurfacePixel(sv_surface, sv_x, sv_y, sv_r, sv_g, sv_b, sv_a)
	SV *sv_surface
	SV *sv_x
	SV *sv_y
	SV *sv_r
	SV *sv_g
	SV *sv_b
	SV *sv_a
    PREINIT:
	SDL_Surface * c_surface;
	int c_x;
	int c_y;
	Uint8 c_r;
	Uint8 c_g;
	Uint8 c_b;
	Uint8 c_a;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_WriteSurfacePixel(surface)");
	c_x = (int)bg_in_iv(aTHX_ sv_x, "SDL_WriteSurfacePixel(x)");
	c_y = (int)bg_in_iv(aTHX_ sv_y, "SDL_WriteSurfacePixel(y)");
	c_r = (Uint8)bg_in_uv(aTHX_ sv_r, "SDL_WriteSurfacePixel(r)");
	c_g = (Uint8)bg_in_uv(aTHX_ sv_g, "SDL_WriteSurfacePixel(g)");
	c_b = (Uint8)bg_in_uv(aTHX_ sv_b, "SDL_WriteSurfacePixel(b)");
	c_a = (Uint8)bg_in_uv(aTHX_ sv_a, "SDL_WriteSurfacePixel(a)");
	c_bg_ret = SDL_WriteSurfacePixel(c_surface, c_x, c_y, c_r, c_g, c_b, c_a);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteSurfacePixelFloat(sv_surface, sv_x, sv_y, sv_r, sv_g, sv_b, sv_a)
	SV *sv_surface
	SV *sv_x
	SV *sv_y
	SV *sv_r
	SV *sv_g
	SV *sv_b
	SV *sv_a
    PREINIT:
	SDL_Surface * c_surface;
	int c_x;
	int c_y;
	float c_r;
	float c_g;
	float c_b;
	float c_a;
	_Bool c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_WriteSurfacePixelFloat(surface)");
	c_x = (int)bg_in_iv(aTHX_ sv_x, "SDL_WriteSurfacePixelFloat(x)");
	c_y = (int)bg_in_iv(aTHX_ sv_y, "SDL_WriteSurfacePixelFloat(y)");
	c_r = (float)bg_in_nv(aTHX_ sv_r, "SDL_WriteSurfacePixelFloat(r)");
	c_g = (float)bg_in_nv(aTHX_ sv_g, "SDL_WriteSurfacePixelFloat(g)");
	c_b = (float)bg_in_nv(aTHX_ sv_b, "SDL_WriteSurfacePixelFloat(b)");
	c_a = (float)bg_in_nv(aTHX_ sv_a, "SDL_WriteSurfacePixelFloat(a)");
	c_bg_ret = SDL_WriteSurfacePixelFloat(c_surface, c_x, c_y, c_r, c_g, c_b, c_a);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Surface", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_PROP_SURFACE_HDR_HEADROOM_FLOAT", BG_CONST_SV(SDL_PROP_SURFACE_HDR_HEADROOM_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_SURFACE_HOTSPOT_X_NUMBER", BG_CONST_SV(SDL_PROP_SURFACE_HOTSPOT_X_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_SURFACE_HOTSPOT_Y_NUMBER", BG_CONST_SV(SDL_PROP_SURFACE_HOTSPOT_Y_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_SURFACE_ROTATION_FLOAT", BG_CONST_SV(SDL_PROP_SURFACE_ROTATION_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT", BG_CONST_SV(SDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING", BG_CONST_SV(SDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING));
	bg_export_constant(aTHX_ stash, "SDL_SURFACE_LOCKED", BG_CONST_SV(SDL_SURFACE_LOCKED));
	bg_export_constant(aTHX_ stash, "SDL_SURFACE_LOCK_NEEDED", BG_CONST_SV(SDL_SURFACE_LOCK_NEEDED));
	bg_export_constant(aTHX_ stash, "SDL_SURFACE_PREALLOCATED", BG_CONST_SV(SDL_SURFACE_PREALLOCATED));
	bg_export_constant(aTHX_ stash, "SDL_SURFACE_SIMD_ALIGNED", BG_CONST_SV(SDL_SURFACE_SIMD_ALIGNED));
	bg_export_constant(aTHX_ stash, "SDL_SCALEMODE_INVALID", BG_CONST_SV(SDL_SCALEMODE_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_SCALEMODE_NEAREST", BG_CONST_SV(SDL_SCALEMODE_NEAREST));
	bg_export_constant(aTHX_ stash, "SDL_SCALEMODE_LINEAR", BG_CONST_SV(SDL_SCALEMODE_LINEAR));
	bg_export_constant(aTHX_ stash, "SDL_SCALEMODE_PIXELART", BG_CONST_SV(SDL_SCALEMODE_PIXELART));
	bg_export_constant(aTHX_ stash, "SDL_FLIP_NONE", BG_CONST_SV(SDL_FLIP_NONE));
	bg_export_constant(aTHX_ stash, "SDL_FLIP_HORIZONTAL", BG_CONST_SV(SDL_FLIP_HORIZONTAL));
	bg_export_constant(aTHX_ stash, "SDL_FLIP_VERTICAL", BG_CONST_SV(SDL_FLIP_VERTICAL));
	bg_export_constant(aTHX_ stash, "SDL_FLIP_HORIZONTAL_AND_VERTICAL", BG_CONST_SV(SDL_FLIP_HORIZONTAL_AND_VERTICAL));
	}

MODULE = SDL3  PACKAGE = SDL3::Surface

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_Surface), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_Surface)));
	XSRETURN(1);

void
flags(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Surface *self;
    PPCODE:
	self = (struct SDL_Surface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Surface", "SDL3::Surface::flags");
	if (items > 1) {
		self->flags = (SDL_SurfaceFlags)bg_in_uv(aTHX_ ST(1), "SDL3::Surface::flags");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->flags)));
	XSRETURN(1);

void
format(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Surface *self;
    PPCODE:
	self = (struct SDL_Surface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Surface", "SDL3::Surface::format");
	if (items > 1) {
		self->format = (SDL_PixelFormat)bg_in_iv(aTHX_ ST(1), "SDL3::Surface::format");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->format)));
	XSRETURN(1);

void
w(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Surface *self;
    PPCODE:
	self = (struct SDL_Surface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Surface", "SDL3::Surface::w");
	if (items > 1) {
		self->w = (int)bg_in_iv(aTHX_ ST(1), "SDL3::Surface::w");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->w)));
	XSRETURN(1);

void
h(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Surface *self;
    PPCODE:
	self = (struct SDL_Surface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Surface", "SDL3::Surface::h");
	if (items > 1) {
		self->h = (int)bg_in_iv(aTHX_ ST(1), "SDL3::Surface::h");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->h)));
	XSRETURN(1);

void
pitch(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Surface *self;
    PPCODE:
	self = (struct SDL_Surface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Surface", "SDL3::Surface::pitch");
	if (items > 1) {
		self->pitch = (int)bg_in_iv(aTHX_ ST(1), "SDL3::Surface::pitch");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->pitch)));
	XSRETURN(1);

void
pixels(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Surface *self;
    PPCODE:
	self = (struct SDL_Surface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Surface", "SDL3::Surface::pixels");
	if (items > 1) {
		self->pixels = (void *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::Surface::pixels");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->pixels), "SDL3::Pointer"));
	XSRETURN(1);

void
refcount(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Surface *self;
    PPCODE:
	self = (struct SDL_Surface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Surface", "SDL3::Surface::refcount");
	if (items > 1) {
		self->refcount = (int)bg_in_iv(aTHX_ ST(1), "SDL3::Surface::refcount");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->refcount)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Surface *self;
    PPCODE:
	self = (struct SDL_Surface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Surface", "SDL3::Surface::reserved");
	if (items > 1) {
		self->reserved = (void *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::Surface::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->reserved), "SDL3::Pointer"));
	XSRETURN(1);
