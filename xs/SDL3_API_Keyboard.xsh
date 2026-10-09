MODULE = SDL3  PACKAGE = SDL3::API::Keyboard

void
SDL_HasKeyboard()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasKeyboard();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetKeyboards(sv_count)
	SV *sv_count
    PREINIT:
	int c_count; int * p_count; SV *t_count;
	SDL_KeyboardID * c_bg_ret;
    PPCODE:
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetKeyboards(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetKeyboards(count)");
	c_bg_ret = SDL_GetKeyboards(p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetKeyboardNameForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_KeyboardID c_instance_id;
	const char * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_KeyboardID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetKeyboardNameForID(instance_id)");
	c_bg_ret = SDL_GetKeyboardNameForID(c_instance_id);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetKeyboardFocus()
    PREINIT:
	SDL_Window * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetKeyboardFocus();
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Window"));
	XSRETURN(1);

void
SDL_GetKeyboardState(sv_numkeys)
	SV *sv_numkeys
    PREINIT:
	int c_numkeys; int * p_numkeys; SV *t_numkeys;
	const _Bool * c_bg_ret;
    PPCODE:
	t_numkeys = bg_outref_target(aTHX_ sv_numkeys);
	c_numkeys = (t_numkeys && SvOK(t_numkeys)) ? (int)bg_in_iv(aTHX_ t_numkeys, "SDL_GetKeyboardState(numkeys)") : (int)0;
	p_numkeys = t_numkeys ? &c_numkeys : (int *)bg_outref_raw(aTHX_ sv_numkeys, "SDL_GetKeyboardState(numkeys)");
	c_bg_ret = SDL_GetKeyboardState(p_numkeys);
	if (t_numkeys) sv_setsv(t_numkeys, sv_2mortal(newSViv((IV)(c_numkeys))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_ResetKeyboard()
    PPCODE:
	SDL_ResetKeyboard();
	XSRETURN(0);

void
SDL_GetModState()
    PREINIT:
	SDL_Keymod c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetModState();
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetModState(sv_modstate)
	SV *sv_modstate
    PREINIT:
	SDL_Keymod c_modstate;
    PPCODE:
	c_modstate = (SDL_Keymod)bg_in_uv(aTHX_ sv_modstate, "SDL_SetModState(modstate)");
	SDL_SetModState(c_modstate);
	XSRETURN(0);

void
SDL_GetKeyFromScancode(sv_scancode, sv_modstate, sv_key_event)
	SV *sv_scancode
	SV *sv_modstate
	SV *sv_key_event
    PREINIT:
	SDL_Scancode c_scancode;
	SDL_Keymod c_modstate;
	_Bool c_key_event;
	SDL_Keycode c_bg_ret;
    PPCODE:
	c_scancode = (SDL_Scancode)bg_in_iv(aTHX_ sv_scancode, "SDL_GetKeyFromScancode(scancode)");
	c_modstate = (SDL_Keymod)bg_in_uv(aTHX_ sv_modstate, "SDL_GetKeyFromScancode(modstate)");
	c_key_event = (_Bool)SvTRUE(sv_key_event);
	c_bg_ret = SDL_GetKeyFromScancode(c_scancode, c_modstate, c_key_event);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetScancodeFromKey(sv_key, sv_modstate)
	SV *sv_key
	SV *sv_modstate
    PREINIT:
	SDL_Keycode c_key;
	SDL_Keymod c_modstate; SDL_Keymod * p_modstate; SV *t_modstate;
	SDL_Scancode c_bg_ret;
    PPCODE:
	c_key = (SDL_Keycode)bg_in_uv(aTHX_ sv_key, "SDL_GetScancodeFromKey(key)");
	t_modstate = bg_outref_target(aTHX_ sv_modstate);
	c_modstate = (t_modstate && SvOK(t_modstate)) ? (SDL_Keymod)bg_in_uv(aTHX_ t_modstate, "SDL_GetScancodeFromKey(modstate)") : (SDL_Keymod)0;
	p_modstate = t_modstate ? &c_modstate : (SDL_Keymod *)bg_outref_raw(aTHX_ sv_modstate, "SDL_GetScancodeFromKey(modstate)");
	c_bg_ret = SDL_GetScancodeFromKey(c_key, p_modstate);
	if (t_modstate) sv_setsv(t_modstate, sv_2mortal(newSVuv((UV)(c_modstate))));
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetScancodeName(sv_scancode, sv_name)
	SV *sv_scancode
	SV *sv_name
    PREINIT:
	SDL_Scancode c_scancode;
	const char * c_name;
	_Bool c_bg_ret;
    PPCODE:
	c_scancode = (SDL_Scancode)bg_in_iv(aTHX_ sv_scancode, "SDL_SetScancodeName(scancode)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_SetScancodeName(name)");
	c_bg_ret = SDL_SetScancodeName(c_scancode, c_name);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetScancodeName(sv_scancode)
	SV *sv_scancode
    PREINIT:
	SDL_Scancode c_scancode;
	const char * c_bg_ret;
    PPCODE:
	c_scancode = (SDL_Scancode)bg_in_iv(aTHX_ sv_scancode, "SDL_GetScancodeName(scancode)");
	c_bg_ret = SDL_GetScancodeName(c_scancode);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetScancodeFromName(sv_name)
	SV *sv_name
    PREINIT:
	const char * c_name;
	SDL_Scancode c_bg_ret;
    PPCODE:
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_GetScancodeFromName(name)");
	c_bg_ret = SDL_GetScancodeFromName(c_name);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetKeyName(sv_key)
	SV *sv_key
    PREINIT:
	SDL_Keycode c_key;
	const char * c_bg_ret;
    PPCODE:
	c_key = (SDL_Keycode)bg_in_uv(aTHX_ sv_key, "SDL_GetKeyName(key)");
	c_bg_ret = SDL_GetKeyName(c_key);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetKeyFromName(sv_name)
	SV *sv_name
    PREINIT:
	const char * c_name;
	SDL_Keycode c_bg_ret;
    PPCODE:
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_GetKeyFromName(name)");
	c_bg_ret = SDL_GetKeyFromName(c_name);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_StartTextInput(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_StartTextInput(window)");
	c_bg_ret = SDL_StartTextInput(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_StartTextInputWithProperties(sv_window, sv_props)
	SV *sv_window
	SV *sv_props
    PREINIT:
	SDL_Window * c_window;
	SDL_PropertiesID c_props;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_StartTextInputWithProperties(window)");
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_StartTextInputWithProperties(props)");
	c_bg_ret = SDL_StartTextInputWithProperties(c_window, c_props);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_TextInputActive(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_TextInputActive(window)");
	c_bg_ret = SDL_TextInputActive(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_StopTextInput(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_StopTextInput(window)");
	c_bg_ret = SDL_StopTextInput(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ClearComposition(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_ClearComposition(window)");
	c_bg_ret = SDL_ClearComposition(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetTextInputArea(sv_window, sv_rect, sv_cursor)
	SV *sv_window
	SV *sv_rect
	SV *sv_cursor
    PREINIT:
	SDL_Window * c_window;
	const SDL_Rect * c_rect;
	int c_cursor;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetTextInputArea(window)");
	c_rect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_SetTextInputArea(rect)");
	c_cursor = (int)bg_in_iv(aTHX_ sv_cursor, "SDL_SetTextInputArea(cursor)");
	c_bg_ret = SDL_SetTextInputArea(c_window, c_rect, c_cursor);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetTextInputArea(sv_window, sv_rect, sv_cursor)
	SV *sv_window
	SV *sv_rect
	SV *sv_cursor
    PREINIT:
	SDL_Window * c_window;
	SDL_Rect * c_rect;
	int c_cursor; int * p_cursor; SV *t_cursor;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetTextInputArea(window)");
	c_rect = (SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_GetTextInputArea(rect)");
	t_cursor = bg_outref_target(aTHX_ sv_cursor);
	c_cursor = (t_cursor && SvOK(t_cursor)) ? (int)bg_in_iv(aTHX_ t_cursor, "SDL_GetTextInputArea(cursor)") : (int)0;
	p_cursor = t_cursor ? &c_cursor : (int *)bg_outref_raw(aTHX_ sv_cursor, "SDL_GetTextInputArea(cursor)");
	c_bg_ret = SDL_GetTextInputArea(c_window, c_rect, p_cursor);
	if (t_cursor) sv_setsv(t_cursor, sv_2mortal(newSViv((IV)(c_cursor))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasScreenKeyboardSupport()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasScreenKeyboardSupport();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ScreenKeyboardShown(sv_window)
	SV *sv_window
    PREINIT:
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_ScreenKeyboardShown(window)");
	c_bg_ret = SDL_ScreenKeyboardShown(c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Keyboard", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER", BG_CONST_SV(SDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN", BG_CONST_SV(SDL_PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER", BG_CONST_SV(SDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN", BG_CONST_SV(SDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_TEXTINPUT_TYPE_NUMBER", BG_CONST_SV(SDL_PROP_TEXTINPUT_TYPE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_TEXTINPUT_TYPE_TEXT", BG_CONST_SV(SDL_TEXTINPUT_TYPE_TEXT));
	bg_export_constant(aTHX_ stash, "SDL_TEXTINPUT_TYPE_TEXT_NAME", BG_CONST_SV(SDL_TEXTINPUT_TYPE_TEXT_NAME));
	bg_export_constant(aTHX_ stash, "SDL_TEXTINPUT_TYPE_TEXT_EMAIL", BG_CONST_SV(SDL_TEXTINPUT_TYPE_TEXT_EMAIL));
	bg_export_constant(aTHX_ stash, "SDL_TEXTINPUT_TYPE_TEXT_USERNAME", BG_CONST_SV(SDL_TEXTINPUT_TYPE_TEXT_USERNAME));
	bg_export_constant(aTHX_ stash, "SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN", BG_CONST_SV(SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN));
	bg_export_constant(aTHX_ stash, "SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE", BG_CONST_SV(SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE));
	bg_export_constant(aTHX_ stash, "SDL_TEXTINPUT_TYPE_NUMBER", BG_CONST_SV(SDL_TEXTINPUT_TYPE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN", BG_CONST_SV(SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN));
	bg_export_constant(aTHX_ stash, "SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE", BG_CONST_SV(SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE));
	bg_export_constant(aTHX_ stash, "SDL_CAPITALIZE_NONE", BG_CONST_SV(SDL_CAPITALIZE_NONE));
	bg_export_constant(aTHX_ stash, "SDL_CAPITALIZE_SENTENCES", BG_CONST_SV(SDL_CAPITALIZE_SENTENCES));
	bg_export_constant(aTHX_ stash, "SDL_CAPITALIZE_WORDS", BG_CONST_SV(SDL_CAPITALIZE_WORDS));
	bg_export_constant(aTHX_ stash, "SDL_CAPITALIZE_LETTERS", BG_CONST_SV(SDL_CAPITALIZE_LETTERS));
	}
