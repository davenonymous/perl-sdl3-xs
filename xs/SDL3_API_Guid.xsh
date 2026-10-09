MODULE = SDL3  PACKAGE = SDL3::API::Guid

void
SDL_GUIDToString(sv_guid, sv_pszGUID, sv_cbGUID)
	SV *sv_guid
	SV *sv_pszGUID
	SV *sv_cbGUID
    PREINIT:
	struct SDL_GUID c_guid;
	char * c_pszGUID;
	int c_cbGUID;
    PPCODE:
	c_guid = *(struct SDL_GUID *)bg_in_record_value_ptr(aTHX_ sv_guid, "SDL3::GUID", "SDL_GUIDToString(guid)");
	c_pszGUID = (char *)bg_in_writable_string(aTHX_ sv_pszGUID, "SDL_GUIDToString(pszGUID)");
	c_cbGUID = (int)bg_in_iv(aTHX_ sv_cbGUID, "SDL_GUIDToString(cbGUID)");
	SDL_GUIDToString(c_guid, c_pszGUID, c_cbGUID);
	XSRETURN(0);

void
SDL_StringToGUID(sv_pchGUID)
	SV *sv_pchGUID
    PREINIT:
	const char * c_pchGUID;
	struct SDL_GUID c_bg_ret;
    PPCODE:
	c_pchGUID = (const char *)bg_in_string(aTHX_ sv_pchGUID, "SDL_StringToGUID(pchGUID)");
	c_bg_ret = SDL_StringToGUID(c_pchGUID);
	ST(0) = sv_2mortal(bg_out_record_copy(aTHX_ (const void *)&(c_bg_ret), sizeof(struct SDL_GUID), "SDL3::GUID"));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GUID

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GUID), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GUID)));
	XSRETURN(1);

void
data(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GUID *self;
	Size_t bg_i;
    PPCODE:
	self = (struct SDL_GUID *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GUID", "SDL3::GUID::data");
	if (items > 1) {
		if (items - 1 != 16) croak("%s expects 16 values, got %d", "SDL3::GUID::data", (int)(items - 1));
		for (bg_i = 0; bg_i < 16; bg_i++) self->data[bg_i] = (Uint8)bg_in_uv(aTHX_ ST(1 + bg_i), "SDL3::GUID::data");
		XSRETURN(1);
	}
	EXTEND(SP, 16);
	for (bg_i = 0; bg_i < 16; bg_i++) mPUSHs(newSVuv((UV)(self->data[bg_i])));
	XSRETURN(16);
