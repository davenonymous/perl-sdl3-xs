MODULE = SDL3  PACKAGE = SDL3::API::Storage

void
SDL_OpenTitleStorage(sv_override, sv_props)
	SV *sv_override
	SV *sv_props
    PREINIT:
	const char * c_override;
	SDL_PropertiesID c_props;
	SDL_Storage * c_bg_ret;
    PPCODE:
	c_override = (const char *)bg_in_string(aTHX_ sv_override, "SDL_OpenTitleStorage(override)");
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_OpenTitleStorage(props)");
	c_bg_ret = SDL_OpenTitleStorage(c_override, c_props);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Storage"));
	XSRETURN(1);

void
SDL_OpenUserStorage(sv_org, sv_app, sv_props)
	SV *sv_org
	SV *sv_app
	SV *sv_props
    PREINIT:
	const char * c_org;
	const char * c_app;
	SDL_PropertiesID c_props;
	SDL_Storage * c_bg_ret;
    PPCODE:
	c_org = (const char *)bg_in_string(aTHX_ sv_org, "SDL_OpenUserStorage(org)");
	c_app = (const char *)bg_in_string(aTHX_ sv_app, "SDL_OpenUserStorage(app)");
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_OpenUserStorage(props)");
	c_bg_ret = SDL_OpenUserStorage(c_org, c_app, c_props);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Storage"));
	XSRETURN(1);

void
SDL_OpenFileStorage(sv_path)
	SV *sv_path
    PREINIT:
	const char * c_path;
	SDL_Storage * c_bg_ret;
    PPCODE:
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_OpenFileStorage(path)");
	c_bg_ret = SDL_OpenFileStorage(c_path);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Storage"));
	XSRETURN(1);

void
SDL_OpenStorage(sv_iface, sv_userdata)
	SV *sv_iface
	SV *sv_userdata
    PREINIT:
	const SDL_StorageInterface * c_iface;
	void * c_userdata;
	SDL_Storage * c_bg_ret;
    PPCODE:
	c_iface = (const SDL_StorageInterface *)bg_in_record_ptr(aTHX_ sv_iface, "SDL3::StorageInterface", "SDL_OpenStorage(iface)");
	c_userdata = (void *)bg_in_raw_ptr(aTHX_ sv_userdata, "SDL_OpenStorage(userdata)");
	c_bg_ret = SDL_OpenStorage(c_iface, c_userdata);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Storage"));
	XSRETURN(1);

