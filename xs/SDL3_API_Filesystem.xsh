MODULE = SDL3  PACKAGE = SDL3::API::Filesystem

void
SDL_GetBasePath()
    PREINIT:
	const char * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetBasePath();
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetPrefPath(sv_org, sv_app)
	SV *sv_org
	SV *sv_app
    PREINIT:
	const char * c_org;
	const char * c_app;
	char * c_bg_ret;
    PPCODE:
	c_org = (const char *)bg_in_string(aTHX_ sv_org, "SDL_GetPrefPath(org)");
	c_app = (const char *)bg_in_string(aTHX_ sv_app, "SDL_GetPrefPath(app)");
	c_bg_ret = SDL_GetPrefPath(c_org, c_app);
	ST(0) = sv_2mortal(bg_out_owned_string(aTHX_ (char *)(c_bg_ret), (void (*)(void *))SDL_free));
	XSRETURN(1);

void
SDL_GetUserFolder(sv_folder)
	SV *sv_folder
    PREINIT:
	SDL_Folder c_folder;
	const char * c_bg_ret;
    PPCODE:
	c_folder = (SDL_Folder)bg_in_iv(aTHX_ sv_folder, "SDL_GetUserFolder(folder)");
	c_bg_ret = SDL_GetUserFolder(c_folder);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_CreateDirectory(sv_path)
	SV *sv_path
    PREINIT:
	const char * c_path;
	_Bool c_bg_ret;
    PPCODE:
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_CreateDirectory(path)");
	c_bg_ret = SDL_CreateDirectory(c_path);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_EnumerateDirectory(sv_path, sv_callback, sv_userdata)
	SV *sv_path
	SV *sv_callback
	SV *sv_userdata
    PREINIT:
	const char * c_path;
	SDL_EnumerateDirectoryCallback c_callback;
	void * c_userdata;
	_Bool c_bg_ret;
    PPCODE:
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_EnumerateDirectory(path)");
	c_callback = SvOK(sv_callback) ? (SDL_EnumerateDirectoryCallback)bg_tramp_SDL_EnumerateDirectoryCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_EnumerateDirectory(userdata)") : NULL;
	c_bg_ret = SDL_EnumerateDirectory(c_path, c_callback, c_userdata);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RemovePath(sv_path)
	SV *sv_path
    PREINIT:
	const char * c_path;
	_Bool c_bg_ret;
    PPCODE:
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_RemovePath(path)");
	c_bg_ret = SDL_RemovePath(c_path);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenamePath(sv_oldpath, sv_newpath)
	SV *sv_oldpath
	SV *sv_newpath
    PREINIT:
	const char * c_oldpath;
	const char * c_newpath;
	_Bool c_bg_ret;
    PPCODE:
	c_oldpath = (const char *)bg_in_string(aTHX_ sv_oldpath, "SDL_RenamePath(oldpath)");
	c_newpath = (const char *)bg_in_string(aTHX_ sv_newpath, "SDL_RenamePath(newpath)");
	c_bg_ret = SDL_RenamePath(c_oldpath, c_newpath);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CopyFile(sv_oldpath, sv_newpath)
	SV *sv_oldpath
	SV *sv_newpath
    PREINIT:
	const char * c_oldpath;
	const char * c_newpath;
	_Bool c_bg_ret;
    PPCODE:
	c_oldpath = (const char *)bg_in_string(aTHX_ sv_oldpath, "SDL_CopyFile(oldpath)");
	c_newpath = (const char *)bg_in_string(aTHX_ sv_newpath, "SDL_CopyFile(newpath)");
	c_bg_ret = SDL_CopyFile(c_oldpath, c_newpath);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetPathInfo(sv_path, sv_info)
	SV *sv_path
	SV *sv_info
    PREINIT:
	const char * c_path;
	SDL_PathInfo * c_info;
	_Bool c_bg_ret;
    PPCODE:
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_GetPathInfo(path)");
	c_info = (SDL_PathInfo *)bg_in_record_ptr(aTHX_ sv_info, "SDL3::PathInfo", "SDL_GetPathInfo(info)");
	c_bg_ret = SDL_GetPathInfo(c_path, c_info);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GlobDirectory(sv_path, sv_pattern, sv_flags, sv_count)
	SV *sv_path
	SV *sv_pattern
	SV *sv_flags
	SV *sv_count
    PREINIT:
	const char * c_path;
	const char * c_pattern;
	SDL_GlobFlags c_flags;
	int c_count; int * p_count; SV *t_count;
	char ** c_bg_ret;
    PPCODE:
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_GlobDirectory(path)");
	c_pattern = (const char *)bg_in_string(aTHX_ sv_pattern, "SDL_GlobDirectory(pattern)");
	c_flags = (SDL_GlobFlags)bg_in_uv(aTHX_ sv_flags, "SDL_GlobDirectory(flags)");
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GlobDirectory(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GlobDirectory(count)");
	c_bg_ret = SDL_GlobDirectory(c_path, c_pattern, c_flags, p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetCurrentDirectory()
    PREINIT:
	char * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetCurrentDirectory();
	ST(0) = sv_2mortal(bg_out_owned_string(aTHX_ (char *)(c_bg_ret), (void (*)(void *))SDL_free));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Filesystem", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_GLOB_CASEINSENSITIVE", BG_CONST_SV(SDL_GLOB_CASEINSENSITIVE));
	bg_export_constant(aTHX_ stash, "SDL_FOLDER_HOME", BG_CONST_SV(SDL_FOLDER_HOME));
	bg_export_constant(aTHX_ stash, "SDL_FOLDER_DESKTOP", BG_CONST_SV(SDL_FOLDER_DESKTOP));
	bg_export_constant(aTHX_ stash, "SDL_FOLDER_DOCUMENTS", BG_CONST_SV(SDL_FOLDER_DOCUMENTS));
	bg_export_constant(aTHX_ stash, "SDL_FOLDER_DOWNLOADS", BG_CONST_SV(SDL_FOLDER_DOWNLOADS));
	bg_export_constant(aTHX_ stash, "SDL_FOLDER_MUSIC", BG_CONST_SV(SDL_FOLDER_MUSIC));
	bg_export_constant(aTHX_ stash, "SDL_FOLDER_PICTURES", BG_CONST_SV(SDL_FOLDER_PICTURES));
	bg_export_constant(aTHX_ stash, "SDL_FOLDER_PUBLICSHARE", BG_CONST_SV(SDL_FOLDER_PUBLICSHARE));
	bg_export_constant(aTHX_ stash, "SDL_FOLDER_SAVEDGAMES", BG_CONST_SV(SDL_FOLDER_SAVEDGAMES));
	bg_export_constant(aTHX_ stash, "SDL_FOLDER_SCREENSHOTS", BG_CONST_SV(SDL_FOLDER_SCREENSHOTS));
	bg_export_constant(aTHX_ stash, "SDL_FOLDER_TEMPLATES", BG_CONST_SV(SDL_FOLDER_TEMPLATES));
	bg_export_constant(aTHX_ stash, "SDL_FOLDER_VIDEOS", BG_CONST_SV(SDL_FOLDER_VIDEOS));
	bg_export_constant(aTHX_ stash, "SDL_FOLDER_COUNT", BG_CONST_SV(SDL_FOLDER_COUNT));
	bg_export_constant(aTHX_ stash, "SDL_PATHTYPE_NONE", BG_CONST_SV(SDL_PATHTYPE_NONE));
	bg_export_constant(aTHX_ stash, "SDL_PATHTYPE_FILE", BG_CONST_SV(SDL_PATHTYPE_FILE));
	bg_export_constant(aTHX_ stash, "SDL_PATHTYPE_DIRECTORY", BG_CONST_SV(SDL_PATHTYPE_DIRECTORY));
	bg_export_constant(aTHX_ stash, "SDL_PATHTYPE_OTHER", BG_CONST_SV(SDL_PATHTYPE_OTHER));
	bg_export_constant(aTHX_ stash, "SDL_ENUM_CONTINUE", BG_CONST_SV(SDL_ENUM_CONTINUE));
	bg_export_constant(aTHX_ stash, "SDL_ENUM_SUCCESS", BG_CONST_SV(SDL_ENUM_SUCCESS));
	bg_export_constant(aTHX_ stash, "SDL_ENUM_FAILURE", BG_CONST_SV(SDL_ENUM_FAILURE));
	}

