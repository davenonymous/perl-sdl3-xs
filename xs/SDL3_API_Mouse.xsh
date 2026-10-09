MODULE = SDL3  PACKAGE = SDL3::API::Mouse

void
SDL_HasMouse()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasMouse();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetMice(sv_count)
	SV *sv_count
    PREINIT:
	int c_count; int * p_count; SV *t_count;
	SDL_MouseID * c_bg_ret;
    PPCODE:
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetMice(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetMice(count)");
	c_bg_ret = SDL_GetMice(p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetMouseNameForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_MouseID c_instance_id;
	const char * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_MouseID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetMouseNameForID(instance_id)");
	c_bg_ret = SDL_GetMouseNameForID(c_instance_id);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetMouseFocus()
    PREINIT:
	SDL_Window * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetMouseFocus();
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Window"));
	XSRETURN(1);

void
SDL_GetMouseState(sv_x, sv_y)
	SV *sv_x
	SV *sv_y
    PREINIT:
	float c_x; float * p_x; SV *t_x;
	float c_y; float * p_y; SV *t_y;
	SDL_MouseButtonFlags c_bg_ret;
    PPCODE:
	t_x = bg_outref_target(aTHX_ sv_x);
	c_x = (t_x && SvOK(t_x)) ? (float)bg_in_nv(aTHX_ t_x, "SDL_GetMouseState(x)") : (float)0;
	p_x = t_x ? &c_x : (float *)bg_outref_raw(aTHX_ sv_x, "SDL_GetMouseState(x)");
	t_y = bg_outref_target(aTHX_ sv_y);
	c_y = (t_y && SvOK(t_y)) ? (float)bg_in_nv(aTHX_ t_y, "SDL_GetMouseState(y)") : (float)0;
	p_y = t_y ? &c_y : (float *)bg_outref_raw(aTHX_ sv_y, "SDL_GetMouseState(y)");
	c_bg_ret = SDL_GetMouseState(p_x, p_y);
	if (t_x) sv_setsv(t_x, sv_2mortal(newSVnv((NV)(c_x))));
	if (t_y) sv_setsv(t_y, sv_2mortal(newSVnv((NV)(c_y))));
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGlobalMouseState(sv_x, sv_y)
	SV *sv_x
	SV *sv_y
    PREINIT:
	float c_x; float * p_x; SV *t_x;
	float c_y; float * p_y; SV *t_y;
	SDL_MouseButtonFlags c_bg_ret;
    PPCODE:
	t_x = bg_outref_target(aTHX_ sv_x);
	c_x = (t_x && SvOK(t_x)) ? (float)bg_in_nv(aTHX_ t_x, "SDL_GetGlobalMouseState(x)") : (float)0;
	p_x = t_x ? &c_x : (float *)bg_outref_raw(aTHX_ sv_x, "SDL_GetGlobalMouseState(x)");
	t_y = bg_outref_target(aTHX_ sv_y);
	c_y = (t_y && SvOK(t_y)) ? (float)bg_in_nv(aTHX_ t_y, "SDL_GetGlobalMouseState(y)") : (float)0;
	p_y = t_y ? &c_y : (float *)bg_outref_raw(aTHX_ sv_y, "SDL_GetGlobalMouseState(y)");
	c_bg_ret = SDL_GetGlobalMouseState(p_x, p_y);
	if (t_x) sv_setsv(t_x, sv_2mortal(newSVnv((NV)(c_x))));
	if (t_y) sv_setsv(t_y, sv_2mortal(newSVnv((NV)(c_y))));
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRelativeMouseState(sv_x, sv_y)
	SV *sv_x
	SV *sv_y
    PREINIT:
	float c_x; float * p_x; SV *t_x;
	float c_y; float * p_y; SV *t_y;
	SDL_MouseButtonFlags c_bg_ret;
    PPCODE:
	t_x = bg_outref_target(aTHX_ sv_x);
	c_x = (t_x && SvOK(t_x)) ? (float)bg_in_nv(aTHX_ t_x, "SDL_GetRelativeMouseState(x)") : (float)0;
	p_x = t_x ? &c_x : (float *)bg_outref_raw(aTHX_ sv_x, "SDL_GetRelativeMouseState(x)");
	t_y = bg_outref_target(aTHX_ sv_y);
	c_y = (t_y && SvOK(t_y)) ? (float)bg_in_nv(aTHX_ t_y, "SDL_GetRelativeMouseState(y)") : (float)0;
	p_y = t_y ? &c_y : (float *)bg_outref_raw(aTHX_ sv_y, "SDL_GetRelativeMouseState(y)");
	c_bg_ret = SDL_GetRelativeMouseState(p_x, p_y);
	if (t_x) sv_setsv(t_x, sv_2mortal(newSVnv((NV)(c_x))));
	if (t_y) sv_setsv(t_y, sv_2mortal(newSVnv((NV)(c_y))));
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_WarpMouseInWindow(sv_window, sv_x, sv_y)
	SV *sv_window
	SV *sv_x
	SV *sv_y
    PREINIT:
	SDL_Window * c_window;
	float c_x;
	float c_y;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_WarpMouseInWindow(window)");
	c_x = (float)bg_in_nv(aTHX_ sv_x, "SDL_WarpMouseInWindow(x)");
	c_y = (float)bg_in_nv(aTHX_ sv_y, "SDL_WarpMouseInWindow(y)");
	SDL_WarpMouseInWindow(c_window, c_x, c_y);
	XSRETURN(0);

void
SDL_WarpMouseGlobal(sv_x, sv_y)
	SV *sv_x
	SV *sv_y
    PREINIT:
	float c_x;
	float c_y;
	_Bool c_bg_ret;
    PPCODE:
	c_x = (float)bg_in_nv(aTHX_ sv_x, "SDL_WarpMouseGlobal(x)");
	c_y = (float)bg_in_nv(aTHX_ sv_y, "SDL_WarpMouseGlobal(y)");
	c_bg_ret = SDL_WarpMouseGlobal(c_x, c_y);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetRelativeMouseTransform(sv_callback, sv_userdata)
	SV *sv_callback
	SV *sv_userdata
    PREINIT:
	SDL_MouseMotionTransformCallback c_callback;
	void * c_userdata;
	_Bool c_bg_ret;
    PPCODE:
	c_callback = SvOK(sv_callback) ? (SDL_MouseMotionTransformCallback)bg_tramp_SDL_MouseMotionTransformCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_SetRelativeMouseTransform(userdata)") : NULL;
	c_bg_ret = SDL_SetRelativeMouseTransform(c_callback, c_userdata);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetWindowRelativeMouseMode(sv_window, sv_enabled)
	SV *sv_window
	SV *sv_enabled
    PREINIT:
	SDL_Window * c_window;
	_Bool c_enabled;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetWindowRelativeMouseMode(window)");
	c_enabled = (_Bool)SvTRUE(sv_enabled);
	c_bg_ret = SDL_SetWindowRelativeMouseMode(c_window, c_enabled);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetWindowRelativeMouseMode(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetWindowRelativeMouseMode(window)");
	c_bg_ret = SDL_GetWindowRelativeMouseMode(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CaptureMouse(sv_enabled)
	SV *sv_enabled
    PREINIT:
	_Bool c_enabled;
	_Bool c_bg_ret;
    PPCODE:
	c_enabled = (_Bool)SvTRUE(sv_enabled);
	c_bg_ret = SDL_CaptureMouse(c_enabled);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CreateCursor(sv_data, sv_mask, sv_w, sv_h, sv_hot_x, sv_hot_y)
	SV *sv_data
	SV *sv_mask
	SV *sv_w
	SV *sv_h
	SV *sv_hot_x
	SV *sv_hot_y
    PREINIT:
	Uint8 c_data; const Uint8 * p_data; SV *t_data;
	Uint8 c_mask; const Uint8 * p_mask; SV *t_mask;
	int c_w;
	int c_h;
	int c_hot_x;
	int c_hot_y;
	SDL_Cursor * c_bg_ret;
    PPCODE:
	t_data = bg_outref_target(aTHX_ sv_data);
	c_data = (t_data && SvOK(t_data)) ? (Uint8)bg_in_uv(aTHX_ t_data, "SDL_CreateCursor(data)") : (Uint8)0;
	p_data = t_data ? &c_data : (const Uint8 *)bg_outref_raw(aTHX_ sv_data, "SDL_CreateCursor(data)");
	t_mask = bg_outref_target(aTHX_ sv_mask);
	c_mask = (t_mask && SvOK(t_mask)) ? (Uint8)bg_in_uv(aTHX_ t_mask, "SDL_CreateCursor(mask)") : (Uint8)0;
	p_mask = t_mask ? &c_mask : (const Uint8 *)bg_outref_raw(aTHX_ sv_mask, "SDL_CreateCursor(mask)");
	c_w = (int)bg_in_iv(aTHX_ sv_w, "SDL_CreateCursor(w)");
	c_h = (int)bg_in_iv(aTHX_ sv_h, "SDL_CreateCursor(h)");
	c_hot_x = (int)bg_in_iv(aTHX_ sv_hot_x, "SDL_CreateCursor(hot_x)");
	c_hot_y = (int)bg_in_iv(aTHX_ sv_hot_y, "SDL_CreateCursor(hot_y)");
	c_bg_ret = SDL_CreateCursor(p_data, p_mask, c_w, c_h, c_hot_x, c_hot_y);
	if (t_data) sv_setsv(t_data, sv_2mortal(newSVuv((UV)(c_data))));
	if (t_mask) sv_setsv(t_mask, sv_2mortal(newSVuv((UV)(c_mask))));
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Cursor"));
	XSRETURN(1);

void
SDL_CreateColorCursor(sv_surface, sv_hot_x, sv_hot_y)
	SV *sv_surface
	SV *sv_hot_x
	SV *sv_hot_y
    PREINIT:
	SDL_Surface * c_surface;
	int c_hot_x;
	int c_hot_y;
	SDL_Cursor * c_bg_ret;
    PPCODE:
	c_surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_surface, "SDL3::Surface", "SDL_CreateColorCursor(surface)");
	c_hot_x = (int)bg_in_iv(aTHX_ sv_hot_x, "SDL_CreateColorCursor(hot_x)");
	c_hot_y = (int)bg_in_iv(aTHX_ sv_hot_y, "SDL_CreateColorCursor(hot_y)");
	c_bg_ret = SDL_CreateColorCursor(c_surface, c_hot_x, c_hot_y);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Cursor"));
	XSRETURN(1);

void
SDL_CreateAnimatedCursor(sv_frames, sv_frame_count, sv_hot_x, sv_hot_y)
	SV *sv_frames
	SV *sv_frame_count
	SV *sv_hot_x
	SV *sv_hot_y
    PREINIT:
	SDL_CursorFrameInfo * c_frames;
	int c_frame_count;
	int c_hot_x;
	int c_hot_y;
	SDL_Cursor * c_bg_ret;
    PPCODE:
	c_frames = (SDL_CursorFrameInfo *)bg_in_record_ptr(aTHX_ sv_frames, "SDL3::CursorFrameInfo", "SDL_CreateAnimatedCursor(frames)");
	c_frame_count = (int)bg_in_iv(aTHX_ sv_frame_count, "SDL_CreateAnimatedCursor(frame_count)");
	c_hot_x = (int)bg_in_iv(aTHX_ sv_hot_x, "SDL_CreateAnimatedCursor(hot_x)");
	c_hot_y = (int)bg_in_iv(aTHX_ sv_hot_y, "SDL_CreateAnimatedCursor(hot_y)");
	c_bg_ret = SDL_CreateAnimatedCursor(c_frames, c_frame_count, c_hot_x, c_hot_y);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Cursor"));
	XSRETURN(1);

void
SDL_CreateSystemCursor(sv_id)
	SV *sv_id
    PREINIT:
	SDL_SystemCursor c_id;
	SDL_Cursor * c_bg_ret;
    PPCODE:
	c_id = (SDL_SystemCursor)bg_in_iv(aTHX_ sv_id, "SDL_CreateSystemCursor(id)");
	c_bg_ret = SDL_CreateSystemCursor(c_id);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Cursor"));
	XSRETURN(1);

void
SDL_SetCursor(sv_cursor)
	SV *sv_cursor
    PREINIT:
	SDL_Cursor * c_cursor;
	_Bool c_bg_ret;
    PPCODE:
	c_cursor = (SDL_Cursor *)bg_in_record_ptr(aTHX_ sv_cursor, "SDL3::Cursor", "SDL_SetCursor(cursor)");
	c_bg_ret = SDL_SetCursor(c_cursor);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetCursor()
    PREINIT:
	SDL_Cursor * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetCursor();
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Cursor"));
	XSRETURN(1);

void
SDL_GetDefaultCursor()
    PREINIT:
	SDL_Cursor * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetDefaultCursor();
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Cursor"));
	XSRETURN(1);

void
SDL_DestroyCursor(sv_cursor)
	SV *sv_cursor
    PREINIT:
	SDL_Cursor * c_cursor;
    PPCODE:
	c_cursor = (SDL_Cursor *)bg_in_record_ptr(aTHX_ sv_cursor, "SDL3::Cursor", "SDL_DestroyCursor(cursor)");
	SDL_DestroyCursor(c_cursor);
	XSRETURN(0);

void
SDL_ShowCursor()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_ShowCursor();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HideCursor()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HideCursor();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CursorVisible()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_CursorVisible();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Mouse", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_BUTTON_LEFT", BG_CONST_SV(SDL_BUTTON_LEFT));
	bg_export_constant(aTHX_ stash, "SDL_BUTTON_LMASK", BG_CONST_SV(SDL_BUTTON_LMASK));
	bg_export_constant(aTHX_ stash, "SDL_BUTTON_MIDDLE", BG_CONST_SV(SDL_BUTTON_MIDDLE));
	bg_export_constant(aTHX_ stash, "SDL_BUTTON_MMASK", BG_CONST_SV(SDL_BUTTON_MMASK));
	bg_export_constant(aTHX_ stash, "SDL_BUTTON_RIGHT", BG_CONST_SV(SDL_BUTTON_RIGHT));
	bg_export_constant(aTHX_ stash, "SDL_BUTTON_RMASK", BG_CONST_SV(SDL_BUTTON_RMASK));
	bg_export_constant(aTHX_ stash, "SDL_BUTTON_X1", BG_CONST_SV(SDL_BUTTON_X1));
	bg_export_constant(aTHX_ stash, "SDL_BUTTON_X1MASK", BG_CONST_SV(SDL_BUTTON_X1MASK));
	bg_export_constant(aTHX_ stash, "SDL_BUTTON_X2", BG_CONST_SV(SDL_BUTTON_X2));
	bg_export_constant(aTHX_ stash, "SDL_BUTTON_X2MASK", BG_CONST_SV(SDL_BUTTON_X2MASK));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_DEFAULT", BG_CONST_SV(SDL_SYSTEM_CURSOR_DEFAULT));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_TEXT", BG_CONST_SV(SDL_SYSTEM_CURSOR_TEXT));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_WAIT", BG_CONST_SV(SDL_SYSTEM_CURSOR_WAIT));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_CROSSHAIR", BG_CONST_SV(SDL_SYSTEM_CURSOR_CROSSHAIR));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_PROGRESS", BG_CONST_SV(SDL_SYSTEM_CURSOR_PROGRESS));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_NWSE_RESIZE", BG_CONST_SV(SDL_SYSTEM_CURSOR_NWSE_RESIZE));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_NESW_RESIZE", BG_CONST_SV(SDL_SYSTEM_CURSOR_NESW_RESIZE));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_EW_RESIZE", BG_CONST_SV(SDL_SYSTEM_CURSOR_EW_RESIZE));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_NS_RESIZE", BG_CONST_SV(SDL_SYSTEM_CURSOR_NS_RESIZE));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_MOVE", BG_CONST_SV(SDL_SYSTEM_CURSOR_MOVE));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_NOT_ALLOWED", BG_CONST_SV(SDL_SYSTEM_CURSOR_NOT_ALLOWED));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_POINTER", BG_CONST_SV(SDL_SYSTEM_CURSOR_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_NW_RESIZE", BG_CONST_SV(SDL_SYSTEM_CURSOR_NW_RESIZE));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_N_RESIZE", BG_CONST_SV(SDL_SYSTEM_CURSOR_N_RESIZE));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_NE_RESIZE", BG_CONST_SV(SDL_SYSTEM_CURSOR_NE_RESIZE));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_E_RESIZE", BG_CONST_SV(SDL_SYSTEM_CURSOR_E_RESIZE));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_SE_RESIZE", BG_CONST_SV(SDL_SYSTEM_CURSOR_SE_RESIZE));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_S_RESIZE", BG_CONST_SV(SDL_SYSTEM_CURSOR_S_RESIZE));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_SW_RESIZE", BG_CONST_SV(SDL_SYSTEM_CURSOR_SW_RESIZE));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_W_RESIZE", BG_CONST_SV(SDL_SYSTEM_CURSOR_W_RESIZE));
	bg_export_constant(aTHX_ stash, "SDL_SYSTEM_CURSOR_COUNT", BG_CONST_SV(SDL_SYSTEM_CURSOR_COUNT));
	bg_export_constant(aTHX_ stash, "SDL_MOUSEWHEEL_NORMAL", BG_CONST_SV(SDL_MOUSEWHEEL_NORMAL));
	bg_export_constant(aTHX_ stash, "SDL_MOUSEWHEEL_FLIPPED", BG_CONST_SV(SDL_MOUSEWHEEL_FLIPPED));
	}


MODULE = SDL3  PACKAGE = SDL3::CursorFrameInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_CursorFrameInfo), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_CursorFrameInfo)));
	XSRETURN(1);

void
surface(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_CursorFrameInfo *self;
    PPCODE:
	self = (struct SDL_CursorFrameInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::CursorFrameInfo", "SDL3::CursorFrameInfo::surface");
	if (items > 1) {
		self->surface = (SDL_Surface *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::Surface", "SDL3::CursorFrameInfo::surface");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->surface), "SDL3::Surface"));
	XSRETURN(1);

void
duration(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_CursorFrameInfo *self;
    PPCODE:
	self = (struct SDL_CursorFrameInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::CursorFrameInfo", "SDL3::CursorFrameInfo::duration");
	if (items > 1) {
		self->duration = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::CursorFrameInfo::duration");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->duration)));
	XSRETURN(1);
