MODULE = SDL3  PACKAGE = SDL3::API::Pixels

void
SDL_GetPixelFormatName(sv_format)
	SV *sv_format
    PREINIT:
	SDL_PixelFormat c_format;
	const char * c_bg_ret;
    PPCODE:
	c_format = (SDL_PixelFormat)bg_in_iv(aTHX_ sv_format, "SDL_GetPixelFormatName(format)");
	c_bg_ret = SDL_GetPixelFormatName(c_format);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetMasksForPixelFormat(sv_format, sv_bpp, sv_Rmask, sv_Gmask, sv_Bmask, sv_Amask)
	SV *sv_format
	SV *sv_bpp
	SV *sv_Rmask
	SV *sv_Gmask
	SV *sv_Bmask
	SV *sv_Amask
    PREINIT:
	SDL_PixelFormat c_format;
	int c_bpp; int * p_bpp; SV *t_bpp;
	Uint32 c_Rmask; Uint32 * p_Rmask; SV *t_Rmask;
	Uint32 c_Gmask; Uint32 * p_Gmask; SV *t_Gmask;
	Uint32 c_Bmask; Uint32 * p_Bmask; SV *t_Bmask;
	Uint32 c_Amask; Uint32 * p_Amask; SV *t_Amask;
	_Bool c_bg_ret;
    PPCODE:
	c_format = (SDL_PixelFormat)bg_in_iv(aTHX_ sv_format, "SDL_GetMasksForPixelFormat(format)");
	t_bpp = bg_outref_target(aTHX_ sv_bpp);
	c_bpp = (t_bpp && SvOK(t_bpp)) ? (int)bg_in_iv(aTHX_ t_bpp, "SDL_GetMasksForPixelFormat(bpp)") : (int)0;
	p_bpp = t_bpp ? &c_bpp : (int *)bg_outref_raw(aTHX_ sv_bpp, "SDL_GetMasksForPixelFormat(bpp)");
	t_Rmask = bg_outref_target(aTHX_ sv_Rmask);
	c_Rmask = (t_Rmask && SvOK(t_Rmask)) ? (Uint32)bg_in_uv(aTHX_ t_Rmask, "SDL_GetMasksForPixelFormat(Rmask)") : (Uint32)0;
	p_Rmask = t_Rmask ? &c_Rmask : (Uint32 *)bg_outref_raw(aTHX_ sv_Rmask, "SDL_GetMasksForPixelFormat(Rmask)");
	t_Gmask = bg_outref_target(aTHX_ sv_Gmask);
	c_Gmask = (t_Gmask && SvOK(t_Gmask)) ? (Uint32)bg_in_uv(aTHX_ t_Gmask, "SDL_GetMasksForPixelFormat(Gmask)") : (Uint32)0;
	p_Gmask = t_Gmask ? &c_Gmask : (Uint32 *)bg_outref_raw(aTHX_ sv_Gmask, "SDL_GetMasksForPixelFormat(Gmask)");
	t_Bmask = bg_outref_target(aTHX_ sv_Bmask);
	c_Bmask = (t_Bmask && SvOK(t_Bmask)) ? (Uint32)bg_in_uv(aTHX_ t_Bmask, "SDL_GetMasksForPixelFormat(Bmask)") : (Uint32)0;
	p_Bmask = t_Bmask ? &c_Bmask : (Uint32 *)bg_outref_raw(aTHX_ sv_Bmask, "SDL_GetMasksForPixelFormat(Bmask)");
	t_Amask = bg_outref_target(aTHX_ sv_Amask);
	c_Amask = (t_Amask && SvOK(t_Amask)) ? (Uint32)bg_in_uv(aTHX_ t_Amask, "SDL_GetMasksForPixelFormat(Amask)") : (Uint32)0;
	p_Amask = t_Amask ? &c_Amask : (Uint32 *)bg_outref_raw(aTHX_ sv_Amask, "SDL_GetMasksForPixelFormat(Amask)");
	c_bg_ret = SDL_GetMasksForPixelFormat(c_format, p_bpp, p_Rmask, p_Gmask, p_Bmask, p_Amask);
	if (t_bpp) sv_setsv(t_bpp, sv_2mortal(newSViv((IV)(c_bpp))));
	if (t_Rmask) sv_setsv(t_Rmask, sv_2mortal(newSVuv((UV)(c_Rmask))));
	if (t_Gmask) sv_setsv(t_Gmask, sv_2mortal(newSVuv((UV)(c_Gmask))));
	if (t_Bmask) sv_setsv(t_Bmask, sv_2mortal(newSVuv((UV)(c_Bmask))));
	if (t_Amask) sv_setsv(t_Amask, sv_2mortal(newSVuv((UV)(c_Amask))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetPixelFormatForMasks(sv_bpp, sv_Rmask, sv_Gmask, sv_Bmask, sv_Amask)
	SV *sv_bpp
	SV *sv_Rmask
	SV *sv_Gmask
	SV *sv_Bmask
	SV *sv_Amask
    PREINIT:
	int c_bpp;
	Uint32 c_Rmask;
	Uint32 c_Gmask;
	Uint32 c_Bmask;
	Uint32 c_Amask;
	SDL_PixelFormat c_bg_ret;
    PPCODE:
	c_bpp = (int)bg_in_iv(aTHX_ sv_bpp, "SDL_GetPixelFormatForMasks(bpp)");
	c_Rmask = (Uint32)bg_in_uv(aTHX_ sv_Rmask, "SDL_GetPixelFormatForMasks(Rmask)");
	c_Gmask = (Uint32)bg_in_uv(aTHX_ sv_Gmask, "SDL_GetPixelFormatForMasks(Gmask)");
	c_Bmask = (Uint32)bg_in_uv(aTHX_ sv_Bmask, "SDL_GetPixelFormatForMasks(Bmask)");
	c_Amask = (Uint32)bg_in_uv(aTHX_ sv_Amask, "SDL_GetPixelFormatForMasks(Amask)");
	c_bg_ret = SDL_GetPixelFormatForMasks(c_bpp, c_Rmask, c_Gmask, c_Bmask, c_Amask);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetPixelFormatDetails(sv_format)
	SV *sv_format
    PREINIT:
	SDL_PixelFormat c_format;
	const SDL_PixelFormatDetails * c_bg_ret;
    PPCODE:
	c_format = (SDL_PixelFormat)bg_in_iv(aTHX_ sv_format, "SDL_GetPixelFormatDetails(format)");
	c_bg_ret = SDL_GetPixelFormatDetails(c_format);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::PixelFormatDetails"));
	XSRETURN(1);

void
SDL_CreatePalette(sv_ncolors)
	SV *sv_ncolors
    PREINIT:
	int c_ncolors;
	SDL_Palette * c_bg_ret;
    PPCODE:
	c_ncolors = (int)bg_in_iv(aTHX_ sv_ncolors, "SDL_CreatePalette(ncolors)");
	c_bg_ret = SDL_CreatePalette(c_ncolors);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Palette"));
	XSRETURN(1);

void
SDL_SetPaletteColors(sv_palette, sv_colors, sv_firstcolor, sv_ncolors)
	SV *sv_palette
	SV *sv_colors
	SV *sv_firstcolor
	SV *sv_ncolors
    PREINIT:
	SDL_Palette * c_palette;
	const SDL_Color * c_colors;
	int c_firstcolor;
	int c_ncolors;
	_Bool c_bg_ret;
    PPCODE:
	c_palette = (SDL_Palette *)bg_in_record_ptr(aTHX_ sv_palette, "SDL3::Palette", "SDL_SetPaletteColors(palette)");
	c_colors = (const SDL_Color *)bg_in_record_ptr(aTHX_ sv_colors, "SDL3::Color", "SDL_SetPaletteColors(colors)");
	c_firstcolor = (int)bg_in_iv(aTHX_ sv_firstcolor, "SDL_SetPaletteColors(firstcolor)");
	c_ncolors = (int)bg_in_iv(aTHX_ sv_ncolors, "SDL_SetPaletteColors(ncolors)");
	c_bg_ret = SDL_SetPaletteColors(c_palette, c_colors, c_firstcolor, c_ncolors);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_DestroyPalette(sv_palette)
	SV *sv_palette
    PREINIT:
	SDL_Palette * c_palette;
    PPCODE:
	c_palette = (SDL_Palette *)bg_in_record_ptr(aTHX_ sv_palette, "SDL3::Palette", "SDL_DestroyPalette(palette)");
	SDL_DestroyPalette(c_palette);
	XSRETURN(0);

void
SDL_MapRGB(sv_format, sv_palette, sv_r, sv_g, sv_b)
	SV *sv_format
	SV *sv_palette
	SV *sv_r
	SV *sv_g
	SV *sv_b
    PREINIT:
	const SDL_PixelFormatDetails * c_format;
	const SDL_Palette * c_palette;
	Uint8 c_r;
	Uint8 c_g;
	Uint8 c_b;
	Uint32 c_bg_ret;
    PPCODE:
	c_format = (const SDL_PixelFormatDetails *)bg_in_record_ptr(aTHX_ sv_format, "SDL3::PixelFormatDetails", "SDL_MapRGB(format)");
	c_palette = (const SDL_Palette *)bg_in_record_ptr(aTHX_ sv_palette, "SDL3::Palette", "SDL_MapRGB(palette)");
	c_r = (Uint8)bg_in_uv(aTHX_ sv_r, "SDL_MapRGB(r)");
	c_g = (Uint8)bg_in_uv(aTHX_ sv_g, "SDL_MapRGB(g)");
	c_b = (Uint8)bg_in_uv(aTHX_ sv_b, "SDL_MapRGB(b)");
	c_bg_ret = SDL_MapRGB(c_format, c_palette, c_r, c_g, c_b);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_MapRGBA(sv_format, sv_palette, sv_r, sv_g, sv_b, sv_a)
	SV *sv_format
	SV *sv_palette
	SV *sv_r
	SV *sv_g
	SV *sv_b
	SV *sv_a
    PREINIT:
	const SDL_PixelFormatDetails * c_format;
	const SDL_Palette * c_palette;
	Uint8 c_r;
	Uint8 c_g;
	Uint8 c_b;
	Uint8 c_a;
	Uint32 c_bg_ret;
    PPCODE:
	c_format = (const SDL_PixelFormatDetails *)bg_in_record_ptr(aTHX_ sv_format, "SDL3::PixelFormatDetails", "SDL_MapRGBA(format)");
	c_palette = (const SDL_Palette *)bg_in_record_ptr(aTHX_ sv_palette, "SDL3::Palette", "SDL_MapRGBA(palette)");
	c_r = (Uint8)bg_in_uv(aTHX_ sv_r, "SDL_MapRGBA(r)");
	c_g = (Uint8)bg_in_uv(aTHX_ sv_g, "SDL_MapRGBA(g)");
	c_b = (Uint8)bg_in_uv(aTHX_ sv_b, "SDL_MapRGBA(b)");
	c_a = (Uint8)bg_in_uv(aTHX_ sv_a, "SDL_MapRGBA(a)");
	c_bg_ret = SDL_MapRGBA(c_format, c_palette, c_r, c_g, c_b, c_a);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRGB(sv_pixelvalue, sv_format, sv_palette, sv_r, sv_g, sv_b)
	SV *sv_pixelvalue
	SV *sv_format
	SV *sv_palette
	SV *sv_r
	SV *sv_g
	SV *sv_b
    PREINIT:
	Uint32 c_pixelvalue;
	const SDL_PixelFormatDetails * c_format;
	const SDL_Palette * c_palette;
	Uint8 c_r; Uint8 * p_r; SV *t_r;
	Uint8 c_g; Uint8 * p_g; SV *t_g;
	Uint8 c_b; Uint8 * p_b; SV *t_b;
    PPCODE:
	c_pixelvalue = (Uint32)bg_in_uv(aTHX_ sv_pixelvalue, "SDL_GetRGB(pixelvalue)");
	c_format = (const SDL_PixelFormatDetails *)bg_in_record_ptr(aTHX_ sv_format, "SDL3::PixelFormatDetails", "SDL_GetRGB(format)");
	c_palette = (const SDL_Palette *)bg_in_record_ptr(aTHX_ sv_palette, "SDL3::Palette", "SDL_GetRGB(palette)");
	t_r = bg_outref_target(aTHX_ sv_r);
	c_r = (t_r && SvOK(t_r)) ? (Uint8)bg_in_uv(aTHX_ t_r, "SDL_GetRGB(r)") : (Uint8)0;
	p_r = t_r ? &c_r : (Uint8 *)bg_outref_raw(aTHX_ sv_r, "SDL_GetRGB(r)");
	t_g = bg_outref_target(aTHX_ sv_g);
	c_g = (t_g && SvOK(t_g)) ? (Uint8)bg_in_uv(aTHX_ t_g, "SDL_GetRGB(g)") : (Uint8)0;
	p_g = t_g ? &c_g : (Uint8 *)bg_outref_raw(aTHX_ sv_g, "SDL_GetRGB(g)");
	t_b = bg_outref_target(aTHX_ sv_b);
	c_b = (t_b && SvOK(t_b)) ? (Uint8)bg_in_uv(aTHX_ t_b, "SDL_GetRGB(b)") : (Uint8)0;
	p_b = t_b ? &c_b : (Uint8 *)bg_outref_raw(aTHX_ sv_b, "SDL_GetRGB(b)");
	SDL_GetRGB(c_pixelvalue, c_format, c_palette, p_r, p_g, p_b);
	if (t_r) sv_setsv(t_r, sv_2mortal(newSVuv((UV)(c_r))));
	if (t_g) sv_setsv(t_g, sv_2mortal(newSVuv((UV)(c_g))));
	if (t_b) sv_setsv(t_b, sv_2mortal(newSVuv((UV)(c_b))));
	XSRETURN(0);

void
SDL_GetRGBA(sv_pixelvalue, sv_format, sv_palette, sv_r, sv_g, sv_b, sv_a)
	SV *sv_pixelvalue
	SV *sv_format
	SV *sv_palette
	SV *sv_r
	SV *sv_g
	SV *sv_b
	SV *sv_a
    PREINIT:
	Uint32 c_pixelvalue;
	const SDL_PixelFormatDetails * c_format;
	const SDL_Palette * c_palette;
	Uint8 c_r; Uint8 * p_r; SV *t_r;
	Uint8 c_g; Uint8 * p_g; SV *t_g;
	Uint8 c_b; Uint8 * p_b; SV *t_b;
	Uint8 c_a; Uint8 * p_a; SV *t_a;
    PPCODE:
	c_pixelvalue = (Uint32)bg_in_uv(aTHX_ sv_pixelvalue, "SDL_GetRGBA(pixelvalue)");
	c_format = (const SDL_PixelFormatDetails *)bg_in_record_ptr(aTHX_ sv_format, "SDL3::PixelFormatDetails", "SDL_GetRGBA(format)");
	c_palette = (const SDL_Palette *)bg_in_record_ptr(aTHX_ sv_palette, "SDL3::Palette", "SDL_GetRGBA(palette)");
	t_r = bg_outref_target(aTHX_ sv_r);
	c_r = (t_r && SvOK(t_r)) ? (Uint8)bg_in_uv(aTHX_ t_r, "SDL_GetRGBA(r)") : (Uint8)0;
	p_r = t_r ? &c_r : (Uint8 *)bg_outref_raw(aTHX_ sv_r, "SDL_GetRGBA(r)");
	t_g = bg_outref_target(aTHX_ sv_g);
	c_g = (t_g && SvOK(t_g)) ? (Uint8)bg_in_uv(aTHX_ t_g, "SDL_GetRGBA(g)") : (Uint8)0;
	p_g = t_g ? &c_g : (Uint8 *)bg_outref_raw(aTHX_ sv_g, "SDL_GetRGBA(g)");
	t_b = bg_outref_target(aTHX_ sv_b);
	c_b = (t_b && SvOK(t_b)) ? (Uint8)bg_in_uv(aTHX_ t_b, "SDL_GetRGBA(b)") : (Uint8)0;
	p_b = t_b ? &c_b : (Uint8 *)bg_outref_raw(aTHX_ sv_b, "SDL_GetRGBA(b)");
	t_a = bg_outref_target(aTHX_ sv_a);
	c_a = (t_a && SvOK(t_a)) ? (Uint8)bg_in_uv(aTHX_ t_a, "SDL_GetRGBA(a)") : (Uint8)0;
	p_a = t_a ? &c_a : (Uint8 *)bg_outref_raw(aTHX_ sv_a, "SDL_GetRGBA(a)");
	SDL_GetRGBA(c_pixelvalue, c_format, c_palette, p_r, p_g, p_b, p_a);
	if (t_r) sv_setsv(t_r, sv_2mortal(newSVuv((UV)(c_r))));
	if (t_g) sv_setsv(t_g, sv_2mortal(newSVuv((UV)(c_g))));
	if (t_b) sv_setsv(t_b, sv_2mortal(newSVuv((UV)(c_b))));
	if (t_a) sv_setsv(t_a, sv_2mortal(newSVuv((UV)(c_a))));
	XSRETURN(0);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Pixels", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_ALPHA_OPAQUE", BG_CONST_SV(SDL_ALPHA_OPAQUE));
	bg_export_constant(aTHX_ stash, "SDL_ALPHA_OPAQUE_FLOAT", BG_CONST_SV(SDL_ALPHA_OPAQUE_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_ALPHA_TRANSPARENT", BG_CONST_SV(SDL_ALPHA_TRANSPARENT));
	bg_export_constant(aTHX_ stash, "SDL_ALPHA_TRANSPARENT_FLOAT", BG_CONST_SV(SDL_ALPHA_TRANSPARENT_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PIXELTYPE_UNKNOWN", BG_CONST_SV(SDL_PIXELTYPE_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_PIXELTYPE_INDEX1", BG_CONST_SV(SDL_PIXELTYPE_INDEX1));
	bg_export_constant(aTHX_ stash, "SDL_PIXELTYPE_INDEX4", BG_CONST_SV(SDL_PIXELTYPE_INDEX4));
	bg_export_constant(aTHX_ stash, "SDL_PIXELTYPE_INDEX8", BG_CONST_SV(SDL_PIXELTYPE_INDEX8));
	bg_export_constant(aTHX_ stash, "SDL_PIXELTYPE_PACKED8", BG_CONST_SV(SDL_PIXELTYPE_PACKED8));
	bg_export_constant(aTHX_ stash, "SDL_PIXELTYPE_PACKED16", BG_CONST_SV(SDL_PIXELTYPE_PACKED16));
	bg_export_constant(aTHX_ stash, "SDL_PIXELTYPE_PACKED32", BG_CONST_SV(SDL_PIXELTYPE_PACKED32));
	bg_export_constant(aTHX_ stash, "SDL_PIXELTYPE_ARRAYU8", BG_CONST_SV(SDL_PIXELTYPE_ARRAYU8));
	bg_export_constant(aTHX_ stash, "SDL_PIXELTYPE_ARRAYU16", BG_CONST_SV(SDL_PIXELTYPE_ARRAYU16));
	bg_export_constant(aTHX_ stash, "SDL_PIXELTYPE_ARRAYU32", BG_CONST_SV(SDL_PIXELTYPE_ARRAYU32));
	bg_export_constant(aTHX_ stash, "SDL_PIXELTYPE_ARRAYF16", BG_CONST_SV(SDL_PIXELTYPE_ARRAYF16));
	bg_export_constant(aTHX_ stash, "SDL_PIXELTYPE_ARRAYF32", BG_CONST_SV(SDL_PIXELTYPE_ARRAYF32));
	bg_export_constant(aTHX_ stash, "SDL_PIXELTYPE_INDEX2", BG_CONST_SV(SDL_PIXELTYPE_INDEX2));
	bg_export_constant(aTHX_ stash, "SDL_BITMAPORDER_NONE", BG_CONST_SV(SDL_BITMAPORDER_NONE));
	bg_export_constant(aTHX_ stash, "SDL_BITMAPORDER_4321", BG_CONST_SV(SDL_BITMAPORDER_4321));
	bg_export_constant(aTHX_ stash, "SDL_BITMAPORDER_1234", BG_CONST_SV(SDL_BITMAPORDER_1234));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDORDER_NONE", BG_CONST_SV(SDL_PACKEDORDER_NONE));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDORDER_XRGB", BG_CONST_SV(SDL_PACKEDORDER_XRGB));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDORDER_RGBX", BG_CONST_SV(SDL_PACKEDORDER_RGBX));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDORDER_ARGB", BG_CONST_SV(SDL_PACKEDORDER_ARGB));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDORDER_RGBA", BG_CONST_SV(SDL_PACKEDORDER_RGBA));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDORDER_XBGR", BG_CONST_SV(SDL_PACKEDORDER_XBGR));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDORDER_BGRX", BG_CONST_SV(SDL_PACKEDORDER_BGRX));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDORDER_ABGR", BG_CONST_SV(SDL_PACKEDORDER_ABGR));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDORDER_BGRA", BG_CONST_SV(SDL_PACKEDORDER_BGRA));
	bg_export_constant(aTHX_ stash, "SDL_ARRAYORDER_NONE", BG_CONST_SV(SDL_ARRAYORDER_NONE));
	bg_export_constant(aTHX_ stash, "SDL_ARRAYORDER_RGB", BG_CONST_SV(SDL_ARRAYORDER_RGB));
	bg_export_constant(aTHX_ stash, "SDL_ARRAYORDER_RGBA", BG_CONST_SV(SDL_ARRAYORDER_RGBA));
	bg_export_constant(aTHX_ stash, "SDL_ARRAYORDER_ARGB", BG_CONST_SV(SDL_ARRAYORDER_ARGB));
	bg_export_constant(aTHX_ stash, "SDL_ARRAYORDER_BGR", BG_CONST_SV(SDL_ARRAYORDER_BGR));
	bg_export_constant(aTHX_ stash, "SDL_ARRAYORDER_BGRA", BG_CONST_SV(SDL_ARRAYORDER_BGRA));
	bg_export_constant(aTHX_ stash, "SDL_ARRAYORDER_ABGR", BG_CONST_SV(SDL_ARRAYORDER_ABGR));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDLAYOUT_NONE", BG_CONST_SV(SDL_PACKEDLAYOUT_NONE));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDLAYOUT_332", BG_CONST_SV(SDL_PACKEDLAYOUT_332));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDLAYOUT_4444", BG_CONST_SV(SDL_PACKEDLAYOUT_4444));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDLAYOUT_1555", BG_CONST_SV(SDL_PACKEDLAYOUT_1555));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDLAYOUT_5551", BG_CONST_SV(SDL_PACKEDLAYOUT_5551));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDLAYOUT_565", BG_CONST_SV(SDL_PACKEDLAYOUT_565));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDLAYOUT_8888", BG_CONST_SV(SDL_PACKEDLAYOUT_8888));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDLAYOUT_2101010", BG_CONST_SV(SDL_PACKEDLAYOUT_2101010));
	bg_export_constant(aTHX_ stash, "SDL_PACKEDLAYOUT_1010102", BG_CONST_SV(SDL_PACKEDLAYOUT_1010102));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_UNKNOWN", BG_CONST_SV(SDL_PIXELFORMAT_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_INDEX1LSB", BG_CONST_SV(SDL_PIXELFORMAT_INDEX1LSB));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_INDEX1MSB", BG_CONST_SV(SDL_PIXELFORMAT_INDEX1MSB));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_INDEX2LSB", BG_CONST_SV(SDL_PIXELFORMAT_INDEX2LSB));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_INDEX2MSB", BG_CONST_SV(SDL_PIXELFORMAT_INDEX2MSB));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_INDEX4LSB", BG_CONST_SV(SDL_PIXELFORMAT_INDEX4LSB));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_INDEX4MSB", BG_CONST_SV(SDL_PIXELFORMAT_INDEX4MSB));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_INDEX8", BG_CONST_SV(SDL_PIXELFORMAT_INDEX8));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_RGB332", BG_CONST_SV(SDL_PIXELFORMAT_RGB332));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_XRGB4444", BG_CONST_SV(SDL_PIXELFORMAT_XRGB4444));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_XBGR4444", BG_CONST_SV(SDL_PIXELFORMAT_XBGR4444));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_XRGB1555", BG_CONST_SV(SDL_PIXELFORMAT_XRGB1555));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_XBGR1555", BG_CONST_SV(SDL_PIXELFORMAT_XBGR1555));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ARGB4444", BG_CONST_SV(SDL_PIXELFORMAT_ARGB4444));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_RGBA4444", BG_CONST_SV(SDL_PIXELFORMAT_RGBA4444));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ABGR4444", BG_CONST_SV(SDL_PIXELFORMAT_ABGR4444));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_BGRA4444", BG_CONST_SV(SDL_PIXELFORMAT_BGRA4444));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ARGB1555", BG_CONST_SV(SDL_PIXELFORMAT_ARGB1555));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_RGBA5551", BG_CONST_SV(SDL_PIXELFORMAT_RGBA5551));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ABGR1555", BG_CONST_SV(SDL_PIXELFORMAT_ABGR1555));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_BGRA5551", BG_CONST_SV(SDL_PIXELFORMAT_BGRA5551));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_RGB565", BG_CONST_SV(SDL_PIXELFORMAT_RGB565));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_BGR565", BG_CONST_SV(SDL_PIXELFORMAT_BGR565));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_RGB24", BG_CONST_SV(SDL_PIXELFORMAT_RGB24));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_BGR24", BG_CONST_SV(SDL_PIXELFORMAT_BGR24));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_XRGB8888", BG_CONST_SV(SDL_PIXELFORMAT_XRGB8888));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_RGBX8888", BG_CONST_SV(SDL_PIXELFORMAT_RGBX8888));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_XBGR8888", BG_CONST_SV(SDL_PIXELFORMAT_XBGR8888));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_BGRX8888", BG_CONST_SV(SDL_PIXELFORMAT_BGRX8888));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ARGB8888", BG_CONST_SV(SDL_PIXELFORMAT_ARGB8888));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_RGBA8888", BG_CONST_SV(SDL_PIXELFORMAT_RGBA8888));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ABGR8888", BG_CONST_SV(SDL_PIXELFORMAT_ABGR8888));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_BGRA8888", BG_CONST_SV(SDL_PIXELFORMAT_BGRA8888));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_XRGB2101010", BG_CONST_SV(SDL_PIXELFORMAT_XRGB2101010));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_XBGR2101010", BG_CONST_SV(SDL_PIXELFORMAT_XBGR2101010));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ARGB2101010", BG_CONST_SV(SDL_PIXELFORMAT_ARGB2101010));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ABGR2101010", BG_CONST_SV(SDL_PIXELFORMAT_ABGR2101010));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_RGB48", BG_CONST_SV(SDL_PIXELFORMAT_RGB48));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_BGR48", BG_CONST_SV(SDL_PIXELFORMAT_BGR48));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_RGBA64", BG_CONST_SV(SDL_PIXELFORMAT_RGBA64));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ARGB64", BG_CONST_SV(SDL_PIXELFORMAT_ARGB64));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_BGRA64", BG_CONST_SV(SDL_PIXELFORMAT_BGRA64));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ABGR64", BG_CONST_SV(SDL_PIXELFORMAT_ABGR64));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_RGB48_FLOAT", BG_CONST_SV(SDL_PIXELFORMAT_RGB48_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_BGR48_FLOAT", BG_CONST_SV(SDL_PIXELFORMAT_BGR48_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_RGBA64_FLOAT", BG_CONST_SV(SDL_PIXELFORMAT_RGBA64_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ARGB64_FLOAT", BG_CONST_SV(SDL_PIXELFORMAT_ARGB64_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_BGRA64_FLOAT", BG_CONST_SV(SDL_PIXELFORMAT_BGRA64_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ABGR64_FLOAT", BG_CONST_SV(SDL_PIXELFORMAT_ABGR64_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_RGB96_FLOAT", BG_CONST_SV(SDL_PIXELFORMAT_RGB96_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_BGR96_FLOAT", BG_CONST_SV(SDL_PIXELFORMAT_BGR96_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_RGBA128_FLOAT", BG_CONST_SV(SDL_PIXELFORMAT_RGBA128_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ARGB128_FLOAT", BG_CONST_SV(SDL_PIXELFORMAT_ARGB128_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_BGRA128_FLOAT", BG_CONST_SV(SDL_PIXELFORMAT_BGRA128_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ABGR128_FLOAT", BG_CONST_SV(SDL_PIXELFORMAT_ABGR128_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_YV12", BG_CONST_SV(SDL_PIXELFORMAT_YV12));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_IYUV", BG_CONST_SV(SDL_PIXELFORMAT_IYUV));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_YUY2", BG_CONST_SV(SDL_PIXELFORMAT_YUY2));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_UYVY", BG_CONST_SV(SDL_PIXELFORMAT_UYVY));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_YVYU", BG_CONST_SV(SDL_PIXELFORMAT_YVYU));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_NV12", BG_CONST_SV(SDL_PIXELFORMAT_NV12));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_NV21", BG_CONST_SV(SDL_PIXELFORMAT_NV21));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_P010", BG_CONST_SV(SDL_PIXELFORMAT_P010));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_EXTERNAL_OES", BG_CONST_SV(SDL_PIXELFORMAT_EXTERNAL_OES));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_MJPG", BG_CONST_SV(SDL_PIXELFORMAT_MJPG));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_RGBA32", BG_CONST_SV(SDL_PIXELFORMAT_RGBA32));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ARGB32", BG_CONST_SV(SDL_PIXELFORMAT_ARGB32));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_BGRA32", BG_CONST_SV(SDL_PIXELFORMAT_BGRA32));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_ABGR32", BG_CONST_SV(SDL_PIXELFORMAT_ABGR32));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_RGBX32", BG_CONST_SV(SDL_PIXELFORMAT_RGBX32));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_XRGB32", BG_CONST_SV(SDL_PIXELFORMAT_XRGB32));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_BGRX32", BG_CONST_SV(SDL_PIXELFORMAT_BGRX32));
	bg_export_constant(aTHX_ stash, "SDL_PIXELFORMAT_XBGR32", BG_CONST_SV(SDL_PIXELFORMAT_XBGR32));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_TYPE_UNKNOWN", BG_CONST_SV(SDL_COLOR_TYPE_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_TYPE_RGB", BG_CONST_SV(SDL_COLOR_TYPE_RGB));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_TYPE_YCBCR", BG_CONST_SV(SDL_COLOR_TYPE_YCBCR));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_RANGE_UNKNOWN", BG_CONST_SV(SDL_COLOR_RANGE_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_RANGE_LIMITED", BG_CONST_SV(SDL_COLOR_RANGE_LIMITED));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_RANGE_FULL", BG_CONST_SV(SDL_COLOR_RANGE_FULL));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_PRIMARIES_UNKNOWN", BG_CONST_SV(SDL_COLOR_PRIMARIES_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_PRIMARIES_BT709", BG_CONST_SV(SDL_COLOR_PRIMARIES_BT709));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_PRIMARIES_UNSPECIFIED", BG_CONST_SV(SDL_COLOR_PRIMARIES_UNSPECIFIED));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_PRIMARIES_BT470M", BG_CONST_SV(SDL_COLOR_PRIMARIES_BT470M));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_PRIMARIES_BT470BG", BG_CONST_SV(SDL_COLOR_PRIMARIES_BT470BG));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_PRIMARIES_BT601", BG_CONST_SV(SDL_COLOR_PRIMARIES_BT601));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_PRIMARIES_SMPTE240", BG_CONST_SV(SDL_COLOR_PRIMARIES_SMPTE240));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_PRIMARIES_GENERIC_FILM", BG_CONST_SV(SDL_COLOR_PRIMARIES_GENERIC_FILM));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_PRIMARIES_BT2020", BG_CONST_SV(SDL_COLOR_PRIMARIES_BT2020));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_PRIMARIES_XYZ", BG_CONST_SV(SDL_COLOR_PRIMARIES_XYZ));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_PRIMARIES_SMPTE431", BG_CONST_SV(SDL_COLOR_PRIMARIES_SMPTE431));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_PRIMARIES_SMPTE432", BG_CONST_SV(SDL_COLOR_PRIMARIES_SMPTE432));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_PRIMARIES_EBU3213", BG_CONST_SV(SDL_COLOR_PRIMARIES_EBU3213));
	bg_export_constant(aTHX_ stash, "SDL_COLOR_PRIMARIES_CUSTOM", BG_CONST_SV(SDL_COLOR_PRIMARIES_CUSTOM));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_UNKNOWN", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_BT709", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_BT709));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_UNSPECIFIED", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_UNSPECIFIED));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_GAMMA22", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_GAMMA22));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_GAMMA28", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_GAMMA28));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_BT601", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_BT601));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_SMPTE240", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_SMPTE240));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_LINEAR", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_LINEAR));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_LOG100", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_LOG100));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_LOG100_SQRT10", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_LOG100_SQRT10));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_IEC61966", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_IEC61966));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_BT1361", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_BT1361));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_SRGB", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_BT2020_10BIT", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_BT2020_10BIT));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_BT2020_12BIT", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_BT2020_12BIT));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_PQ", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_PQ));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_SMPTE428", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_SMPTE428));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_HLG", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_HLG));
	bg_export_constant(aTHX_ stash, "SDL_TRANSFER_CHARACTERISTICS_CUSTOM", BG_CONST_SV(SDL_TRANSFER_CHARACTERISTICS_CUSTOM));
	bg_export_constant(aTHX_ stash, "SDL_MATRIX_COEFFICIENTS_IDENTITY", BG_CONST_SV(SDL_MATRIX_COEFFICIENTS_IDENTITY));
	bg_export_constant(aTHX_ stash, "SDL_MATRIX_COEFFICIENTS_BT709", BG_CONST_SV(SDL_MATRIX_COEFFICIENTS_BT709));
	bg_export_constant(aTHX_ stash, "SDL_MATRIX_COEFFICIENTS_UNSPECIFIED", BG_CONST_SV(SDL_MATRIX_COEFFICIENTS_UNSPECIFIED));
	bg_export_constant(aTHX_ stash, "SDL_MATRIX_COEFFICIENTS_FCC", BG_CONST_SV(SDL_MATRIX_COEFFICIENTS_FCC));
	bg_export_constant(aTHX_ stash, "SDL_MATRIX_COEFFICIENTS_BT470BG", BG_CONST_SV(SDL_MATRIX_COEFFICIENTS_BT470BG));
	bg_export_constant(aTHX_ stash, "SDL_MATRIX_COEFFICIENTS_BT601", BG_CONST_SV(SDL_MATRIX_COEFFICIENTS_BT601));
	bg_export_constant(aTHX_ stash, "SDL_MATRIX_COEFFICIENTS_SMPTE240", BG_CONST_SV(SDL_MATRIX_COEFFICIENTS_SMPTE240));
	bg_export_constant(aTHX_ stash, "SDL_MATRIX_COEFFICIENTS_YCGCO", BG_CONST_SV(SDL_MATRIX_COEFFICIENTS_YCGCO));
	bg_export_constant(aTHX_ stash, "SDL_MATRIX_COEFFICIENTS_BT2020_NCL", BG_CONST_SV(SDL_MATRIX_COEFFICIENTS_BT2020_NCL));
	bg_export_constant(aTHX_ stash, "SDL_MATRIX_COEFFICIENTS_BT2020_CL", BG_CONST_SV(SDL_MATRIX_COEFFICIENTS_BT2020_CL));
	bg_export_constant(aTHX_ stash, "SDL_MATRIX_COEFFICIENTS_SMPTE2085", BG_CONST_SV(SDL_MATRIX_COEFFICIENTS_SMPTE2085));
	bg_export_constant(aTHX_ stash, "SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL", BG_CONST_SV(SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL));
	bg_export_constant(aTHX_ stash, "SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL", BG_CONST_SV(SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL));
	bg_export_constant(aTHX_ stash, "SDL_MATRIX_COEFFICIENTS_ICTCP", BG_CONST_SV(SDL_MATRIX_COEFFICIENTS_ICTCP));
	bg_export_constant(aTHX_ stash, "SDL_MATRIX_COEFFICIENTS_CUSTOM", BG_CONST_SV(SDL_MATRIX_COEFFICIENTS_CUSTOM));
	bg_export_constant(aTHX_ stash, "SDL_CHROMA_LOCATION_NONE", BG_CONST_SV(SDL_CHROMA_LOCATION_NONE));
	bg_export_constant(aTHX_ stash, "SDL_CHROMA_LOCATION_LEFT", BG_CONST_SV(SDL_CHROMA_LOCATION_LEFT));
	bg_export_constant(aTHX_ stash, "SDL_CHROMA_LOCATION_CENTER", BG_CONST_SV(SDL_CHROMA_LOCATION_CENTER));
	bg_export_constant(aTHX_ stash, "SDL_CHROMA_LOCATION_TOPLEFT", BG_CONST_SV(SDL_CHROMA_LOCATION_TOPLEFT));
	bg_export_constant(aTHX_ stash, "SDL_COLORSPACE_UNKNOWN", BG_CONST_SV(SDL_COLORSPACE_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_COLORSPACE_SRGB", BG_CONST_SV(SDL_COLORSPACE_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_COLORSPACE_SRGB_LINEAR", BG_CONST_SV(SDL_COLORSPACE_SRGB_LINEAR));
	bg_export_constant(aTHX_ stash, "SDL_COLORSPACE_HDR10", BG_CONST_SV(SDL_COLORSPACE_HDR10));
	bg_export_constant(aTHX_ stash, "SDL_COLORSPACE_JPEG", BG_CONST_SV(SDL_COLORSPACE_JPEG));
	bg_export_constant(aTHX_ stash, "SDL_COLORSPACE_BT601_LIMITED", BG_CONST_SV(SDL_COLORSPACE_BT601_LIMITED));
	bg_export_constant(aTHX_ stash, "SDL_COLORSPACE_BT601_FULL", BG_CONST_SV(SDL_COLORSPACE_BT601_FULL));
	bg_export_constant(aTHX_ stash, "SDL_COLORSPACE_BT709_LIMITED", BG_CONST_SV(SDL_COLORSPACE_BT709_LIMITED));
	bg_export_constant(aTHX_ stash, "SDL_COLORSPACE_BT709_FULL", BG_CONST_SV(SDL_COLORSPACE_BT709_FULL));
	bg_export_constant(aTHX_ stash, "SDL_COLORSPACE_BT2020_LIMITED", BG_CONST_SV(SDL_COLORSPACE_BT2020_LIMITED));
	bg_export_constant(aTHX_ stash, "SDL_COLORSPACE_BT2020_FULL", BG_CONST_SV(SDL_COLORSPACE_BT2020_FULL));
	bg_export_constant(aTHX_ stash, "SDL_COLORSPACE_RGB_DEFAULT", BG_CONST_SV(SDL_COLORSPACE_RGB_DEFAULT));
	bg_export_constant(aTHX_ stash, "SDL_COLORSPACE_YUV_DEFAULT", BG_CONST_SV(SDL_COLORSPACE_YUV_DEFAULT));
	}

