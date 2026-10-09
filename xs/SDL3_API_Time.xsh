MODULE = SDL3  PACKAGE = SDL3::API::Time

void
SDL_GetDateTimeLocalePreferences(sv_dateFormat, sv_timeFormat)
	SV *sv_dateFormat
	SV *sv_timeFormat
    PREINIT:
	SDL_DateFormat c_dateFormat; SDL_DateFormat * p_dateFormat; SV *t_dateFormat;
	SDL_TimeFormat c_timeFormat; SDL_TimeFormat * p_timeFormat; SV *t_timeFormat;
	_Bool c_bg_ret;
    PPCODE:
	t_dateFormat = bg_outref_target(aTHX_ sv_dateFormat);
	c_dateFormat = (t_dateFormat && SvOK(t_dateFormat)) ? (SDL_DateFormat)bg_in_iv(aTHX_ t_dateFormat, "SDL_GetDateTimeLocalePreferences(dateFormat)") : (SDL_DateFormat)0;
	p_dateFormat = t_dateFormat ? &c_dateFormat : (SDL_DateFormat *)bg_outref_raw(aTHX_ sv_dateFormat, "SDL_GetDateTimeLocalePreferences(dateFormat)");
	t_timeFormat = bg_outref_target(aTHX_ sv_timeFormat);
	c_timeFormat = (t_timeFormat && SvOK(t_timeFormat)) ? (SDL_TimeFormat)bg_in_iv(aTHX_ t_timeFormat, "SDL_GetDateTimeLocalePreferences(timeFormat)") : (SDL_TimeFormat)0;
	p_timeFormat = t_timeFormat ? &c_timeFormat : (SDL_TimeFormat *)bg_outref_raw(aTHX_ sv_timeFormat, "SDL_GetDateTimeLocalePreferences(timeFormat)");
	c_bg_ret = SDL_GetDateTimeLocalePreferences(p_dateFormat, p_timeFormat);
	if (t_dateFormat) sv_setsv(t_dateFormat, sv_2mortal(newSViv((IV)(c_dateFormat))));
	if (t_timeFormat) sv_setsv(t_timeFormat, sv_2mortal(newSViv((IV)(c_timeFormat))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetCurrentTime(sv_ticks)
	SV *sv_ticks
    PREINIT:
	SDL_Time c_ticks; SDL_Time * p_ticks; SV *t_ticks;
	_Bool c_bg_ret;
    PPCODE:
	t_ticks = bg_outref_target(aTHX_ sv_ticks);
	c_ticks = (t_ticks && SvOK(t_ticks)) ? (SDL_Time)bg_in_iv(aTHX_ t_ticks, "SDL_GetCurrentTime(ticks)") : (SDL_Time)0;
	p_ticks = t_ticks ? &c_ticks : (SDL_Time *)bg_outref_raw(aTHX_ sv_ticks, "SDL_GetCurrentTime(ticks)");
	c_bg_ret = SDL_GetCurrentTime(p_ticks);
	if (t_ticks) sv_setsv(t_ticks, sv_2mortal(newSViv((IV)(c_ticks))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_TimeToDateTime(sv_ticks, sv_dt, sv_localTime)
	SV *sv_ticks
	SV *sv_dt
	SV *sv_localTime
    PREINIT:
	SDL_Time c_ticks;
	SDL_DateTime * c_dt;
	_Bool c_localTime;
	_Bool c_bg_ret;
    PPCODE:
	c_ticks = (SDL_Time)bg_in_iv(aTHX_ sv_ticks, "SDL_TimeToDateTime(ticks)");
	c_dt = (SDL_DateTime *)bg_in_record_ptr(aTHX_ sv_dt, "SDL3::DateTime", "SDL_TimeToDateTime(dt)");
	c_localTime = (_Bool)SvTRUE(sv_localTime);
	c_bg_ret = SDL_TimeToDateTime(c_ticks, c_dt, c_localTime);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_DateTimeToTime(sv_dt, sv_ticks)
	SV *sv_dt
	SV *sv_ticks
    PREINIT:
	const SDL_DateTime * c_dt;
	SDL_Time c_ticks; SDL_Time * p_ticks; SV *t_ticks;
	_Bool c_bg_ret;
    PPCODE:
	c_dt = (const SDL_DateTime *)bg_in_record_ptr(aTHX_ sv_dt, "SDL3::DateTime", "SDL_DateTimeToTime(dt)");
	t_ticks = bg_outref_target(aTHX_ sv_ticks);
	c_ticks = (t_ticks && SvOK(t_ticks)) ? (SDL_Time)bg_in_iv(aTHX_ t_ticks, "SDL_DateTimeToTime(ticks)") : (SDL_Time)0;
	p_ticks = t_ticks ? &c_ticks : (SDL_Time *)bg_outref_raw(aTHX_ sv_ticks, "SDL_DateTimeToTime(ticks)");
	c_bg_ret = SDL_DateTimeToTime(c_dt, p_ticks);
	if (t_ticks) sv_setsv(t_ticks, sv_2mortal(newSViv((IV)(c_ticks))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_TimeToWindows(sv_ticks, sv_dwLowDateTime, sv_dwHighDateTime)
	SV *sv_ticks
	SV *sv_dwLowDateTime
	SV *sv_dwHighDateTime
    PREINIT:
	SDL_Time c_ticks;
	Uint32 c_dwLowDateTime; Uint32 * p_dwLowDateTime; SV *t_dwLowDateTime;
	Uint32 c_dwHighDateTime; Uint32 * p_dwHighDateTime; SV *t_dwHighDateTime;
    PPCODE:
	c_ticks = (SDL_Time)bg_in_iv(aTHX_ sv_ticks, "SDL_TimeToWindows(ticks)");
	t_dwLowDateTime = bg_outref_target(aTHX_ sv_dwLowDateTime);
	c_dwLowDateTime = (t_dwLowDateTime && SvOK(t_dwLowDateTime)) ? (Uint32)bg_in_uv(aTHX_ t_dwLowDateTime, "SDL_TimeToWindows(dwLowDateTime)") : (Uint32)0;
	p_dwLowDateTime = t_dwLowDateTime ? &c_dwLowDateTime : (Uint32 *)bg_outref_raw(aTHX_ sv_dwLowDateTime, "SDL_TimeToWindows(dwLowDateTime)");
	t_dwHighDateTime = bg_outref_target(aTHX_ sv_dwHighDateTime);
	c_dwHighDateTime = (t_dwHighDateTime && SvOK(t_dwHighDateTime)) ? (Uint32)bg_in_uv(aTHX_ t_dwHighDateTime, "SDL_TimeToWindows(dwHighDateTime)") : (Uint32)0;
	p_dwHighDateTime = t_dwHighDateTime ? &c_dwHighDateTime : (Uint32 *)bg_outref_raw(aTHX_ sv_dwHighDateTime, "SDL_TimeToWindows(dwHighDateTime)");
	SDL_TimeToWindows(c_ticks, p_dwLowDateTime, p_dwHighDateTime);
	if (t_dwLowDateTime) sv_setsv(t_dwLowDateTime, sv_2mortal(newSVuv((UV)(c_dwLowDateTime))));
	if (t_dwHighDateTime) sv_setsv(t_dwHighDateTime, sv_2mortal(newSVuv((UV)(c_dwHighDateTime))));
	XSRETURN(0);

void
SDL_TimeFromWindows(sv_dwLowDateTime, sv_dwHighDateTime)
	SV *sv_dwLowDateTime
	SV *sv_dwHighDateTime
    PREINIT:
	Uint32 c_dwLowDateTime;
	Uint32 c_dwHighDateTime;
	SDL_Time c_bg_ret;
    PPCODE:
	c_dwLowDateTime = (Uint32)bg_in_uv(aTHX_ sv_dwLowDateTime, "SDL_TimeFromWindows(dwLowDateTime)");
	c_dwHighDateTime = (Uint32)bg_in_uv(aTHX_ sv_dwHighDateTime, "SDL_TimeFromWindows(dwHighDateTime)");
	c_bg_ret = SDL_TimeFromWindows(c_dwLowDateTime, c_dwHighDateTime);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetDaysInMonth(sv_year, sv_month)
	SV *sv_year
	SV *sv_month
    PREINIT:
	int c_year;
	int c_month;
	int c_bg_ret;
    PPCODE:
	c_year = (int)bg_in_iv(aTHX_ sv_year, "SDL_GetDaysInMonth(year)");
	c_month = (int)bg_in_iv(aTHX_ sv_month, "SDL_GetDaysInMonth(month)");
	c_bg_ret = SDL_GetDaysInMonth(c_year, c_month);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetDayOfYear(sv_year, sv_month, sv_day)
	SV *sv_year
	SV *sv_month
	SV *sv_day
    PREINIT:
	int c_year;
	int c_month;
	int c_day;
	int c_bg_ret;
    PPCODE:
	c_year = (int)bg_in_iv(aTHX_ sv_year, "SDL_GetDayOfYear(year)");
	c_month = (int)bg_in_iv(aTHX_ sv_month, "SDL_GetDayOfYear(month)");
	c_day = (int)bg_in_iv(aTHX_ sv_day, "SDL_GetDayOfYear(day)");
	c_bg_ret = SDL_GetDayOfYear(c_year, c_month, c_day);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetDayOfWeek(sv_year, sv_month, sv_day)
	SV *sv_year
	SV *sv_month
	SV *sv_day
    PREINIT:
	int c_year;
	int c_month;
	int c_day;
	int c_bg_ret;
    PPCODE:
	c_year = (int)bg_in_iv(aTHX_ sv_year, "SDL_GetDayOfWeek(year)");
	c_month = (int)bg_in_iv(aTHX_ sv_month, "SDL_GetDayOfWeek(month)");
	c_day = (int)bg_in_iv(aTHX_ sv_day, "SDL_GetDayOfWeek(day)");
	c_bg_ret = SDL_GetDayOfWeek(c_year, c_month, c_day);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Time", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_DATE_FORMAT_YYYYMMDD", BG_CONST_SV(SDL_DATE_FORMAT_YYYYMMDD));
	bg_export_constant(aTHX_ stash, "SDL_DATE_FORMAT_DDMMYYYY", BG_CONST_SV(SDL_DATE_FORMAT_DDMMYYYY));
	bg_export_constant(aTHX_ stash, "SDL_DATE_FORMAT_MMDDYYYY", BG_CONST_SV(SDL_DATE_FORMAT_MMDDYYYY));
	bg_export_constant(aTHX_ stash, "SDL_TIME_FORMAT_24HR", BG_CONST_SV(SDL_TIME_FORMAT_24HR));
	bg_export_constant(aTHX_ stash, "SDL_TIME_FORMAT_12HR", BG_CONST_SV(SDL_TIME_FORMAT_12HR));
	}

MODULE = SDL3  PACKAGE = SDL3::DateTime

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_DateTime), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_DateTime)));
	XSRETURN(1);