void
SDL_CloseStorage(sv_storage)
	SV *sv_storage
    PREINIT:
	SDL_Storage * c_storage;
	_Bool c_bg_ret;
    PPCODE:
	c_storage = (SDL_Storage *)bg_in_record_ptr(aTHX_ sv_storage, "SDL3::Storage", "SDL_CloseStorage(storage)");
	c_bg_ret = SDL_CloseStorage(c_storage);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_StorageReady(sv_storage)
	SV *sv_storage
    PREINIT:
	SDL_Storage * c_storage;
	_Bool c_bg_ret;
    PPCODE:
	c_storage = (SDL_Storage *)bg_in_record_ptr(aTHX_ sv_storage, "SDL3::Storage", "SDL_StorageReady(storage)");
	c_bg_ret = SDL_StorageReady(c_storage);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetStorageFileSize(sv_storage, sv_path, sv_length)
	SV *sv_storage
	SV *sv_path
	SV *sv_length
    PREINIT:
	SDL_Storage * c_storage;
	const char * c_path;
	Uint64 c_length; Uint64 * p_length; SV *t_length;
	_Bool c_bg_ret;
    PPCODE:
	c_storage = (SDL_Storage *)bg_in_record_ptr(aTHX_ sv_storage, "SDL3::Storage", "SDL_GetStorageFileSize(storage)");
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_GetStorageFileSize(path)");
	t_length = bg_outref_target(aTHX_ sv_length);
	c_length = (t_length && SvOK(t_length)) ? (Uint64)bg_in_uv(aTHX_ t_length, "SDL_GetStorageFileSize(length)") : (Uint64)0;
	p_length = t_length ? &c_length : (Uint64 *)bg_outref_raw(aTHX_ sv_length, "SDL_GetStorageFileSize(length)");
	c_bg_ret = SDL_GetStorageFileSize(c_storage, c_path, p_length);
	if (t_length) sv_setsv(t_length, sv_2mortal(newSVuv((UV)(c_length))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadStorageFile(sv_storage, sv_path, sv_destination, sv_length)
	SV *sv_storage
	SV *sv_path
	SV *sv_destination
	SV *sv_length
    PREINIT:
	SDL_Storage * c_storage;
	const char * c_path;
	void * c_destination;
	Uint64 c_length;
	_Bool c_bg_ret;
    PPCODE:
	c_storage = (SDL_Storage *)bg_in_record_ptr(aTHX_ sv_storage, "SDL3::Storage", "SDL_ReadStorageFile(storage)");
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_ReadStorageFile(path)");
	c_destination = (void *)bg_in_raw_ptr(aTHX_ sv_destination, "SDL_ReadStorageFile(destination)");
	c_length = (Uint64)bg_in_uv(aTHX_ sv_length, "SDL_ReadStorageFile(length)");
	c_bg_ret = SDL_ReadStorageFile(c_storage, c_path, c_destination, c_length);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteStorageFile(sv_storage, sv_path, sv_source, sv_length)
	SV *sv_storage
	SV *sv_path
	SV *sv_source
	SV *sv_length
    PREINIT:
	SDL_Storage * c_storage;
	const char * c_path;
	const void * c_source;
	Uint64 c_length;
	_Bool c_bg_ret;
    PPCODE:
	c_storage = (SDL_Storage *)bg_in_record_ptr(aTHX_ sv_storage, "SDL3::Storage", "SDL_WriteStorageFile(storage)");
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_WriteStorageFile(path)");
	c_source = (const void *)bg_in_raw_ptr(aTHX_ sv_source, "SDL_WriteStorageFile(source)");
	c_length = (Uint64)bg_in_uv(aTHX_ sv_length, "SDL_WriteStorageFile(length)");
	c_bg_ret = SDL_WriteStorageFile(c_storage, c_path, c_source, c_length);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CreateStorageDirectory(sv_storage, sv_path)
	SV *sv_storage
	SV *sv_path
    PREINIT:
	SDL_Storage * c_storage;
	const char * c_path;
	_Bool c_bg_ret;
    PPCODE:
	c_storage = (SDL_Storage *)bg_in_record_ptr(aTHX_ sv_storage, "SDL3::Storage", "SDL_CreateStorageDirectory(storage)");
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_CreateStorageDirectory(path)");
	c_bg_ret = SDL_CreateStorageDirectory(c_storage, c_path);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_EnumerateStorageDirectory(sv_storage, sv_path, sv_callback, sv_userdata)
	SV *sv_storage
	SV *sv_path
	SV *sv_callback
	SV *sv_userdata
    PREINIT:
	SDL_Storage * c_storage;
	const char * c_path;
	SDL_EnumerateDirectoryCallback c_callback;
	void * c_userdata;
	_Bool c_bg_ret;
    PPCODE:
	c_storage = (SDL_Storage *)bg_in_record_ptr(aTHX_ sv_storage, "SDL3::Storage", "SDL_EnumerateStorageDirectory(storage)");
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_EnumerateStorageDirectory(path)");
	c_callback = SvOK(sv_callback) ? (SDL_EnumerateDirectoryCallback)bg_tramp_SDL_EnumerateDirectoryCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_EnumerateStorageDirectory(userdata)") : NULL;
	c_bg_ret = SDL_EnumerateStorageDirectory(c_storage, c_path, c_callback, c_userdata);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RemoveStoragePath(sv_storage, sv_path)
	SV *sv_storage
	SV *sv_path
    PREINIT:
	SDL_Storage * c_storage;
	const char * c_path;
	_Bool c_bg_ret;
    PPCODE:
	c_storage = (SDL_Storage *)bg_in_record_ptr(aTHX_ sv_storage, "SDL3::Storage", "SDL_RemoveStoragePath(storage)");
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_RemoveStoragePath(path)");
	c_bg_ret = SDL_RemoveStoragePath(c_storage, c_path);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RenameStoragePath(sv_storage, sv_oldpath, sv_newpath)
	SV *sv_storage
	SV *sv_oldpath
	SV *sv_newpath
    PREINIT:
	SDL_Storage * c_storage;
	const char * c_oldpath;
	const char * c_newpath;
	_Bool c_bg_ret;
    PPCODE:
	c_storage = (SDL_Storage *)bg_in_record_ptr(aTHX_ sv_storage, "SDL3::Storage", "SDL_RenameStoragePath(storage)");
	c_oldpath = (const char *)bg_in_string(aTHX_ sv_oldpath, "SDL_RenameStoragePath(oldpath)");
	c_newpath = (const char *)bg_in_string(aTHX_ sv_newpath, "SDL_RenameStoragePath(newpath)");
	c_bg_ret = SDL_RenameStoragePath(c_storage, c_oldpath, c_newpath);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CopyStorageFile(sv_storage, sv_oldpath, sv_newpath)
	SV *sv_storage
	SV *sv_oldpath
	SV *sv_newpath
    PREINIT:
	SDL_Storage * c_storage;
	const char * c_oldpath;
	const char * c_newpath;
	_Bool c_bg_ret;
    PPCODE:
	c_storage = (SDL_Storage *)bg_in_record_ptr(aTHX_ sv_storage, "SDL3::Storage", "SDL_CopyStorageFile(storage)");
	c_oldpath = (const char *)bg_in_string(aTHX_ sv_oldpath, "SDL_CopyStorageFile(oldpath)");
	c_newpath = (const char *)bg_in_string(aTHX_ sv_newpath, "SDL_CopyStorageFile(newpath)");
	c_bg_ret = SDL_CopyStorageFile(c_storage, c_oldpath, c_newpath);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetStoragePathInfo(sv_storage, sv_path, sv_info)
	SV *sv_storage
	SV *sv_path
	SV *sv_info
    PREINIT:
	SDL_Storage * c_storage;
	const char * c_path;
	SDL_PathInfo * c_info;
	_Bool c_bg_ret;
    PPCODE:
	c_storage = (SDL_Storage *)bg_in_record_ptr(aTHX_ sv_storage, "SDL3::Storage", "SDL_GetStoragePathInfo(storage)");
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_GetStoragePathInfo(path)");
	c_info = (SDL_PathInfo *)bg_in_record_ptr(aTHX_ sv_info, "SDL3::PathInfo", "SDL_GetStoragePathInfo(info)");
	c_bg_ret = SDL_GetStoragePathInfo(c_storage, c_path, c_info);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetStorageSpaceRemaining(sv_storage)
	SV *sv_storage
    PREINIT:
	SDL_Storage * c_storage;
	Uint64 c_bg_ret;
    PPCODE:
	c_storage = (SDL_Storage *)bg_in_record_ptr(aTHX_ sv_storage, "SDL3::Storage", "SDL_GetStorageSpaceRemaining(storage)");
	c_bg_ret = SDL_GetStorageSpaceRemaining(c_storage);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GlobStorageDirectory(sv_storage, sv_path, sv_pattern, sv_flags, sv_count)
	SV *sv_storage
	SV *sv_path
	SV *sv_pattern
	SV *sv_flags
	SV *sv_count
    PREINIT:
	SDL_Storage * c_storage;
	const char * c_path;
	const char * c_pattern;
	SDL_GlobFlags c_flags;
	int c_count; int * p_count; SV *t_count;
	char ** c_bg_ret;
    PPCODE:
	c_storage = (SDL_Storage *)bg_in_record_ptr(aTHX_ sv_storage, "SDL3::Storage", "SDL_GlobStorageDirectory(storage)");
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_GlobStorageDirectory(path)");
	c_pattern = (const char *)bg_in_string(aTHX_ sv_pattern, "SDL_GlobStorageDirectory(pattern)");
	c_flags = (SDL_GlobFlags)bg_in_uv(aTHX_ sv_flags, "SDL_GlobStorageDirectory(flags)");
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GlobStorageDirectory(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GlobStorageDirectory(count)");
	c_bg_ret = SDL_GlobStorageDirectory(c_storage, c_path, c_pattern, c_flags, p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::StorageInterface

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_StorageInterface), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_StorageInterface)));
	XSRETURN(1);

