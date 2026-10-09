MODULE = SDL3  PACKAGE = SDL3::API::Messagebox

void
SDL_ShowMessageBox(sv_messageboxdata, sv_buttonid)
	SV *sv_messageboxdata
	SV *sv_buttonid
    PREINIT:
	const SDL_MessageBoxData * c_messageboxdata;
	int c_buttonid; int * p_buttonid; SV *t_buttonid;
	_Bool c_bg_ret;
    PPCODE:
	c_messageboxdata = (const SDL_MessageBoxData *)bg_in_record_ptr(aTHX_ sv_messageboxdata, "SDL3::MessageBoxData", "SDL_ShowMessageBox(messageboxdata)");
	t_buttonid = bg_outref_target(aTHX_ sv_buttonid);
	c_buttonid = (t_buttonid && SvOK(t_buttonid)) ? (int)bg_in_iv(aTHX_ t_buttonid, "SDL_ShowMessageBox(buttonid)") : (int)0;
	p_buttonid = t_buttonid ? &c_buttonid : (int *)bg_outref_raw(aTHX_ sv_buttonid, "SDL_ShowMessageBox(buttonid)");
	c_bg_ret = SDL_ShowMessageBox(c_messageboxdata, p_buttonid);
	if (t_buttonid) sv_setsv(t_buttonid, sv_2mortal(newSViv((IV)(c_buttonid))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ShowSimpleMessageBox(sv_flags, sv_title, sv_message, sv_window)
	SV *sv_flags
	SV *sv_title
	SV *sv_message
	SV *sv_window
    PREINIT:
	SDL_MessageBoxFlags c_flags;
	const char * c_title;
	const char * c_message;
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_flags = (SDL_MessageBoxFlags)bg_in_uv(aTHX_ sv_flags, "SDL_ShowSimpleMessageBox(flags)");
	c_title = (const char *)bg_in_string(aTHX_ sv_title, "SDL_ShowSimpleMessageBox(title)");
	c_message = (const char *)bg_in_string(aTHX_ sv_message, "SDL_ShowSimpleMessageBox(message)");
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_ShowSimpleMessageBox(window)");
	c_bg_ret = SDL_ShowSimpleMessageBox(c_flags, c_title, c_message, c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Messagebox", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT", BG_CONST_SV(SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT));
	bg_export_constant(aTHX_ stash, "SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT", BG_CONST_SV(SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT));
	bg_export_constant(aTHX_ stash, "SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT", BG_CONST_SV(SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT));
	bg_export_constant(aTHX_ stash, "SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT", BG_CONST_SV(SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT));
	bg_export_constant(aTHX_ stash, "SDL_MESSAGEBOX_ERROR", BG_CONST_SV(SDL_MESSAGEBOX_ERROR));
	bg_export_constant(aTHX_ stash, "SDL_MESSAGEBOX_INFORMATION", BG_CONST_SV(SDL_MESSAGEBOX_INFORMATION));
	bg_export_constant(aTHX_ stash, "SDL_MESSAGEBOX_WARNING", BG_CONST_SV(SDL_MESSAGEBOX_WARNING));
	bg_export_constant(aTHX_ stash, "SDL_MESSAGEBOX_COLOR_BACKGROUND", BG_CONST_SV(SDL_MESSAGEBOX_COLOR_BACKGROUND));
	bg_export_constant(aTHX_ stash, "SDL_MESSAGEBOX_COLOR_TEXT", BG_CONST_SV(SDL_MESSAGEBOX_COLOR_TEXT));
	bg_export_constant(aTHX_ stash, "SDL_MESSAGEBOX_COLOR_BUTTON_BORDER", BG_CONST_SV(SDL_MESSAGEBOX_COLOR_BUTTON_BORDER));
	bg_export_constant(aTHX_ stash, "SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND", BG_CONST_SV(SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND));
	bg_export_constant(aTHX_ stash, "SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED", BG_CONST_SV(SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED));
	bg_export_constant(aTHX_ stash, "SDL_MESSAGEBOX_COLOR_COUNT", BG_CONST_SV(SDL_MESSAGEBOX_COLOR_COUNT));
	}

MODULE = SDL3  PACKAGE = SDL3::MessageBoxButtonData

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_MessageBoxButtonData), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_MessageBoxButtonData)));
	XSRETURN(1);

void
flags(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MessageBoxButtonData *self;
    PPCODE:
	self = (struct SDL_MessageBoxButtonData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MessageBoxButtonData", "SDL3::MessageBoxButtonData::flags");
	if (items > 1) {
		self->flags = (SDL_MessageBoxButtonFlags)bg_in_uv(aTHX_ ST(1), "SDL3::MessageBoxButtonData::flags");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->flags)));
	XSRETURN(1);

void
buttonID(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MessageBoxButtonData *self;
    PPCODE:
	self = (struct SDL_MessageBoxButtonData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MessageBoxButtonData", "SDL3::MessageBoxButtonData::buttonID");
	if (items > 1) {
		self->buttonID = (int)bg_in_iv(aTHX_ ST(1), "SDL3::MessageBoxButtonData::buttonID");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->buttonID)));
	XSRETURN(1);