void
year(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DateTime *self;
    PPCODE:
	self = (struct SDL_DateTime *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DateTime", "SDL3::DateTime::year");
	if (items > 1) {
		self->year = (int)bg_in_iv(aTHX_ ST(1), "SDL3::DateTime::year");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->year)));
	XSRETURN(1);

void
month(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DateTime *self;
    PPCODE:
	self = (struct SDL_DateTime *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DateTime", "SDL3::DateTime::month");
	if (items > 1) {
		self->month = (int)bg_in_iv(aTHX_ ST(1), "SDL3::DateTime::month");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->month)));
	XSRETURN(1);

void
day(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DateTime *self;
    PPCODE:
	self = (struct SDL_DateTime *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DateTime", "SDL3::DateTime::day");
	if (items > 1) {
		self->day = (int)bg_in_iv(aTHX_ ST(1), "SDL3::DateTime::day");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->day)));
	XSRETURN(1);

void
hour(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DateTime *self;
    PPCODE:
	self = (struct SDL_DateTime *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DateTime", "SDL3::DateTime::hour");
	if (items > 1) {
		self->hour = (int)bg_in_iv(aTHX_ ST(1), "SDL3::DateTime::hour");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->hour)));
	XSRETURN(1);

void
minute(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DateTime *self;
    PPCODE:
	self = (struct SDL_DateTime *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DateTime", "SDL3::DateTime::minute");
	if (items > 1) {
		self->minute = (int)bg_in_iv(aTHX_ ST(1), "SDL3::DateTime::minute");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->minute)));
	XSRETURN(1);

