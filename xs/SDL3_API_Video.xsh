MODULE = SDL3  PACKAGE = SDL3::API::Video

void
SDL_GetNumVideoDrivers()
    PREINIT:
	int c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetNumVideoDrivers();
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetVideoDriver(sv_index)
	SV *sv_index
    PREINIT:
	int c_index;
	const char * c_bg_ret;
    PPCODE:
	c_index = (int)bg_in_iv(aTHX_ sv_index, "SDL_GetVideoDriver(index)");
	c_bg_ret = SDL_GetVideoDriver(c_index);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetCurrentVideoDriver()
    PREINIT:
	const char * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetCurrentVideoDriver();
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSystemTheme()
    PREINIT:
	SDL_SystemTheme c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetSystemTheme();
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetDisplays(sv_count)
	SV *sv_count
    PREINIT:
	int c_count; int * p_count; SV *t_count;
	SDL_DisplayID * c_bg_ret;
    PPCODE:
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetDisplays(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetDisplays(count)");
	c_bg_ret = SDL_GetDisplays(p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetPrimaryDisplay()
    PREINIT:
	SDL_DisplayID c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetPrimaryDisplay();
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetDisplayProperties(sv_displayID)
	SV *sv_displayID
    PREINIT:
	SDL_DisplayID c_displayID;
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_displayID = (SDL_DisplayID)bg_in_uv(aTHX_ sv_displayID, "SDL_GetDisplayProperties(displayID)");
	c_bg_ret = SDL_GetDisplayProperties(c_displayID);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetDisplayName(sv_displayID)
	SV *sv_displayID
    PREINIT:
	SDL_DisplayID c_displayID;
	const char * c_bg_ret;
    PPCODE:
	c_displayID = (SDL_DisplayID)bg_in_uv(aTHX_ sv_displayID, "SDL_GetDisplayName(displayID)");
	c_bg_ret = SDL_GetDisplayName(c_displayID);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetDisplayBounds(sv_displayID, sv_rect)
	SV *sv_displayID
	SV *sv_rect
    PREINIT:
	SDL_DisplayID c_displayID;
	SDL_Rect * c_rect;
	_Bool c_bg_ret;
    PPCODE:
	c_displayID = (SDL_DisplayID)bg_in_uv(aTHX_ sv_displayID, "SDL_GetDisplayBounds(displayID)");
	c_rect = (SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_GetDisplayBounds(rect)");
	c_bg_ret = SDL_GetDisplayBounds(c_displayID, c_rect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetDisplayUsableBounds(sv_displayID, sv_rect)
	SV *sv_displayID
	SV *sv_rect
    PREINIT:
	SDL_DisplayID c_displayID;
	SDL_Rect * c_rect;
	_Bool c_bg_ret;
    PPCODE:
	c_displayID = (SDL_DisplayID)bg_in_uv(aTHX_ sv_displayID, "SDL_GetDisplayUsableBounds(displayID)");
	c_rect = (SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_GetDisplayUsableBounds(rect)");
	c_bg_ret = SDL_GetDisplayUsableBounds(c_displayID, c_rect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetNaturalDisplayOrientation(sv_displayID)
	SV *sv_displayID
    PREINIT:
	SDL_DisplayID c_displayID;
	SDL_DisplayOrientation c_bg_ret;
    PPCODE:
	c_displayID = (SDL_DisplayID)bg_in_uv(aTHX_ sv_displayID, "SDL_GetNaturalDisplayOrientation(displayID)");
	c_bg_ret = SDL_GetNaturalDisplayOrientation(c_displayID);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetCurrentDisplayOrientation(sv_displayID)
	SV *sv_displayID
    PREINIT:
	SDL_DisplayID c_displayID;
	SDL_DisplayOrientation c_bg_ret;
    PPCODE:
	c_displayID = (SDL_DisplayID)bg_in_uv(aTHX_ sv_displayID, "SDL_GetCurrentDisplayOrientation(displayID)");
	c_bg_ret = SDL_GetCurrentDisplayOrientation(c_displayID);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetDisplayContentScale(sv_displayID)
	SV *sv_displayID
    PREINIT:
	SDL_DisplayID c_displayID;
	float c_bg_ret;
    PPCODE:
	c_displayID = (SDL_DisplayID)bg_in_uv(aTHX_ sv_displayID, "SDL_GetDisplayContentScale(displayID)");
	c_bg_ret = SDL_GetDisplayContentScale(c_displayID);
	ST(0) = sv_2mortal(newSVnv((NV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetFullscreenDisplayModes(sv_displayID, sv_count)
	SV *sv_displayID
	SV *sv_count
    PREINIT:
	SDL_DisplayID c_displayID;
	int c_count; int * p_count; SV *t_count;
	SDL_DisplayMode ** c_bg_ret;
    PPCODE:
	c_displayID = (SDL_DisplayID)bg_in_uv(aTHX_ sv_displayID, "SDL_GetFullscreenDisplayModes(displayID)");
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetFullscreenDisplayModes(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetFullscreenDisplayModes(count)");
	c_bg_ret = SDL_GetFullscreenDisplayModes(c_displayID, p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetClosestFullscreenDisplayMode(sv_displayID, sv_w, sv_h, sv_refresh_rate, sv_include_high_density_modes, sv_closest)
	SV *sv_displayID
	SV *sv_w
	SV *sv_h
	SV *sv_refresh_rate
	SV *sv_include_high_density_modes
	SV *sv_closest
    PREINIT:
	SDL_DisplayID c_displayID;
	int c_w;
	int c_h;
	float c_refresh_rate;
	_Bool c_include_high_density_modes;
	SDL_DisplayMode * c_closest;
	_Bool c_bg_ret;
    PPCODE:
	c_displayID = (SDL_DisplayID)bg_in_uv(aTHX_ sv_displayID, "SDL_GetClosestFullscreenDisplayMode(displayID)");
	c_w = (int)bg_in_iv(aTHX_ sv_w, "SDL_GetClosestFullscreenDisplayMode(w)");
	c_h = (int)bg_in_iv(aTHX_ sv_h, "SDL_GetClosestFullscreenDisplayMode(h)");
	c_refresh_rate = (float)bg_in_nv(aTHX_ sv_refresh_rate, "SDL_GetClosestFullscreenDisplayMode(refresh_rate)");
	c_include_high_density_modes = (_Bool)SvTRUE(sv_include_high_density_modes);
	c_closest = (SDL_DisplayMode *)bg_in_record_ptr(aTHX_ sv_closest, "SDL3::DisplayMode", "SDL_GetClosestFullscreenDisplayMode(closest)");
	c_bg_ret = SDL_GetClosestFullscreenDisplayMode(c_displayID, c_w, c_h, c_refresh_rate, c_include_high_density_modes, c_closest);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetDesktopDisplayMode(sv_displayID)
	SV *sv_displayID
    PREINIT:
	SDL_DisplayID c_displayID;
	const SDL_DisplayMode * c_bg_ret;
    PPCODE:
	c_displayID = (SDL_DisplayID)bg_in_uv(aTHX_ sv_displayID, "SDL_GetDesktopDisplayMode(displayID)");
	c_bg_ret = SDL_GetDesktopDisplayMode(c_displayID);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::DisplayMode"));
	XSRETURN(1);

void
SDL_GetCurrentDisplayMode(sv_displayID)
	SV *sv_displayID
    PREINIT:
	SDL_DisplayID c_displayID;
	const SDL_DisplayMode * c_bg_ret;
    PPCODE:
	c_displayID = (SDL_DisplayID)bg_in_uv(aTHX_ sv_displayID, "SDL_GetCurrentDisplayMode(displayID)");
	c_bg_ret = SDL_GetCurrentDisplayMode(c_displayID);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::DisplayMode"));
	XSRETURN(1);

void
SDL_GetDisplayForPoint(sv_point)
	SV *sv_point
    PREINIT:
	const SDL_Point * c_point;
	SDL_DisplayID c_bg_ret;
    PPCODE:
	c_point = (const SDL_Point *)bg_in_record_ptr(aTHX_ sv_point, "SDL3::Point", "SDL_GetDisplayForPoint(point)");
	c_bg_ret = SDL_GetDisplayForPoint(c_point);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetDisplayForRect(sv_rect)
	SV *sv_rect
    PREINIT:
	const SDL_Rect * c_rect;
	SDL_DisplayID c_bg_ret;
    PPCODE:
	c_rect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_GetDisplayForRect(rect)");
	c_bg_ret = SDL_GetDisplayForRect(c_rect);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetDisplayForWindow(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	SDL_DisplayID c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetDisplayForWindow(window)");
	c_bg_ret = SDL_GetDisplayForWindow(c_window);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowPixelDensity(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	float c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowPixelDensity(window)");
	c_bg_ret = SDL_GetWindowPixelDensity(c_window);
	ST(0) = sv_2mortal(newSVnv((NV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowDisplayScale(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	float c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowDisplayScale(window)");
	c_bg_ret = SDL_GetWindowDisplayScale(c_window);
	ST(0) = sv_2mortal(newSVnv((NV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowFullscreenMode(sv_window, sv_mode)
	SV *sv_window
	SV *sv_mode
    PREINIT:
	SDL_Window * c_window;
	const SDL_DisplayMode * c_mode;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowFullscreenMode(window)");
	c_mode = (const SDL_DisplayMode *)bg_in_record_ptr(aTHX_ sv_mode, "SDL3::DisplayMode", "SDL_SetWindowFullscreenMode(mode)");
	c_bg_ret = SDL_SetWindowFullscreenMode(c_window, c_mode);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowFullscreenMode(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	const SDL_DisplayMode * c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowFullscreenMode(window)");
	c_bg_ret = SDL_GetWindowFullscreenMode(c_window);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::DisplayMode"));
	XSRETURN(1);

void
SDL_GetWindowICCProfile(sv_window, sv_size)
	SV *sv_window
	SV *sv_size
    PREINIT:
	SDL_Window * c_window;
	size_t c_size; size_t * p_size; SV *t_size;
	void * c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowICCProfile(window)");
	t_size = bg_outref_target(aTHX_ sv_size);
	c_size = (t_size && SvOK(t_size)) ? (size_t)bg_in_uv(aTHX_ t_size, "SDL_GetWindowICCProfile(size)") : (size_t)0;
	p_size = t_size ? &c_size : (size_t *)bg_outref_raw(aTHX_ sv_size, "SDL_GetWindowICCProfile(size)");
	c_bg_ret = SDL_GetWindowICCProfile(c_window, p_size);
	if (t_size) sv_setsv(t_size, sv_2mortal(newSVuv((UV)(c_size))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetWindowPixelFormat(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	SDL_PixelFormat c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowPixelFormat(window)");
	c_bg_ret = SDL_GetWindowPixelFormat(c_window);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindows(sv_count)
	SV *sv_count
    PREINIT:
	int c_count; int * p_count; SV *t_count;
	SDL_Window ** c_bg_ret;
    PPCODE:
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetWindows(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetWindows(count)");
	c_bg_ret = SDL_GetWindows(p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_CreateWindow(sv_title, sv_w, sv_h, sv_flags)
	SV *sv_title
	SV *sv_w
	SV *sv_h
	SV *sv_flags
    PREINIT:
	const char * c_title;
	int c_w;
	int c_h;
	SDL_WindowFlags c_flags;
	SDL_Window * c_bg_ret;
    PPCODE:
	c_title = (const char *)bg_in_string(aTHX_ sv_title, "SDL_CreateWindow(title)");
	c_w = (int)bg_in_iv(aTHX_ sv_w, "SDL_CreateWindow(w)");
	c_h = (int)bg_in_iv(aTHX_ sv_h, "SDL_CreateWindow(h)");
	c_flags = (SDL_WindowFlags)bg_in_uv(aTHX_ sv_flags, "SDL_CreateWindow(flags)");
	c_bg_ret = SDL_CreateWindow(c_title, c_w, c_h, c_flags);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Window"));
	XSRETURN(1);

void
SDL_CreatePopupWindow(sv_parent, sv_offset_x, sv_offset_y, sv_w, sv_h, sv_flags)
	SV *sv_parent
	SV *sv_offset_x
	SV *sv_offset_y
	SV *sv_w
	SV *sv_h
	SV *sv_flags
    PREINIT:
	SDL_Window * c_parent;
	int c_offset_x;
	int c_offset_y;
	int c_w;
	int c_h;
	SDL_WindowFlags c_flags;
	SDL_Window * c_bg_ret;
    PPCODE:
	c_parent = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_parent, "SDL3::Window", "SDL_CreatePopupWindow(parent)");
	c_offset_x = (int)bg_in_iv(aTHX_ sv_offset_x, "SDL_CreatePopupWindow(offset_x)");
	c_offset_y = (int)bg_in_iv(aTHX_ sv_offset_y, "SDL_CreatePopupWindow(offset_y)");
	c_w = (int)bg_in_iv(aTHX_ sv_w, "SDL_CreatePopupWindow(w)");
	c_h = (int)bg_in_iv(aTHX_ sv_h, "SDL_CreatePopupWindow(h)");
	c_flags = (SDL_WindowFlags)bg_in_uv(aTHX_ sv_flags, "SDL_CreatePopupWindow(flags)");
	c_bg_ret = SDL_CreatePopupWindow(c_parent, c_offset_x, c_offset_y, c_w, c_h, c_flags);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Window"));
	XSRETURN(1);

void
SDL_CreateWindowWithProperties(sv_props)
	SV *sv_props
    PREINIT:
	SDL_PropertiesID c_props;
	SDL_Window * c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_CreateWindowWithProperties(props)");
	c_bg_ret = SDL_CreateWindowWithProperties(c_props);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Window"));
	XSRETURN(1);

void
SDL_GetWindowID(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	SDL_WindowID c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowID(window)");
	c_bg_ret = SDL_GetWindowID(c_window);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowFromID(sv_id)
	SV *sv_id
    PREINIT:
	SDL_WindowID c_id;
	SDL_Window * c_bg_ret;
    PPCODE:
	c_id = (SDL_WindowID)bg_in_uv(aTHX_ sv_id, "SDL_GetWindowFromID(id)");
	c_bg_ret = SDL_GetWindowFromID(c_id);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Window"));
	XSRETURN(1);

void
SDL_GetWindowParent(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	SDL_Window * c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowParent(window)");
	c_bg_ret = SDL_GetWindowParent(c_window);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Window"));
	XSRETURN(1);

void
SDL_GetWindowProperties(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowProperties(window)");
	c_bg_ret = SDL_GetWindowProperties(c_window);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowFlags(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	SDL_WindowFlags c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowFlags(window)");
	c_bg_ret = SDL_GetWindowFlags(c_window);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowTitle(sv_window, sv_title)
	SV *sv_window
	SV *sv_title
    PREINIT:
	SDL_Window * c_window;
	const char * c_title;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowTitle(window)");
	c_title = (const char *)bg_in_string(aTHX_ sv_title, "SDL_SetWindowTitle(title)");
	c_bg_ret = SDL_SetWindowTitle(c_window, c_title);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowTitle(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	const char * c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowTitle(window)");
	c_bg_ret = SDL_GetWindowTitle(c_window);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowIcon(sv_window, sv_icon)
	SV *sv_window
	SV *sv_icon
    PREINIT:
	SDL_Window * c_window;
	SDL_Surface * c_icon;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowIcon(window)");
	c_icon = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_icon, "SDL3::Surface", "SDL_SetWindowIcon(icon)");
	c_bg_ret = SDL_SetWindowIcon(c_window, c_icon);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowPosition(sv_window, sv_x, sv_y)
	SV *sv_window
	SV *sv_x
	SV *sv_y
    PREINIT:
	SDL_Window * c_window;
	int c_x;
	int c_y;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowPosition(window)");
	c_x = (int)bg_in_iv(aTHX_ sv_x, "SDL_SetWindowPosition(x)");
	c_y = (int)bg_in_iv(aTHX_ sv_y, "SDL_SetWindowPosition(y)");
	c_bg_ret = SDL_SetWindowPosition(c_window, c_x, c_y);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowPosition(sv_window, sv_x, sv_y)
	SV *sv_window
	SV *sv_x
	SV *sv_y
    PREINIT:
	SDL_Window * c_window;
	int c_x; int * p_x; SV *t_x;
	int c_y; int * p_y; SV *t_y;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowPosition(window)");
	t_x = bg_outref_target(aTHX_ sv_x);
	c_x = (t_x && SvOK(t_x)) ? (int)bg_in_iv(aTHX_ t_x, "SDL_GetWindowPosition(x)") : (int)0;
	p_x = t_x ? &c_x : (int *)bg_outref_raw(aTHX_ sv_x, "SDL_GetWindowPosition(x)");
	t_y = bg_outref_target(aTHX_ sv_y);
	c_y = (t_y && SvOK(t_y)) ? (int)bg_in_iv(aTHX_ t_y, "SDL_GetWindowPosition(y)") : (int)0;
	p_y = t_y ? &c_y : (int *)bg_outref_raw(aTHX_ sv_y, "SDL_GetWindowPosition(y)");
	c_bg_ret = SDL_GetWindowPosition(c_window, p_x, p_y);
	if (t_x) sv_setsv(t_x, sv_2mortal(newSViv((IV)(c_x))));
	if (t_y) sv_setsv(t_y, sv_2mortal(newSViv((IV)(c_y))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowSize(sv_window, sv_w, sv_h)
	SV *sv_window
	SV *sv_w
	SV *sv_h
    PREINIT:
	SDL_Window * c_window;
	int c_w;
	int c_h;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowSize(window)");
	c_w = (int)bg_in_iv(aTHX_ sv_w, "SDL_SetWindowSize(w)");
	c_h = (int)bg_in_iv(aTHX_ sv_h, "SDL_SetWindowSize(h)");
	c_bg_ret = SDL_SetWindowSize(c_window, c_w, c_h);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowSize(sv_window, sv_w, sv_h)
	SV *sv_window
	SV *sv_w
	SV *sv_h
    PREINIT:
	SDL_Window * c_window;
	int c_w; int * p_w; SV *t_w;
	int c_h; int * p_h; SV *t_h;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowSize(window)");
	t_w = bg_outref_target(aTHX_ sv_w);
	c_w = (t_w && SvOK(t_w)) ? (int)bg_in_iv(aTHX_ t_w, "SDL_GetWindowSize(w)") : (int)0;
	p_w = t_w ? &c_w : (int *)bg_outref_raw(aTHX_ sv_w, "SDL_GetWindowSize(w)");
	t_h = bg_outref_target(aTHX_ sv_h);
	c_h = (t_h && SvOK(t_h)) ? (int)bg_in_iv(aTHX_ t_h, "SDL_GetWindowSize(h)") : (int)0;
	p_h = t_h ? &c_h : (int *)bg_outref_raw(aTHX_ sv_h, "SDL_GetWindowSize(h)");
	c_bg_ret = SDL_GetWindowSize(c_window, p_w, p_h);
	if (t_w) sv_setsv(t_w, sv_2mortal(newSViv((IV)(c_w))));
	if (t_h) sv_setsv(t_h, sv_2mortal(newSViv((IV)(c_h))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowSafeArea(sv_window, sv_rect)
	SV *sv_window
	SV *sv_rect
    PREINIT:
	SDL_Window * c_window;
	SDL_Rect * c_rect;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowSafeArea(window)");
	c_rect = (SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_GetWindowSafeArea(rect)");
	c_bg_ret = SDL_GetWindowSafeArea(c_window, c_rect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowAspectRatio(sv_window, sv_min_aspect, sv_max_aspect)
	SV *sv_window
	SV *sv_min_aspect
	SV *sv_max_aspect
    PREINIT:
	SDL_Window * c_window;
	float c_min_aspect;
	float c_max_aspect;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowAspectRatio(window)");
	c_min_aspect = (float)bg_in_nv(aTHX_ sv_min_aspect, "SDL_SetWindowAspectRatio(min_aspect)");
	c_max_aspect = (float)bg_in_nv(aTHX_ sv_max_aspect, "SDL_SetWindowAspectRatio(max_aspect)");
	c_bg_ret = SDL_SetWindowAspectRatio(c_window, c_min_aspect, c_max_aspect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowAspectRatio(sv_window, sv_min_aspect, sv_max_aspect)
	SV *sv_window
	SV *sv_min_aspect
	SV *sv_max_aspect
    PREINIT:
	SDL_Window * c_window;
	float c_min_aspect; float * p_min_aspect; SV *t_min_aspect;
	float c_max_aspect; float * p_max_aspect; SV *t_max_aspect;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowAspectRatio(window)");
	t_min_aspect = bg_outref_target(aTHX_ sv_min_aspect);
	c_min_aspect = (t_min_aspect && SvOK(t_min_aspect)) ? (float)bg_in_nv(aTHX_ t_min_aspect, "SDL_GetWindowAspectRatio(min_aspect)") : (float)0;
	p_min_aspect = t_min_aspect ? &c_min_aspect : (float *)bg_outref_raw(aTHX_ sv_min_aspect, "SDL_GetWindowAspectRatio(min_aspect)");
	t_max_aspect = bg_outref_target(aTHX_ sv_max_aspect);
	c_max_aspect = (t_max_aspect && SvOK(t_max_aspect)) ? (float)bg_in_nv(aTHX_ t_max_aspect, "SDL_GetWindowAspectRatio(max_aspect)") : (float)0;
	p_max_aspect = t_max_aspect ? &c_max_aspect : (float *)bg_outref_raw(aTHX_ sv_max_aspect, "SDL_GetWindowAspectRatio(max_aspect)");
	c_bg_ret = SDL_GetWindowAspectRatio(c_window, p_min_aspect, p_max_aspect);
	if (t_min_aspect) sv_setsv(t_min_aspect, sv_2mortal(newSVnv((NV)(c_min_aspect))));
	if (t_max_aspect) sv_setsv(t_max_aspect, sv_2mortal(newSVnv((NV)(c_max_aspect))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowBordersSize(sv_window, sv_top, sv_left, sv_bottom, sv_right)
	SV *sv_window
	SV *sv_top
	SV *sv_left
	SV *sv_bottom
	SV *sv_right
    PREINIT:
	SDL_Window * c_window;
	int c_top; int * p_top; SV *t_top;
	int c_left; int * p_left; SV *t_left;
	int c_bottom; int * p_bottom; SV *t_bottom;
	int c_right; int * p_right; SV *t_right;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowBordersSize(window)");
	t_top = bg_outref_target(aTHX_ sv_top);
	c_top = (t_top && SvOK(t_top)) ? (int)bg_in_iv(aTHX_ t_top, "SDL_GetWindowBordersSize(top)") : (int)0;
	p_top = t_top ? &c_top : (int *)bg_outref_raw(aTHX_ sv_top, "SDL_GetWindowBordersSize(top)");
	t_left = bg_outref_target(aTHX_ sv_left);
	c_left = (t_left && SvOK(t_left)) ? (int)bg_in_iv(aTHX_ t_left, "SDL_GetWindowBordersSize(left)") : (int)0;
	p_left = t_left ? &c_left : (int *)bg_outref_raw(aTHX_ sv_left, "SDL_GetWindowBordersSize(left)");
	t_bottom = bg_outref_target(aTHX_ sv_bottom);
	c_bottom = (t_bottom && SvOK(t_bottom)) ? (int)bg_in_iv(aTHX_ t_bottom, "SDL_GetWindowBordersSize(bottom)") : (int)0;
	p_bottom = t_bottom ? &c_bottom : (int *)bg_outref_raw(aTHX_ sv_bottom, "SDL_GetWindowBordersSize(bottom)");
	t_right = bg_outref_target(aTHX_ sv_right);
	c_right = (t_right && SvOK(t_right)) ? (int)bg_in_iv(aTHX_ t_right, "SDL_GetWindowBordersSize(right)") : (int)0;
	p_right = t_right ? &c_right : (int *)bg_outref_raw(aTHX_ sv_right, "SDL_GetWindowBordersSize(right)");
	c_bg_ret = SDL_GetWindowBordersSize(c_window, p_top, p_left, p_bottom, p_right);
	if (t_top) sv_setsv(t_top, sv_2mortal(newSViv((IV)(c_top))));
	if (t_left) sv_setsv(t_left, sv_2mortal(newSViv((IV)(c_left))));
	if (t_bottom) sv_setsv(t_bottom, sv_2mortal(newSViv((IV)(c_bottom))));
	if (t_right) sv_setsv(t_right, sv_2mortal(newSViv((IV)(c_right))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowSizeInPixels(sv_window, sv_w, sv_h)
	SV *sv_window
	SV *sv_w
	SV *sv_h
    PREINIT:
	SDL_Window * c_window;
	int c_w; int * p_w; SV *t_w;
	int c_h; int * p_h; SV *t_h;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowSizeInPixels(window)");
	t_w = bg_outref_target(aTHX_ sv_w);
	c_w = (t_w && SvOK(t_w)) ? (int)bg_in_iv(aTHX_ t_w, "SDL_GetWindowSizeInPixels(w)") : (int)0;
	p_w = t_w ? &c_w : (int *)bg_outref_raw(aTHX_ sv_w, "SDL_GetWindowSizeInPixels(w)");
	t_h = bg_outref_target(aTHX_ sv_h);
	c_h = (t_h && SvOK(t_h)) ? (int)bg_in_iv(aTHX_ t_h, "SDL_GetWindowSizeInPixels(h)") : (int)0;
	p_h = t_h ? &c_h : (int *)bg_outref_raw(aTHX_ sv_h, "SDL_GetWindowSizeInPixels(h)");
	c_bg_ret = SDL_GetWindowSizeInPixels(c_window, p_w, p_h);
	if (t_w) sv_setsv(t_w, sv_2mortal(newSViv((IV)(c_w))));
	if (t_h) sv_setsv(t_h, sv_2mortal(newSViv((IV)(c_h))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowMinimumSize(sv_window, sv_min_w, sv_min_h)
	SV *sv_window
	SV *sv_min_w
	SV *sv_min_h
    PREINIT:
	SDL_Window * c_window;
	int c_min_w;
	int c_min_h;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowMinimumSize(window)");
	c_min_w = (int)bg_in_iv(aTHX_ sv_min_w, "SDL_SetWindowMinimumSize(min_w)");
	c_min_h = (int)bg_in_iv(aTHX_ sv_min_h, "SDL_SetWindowMinimumSize(min_h)");
	c_bg_ret = SDL_SetWindowMinimumSize(c_window, c_min_w, c_min_h);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowMinimumSize(sv_window, sv_w, sv_h)
	SV *sv_window
	SV *sv_w
	SV *sv_h
    PREINIT:
	SDL_Window * c_window;
	int c_w; int * p_w; SV *t_w;
	int c_h; int * p_h; SV *t_h;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowMinimumSize(window)");
	t_w = bg_outref_target(aTHX_ sv_w);
	c_w = (t_w && SvOK(t_w)) ? (int)bg_in_iv(aTHX_ t_w, "SDL_GetWindowMinimumSize(w)") : (int)0;
	p_w = t_w ? &c_w : (int *)bg_outref_raw(aTHX_ sv_w, "SDL_GetWindowMinimumSize(w)");
	t_h = bg_outref_target(aTHX_ sv_h);
	c_h = (t_h && SvOK(t_h)) ? (int)bg_in_iv(aTHX_ t_h, "SDL_GetWindowMinimumSize(h)") : (int)0;
	p_h = t_h ? &c_h : (int *)bg_outref_raw(aTHX_ sv_h, "SDL_GetWindowMinimumSize(h)");
	c_bg_ret = SDL_GetWindowMinimumSize(c_window, p_w, p_h);
	if (t_w) sv_setsv(t_w, sv_2mortal(newSViv((IV)(c_w))));
	if (t_h) sv_setsv(t_h, sv_2mortal(newSViv((IV)(c_h))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowMaximumSize(sv_window, sv_max_w, sv_max_h)
	SV *sv_window
	SV *sv_max_w
	SV *sv_max_h
    PREINIT:
	SDL_Window * c_window;
	int c_max_w;
	int c_max_h;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowMaximumSize(window)");
	c_max_w = (int)bg_in_iv(aTHX_ sv_max_w, "SDL_SetWindowMaximumSize(max_w)");
	c_max_h = (int)bg_in_iv(aTHX_ sv_max_h, "SDL_SetWindowMaximumSize(max_h)");
	c_bg_ret = SDL_SetWindowMaximumSize(c_window, c_max_w, c_max_h);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowMaximumSize(sv_window, sv_w, sv_h)
	SV *sv_window
	SV *sv_w
	SV *sv_h
    PREINIT:
	SDL_Window * c_window;
	int c_w; int * p_w; SV *t_w;
	int c_h; int * p_h; SV *t_h;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowMaximumSize(window)");
	t_w = bg_outref_target(aTHX_ sv_w);
	c_w = (t_w && SvOK(t_w)) ? (int)bg_in_iv(aTHX_ t_w, "SDL_GetWindowMaximumSize(w)") : (int)0;
	p_w = t_w ? &c_w : (int *)bg_outref_raw(aTHX_ sv_w, "SDL_GetWindowMaximumSize(w)");
	t_h = bg_outref_target(aTHX_ sv_h);
	c_h = (t_h && SvOK(t_h)) ? (int)bg_in_iv(aTHX_ t_h, "SDL_GetWindowMaximumSize(h)") : (int)0;
	p_h = t_h ? &c_h : (int *)bg_outref_raw(aTHX_ sv_h, "SDL_GetWindowMaximumSize(h)");
	c_bg_ret = SDL_GetWindowMaximumSize(c_window, p_w, p_h);
	if (t_w) sv_setsv(t_w, sv_2mortal(newSViv((IV)(c_w))));
	if (t_h) sv_setsv(t_h, sv_2mortal(newSViv((IV)(c_h))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowBordered(sv_window, sv_bordered)
	SV *sv_window
	SV *sv_bordered
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bordered;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowBordered(window)");
	c_bordered = (_Bool)SvTRUE(sv_bordered);
	c_bg_ret = SDL_SetWindowBordered(c_window, c_bordered);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowResizable(sv_window, sv_resizable)
	SV *sv_window
	SV *sv_resizable
    PREINIT:
	SDL_Window * c_window;
	_Bool c_resizable;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowResizable(window)");
	c_resizable = (_Bool)SvTRUE(sv_resizable);
	c_bg_ret = SDL_SetWindowResizable(c_window, c_resizable);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowAlwaysOnTop(sv_window, sv_on_top)
	SV *sv_window
	SV *sv_on_top
    PREINIT:
	SDL_Window * c_window;
	_Bool c_on_top;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowAlwaysOnTop(window)");
	c_on_top = (_Bool)SvTRUE(sv_on_top);
	c_bg_ret = SDL_SetWindowAlwaysOnTop(c_window, c_on_top);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowFillDocument(sv_window, sv_fill)
	SV *sv_window
	SV *sv_fill
    PREINIT:
	SDL_Window * c_window;
	_Bool c_fill;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowFillDocument(window)");
	c_fill = (_Bool)SvTRUE(sv_fill);
	c_bg_ret = SDL_SetWindowFillDocument(c_window, c_fill);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ShowWindow(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_ShowWindow(window)");
	c_bg_ret = SDL_ShowWindow(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HideWindow(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_HideWindow(window)");
	c_bg_ret = SDL_HideWindow(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RaiseWindow(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_RaiseWindow(window)");
	c_bg_ret = SDL_RaiseWindow(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_MaximizeWindow(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_MaximizeWindow(window)");
	c_bg_ret = SDL_MaximizeWindow(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_MinimizeWindow(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_MinimizeWindow(window)");
	c_bg_ret = SDL_MinimizeWindow(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RestoreWindow(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_RestoreWindow(window)");
	c_bg_ret = SDL_RestoreWindow(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowFullscreen(sv_window, sv_fullscreen)
	SV *sv_window
	SV *sv_fullscreen
    PREINIT:
	SDL_Window * c_window;
	_Bool c_fullscreen;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowFullscreen(window)");
	c_fullscreen = (_Bool)SvTRUE(sv_fullscreen);
	c_bg_ret = SDL_SetWindowFullscreen(c_window, c_fullscreen);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SyncWindow(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SyncWindow(window)");
	c_bg_ret = SDL_SyncWindow(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WindowHasSurface(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_WindowHasSurface(window)");
	c_bg_ret = SDL_WindowHasSurface(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowSurface(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	SDL_Surface * c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowSurface(window)");
	c_bg_ret = SDL_GetWindowSurface(c_window);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Surface"));
	XSRETURN(1);

void
SDL_SetWindowSurfaceVSync(sv_window, sv_vsync)
	SV *sv_window
	SV *sv_vsync
    PREINIT:
	SDL_Window * c_window;
	int c_vsync;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowSurfaceVSync(window)");
	c_vsync = (int)bg_in_iv(aTHX_ sv_vsync, "SDL_SetWindowSurfaceVSync(vsync)");
	c_bg_ret = SDL_SetWindowSurfaceVSync(c_window, c_vsync);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowSurfaceVSync(sv_window, sv_vsync)
	SV *sv_window
	SV *sv_vsync
    PREINIT:
	SDL_Window * c_window;
	int c_vsync; int * p_vsync; SV *t_vsync;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowSurfaceVSync(window)");
	t_vsync = bg_outref_target(aTHX_ sv_vsync);
	c_vsync = (t_vsync && SvOK(t_vsync)) ? (int)bg_in_iv(aTHX_ t_vsync, "SDL_GetWindowSurfaceVSync(vsync)") : (int)0;
	p_vsync = t_vsync ? &c_vsync : (int *)bg_outref_raw(aTHX_ sv_vsync, "SDL_GetWindowSurfaceVSync(vsync)");
	c_bg_ret = SDL_GetWindowSurfaceVSync(c_window, p_vsync);
	if (t_vsync) sv_setsv(t_vsync, sv_2mortal(newSViv((IV)(c_vsync))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_UpdateWindowSurface(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_UpdateWindowSurface(window)");
	c_bg_ret = SDL_UpdateWindowSurface(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_UpdateWindowSurfaceRects(sv_window, sv_rects, sv_numrects)
	SV *sv_window
	SV *sv_rects
	SV *sv_numrects
    PREINIT:
	SDL_Window * c_window;
	const SDL_Rect * c_rects;
	int c_numrects;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_UpdateWindowSurfaceRects(window)");
	c_rects = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rects, "SDL3::Rect", "SDL_UpdateWindowSurfaceRects(rects)");
	c_numrects = (int)bg_in_iv(aTHX_ sv_numrects, "SDL_UpdateWindowSurfaceRects(numrects)");
	c_bg_ret = SDL_UpdateWindowSurfaceRects(c_window, c_rects, c_numrects);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_DestroyWindowSurface(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_DestroyWindowSurface(window)");
	c_bg_ret = SDL_DestroyWindowSurface(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowKeyboardGrab(sv_window, sv_grabbed)
	SV *sv_window
	SV *sv_grabbed
    PREINIT:
	SDL_Window * c_window;
	_Bool c_grabbed;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowKeyboardGrab(window)");
	c_grabbed = (_Bool)SvTRUE(sv_grabbed);
	c_bg_ret = SDL_SetWindowKeyboardGrab(c_window, c_grabbed);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowMouseGrab(sv_window, sv_grabbed)
	SV *sv_window
	SV *sv_grabbed
    PREINIT:
	SDL_Window * c_window;
	_Bool c_grabbed;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowMouseGrab(window)");
	c_grabbed = (_Bool)SvTRUE(sv_grabbed);
	c_bg_ret = SDL_SetWindowMouseGrab(c_window, c_grabbed);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowKeyboardGrab(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowKeyboardGrab(window)");
	c_bg_ret = SDL_GetWindowKeyboardGrab(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowMouseGrab(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowMouseGrab(window)");
	c_bg_ret = SDL_GetWindowMouseGrab(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGrabbedWindow()
    PREINIT:
	SDL_Window * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetGrabbedWindow();
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Window"));
	XSRETURN(1);

void
SDL_SetWindowMouseRect(sv_window, sv_rect)
	SV *sv_window
	SV *sv_rect
    PREINIT:
	SDL_Window * c_window;
	const SDL_Rect * c_rect;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowMouseRect(window)");
	c_rect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_SetWindowMouseRect(rect)");
	c_bg_ret = SDL_SetWindowMouseRect(c_window, c_rect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowMouseRect(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	const SDL_Rect * c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowMouseRect(window)");
	c_bg_ret = SDL_GetWindowMouseRect(c_window);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Rect"));
	XSRETURN(1);

void
SDL_SetWindowOpacity(sv_window, sv_opacity)
	SV *sv_window
	SV *sv_opacity
    PREINIT:
	SDL_Window * c_window;
	float c_opacity;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowOpacity(window)");
	c_opacity = (float)bg_in_nv(aTHX_ sv_opacity, "SDL_SetWindowOpacity(opacity)");
	c_bg_ret = SDL_SetWindowOpacity(c_window, c_opacity);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowOpacity(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	float c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowOpacity(window)");
	c_bg_ret = SDL_GetWindowOpacity(c_window);
	ST(0) = sv_2mortal(newSVnv((NV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowParent(sv_window, sv_parent)
	SV *sv_window
	SV *sv_parent
    PREINIT:
	SDL_Window * c_window;
	SDL_Window * c_parent;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowParent(window)");
	c_parent = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_parent, "SDL3::Window", "SDL_SetWindowParent(parent)");
	c_bg_ret = SDL_SetWindowParent(c_window, c_parent);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowModal(sv_window, sv_modal)
	SV *sv_window
	SV *sv_modal
    PREINIT:
	SDL_Window * c_window;
	_Bool c_modal;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowModal(window)");
	c_modal = (_Bool)SvTRUE(sv_modal);
	c_bg_ret = SDL_SetWindowModal(c_window, c_modal);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowFocusable(sv_window, sv_focusable)
	SV *sv_window
	SV *sv_focusable
    PREINIT:
	SDL_Window * c_window;
	_Bool c_focusable;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowFocusable(window)");
	c_focusable = (_Bool)SvTRUE(sv_focusable);
	c_bg_ret = SDL_SetWindowFocusable(c_window, c_focusable);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ShowWindowSystemMenu(sv_window, sv_x, sv_y)
	SV *sv_window
	SV *sv_x
	SV *sv_y
    PREINIT:
	SDL_Window * c_window;
	int c_x;
	int c_y;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_ShowWindowSystemMenu(window)");
	c_x = (int)bg_in_iv(aTHX_ sv_x, "SDL_ShowWindowSystemMenu(x)");
	c_y = (int)bg_in_iv(aTHX_ sv_y, "SDL_ShowWindowSystemMenu(y)");
	c_bg_ret = SDL_ShowWindowSystemMenu(c_window, c_x, c_y);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowHitTest(sv_window, sv_callback, sv_callback_data)
	SV *sv_window
	SV *sv_callback
	SV *sv_callback_data
    PREINIT:
	SDL_Window * c_window;
	SDL_HitTest c_callback;
	void * c_callback_data;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowHitTest(window)");
	c_callback = SvOK(sv_callback) ? (SDL_HitTest)bg_tramp_SDL_HitTest : NULL;
	c_callback_data = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_callback_data, "SDL_SetWindowHitTest(callback_data)") : NULL;
	c_bg_ret = SDL_SetWindowHitTest(c_window, c_callback, c_callback_data);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowShape(sv_window, sv_shape)
	SV *sv_window
	SV *sv_shape
    PREINIT:
	SDL_Window * c_window;
	SDL_Surface * c_shape;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowShape(window)");
	c_shape = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_shape, "SDL3::Surface", "SDL_SetWindowShape(shape)");
	c_bg_ret = SDL_SetWindowShape(c_window, c_shape);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_FlashWindow(sv_window, sv_operation)
	SV *sv_window
	SV *sv_operation
    PREINIT:
	SDL_Window * c_window;
	SDL_FlashOperation c_operation;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_FlashWindow(window)");
	c_operation = (SDL_FlashOperation)bg_in_iv(aTHX_ sv_operation, "SDL_FlashWindow(operation)");
	c_bg_ret = SDL_FlashWindow(c_window, c_operation);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowProgressState(sv_window, sv_state)
	SV *sv_window
	SV *sv_state
    PREINIT:
	SDL_Window * c_window;
	SDL_ProgressState c_state;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowProgressState(window)");
	c_state = (SDL_ProgressState)bg_in_iv(aTHX_ sv_state, "SDL_SetWindowProgressState(state)");
	c_bg_ret = SDL_SetWindowProgressState(c_window, c_state);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowProgressState(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	SDL_ProgressState c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowProgressState(window)");
	c_bg_ret = SDL_GetWindowProgressState(c_window);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowProgressValue(sv_window, sv_value)
	SV *sv_window
	SV *sv_value
    PREINIT:
	SDL_Window * c_window;
	float c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowProgressValue(window)");
	c_value = (float)bg_in_nv(aTHX_ sv_value, "SDL_SetWindowProgressValue(value)");
	c_bg_ret = SDL_SetWindowProgressValue(c_window, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowProgressValue(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	float c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowProgressValue(window)");
	c_bg_ret = SDL_GetWindowProgressValue(c_window);
	ST(0) = sv_2mortal(newSVnv((NV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_DestroyWindow(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_DestroyWindow(window)");
	SDL_DestroyWindow(c_window);
	XSRETURN(0);

void
SDL_ScreenSaverEnabled()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_ScreenSaverEnabled();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_EnableScreenSaver()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_EnableScreenSaver();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_DisableScreenSaver()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_DisableScreenSaver();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GL_LoadLibrary(sv_path)
	SV *sv_path
    PREINIT:
	const char * c_path;
	_Bool c_bg_ret;
    PPCODE:
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_GL_LoadLibrary(path)");
	c_bg_ret = SDL_GL_LoadLibrary(c_path);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GL_GetProcAddress(sv_proc)
	SV *sv_proc
    PREINIT:
	const char * c_proc;
	SDL_FunctionPointer c_bg_ret;
    PPCODE:
	c_proc = (const char *)bg_in_string(aTHX_ sv_proc, "SDL_GL_GetProcAddress(proc)");
	c_bg_ret = SDL_GL_GetProcAddress(c_proc);
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_EGL_GetProcAddress(sv_proc)
	SV *sv_proc
    PREINIT:
	const char * c_proc;
	SDL_FunctionPointer c_bg_ret;
    PPCODE:
	c_proc = (const char *)bg_in_string(aTHX_ sv_proc, "SDL_EGL_GetProcAddress(proc)");
	c_bg_ret = SDL_EGL_GetProcAddress(c_proc);
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GL_UnloadLibrary()
    PPCODE:
	SDL_GL_UnloadLibrary();
	XSRETURN(0);

void
SDL_GL_ExtensionSupported(sv_extension)
	SV *sv_extension
    PREINIT:
	const char * c_extension;
	_Bool c_bg_ret;
    PPCODE:
	c_extension = (const char *)bg_in_string(aTHX_ sv_extension, "SDL_GL_ExtensionSupported(extension)");
	c_bg_ret = SDL_GL_ExtensionSupported(c_extension);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GL_ResetAttributes()
    PPCODE:
	SDL_GL_ResetAttributes();
	XSRETURN(0);

void
SDL_GL_SetAttribute(sv_attr, sv_value)
	SV *sv_attr
	SV *sv_value
    PREINIT:
	SDL_GLAttr c_attr;
	int c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_attr = (SDL_GLAttr)bg_in_iv(aTHX_ sv_attr, "SDL_GL_SetAttribute(attr)");
	c_value = (int)bg_in_iv(aTHX_ sv_value, "SDL_GL_SetAttribute(value)");
	c_bg_ret = SDL_GL_SetAttribute(c_attr, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GL_GetAttribute(sv_attr, sv_value)
	SV *sv_attr
	SV *sv_value
    PREINIT:
	SDL_GLAttr c_attr;
	int c_value; int * p_value; SV *t_value;
	_Bool c_bg_ret;
    PPCODE:
	c_attr = (SDL_GLAttr)bg_in_iv(aTHX_ sv_attr, "SDL_GL_GetAttribute(attr)");
	t_value = bg_outref_target(aTHX_ sv_value);
	c_value = (t_value && SvOK(t_value)) ? (int)bg_in_iv(aTHX_ t_value, "SDL_GL_GetAttribute(value)") : (int)0;
	p_value = t_value ? &c_value : (int *)bg_outref_raw(aTHX_ sv_value, "SDL_GL_GetAttribute(value)");
	c_bg_ret = SDL_GL_GetAttribute(c_attr, p_value);
	if (t_value) sv_setsv(t_value, sv_2mortal(newSViv((IV)(c_value))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GL_CreateContext(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	SDL_GLContext c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GL_CreateContext(window)");
	c_bg_ret = SDL_GL_CreateContext(c_window);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GLContextState"));
	XSRETURN(1);

void
SDL_GL_MakeCurrent(sv_window, sv_context)
	SV *sv_window
	SV *sv_context
    PREINIT:
	SDL_Window * c_window;
	SDL_GLContext c_context;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GL_MakeCurrent(window)");
	c_context = (SDL_GLContext)bg_in_record_ptr(aTHX_ sv_context, "SDL3::GLContextState", "SDL_GL_MakeCurrent(context)");
	c_bg_ret = SDL_GL_MakeCurrent(c_window, c_context);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GL_GetCurrentWindow()
    PREINIT:
	SDL_Window * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GL_GetCurrentWindow();
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Window"));
	XSRETURN(1);

void
SDL_GL_GetCurrentContext()
    PREINIT:
	SDL_GLContext c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GL_GetCurrentContext();
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GLContextState"));
	XSRETURN(1);

void
SDL_EGL_GetCurrentDisplay()
    PREINIT:
	SDL_EGLDisplay c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_EGL_GetCurrentDisplay();
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_EGL_GetCurrentConfig()
    PREINIT:
	SDL_EGLConfig c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_EGL_GetCurrentConfig();
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_EGL_GetWindowSurface(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	SDL_EGLSurface c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_EGL_GetWindowSurface(window)");
	c_bg_ret = SDL_EGL_GetWindowSurface(c_window);
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GL_SetSwapInterval(sv_interval)
	SV *sv_interval
    PREINIT:
	int c_interval;
	_Bool c_bg_ret;
    PPCODE:
	c_interval = (int)bg_in_iv(aTHX_ sv_interval, "SDL_GL_SetSwapInterval(interval)");
	c_bg_ret = SDL_GL_SetSwapInterval(c_interval);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GL_GetSwapInterval(sv_interval)
	SV *sv_interval
    PREINIT:
	int c_interval; int * p_interval; SV *t_interval;
	_Bool c_bg_ret;
    PPCODE:
	t_interval = bg_outref_target(aTHX_ sv_interval);
	c_interval = (t_interval && SvOK(t_interval)) ? (int)bg_in_iv(aTHX_ t_interval, "SDL_GL_GetSwapInterval(interval)") : (int)0;
	p_interval = t_interval ? &c_interval : (int *)bg_outref_raw(aTHX_ sv_interval, "SDL_GL_GetSwapInterval(interval)");
	c_bg_ret = SDL_GL_GetSwapInterval(p_interval);
	if (t_interval) sv_setsv(t_interval, sv_2mortal(newSViv((IV)(c_interval))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GL_SwapWindow(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GL_SwapWindow(window)");
	c_bg_ret = SDL_GL_SwapWindow(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GL_DestroyContext(sv_context)
	SV *sv_context
    PREINIT:
	SDL_GLContext c_context;
	_Bool c_bg_ret;
    PPCODE:
	c_context = (SDL_GLContext)bg_in_record_ptr(aTHX_ sv_context, "SDL3::GLContextState", "SDL_GL_DestroyContext(context)");
	c_bg_ret = SDL_GL_DestroyContext(c_context);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Video", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_DEBUG_FLAG", BG_CONST_SV(SDL_GL_CONTEXT_DEBUG_FLAG));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG", BG_CONST_SV(SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_PROFILE_COMPATIBILITY", BG_CONST_SV(SDL_GL_CONTEXT_PROFILE_COMPATIBILITY));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_PROFILE_CORE", BG_CONST_SV(SDL_GL_CONTEXT_PROFILE_CORE));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_PROFILE_ES", BG_CONST_SV(SDL_GL_CONTEXT_PROFILE_ES));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH", BG_CONST_SV(SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE", BG_CONST_SV(SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_RESET_ISOLATION_FLAG", BG_CONST_SV(SDL_GL_CONTEXT_RESET_ISOLATION_FLAG));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_RESET_LOSE_CONTEXT", BG_CONST_SV(SDL_GL_CONTEXT_RESET_LOSE_CONTEXT));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_RESET_NO_NOTIFICATION", BG_CONST_SV(SDL_GL_CONTEXT_RESET_NO_NOTIFICATION));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG", BG_CONST_SV(SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG));
	bg_export_constant(aTHX_ stash, "SDL_PROP_DISPLAY_HDR_ENABLED_BOOLEAN", BG_CONST_SV(SDL_PROP_DISPLAY_HDR_ENABLED_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER", BG_CONST_SV(SDL_PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_DISPLAY_WAYLAND_WL_OUTPUT_POINTER", BG_CONST_SV(SDL_PROP_DISPLAY_WAYLAND_WL_OUTPUT_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_DISPLAY_WINDOWS_HMONITOR_POINTER", BG_CONST_SV(SDL_PROP_DISPLAY_WINDOWS_HMONITOR_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GLOBAL_VIDEO_WAYLAND_WL_DISPLAY_POINTER", BG_CONST_SV(SDL_PROP_GLOBAL_VIDEO_WAYLAND_WL_DISPLAY_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_ANDROID_SURFACE_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_ANDROID_SURFACE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_ANDROID_WINDOW_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_ANDROID_WINDOW_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_COCOA_WINDOW_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_COCOA_WINDOW_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_COCOA_VIEW_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_COCOA_VIEW_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_CONSTRAIN_POPUP_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_CONSTRAIN_POPUP_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_EMSCRIPTEN_CANVAS_ID_STRING", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_EMSCRIPTEN_CANVAS_ID_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_FLAGS_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_FLAGS_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_MENU_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_MENU_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_METAL_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_METAL_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_MODAL_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_MODAL_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_PARENT_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_PARENT_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_TITLE_STRING", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_TITLE_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_UTILITY_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_UTILITY_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_VULKAN_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_VULKAN_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_WIDTH_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_WIDTH_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_WIN32_HWND_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_WIN32_HWND_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_WINDOWSCENE_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_WINDOWSCENE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_X11_WINDOW_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_X11_WINDOW_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_X_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_X_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_CREATE_Y_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_CREATE_Y_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_EMSCRIPTEN_CANVAS_ID_STRING", BG_CONST_SV(SDL_PROP_WINDOW_EMSCRIPTEN_CANVAS_ID_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING", BG_CONST_SV(SDL_PROP_WINDOW_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_HDR_ENABLED_BOOLEAN", BG_CONST_SV(SDL_PROP_WINDOW_HDR_ENABLED_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_HDR_HEADROOM_FLOAT", BG_CONST_SV(SDL_PROP_WINDOW_HDR_HEADROOM_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_KMSDRM_DRM_FD_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_KMSDRM_DRM_FD_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_OPENVR_OVERLAY_ID_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_OPENVR_OVERLAY_ID_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT", BG_CONST_SV(SDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_SHAPE_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_SHAPE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_UIKIT_WINDOW_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_UIKIT_WINDOW_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_VIVANTE_DISPLAY_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_VIVANTE_DISPLAY_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_VIVANTE_SURFACE_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_VIVANTE_SURFACE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_VIVANTE_WINDOW_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_VIVANTE_WINDOW_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_WAYLAND_DISPLAY_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_WAYLAND_DISPLAY_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_WAYLAND_VIEWPORT_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_WAYLAND_VIEWPORT_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING", BG_CONST_SV(SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_WIN32_HDC_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_WIN32_HDC_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_WIN32_HWND_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_WIN32_HWND_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_WIN32_INSTANCE_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_WIN32_INSTANCE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_X11_DISPLAY_POINTER", BG_CONST_SV(SDL_PROP_WINDOW_X11_DISPLAY_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_X11_SCREEN_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_X11_SCREEN_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_WINDOW_X11_WINDOW_NUMBER", BG_CONST_SV(SDL_PROP_WINDOW_X11_WINDOW_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_WINDOWPOS_CENTERED", BG_CONST_SV(SDL_WINDOWPOS_CENTERED));
	bg_export_constant(aTHX_ stash, "SDL_WINDOWPOS_CENTERED_MASK", BG_CONST_SV(SDL_WINDOWPOS_CENTERED_MASK));
	bg_export_constant(aTHX_ stash, "SDL_WINDOWPOS_UNDEFINED", BG_CONST_SV(SDL_WINDOWPOS_UNDEFINED));
	bg_export_constant(aTHX_ stash, "SDL_WINDOWPOS_UNDEFINED_MASK", BG_CONST_SV(SDL_WINDOWPOS_UNDEFINED_MASK));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_ALWAYS_ON_TOP", BG_CONST_SV(SDL_WINDOW_ALWAYS_ON_TOP));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_BORDERLESS", BG_CONST_SV(SDL_WINDOW_BORDERLESS));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_EXTERNAL", BG_CONST_SV(SDL_WINDOW_EXTERNAL));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_FILL_DOCUMENT", BG_CONST_SV(SDL_WINDOW_FILL_DOCUMENT));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_FULLSCREEN", BG_CONST_SV(SDL_WINDOW_FULLSCREEN));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_HIDDEN", BG_CONST_SV(SDL_WINDOW_HIDDEN));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_HIGH_PIXEL_DENSITY", BG_CONST_SV(SDL_WINDOW_HIGH_PIXEL_DENSITY));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_INPUT_FOCUS", BG_CONST_SV(SDL_WINDOW_INPUT_FOCUS));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_KEYBOARD_GRABBED", BG_CONST_SV(SDL_WINDOW_KEYBOARD_GRABBED));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_MAXIMIZED", BG_CONST_SV(SDL_WINDOW_MAXIMIZED));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_METAL", BG_CONST_SV(SDL_WINDOW_METAL));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_MINIMIZED", BG_CONST_SV(SDL_WINDOW_MINIMIZED));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_MODAL", BG_CONST_SV(SDL_WINDOW_MODAL));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_MOUSE_CAPTURE", BG_CONST_SV(SDL_WINDOW_MOUSE_CAPTURE));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_MOUSE_FOCUS", BG_CONST_SV(SDL_WINDOW_MOUSE_FOCUS));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_MOUSE_GRABBED", BG_CONST_SV(SDL_WINDOW_MOUSE_GRABBED));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_MOUSE_RELATIVE_MODE", BG_CONST_SV(SDL_WINDOW_MOUSE_RELATIVE_MODE));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_NOT_FOCUSABLE", BG_CONST_SV(SDL_WINDOW_NOT_FOCUSABLE));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_OCCLUDED", BG_CONST_SV(SDL_WINDOW_OCCLUDED));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_OPENGL", BG_CONST_SV(SDL_WINDOW_OPENGL));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_POPUP_MENU", BG_CONST_SV(SDL_WINDOW_POPUP_MENU));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_RESIZABLE", BG_CONST_SV(SDL_WINDOW_RESIZABLE));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_SURFACE_VSYNC_ADAPTIVE", BG_CONST_SV(SDL_WINDOW_SURFACE_VSYNC_ADAPTIVE));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_SURFACE_VSYNC_DISABLED", BG_CONST_SV(SDL_WINDOW_SURFACE_VSYNC_DISABLED));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_TOOLTIP", BG_CONST_SV(SDL_WINDOW_TOOLTIP));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_TRANSPARENT", BG_CONST_SV(SDL_WINDOW_TRANSPARENT));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_UTILITY", BG_CONST_SV(SDL_WINDOW_UTILITY));
	bg_export_constant(aTHX_ stash, "SDL_WINDOW_VULKAN", BG_CONST_SV(SDL_WINDOW_VULKAN));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_THEME_UNKNOWN", BG_CONST_SV(SDL_SYSTEM_THEME_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_THEME_LIGHT", BG_CONST_SV(SDL_SYSTEM_THEME_LIGHT));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_THEME_DARK", BG_CONST_SV(SDL_SYSTEM_THEME_DARK));
	bg_export_constant(aTHX_ stash, "SDL_ORIENTATION_UNKNOWN", BG_CONST_SV(SDL_ORIENTATION_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_ORIENTATION_LANDSCAPE", BG_CONST_SV(SDL_ORIENTATION_LANDSCAPE));
	bg_export_constant(aTHX_ stash, "SDL_ORIENTATION_LANDSCAPE_FLIPPED", BG_CONST_SV(SDL_ORIENTATION_LANDSCAPE_FLIPPED));
	bg_export_constant(aTHX_ stash, "SDL_ORIENTATION_PORTRAIT", BG_CONST_SV(SDL_ORIENTATION_PORTRAIT));
	bg_export_constant(aTHX_ stash, "SDL_ORIENTATION_PORTRAIT_FLIPPED", BG_CONST_SV(SDL_ORIENTATION_PORTRAIT_FLIPPED));
	bg_export_constant(aTHX_ stash, "SDL_FLASH_CANCEL", BG_CONST_SV(SDL_FLASH_CANCEL));
	bg_export_constant(aTHX_ stash, "SDL_FLASH_BRIEFLY", BG_CONST_SV(SDL_FLASH_BRIEFLY));
	bg_export_constant(aTHX_ stash, "SDL_FLASH_UNTIL_FOCUSED", BG_CONST_SV(SDL_FLASH_UNTIL_FOCUSED));
	bg_export_constant(aTHX_ stash, "SDL_PROGRESS_STATE_INVALID", BG_CONST_SV(SDL_PROGRESS_STATE_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_PROGRESS_STATE_NONE", BG_CONST_SV(SDL_PROGRESS_STATE_NONE));
	bg_export_constant(aTHX_ stash, "SDL_PROGRESS_STATE_INDETERMINATE", BG_CONST_SV(SDL_PROGRESS_STATE_INDETERMINATE));
	bg_export_constant(aTHX_ stash, "SDL_PROGRESS_STATE_NORMAL", BG_CONST_SV(SDL_PROGRESS_STATE_NORMAL));
	bg_export_constant(aTHX_ stash, "SDL_PROGRESS_STATE_PAUSED", BG_CONST_SV(SDL_PROGRESS_STATE_PAUSED));
	bg_export_constant(aTHX_ stash, "SDL_PROGRESS_STATE_ERROR", BG_CONST_SV(SDL_PROGRESS_STATE_ERROR));
	bg_export_constant(aTHX_ stash, "SDL_GL_RED_SIZE", BG_CONST_SV(SDL_GL_RED_SIZE));
	bg_export_constant(aTHX_ stash, "SDL_GL_GREEN_SIZE", BG_CONST_SV(SDL_GL_GREEN_SIZE));
	bg_export_constant(aTHX_ stash, "SDL_GL_BLUE_SIZE", BG_CONST_SV(SDL_GL_BLUE_SIZE));
	bg_export_constant(aTHX_ stash, "SDL_GL_ALPHA_SIZE", BG_CONST_SV(SDL_GL_ALPHA_SIZE));
	bg_export_constant(aTHX_ stash, "SDL_GL_BUFFER_SIZE", BG_CONST_SV(SDL_GL_BUFFER_SIZE));
	bg_export_constant(aTHX_ stash, "SDL_GL_DOUBLEBUFFER", BG_CONST_SV(SDL_GL_DOUBLEBUFFER));
	bg_export_constant(aTHX_ stash, "SDL_GL_DEPTH_SIZE", BG_CONST_SV(SDL_GL_DEPTH_SIZE));
	bg_export_constant(aTHX_ stash, "SDL_GL_STENCIL_SIZE", BG_CONST_SV(SDL_GL_STENCIL_SIZE));
	bg_export_constant(aTHX_ stash, "SDL_GL_ACCUM_RED_SIZE", BG_CONST_SV(SDL_GL_ACCUM_RED_SIZE));
	bg_export_constant(aTHX_ stash, "SDL_GL_ACCUM_GREEN_SIZE", BG_CONST_SV(SDL_GL_ACCUM_GREEN_SIZE));
	bg_export_constant(aTHX_ stash, "SDL_GL_ACCUM_BLUE_SIZE", BG_CONST_SV(SDL_GL_ACCUM_BLUE_SIZE));
	bg_export_constant(aTHX_ stash, "SDL_GL_ACCUM_ALPHA_SIZE", BG_CONST_SV(SDL_GL_ACCUM_ALPHA_SIZE));
	bg_export_constant(aTHX_ stash, "SDL_GL_STEREO", BG_CONST_SV(SDL_GL_STEREO));
	bg_export_constant(aTHX_ stash, "SDL_GL_MULTISAMPLEBUFFERS", BG_CONST_SV(SDL_GL_MULTISAMPLEBUFFERS));
	bg_export_constant(aTHX_ stash, "SDL_GL_MULTISAMPLESAMPLES", BG_CONST_SV(SDL_GL_MULTISAMPLESAMPLES));
	bg_export_constant(aTHX_ stash, "SDL_GL_ACCELERATED_VISUAL", BG_CONST_SV(SDL_GL_ACCELERATED_VISUAL));
	bg_export_constant(aTHX_ stash, "SDL_GL_RETAINED_BACKING", BG_CONST_SV(SDL_GL_RETAINED_BACKING));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_MAJOR_VERSION", BG_CONST_SV(SDL_GL_CONTEXT_MAJOR_VERSION));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_MINOR_VERSION", BG_CONST_SV(SDL_GL_CONTEXT_MINOR_VERSION));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_FLAGS", BG_CONST_SV(SDL_GL_CONTEXT_FLAGS));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_PROFILE_MASK", BG_CONST_SV(SDL_GL_CONTEXT_PROFILE_MASK));
	bg_export_constant(aTHX_ stash, "SDL_GL_SHARE_WITH_CURRENT_CONTEXT", BG_CONST_SV(SDL_GL_SHARE_WITH_CURRENT_CONTEXT));
	bg_export_constant(aTHX_ stash, "SDL_GL_FRAMEBUFFER_SRGB_CAPABLE", BG_CONST_SV(SDL_GL_FRAMEBUFFER_SRGB_CAPABLE));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_RELEASE_BEHAVIOR", BG_CONST_SV(SDL_GL_CONTEXT_RELEASE_BEHAVIOR));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_RESET_NOTIFICATION", BG_CONST_SV(SDL_GL_CONTEXT_RESET_NOTIFICATION));
	bg_export_constant(aTHX_ stash, "SDL_GL_CONTEXT_NO_ERROR", BG_CONST_SV(SDL_GL_CONTEXT_NO_ERROR));
	bg_export_constant(aTHX_ stash, "SDL_GL_FLOATBUFFERS", BG_CONST_SV(SDL_GL_FLOATBUFFERS));
	bg_export_constant(aTHX_ stash, "SDL_GL_EGL_PLATFORM", BG_CONST_SV(SDL_GL_EGL_PLATFORM));
	bg_export_constant(aTHX_ stash, "SDL_HITTEST_NORMAL", BG_CONST_SV(SDL_HITTEST_NORMAL));
	bg_export_constant(aTHX_ stash, "SDL_HITTEST_DRAGGABLE", BG_CONST_SV(SDL_HITTEST_DRAGGABLE));
	bg_export_constant(aTHX_ stash, "SDL_HITTEST_RESIZE_TOPLEFT", BG_CONST_SV(SDL_HITTEST_RESIZE_TOPLEFT));
	bg_export_constant(aTHX_ stash, "SDL_HITTEST_RESIZE_TOP", BG_CONST_SV(SDL_HITTEST_RESIZE_TOP));
	bg_export_constant(aTHX_ stash, "SDL_HITTEST_RESIZE_TOPRIGHT", BG_CONST_SV(SDL_HITTEST_RESIZE_TOPRIGHT));
	bg_export_constant(aTHX_ stash, "SDL_HITTEST_RESIZE_RIGHT", BG_CONST_SV(SDL_HITTEST_RESIZE_RIGHT));
	bg_export_constant(aTHX_ stash, "SDL_HITTEST_RESIZE_BOTTOMRIGHT", BG_CONST_SV(SDL_HITTEST_RESIZE_BOTTOMRIGHT));
	bg_export_constant(aTHX_ stash, "SDL_HITTEST_RESIZE_BOTTOM", BG_CONST_SV(SDL_HITTEST_RESIZE_BOTTOM));
	bg_export_constant(aTHX_ stash, "SDL_HITTEST_RESIZE_BOTTOMLEFT", BG_CONST_SV(SDL_HITTEST_RESIZE_BOTTOMLEFT));
	bg_export_constant(aTHX_ stash, "SDL_HITTEST_RESIZE_LEFT", BG_CONST_SV(SDL_HITTEST_RESIZE_LEFT));
	}


MODULE = SDL3  PACKAGE = SDL3::DisplayMode

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_DisplayMode), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_DisplayMode)));
	XSRETURN(1);

void
displayID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DisplayMode *self;
    PPCODE:
	self = (struct SDL_DisplayMode *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DisplayMode", "SDL3::DisplayMode::displayID");
	if (items > 1) {
		self->displayID = (SDL_DisplayID)bg_in_uv(aTHX_ ST(1), "SDL3::DisplayMode::displayID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->displayID)));
	XSRETURN(1);

void
format(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DisplayMode *self;
    PPCODE:
	self = (struct SDL_DisplayMode *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DisplayMode", "SDL3::DisplayMode::format");
	if (items > 1) {
		self->format = (SDL_PixelFormat)bg_in_iv(aTHX_ ST(1), "SDL3::DisplayMode::format");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->format)));
	XSRETURN(1);

void
w(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DisplayMode *self;
    PPCODE:
	self = (struct SDL_DisplayMode *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DisplayMode", "SDL3::DisplayMode::w");
	if (items > 1) {
		self->w = (int)bg_in_iv(aTHX_ ST(1), "SDL3::DisplayMode::w");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->w)));
	XSRETURN(1);

void
h(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DisplayMode *self;
    PPCODE:
	self = (struct SDL_DisplayMode *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DisplayMode", "SDL3::DisplayMode::h");
	if (items > 1) {
		self->h = (int)bg_in_iv(aTHX_ ST(1), "SDL3::DisplayMode::h");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->h)));
	XSRETURN(1);

void
pixel_density(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DisplayMode *self;
    PPCODE:
	self = (struct SDL_DisplayMode *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DisplayMode", "SDL3::DisplayMode::pixel_density");
	if (items > 1) {
		self->pixel_density = (float)bg_in_nv(aTHX_ ST(1), "SDL3::DisplayMode::pixel_density");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->pixel_density)));
	XSRETURN(1);

void
refresh_rate(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DisplayMode *self;
    PPCODE:
	self = (struct SDL_DisplayMode *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DisplayMode", "SDL3::DisplayMode::refresh_rate");
	if (items > 1) {
		self->refresh_rate = (float)bg_in_nv(aTHX_ ST(1), "SDL3::DisplayMode::refresh_rate");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->refresh_rate)));
	XSRETURN(1);

void
refresh_rate_numerator(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DisplayMode *self;
    PPCODE:
	self = (struct SDL_DisplayMode *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DisplayMode", "SDL3::DisplayMode::refresh_rate_numerator");
	if (items > 1) {
		self->refresh_rate_numerator = (int)bg_in_iv(aTHX_ ST(1), "SDL3::DisplayMode::refresh_rate_numerator");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->refresh_rate_numerator)));
	XSRETURN(1);

void
refresh_rate_denominator(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DisplayMode *self;
    PPCODE:
	self = (struct SDL_DisplayMode *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DisplayMode", "SDL3::DisplayMode::refresh_rate_denominator");
	if (items > 1) {
		self->refresh_rate_denominator = (int)bg_in_iv(aTHX_ ST(1), "SDL3::DisplayMode::refresh_rate_denominator");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->refresh_rate_denominator)));
	XSRETURN(1);

void
internal(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DisplayMode *self;
    PPCODE:
	self = (struct SDL_DisplayMode *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DisplayMode", "SDL3::DisplayMode::internal");
	if (items > 1) {
		self->internal = (SDL_DisplayModeData *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::DisplayModeData", "SDL3::DisplayMode::internal");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->internal), "SDL3::DisplayModeData"));
	XSRETURN(1);