MODULE = SDL3  PACKAGE = SDL3::Color

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_Color), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_Color)));
	XSRETURN(1);

void
r(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Color *self;
    PPCODE:
	self = (struct SDL_Color *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Color", "SDL3::Color::r");
	if (items > 1) {
		self->r = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::Color::r");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->r)));
	XSRETURN(1);

void
g(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Color *self;
    PPCODE:
	self = (struct SDL_Color *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Color", "SDL3::Color::g");
	if (items > 1) {
		self->g = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::Color::g");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->g)));
	XSRETURN(1);

void
b(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Color *self;
    PPCODE:
	self = (struct SDL_Color *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Color", "SDL3::Color::b");
	if (items > 1) {
		self->b = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::Color::b");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->b)));
	XSRETURN(1);

void
a(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Color *self;
    PPCODE:
	self = (struct SDL_Color *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Color", "SDL3::Color::a");
	if (items > 1) {
		self->a = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::Color::a");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->a)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::FColor

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_FColor), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_FColor)));
	XSRETURN(1);

void
r(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_FColor *self;
    PPCODE:
	self = (struct SDL_FColor *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::FColor", "SDL3::FColor::r");
	if (items > 1) {
		self->r = (float)bg_in_nv(aTHX_ ST(1), "SDL3::FColor::r");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->r)));
	XSRETURN(1);

void
g(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_FColor *self;
    PPCODE:
	self = (struct SDL_FColor *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::FColor", "SDL3::FColor::g");
	if (items > 1) {
		self->g = (float)bg_in_nv(aTHX_ ST(1), "SDL3::FColor::g");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->g)));
	XSRETURN(1);

void
b(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_FColor *self;
    PPCODE:
	self = (struct SDL_FColor *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::FColor", "SDL3::FColor::b");
	if (items > 1) {
		self->b = (float)bg_in_nv(aTHX_ ST(1), "SDL3::FColor::b");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->b)));
	XSRETURN(1);

void
a(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_FColor *self;
    PPCODE:
	self = (struct SDL_FColor *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::FColor", "SDL3::FColor::a");
	if (items > 1) {
		self->a = (float)bg_in_nv(aTHX_ ST(1), "SDL3::FColor::a");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->a)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::Palette

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_Palette), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_Palette)));
	XSRETURN(1);

void
ncolors(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Palette *self;
    PPCODE:
	self = (struct SDL_Palette *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Palette", "SDL3::Palette::ncolors");
	if (items > 1) {
		self->ncolors = (int)bg_in_iv(aTHX_ ST(1), "SDL3::Palette::ncolors");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->ncolors)));
	XSRETURN(1);

void
colors(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Palette *self;
    PPCODE:
	self = (struct SDL_Palette *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Palette", "SDL3::Palette::colors");
	if (items > 1) {
		self->colors = (SDL_Color *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::Color", "SDL3::Palette::colors");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->colors), "SDL3::Color"));
	XSRETURN(1);

void
version(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Palette *self;
    PPCODE:
	self = (struct SDL_Palette *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Palette", "SDL3::Palette::version");
	if (items > 1) {
		self->version = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::Palette::version");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->version)));
	XSRETURN(1);

void
refcount(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Palette *self;
    PPCODE:
	self = (struct SDL_Palette *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Palette", "SDL3::Palette::refcount");
	if (items > 1) {
		self->refcount = (int)bg_in_iv(aTHX_ ST(1), "SDL3::Palette::refcount");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->refcount)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::PixelFormatDetails

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_PixelFormatDetails), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_PixelFormatDetails)));
	XSRETURN(1);

void
format(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::format");
	if (items > 1) {
		self->format = (SDL_PixelFormat)bg_in_iv(aTHX_ ST(1), "SDL3::PixelFormatDetails::format");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->format)));
	XSRETURN(1);

void
bits_per_pixel(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::bits_per_pixel");
	if (items > 1) {
		self->bits_per_pixel = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::PixelFormatDetails::bits_per_pixel");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->bits_per_pixel)));
	XSRETURN(1);

void
bytes_per_pixel(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::bytes_per_pixel");
	if (items > 1) {
		self->bytes_per_pixel = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::PixelFormatDetails::bytes_per_pixel");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->bytes_per_pixel)));
	XSRETURN(1);

void
padding(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
	Size_t bg_i;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::padding");
	if (items > 1) {
		if (items - 1 != 2) croak("%s expects 2 values, got %d", "SDL3::PixelFormatDetails::padding", (int)(items - 1));
		for (bg_i = 0; bg_i < 2; bg_i++) self->padding[bg_i] = (Uint8)bg_in_uv(aTHX_ ST(1 + bg_i), "SDL3::PixelFormatDetails::padding");
		XSRETURN(1);
	}
	EXTEND(SP, 2);
	for (bg_i = 0; bg_i < 2; bg_i++) mPUSHs(newSVuv((UV)(self->padding[bg_i])));
	XSRETURN(2);

void
Rmask(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::Rmask");
	if (items > 1) {
		self->Rmask = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::PixelFormatDetails::Rmask");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->Rmask)));
	XSRETURN(1);

void
Gmask(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::Gmask");
	if (items > 1) {
		self->Gmask = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::PixelFormatDetails::Gmask");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->Gmask)));
	XSRETURN(1);

void
Bmask(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::Bmask");
	if (items > 1) {
		self->Bmask = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::PixelFormatDetails::Bmask");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->Bmask)));
	XSRETURN(1);

void
Amask(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::Amask");
	if (items > 1) {
		self->Amask = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::PixelFormatDetails::Amask");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->Amask)));
	XSRETURN(1);

void
Rbits(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::Rbits");
	if (items > 1) {
		self->Rbits = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::PixelFormatDetails::Rbits");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->Rbits)));
	XSRETURN(1);

void
Gbits(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::Gbits");
	if (items > 1) {
		self->Gbits = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::PixelFormatDetails::Gbits");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->Gbits)));
	XSRETURN(1);

void
Bbits(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::Bbits");
	if (items > 1) {
		self->Bbits = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::PixelFormatDetails::Bbits");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->Bbits)));
	XSRETURN(1);

void
Abits(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::Abits");
	if (items > 1) {
		self->Abits = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::PixelFormatDetails::Abits");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->Abits)));
	XSRETURN(1);

void
Rshift(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::Rshift");
	if (items > 1) {
		self->Rshift = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::PixelFormatDetails::Rshift");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->Rshift)));
	XSRETURN(1);

void
Gshift(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::Gshift");
	if (items > 1) {
		self->Gshift = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::PixelFormatDetails::Gshift");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->Gshift)));
	XSRETURN(1);

void
Bshift(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::Bshift");
	if (items > 1) {
		self->Bshift = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::PixelFormatDetails::Bshift");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->Bshift)));
	XSRETURN(1);

void
Ashift(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PixelFormatDetails *self;
    PPCODE:
	self = (struct SDL_PixelFormatDetails *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PixelFormatDetails", "SDL3::PixelFormatDetails::Ashift");
	if (items > 1) {
		self->Ashift = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::PixelFormatDetails::Ashift");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->Ashift)));
	XSRETURN(1);