void
second(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DateTime *self;
    PPCODE:
	self = (struct SDL_DateTime *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DateTime", "SDL3::DateTime::second");
	if (items > 1) {
		self->second = (int)bg_in_iv(aTHX_ ST(1), "SDL3::DateTime::second");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->second)));
	XSRETURN(1);

void
nanosecond(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DateTime *self;
    PPCODE:
	self = (struct SDL_DateTime *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DateTime", "SDL3::DateTime::nanosecond");
	if (items > 1) {
		self->nanosecond = (int)bg_in_iv(aTHX_ ST(1), "SDL3::DateTime::nanosecond");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->nanosecond)));
	XSRETURN(1);

void
day_of_week(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DateTime *self;
    PPCODE:
	self = (struct SDL_DateTime *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DateTime", "SDL3::DateTime::day_of_week");
	if (items > 1) {
		self->day_of_week = (int)bg_in_iv(aTHX_ ST(1), "SDL3::DateTime::day_of_week");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->day_of_week)));
	XSRETURN(1);

void
utc_offset(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_DateTime *self;
    PPCODE:
	self = (struct SDL_DateTime *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::DateTime", "SDL3::DateTime::utc_offset");
	if (items > 1) {
		self->utc_offset = (int)bg_in_iv(aTHX_ ST(1), "SDL3::DateTime::utc_offset");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->utc_offset)));
	XSRETURN(1);
