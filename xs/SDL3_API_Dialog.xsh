MODULE = SDL3  PACKAGE = SDL3::API::Dialog

void
SDL_ShowOpenFileDialog(sv_callback, sv_userdata, sv_window, sv_filters, sv_nfilters, sv_default_location, sv_allow_many)
	SV *sv_callback
	SV *sv_userdata
	SV *sv_window
	SV *sv_filters
	SV *sv_nfilters
	SV *sv_default_location
	SV *sv_allow_many
    PREINIT:
	SDL_DialogFileCallback c_callback;
	void * c_userdata;
	SDL_Window * c_window;
	const SDL_DialogFileFilter * c_filters;
	int c_nfilters;
	const char * c_default_location;
	_Bool c_allow_many;
    PPCODE:
	c_callback = SvOK(sv_callback) ? (SDL_DialogFileCallback)bg_tramp_SDL_DialogFileCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_ShowOpenFileDialog(userdata)") : NULL;
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_ShowOpenFileDialog(window)");
	c_filters = (const SDL_DialogFileFilter *)bg_in_record_ptr(aTHX_ sv_filters, "SDL3::DialogFileFilter", "SDL_ShowOpenFileDialog(filters)");
	c_nfilters = (int)bg_in_iv(aTHX_ sv_nfilters, "SDL_ShowOpenFileDialog(nfilters)");
	c_default_location = (const char *)bg_in_string(aTHX_ sv_default_location, "SDL_ShowOpenFileDialog(default_location)");
	c_allow_many = (_Bool)SvTRUE(sv_allow_many);
	SDL_ShowOpenFileDialog(c_callback, c_userdata, c_window, c_filters, c_nfilters, c_default_location, c_allow_many);
	XSRETURN(0);

void
SDL_ShowSaveFileDialog(sv_callback, sv_userdata, sv_window, sv_filters, sv_nfilters, sv_default_location)
	SV *sv_callback
	SV *sv_userdata
	SV *sv_window
	SV *sv_filters
	SV *sv_nfilters
	SV *sv_default_location
    PREINIT:
	SDL_DialogFileCallback c_callback;
	void * c_userdata;
	SDL_Window * c_window;
	const SDL_DialogFileFilter * c_filters;
	int c_nfilters;
	const char * c_default_location;
    PPCODE:
	c_callback = SvOK(sv_callback) ? (SDL_DialogFileCallback)bg_tramp_SDL_DialogFileCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_ShowSaveFileDialog(userdata)") : NULL;
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_ShowSaveFileDialog(window)");
	c_filters = (const SDL_DialogFileFilter *)bg_in_record_ptr(aTHX_ sv_filters, "SDL3::DialogFileFilter", "SDL_ShowSaveFileDialog(filters)");
	c_nfilters = (int)bg_in_iv(aTHX_ sv_nfilters, "SDL_ShowSaveFileDialog(nfilters)");
	c_default_location = (const char *)bg_in_string(aTHX_ sv_default_location, "SDL_ShowSaveFileDialog(default_location)");
	SDL_ShowSaveFileDialog(c_callback, c_userdata, c_window, c_filters, c_nfilters, c_default_location);
	XSRETURN(0);

void
SDL_ShowOpenFolderDialog(sv_callback, sv_userdata, sv_window, sv_default_location, sv_allow_many)
	SV *sv_callback
	SV *sv_userdata
	SV *sv_window
	SV *sv_default_location
	SV *sv_allow_many
    PREINIT:
	SDL_DialogFileCallback c_callback;
	void * c_userdata;
	SDL_Window * c_window;
	const char * c_default_location;
	_Bool c_allow_many;
    PPCODE:
	c_callback = SvOK(sv_callback) ? (SDL_DialogFileCallback)bg_tramp_SDL_DialogFileCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_ShowOpenFolderDialog(userdata)") : NULL;
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_ShowOpenFolderDialog(window)");
	c_default_location = (const char *)bg_in_string(aTHX_ sv_default_location, "SDL_ShowOpenFolderDialog(default_location)");
	c_allow_many = (_Bool)SvTRUE(sv_allow_many);
	SDL_ShowOpenFolderDialog(c_callback, c_userdata, c_window, c_default_location, c_allow_many);
	XSRETURN(0);

void
SDL_ShowFileDialogWithProperties(sv_type, sv_callback, sv_userdata, sv_props)
	SV *sv_type
	SV *sv_callback
	SV *sv_userdata
	SV *sv_props
    PREINIT:
	SDL_FileDialogType c_type;
	SDL_DialogFileCallback c_callback;
	void * c_userdata;
	SDL_PropertiesID c_props;
    PPCODE:
	c_type = (SDL_FileDialogType)bg_in_iv(aTHX_ sv_type, "SDL_ShowFileDialogWithProperties(type)");
	c_callback = SvOK(sv_callback) ? (SDL_DialogFileCallback)bg_tramp_SDL_DialogFileCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_ShowFileDialogWithProperties(userdata)") : NULL;
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_ShowFileDialogWithProperties(props)");
	SDL_ShowFileDialogWithProperties(c_type, c_callback, c_userdata, c_props);
	XSRETURN(0);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Dialog", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_PROP_FILE_DIALOG_ACCEPT_STRING", BG_CONST_SV(SDL_PROP_FILE_DIALOG_ACCEPT_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_FILE_DIALOG_CANCEL_STRING", BG_CONST_SV(SDL_PROP_FILE_DIALOG_CANCEL_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_FILE_DIALOG_FILTERS_POINTER", BG_CONST_SV(SDL_PROP_FILE_DIALOG_FILTERS_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_FILE_DIALOG_LOCATION_STRING", BG_CONST_SV(SDL_PROP_FILE_DIALOG_LOCATION_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_FILE_DIALOG_MANY_BOOLEAN", BG_CONST_SV(SDL_PROP_FILE_DIALOG_MANY_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_FILE_DIALOG_NFILTERS_NUMBER", BG_CONST_SV(SDL_PROP_FILE_DIALOG_NFILTERS_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_FILE_DIALOG_TITLE_STRING", BG_CONST_SV(SDL_PROP_FILE_DIALOG_TITLE_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_FILE_DIALOG_WINDOW_POINTER", BG_CONST_SV(SDL_PROP_FILE_DIALOG_WINDOW_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_FILEDIALOG_OPENFILE", BG_CONST_SV(SDL_FILEDIALOG_OPENFILE));
	bg_export_constant(aTHX_ stash, "SDL_FILEDIALOG_SAVEFILE", BG_CONST_SV(SDL_FILEDIALOG_SAVEFILE));
	bg_export_constant(aTHX_ stash, "SDL_FILEDIALOG_OPENFOLDER", BG_CONST_SV(SDL_FILEDIALOG_OPENFOLDER));
	}

MODULE = SDL3  PACKAGE = SDL3::DialogFileFilter

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_DialogFileFilter), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_DialogFileFilter)));
	XSRETURN(1);

void
name(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DialogFileFilter *self;
    PPCODE:
	self = (struct SDL_DialogFileFilter *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DialogFileFilter", "SDL3::DialogFileFilter::name");
	if (items > 1) {
		self->name = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::DialogFileFilter::name");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->name)));
	XSRETURN(1);

void
pattern(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DialogFileFilter *self;
    PPCODE:
	self = (struct SDL_DialogFileFilter *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DialogFileFilter", "SDL3::DialogFileFilter::pattern");
	if (items > 1) {
		self->pattern = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::DialogFileFilter::pattern");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->pattern)));
	XSRETURN(1);