void
version(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_StorageInterface *self;
    PPCODE:
	self = (struct SDL_StorageInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::StorageInterface", "SDL3::StorageInterface::version");
	if (items > 1) {
		self->version = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::StorageInterface::version");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->version)));
	XSRETURN(1);

void
close(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_StorageInterface *self;
    PPCODE:
	self = (struct SDL_StorageInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::StorageInterface", "SDL3::StorageInterface::close");
	if (items > 1) {
		self->close = (_Bool (*)(void *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::StorageInterface::close");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->close), "SDL3::Pointer"));
	XSRETURN(1);

void
ready(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_StorageInterface *self;
    PPCODE:
	self = (struct SDL_StorageInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::StorageInterface", "SDL3::StorageInterface::ready");
	if (items > 1) {
		self->ready = (_Bool (*)(void *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::StorageInterface::ready");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->ready), "SDL3::Pointer"));
	XSRETURN(1);

void
enumerate(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_StorageInterface *self;
    PPCODE:
	self = (struct SDL_StorageInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::StorageInterface", "SDL3::StorageInterface::enumerate");
	if (items > 1) {
		self->enumerate = (_Bool (*)(void *, const char *, SDL_EnumerateDirectoryCallback, void *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::StorageInterface::enumerate");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->enumerate), "SDL3::Pointer"));
	XSRETURN(1);

void
info(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_StorageInterface *self;
    PPCODE:
	self = (struct SDL_StorageInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::StorageInterface", "SDL3::StorageInterface::info");
	if (items > 1) {
		self->info = (_Bool (*)(void *, const char *, SDL_PathInfo *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::StorageInterface::info");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->info), "SDL3::Pointer"));
	XSRETURN(1);

void
read_file(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_StorageInterface *self;
    PPCODE:
	self = (struct SDL_StorageInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::StorageInterface", "SDL3::StorageInterface::read_file");
	if (items > 1) {
		self->read_file = (_Bool (*)(void *, const char *, void *, Uint64))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::StorageInterface::read_file");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->read_file), "SDL3::Pointer"));
	XSRETURN(1);

void
write_file(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_StorageInterface *self;
    PPCODE:
	self = (struct SDL_StorageInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::StorageInterface", "SDL3::StorageInterface::write_file");
	if (items > 1) {
		self->write_file = (_Bool (*)(void *, const char *, const void *, Uint64))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::StorageInterface::write_file");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->write_file), "SDL3::Pointer"));
	XSRETURN(1);

void
mkdir(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_StorageInterface *self;
    PPCODE:
	self = (struct SDL_StorageInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::StorageInterface", "SDL3::StorageInterface::mkdir");
	if (items > 1) {
		self->mkdir = (_Bool (*)(void *, const char *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::StorageInterface::mkdir");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->mkdir), "SDL3::Pointer"));
	XSRETURN(1);

void
remove(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_StorageInterface *self;
    PPCODE:
	self = (struct SDL_StorageInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::StorageInterface", "SDL3::StorageInterface::remove");
	if (items > 1) {
		self->remove = (_Bool (*)(void *, const char *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::StorageInterface::remove");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->remove), "SDL3::Pointer"));
	XSRETURN(1);

void
rename(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_StorageInterface *self;
    PPCODE:
	self = (struct SDL_StorageInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::StorageInterface", "SDL3::StorageInterface::rename");
	if (items > 1) {
		self->rename = (_Bool (*)(void *, const char *, const char *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::StorageInterface::rename");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->rename), "SDL3::Pointer"));
	XSRETURN(1);

void
copy(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_StorageInterface *self;
    PPCODE:
	self = (struct SDL_StorageInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::StorageInterface", "SDL3::StorageInterface::copy");
	if (items > 1) {
		self->copy = (_Bool (*)(void *, const char *, const char *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::StorageInterface::copy");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->copy), "SDL3::Pointer"));
	XSRETURN(1);

void
space_remaining(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_StorageInterface *self;
    PPCODE:
	self = (struct SDL_StorageInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::StorageInterface", "SDL3::StorageInterface::space_remaining");
	if (items > 1) {
		self->space_remaining = (Uint64 (*)(void *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::StorageInterface::space_remaining");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->space_remaining), "SDL3::Pointer"));
	XSRETURN(1);