void
text(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MessageBoxButtonData *self;
    PPCODE:
	self = (struct SDL_MessageBoxButtonData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MessageBoxButtonData", "SDL3::MessageBoxButtonData::text");
	if (items > 1) {
		self->text = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::MessageBoxButtonData::text");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->text)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::MessageBoxColor

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_MessageBoxColor), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_MessageBoxColor)));
	XSRETURN(1);

void
r(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MessageBoxColor *self;
    PPCODE:
	self = (struct SDL_MessageBoxColor *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MessageBoxColor", "SDL3::MessageBoxColor::r");
	if (items > 1) {
		self->r = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::MessageBoxColor::r");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->r)));
	XSRETURN(1);

void
g(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MessageBoxColor *self;
    PPCODE:
	self = (struct SDL_MessageBoxColor *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MessageBoxColor", "SDL3::MessageBoxColor::g");
	if (items > 1) {
		self->g = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::MessageBoxColor::g");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->g)));
	XSRETURN(1);

void
b(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MessageBoxColor *self;
    PPCODE:
	self = (struct SDL_MessageBoxColor *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MessageBoxColor", "SDL3::MessageBoxColor::b");
	if (items > 1) {
		self->b = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::MessageBoxColor::b");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->b)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::MessageBoxColorScheme

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_MessageBoxColorScheme), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_MessageBoxColorScheme)));
	XSRETURN(1);

void
colors(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MessageBoxColorScheme *self;
	Size_t bg_i;
    PPCODE:
	self = (struct SDL_MessageBoxColorScheme *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MessageBoxColorScheme", "SDL3::MessageBoxColorScheme::colors");
	if (items > 1) {
		if (items - 1 != 5) croak("%s expects 5 values, got %d", "SDL3::MessageBoxColorScheme::colors", (int)(items - 1));
		for (bg_i = 0; bg_i < 5; bg_i++) self->colors[bg_i] = *(struct SDL_MessageBoxColor *)bg_in_record_value_ptr(aTHX_ ST(1 + bg_i), "SDL3::MessageBoxColor", "SDL3::MessageBoxColorScheme::colors");
		XSRETURN(1);
	}
	EXTEND(SP, 5);
	for (bg_i = 0; bg_i < 5; bg_i++) mPUSHs(bg_out_record_copy(aTHX_ (const void *)&(self->colors[bg_i]), sizeof(struct SDL_MessageBoxColor), "SDL3::MessageBoxColor"));
	XSRETURN(5);

MODULE = SDL3  PACKAGE = SDL3::MessageBoxData

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_MessageBoxData), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_MessageBoxData)));
	XSRETURN(1);

void
flags(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MessageBoxData *self;
    PPCODE:
	self = (struct SDL_MessageBoxData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MessageBoxData", "SDL3::MessageBoxData::flags");
	if (items > 1) {
		self->flags = (SDL_MessageBoxFlags)bg_in_uv(aTHX_ ST(1), "SDL3::MessageBoxData::flags");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->flags)));
	XSRETURN(1);

void
window(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MessageBoxData *self;
    PPCODE:
	self = (struct SDL_MessageBoxData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MessageBoxData", "SDL3::MessageBoxData::window");
	if (items > 1) {
		self->window = (SDL_Window *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::Window", "SDL3::MessageBoxData::window");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->window), "SDL3::Window"));
	XSRETURN(1);

void
title(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MessageBoxData *self;
    PPCODE:
	self = (struct SDL_MessageBoxData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MessageBoxData", "SDL3::MessageBoxData::title");
	if (items > 1) {
		self->title = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::MessageBoxData::title");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->title)));
	XSRETURN(1);

void
message(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MessageBoxData *self;
    PPCODE:
	self = (struct SDL_MessageBoxData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MessageBoxData", "SDL3::MessageBoxData::message");
	if (items > 1) {
		self->message = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::MessageBoxData::message");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->message)));
	XSRETURN(1);

void
numbuttons(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MessageBoxData *self;
    PPCODE:
	self = (struct SDL_MessageBoxData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MessageBoxData", "SDL3::MessageBoxData::numbuttons");
	if (items > 1) {
		self->numbuttons = (int)bg_in_iv(aTHX_ ST(1), "SDL3::MessageBoxData::numbuttons");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->numbuttons)));
	XSRETURN(1);

void
buttons(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MessageBoxData *self;
    PPCODE:
	self = (struct SDL_MessageBoxData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MessageBoxData", "SDL3::MessageBoxData::buttons");
	if (items > 1) {
		self->buttons = (const SDL_MessageBoxButtonData *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::MessageBoxButtonData", "SDL3::MessageBoxData::buttons");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->buttons), "SDL3::MessageBoxButtonData"));
	XSRETURN(1);

void
colorScheme(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_MessageBoxData *self;
    PPCODE:
	self = (struct SDL_MessageBoxData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::MessageBoxData", "SDL3::MessageBoxData::colorScheme");
	if (items > 1) {
		self->colorScheme = (const SDL_MessageBoxColorScheme *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::MessageBoxColorScheme", "SDL3::MessageBoxData::colorScheme");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->colorScheme), "SDL3::MessageBoxColorScheme"));
	XSRETURN(1);
