MODULE = SDL3  PACKAGE = SDL3::API::Locale

void
SDL_GetPreferredLocales(sv_count)
	SV *sv_count
    PREINIT:
	int c_count; int * p_count; SV *t_count;
	SDL_Locale ** c_bg_ret;
    PPCODE:
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetPreferredLocales(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetPreferredLocales(count)");
	c_bg_ret = SDL_GetPreferredLocales(p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::Locale

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_Locale), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_Locale)));
	XSRETURN(1);

void
language(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Locale *self;
    PPCODE:
	self = (struct SDL_Locale *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Locale", "SDL3::Locale::language");
	if (items > 1) {
		self->language = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::Locale::language");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->language)));
	XSRETURN(1);

void
country(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Locale *self;
    PPCODE:
	self = (struct SDL_Locale *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Locale", "SDL3::Locale::country");
	if (items > 1) {
		self->country = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::Locale::country");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->country)));
	XSRETURN(1);
