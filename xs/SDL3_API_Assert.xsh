MODULE = SDL3  PACKAGE = SDL3::API::Assert

void
SDL_ReportAssertion(sv_data, sv_func, sv_file, sv_line)
	SV *sv_data
	SV *sv_func
	SV *sv_file
	SV *sv_line
    PREINIT:
	SDL_AssertData * c_data;
	const char * c_func;
	const char * c_file;
	int c_line;
	SDL_AssertState c_bg_ret;
    PPCODE:
	c_data = (SDL_AssertData *)bg_in_record_ptr(aTHX_ sv_data, "SDL3::AssertData", "SDL_ReportAssertion(data)");
	c_func = (const char *)bg_in_string(aTHX_ sv_func, "SDL_ReportAssertion(func)");
	c_file = (const char *)bg_in_string(aTHX_ sv_file, "SDL_ReportAssertion(file)");
	c_line = (int)bg_in_iv(aTHX_ sv_line, "SDL_ReportAssertion(line)");
	c_bg_ret = SDL_ReportAssertion(c_data, c_func, c_file, c_line);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetAssertionHandler(sv_handler, sv_userdata)
	SV *sv_handler
	SV *sv_userdata
    PREINIT:
	SDL_AssertionHandler c_handler;
	void * c_userdata;
    PPCODE:
	c_handler = SvOK(sv_handler) ? (SDL_AssertionHandler)bg_tramp_SDL_AssertionHandler : NULL;
	c_userdata = SvOK(sv_handler) ? (void *)bg_make_holder(aTHX_ sv_handler, sv_userdata, "SDL_SetAssertionHandler(userdata)") : NULL;
	SDL_SetAssertionHandler(c_handler, c_userdata);
	XSRETURN(0);

void
SDL_GetDefaultAssertionHandler()
    PREINIT:
	SDL_AssertionHandler c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetDefaultAssertionHandler();
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetAssertionHandler(sv_puserdata)
	SV *sv_puserdata
    PREINIT:
	void * c_puserdata; void ** p_puserdata; SV *t_puserdata;
	SDL_AssertionHandler c_bg_ret;
    PPCODE:
	t_puserdata = bg_outref_target(aTHX_ sv_puserdata);
	c_puserdata = (t_puserdata && SvOK(t_puserdata)) ? (void *)bg_in_raw_ptr(aTHX_ t_puserdata, "SDL_GetAssertionHandler(puserdata)") : (void *)0;
	p_puserdata = t_puserdata ? &c_puserdata : (void **)bg_outref_raw(aTHX_ sv_puserdata, "SDL_GetAssertionHandler(puserdata)");
	c_bg_ret = SDL_GetAssertionHandler(p_puserdata);
	if (t_puserdata) sv_setsv(t_puserdata, sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_puserdata), "SDL3::Pointer")));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetAssertionReport()
    PREINIT:
	const SDL_AssertData * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetAssertionReport();
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::AssertData"));
	XSRETURN(1);

void
SDL_ResetAssertionReport()
    PPCODE:
	SDL_ResetAssertionReport();
	XSRETURN(0);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Assert", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_ASSERT_FILE", BG_CONST_SV(SDL_ASSERT_FILE));
	bg_export_constant(aTHX_ stash, "SDL_ASSERT_LEVEL", BG_CONST_SV(SDL_ASSERT_LEVEL));
	bg_export_constant(aTHX_ stash, "SDL_FILE", BG_CONST_SV(SDL_FILE));
	bg_export_constant(aTHX_ stash, "SDL_LINE", BG_CONST_SV(SDL_LINE));
	bg_export_constant(aTHX_ stash, "SDL_NULL_WHILE_LOOP_CONDITION", BG_CONST_SV(SDL_NULL_WHILE_LOOP_CONDITION));
	bg_export_constant(aTHX_ stash, "SDL_ASSERTION_RETRY", BG_CONST_SV(SDL_ASSERTION_RETRY));
	bg_export_constant(aTHX_ stash, "SDL_ASSERTION_BREAK", BG_CONST_SV(SDL_ASSERTION_BREAK));
	bg_export_constant(aTHX_ stash, "SDL_ASSERTION_ABORT", BG_CONST_SV(SDL_ASSERTION_ABORT));
	bg_export_constant(aTHX_ stash, "SDL_ASSERTION_IGNORE", BG_CONST_SV(SDL_ASSERTION_IGNORE));
	bg_export_constant(aTHX_ stash, "SDL_ASSERTION_ALWAYS_IGNORE", BG_CONST_SV(SDL_ASSERTION_ALWAYS_IGNORE));
	}

MODULE = SDL3  PACKAGE = SDL3::AssertData

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_AssertData), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_AssertData)));
	XSRETURN(1);

void
always_ignore(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AssertData *self;
    PPCODE:
	self = (struct SDL_AssertData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AssertData", "SDL3::AssertData::always_ignore");
	if (items > 1) {
		self->always_ignore = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->always_ignore)));
	XSRETURN(1);

void
trigger_count(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AssertData *self;
    PPCODE:
	self = (struct SDL_AssertData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AssertData", "SDL3::AssertData::trigger_count");
	if (items > 1) {
		self->trigger_count = (unsigned int)bg_in_uv(aTHX_ ST(1), "SDL3::AssertData::trigger_count");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->trigger_count)));
	XSRETURN(1);

void
condition(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AssertData *self;
    PPCODE:
	self = (struct SDL_AssertData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AssertData", "SDL3::AssertData::condition");
	if (items > 1) {
		self->condition = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::AssertData::condition");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->condition)));
	XSRETURN(1);

void
filename(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AssertData *self;
    PPCODE:
	self = (struct SDL_AssertData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AssertData", "SDL3::AssertData::filename");
	if (items > 1) {
		self->filename = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::AssertData::filename");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->filename)));
	XSRETURN(1);

void
linenum(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AssertData *self;
    PPCODE:
	self = (struct SDL_AssertData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AssertData", "SDL3::AssertData::linenum");
	if (items > 1) {
		self->linenum = (int)bg_in_iv(aTHX_ ST(1), "SDL3::AssertData::linenum");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->linenum)));
	XSRETURN(1);

void
function(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AssertData *self;
    PPCODE:
	self = (struct SDL_AssertData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AssertData", "SDL3::AssertData::function");
	if (items > 1) {
		self->function = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::AssertData::function");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->function)));
	XSRETURN(1);

void
next(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AssertData *self;
    PPCODE:
	self = (struct SDL_AssertData *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AssertData", "SDL3::AssertData::next");
	if (items > 1) {
		self->next = (const struct SDL_AssertData *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::AssertData", "SDL3::AssertData::next");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->next), "SDL3::AssertData"));
	XSRETURN(1);