MODULE = SDL3  PACKAGE = SDL3::PathInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_PathInfo), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_PathInfo)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PathInfo *self;
    PPCODE:
	self = (struct SDL_PathInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PathInfo", "SDL3::PathInfo::type");
	if (items > 1) {
		self->type = (SDL_PathType)bg_in_iv(aTHX_ ST(1), "SDL3::PathInfo::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
size(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PathInfo *self;
    PPCODE:
	self = (struct SDL_PathInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PathInfo", "SDL3::PathInfo::size");
	if (items > 1) {
		self->size = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::PathInfo::size");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->size)));
	XSRETURN(1);

void
create_time(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PathInfo *self;
    PPCODE:
	self = (struct SDL_PathInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PathInfo", "SDL3::PathInfo::create_time");
	if (items > 1) {
		self->create_time = (SDL_Time)bg_in_iv(aTHX_ ST(1), "SDL3::PathInfo::create_time");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->create_time)));
	XSRETURN(1);

void
modify_time(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PathInfo *self;
    PPCODE:
	self = (struct SDL_PathInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PathInfo", "SDL3::PathInfo::modify_time");
	if (items > 1) {
		self->modify_time = (SDL_Time)bg_in_iv(aTHX_ ST(1), "SDL3::PathInfo::modify_time");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->modify_time)));
	XSRETURN(1);

void
access_time(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_PathInfo *self;
    PPCODE:
	self = (struct SDL_PathInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::PathInfo", "SDL3::PathInfo::access_time");
	if (items > 1) {
		self->access_time = (SDL_Time)bg_in_iv(aTHX_ ST(1), "SDL3::PathInfo::access_time");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->access_time)));
	XSRETURN(1);
