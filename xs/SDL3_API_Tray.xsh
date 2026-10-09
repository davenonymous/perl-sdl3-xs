MODULE = SDL3  PACKAGE = SDL3::API::Tray

void
SDL_CreateTray(sv_icon, sv_tooltip)
	SV *sv_icon
	SV *sv_tooltip
    PREINIT:
	SDL_Surface * c_icon;
	const char * c_tooltip;
	SDL_Tray * c_bg_ret;
    PPCODE:
	c_icon = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_icon, "SDL3::Surface", "SDL_CreateTray(icon)");
	c_tooltip = (const char *)bg_in_string(aTHX_ sv_tooltip, "SDL_CreateTray(tooltip)");
	c_bg_ret = SDL_CreateTray(c_icon, c_tooltip);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Tray"));
	XSRETURN(1);

void
SDL_SetTrayIcon(sv_tray, sv_icon)
	SV *sv_tray
	SV *sv_icon
    PREINIT:
	SDL_Tray * c_tray;
	SDL_Surface * c_icon;
    PPCODE:
	c_tray = (SDL_Tray *)bg_in_record_ptr(aTHX_ sv_tray, "SDL3::Tray", "SDL_SetTrayIcon(tray)");
	c_icon = (SDL_Surface *)bg_in_record_ptr(aTHX_ sv_icon, "SDL3::Surface", "SDL_SetTrayIcon(icon)");
	SDL_SetTrayIcon(c_tray, c_icon);
	XSRETURN(0);

void
SDL_SetTrayTooltip(sv_tray, sv_tooltip)
	SV *sv_tray
	SV *sv_tooltip
    PREINIT:
	SDL_Tray * c_tray;
	const char * c_tooltip;
    PPCODE:
	c_tray = (SDL_Tray *)bg_in_record_ptr(aTHX_ sv_tray, "SDL3::Tray", "SDL_SetTrayTooltip(tray)");
	c_tooltip = (const char *)bg_in_string(aTHX_ sv_tooltip, "SDL_SetTrayTooltip(tooltip)");
	SDL_SetTrayTooltip(c_tray, c_tooltip);
	XSRETURN(0);

void
SDL_CreateTrayMenu(sv_tray)
	SV *sv_tray
    PREINIT:
	SDL_Tray * c_tray;
	SDL_TrayMenu * c_bg_ret;
    PPCODE:
	c_tray = (SDL_Tray *)bg_in_record_ptr(aTHX_ sv_tray, "SDL3::Tray", "SDL_CreateTrayMenu(tray)");
	c_bg_ret = SDL_CreateTrayMenu(c_tray);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::TrayMenu"));
	XSRETURN(1);

void
SDL_CreateTraySubmenu(sv_entry)
	SV *sv_entry
    PREINIT:
	SDL_TrayEntry * c_entry;
	SDL_TrayMenu * c_bg_ret;
    PPCODE:
	c_entry = (SDL_TrayEntry *)bg_in_record_ptr(aTHX_ sv_entry, "SDL3::TrayEntry", "SDL_CreateTraySubmenu(entry)");
	c_bg_ret = SDL_CreateTraySubmenu(c_entry);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::TrayMenu"));
	XSRETURN(1);

void
SDL_GetTrayMenu(sv_tray)
	SV *sv_tray
    PREINIT:
	SDL_Tray * c_tray;
	SDL_TrayMenu * c_bg_ret;
    PPCODE:
	c_tray = (SDL_Tray *)bg_in_record_ptr(aTHX_ sv_tray, "SDL3::Tray", "SDL_GetTrayMenu(tray)");
	c_bg_ret = SDL_GetTrayMenu(c_tray);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::TrayMenu"));
	XSRETURN(1);

void
SDL_GetTraySubmenu(sv_entry)
	SV *sv_entry
    PREINIT:
	SDL_TrayEntry * c_entry;
	SDL_TrayMenu * c_bg_ret;
    PPCODE:
	c_entry = (SDL_TrayEntry *)bg_in_record_ptr(aTHX_ sv_entry, "SDL3::TrayEntry", "SDL_GetTraySubmenu(entry)");
	c_bg_ret = SDL_GetTraySubmenu(c_entry);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::TrayMenu"));
	XSRETURN(1);

void
SDL_GetTrayEntries(sv_menu, sv_count)
	SV *sv_menu
	SV *sv_count
    PREINIT:
	SDL_TrayMenu * c_menu;
	int c_count; int * p_count; SV *t_count;
	const SDL_TrayEntry ** c_bg_ret;
    PPCODE:
	c_menu = (SDL_TrayMenu *)bg_in_record_ptr(aTHX_ sv_menu, "SDL3::TrayMenu", "SDL_GetTrayEntries(menu)");
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetTrayEntries(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetTrayEntries(count)");
	c_bg_ret = SDL_GetTrayEntries(c_menu, p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_RemoveTrayEntry(sv_entry)
	SV *sv_entry
    PREINIT:
	SDL_TrayEntry * c_entry;
    PPCODE:
	c_entry = (SDL_TrayEntry *)bg_in_record_ptr(aTHX_ sv_entry, "SDL3::TrayEntry", "SDL_RemoveTrayEntry(entry)");
	SDL_RemoveTrayEntry(c_entry);
	XSRETURN(0);

void
SDL_InsertTrayEntryAt(sv_menu, sv_pos, sv_label, sv_flags)
	SV *sv_menu
	SV *sv_pos
	SV *sv_label
	SV *sv_flags
    PREINIT:
	SDL_TrayMenu * c_menu;
	int c_pos;
	const char * c_label;
	SDL_TrayEntryFlags c_flags;
	SDL_TrayEntry * c_bg_ret;
    PPCODE:
	c_menu = (SDL_TrayMenu *)bg_in_record_ptr(aTHX_ sv_menu, "SDL3::TrayMenu", "SDL_InsertTrayEntryAt(menu)");
	c_pos = (int)bg_in_iv(aTHX_ sv_pos, "SDL_InsertTrayEntryAt(pos)");
	c_label = (const char *)bg_in_string(aTHX_ sv_label, "SDL_InsertTrayEntryAt(label)");
	c_flags = (SDL_TrayEntryFlags)bg_in_uv(aTHX_ sv_flags, "SDL_InsertTrayEntryAt(flags)");
	c_bg_ret = SDL_InsertTrayEntryAt(c_menu, c_pos, c_label, c_flags);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::TrayEntry"));
	XSRETURN(1);

void
SDL_SetTrayEntryLabel(sv_entry, sv_label)
	SV *sv_entry
	SV *sv_label
    PREINIT:
	SDL_TrayEntry * c_entry;
	const char * c_label;
    PPCODE:
	c_entry = (SDL_TrayEntry *)bg_in_record_ptr(aTHX_ sv_entry, "SDL3::TrayEntry", "SDL_SetTrayEntryLabel(entry)");
	c_label = (const char *)bg_in_string(aTHX_ sv_label, "SDL_SetTrayEntryLabel(label)");
	SDL_SetTrayEntryLabel(c_entry, c_label);
	XSRETURN(0);

void
SDL_GetTrayEntryLabel(sv_entry)
	SV *sv_entry
    PREINIT:
	SDL_TrayEntry * c_entry;
	const char * c_bg_ret;
    PPCODE:
	c_entry = (SDL_TrayEntry *)bg_in_record_ptr(aTHX_ sv_entry, "SDL3::TrayEntry", "SDL_GetTrayEntryLabel(entry)");
	c_bg_ret = SDL_GetTrayEntryLabel(c_entry);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetTrayEntryChecked(sv_entry, sv_checked)
	SV *sv_entry
	SV *sv_checked
    PREINIT:
	SDL_TrayEntry * c_entry;
	_Bool c_checked;
    PPCODE:
	c_entry = (SDL_TrayEntry *)bg_in_record_ptr(aTHX_ sv_entry, "SDL3::TrayEntry", "SDL_SetTrayEntryChecked(entry)");
	c_checked = (_Bool)SvTRUE(sv_checked);
	SDL_SetTrayEntryChecked(c_entry, c_checked);
	XSRETURN(0);

void
SDL_GetTrayEntryChecked(sv_entry)
	SV *sv_entry
    PREINIT:
	SDL_TrayEntry * c_entry;
	_Bool c_bg_ret;
    PPCODE:
	c_entry = (SDL_TrayEntry *)bg_in_record_ptr(aTHX_ sv_entry, "SDL3::TrayEntry", "SDL_GetTrayEntryChecked(entry)");
	c_bg_ret = SDL_GetTrayEntryChecked(c_entry);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetTrayEntryEnabled(sv_entry, sv_enabled)
	SV *sv_entry
	SV *sv_enabled
    PREINIT:
	SDL_TrayEntry * c_entry;
	_Bool c_enabled;
    PPCODE:
	c_entry = (SDL_TrayEntry *)bg_in_record_ptr(aTHX_ sv_entry, "SDL3::TrayEntry", "SDL_SetTrayEntryEnabled(entry)");
	c_enabled = (_Bool)SvTRUE(sv_enabled);
	SDL_SetTrayEntryEnabled(c_entry, c_enabled);
	XSRETURN(0);

void
SDL_GetTrayEntryEnabled(sv_entry)
	SV *sv_entry
    PREINIT:
	SDL_TrayEntry * c_entry;
	_Bool c_bg_ret;
    PPCODE:
	c_entry = (SDL_TrayEntry *)bg_in_record_ptr(aTHX_ sv_entry, "SDL3::TrayEntry", "SDL_GetTrayEntryEnabled(entry)");
	c_bg_ret = SDL_GetTrayEntryEnabled(c_entry);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetTrayEntryCallback(sv_entry, sv_callback, sv_userdata)
	SV *sv_entry
	SV *sv_callback
	SV *sv_userdata
    PREINIT:
	SDL_TrayEntry * c_entry;
	SDL_TrayCallback c_callback;
	void * c_userdata;
    PPCODE:
	c_entry = (SDL_TrayEntry *)bg_in_record_ptr(aTHX_ sv_entry, "SDL3::TrayEntry", "SDL_SetTrayEntryCallback(entry)");
	c_callback = SvOK(sv_callback) ? (SDL_TrayCallback)bg_tramp_SDL_TrayCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_SetTrayEntryCallback(userdata)") : NULL;
	SDL_SetTrayEntryCallback(c_entry, c_callback, c_userdata);
	XSRETURN(0);

void
SDL_ClickTrayEntry(sv_entry)
	SV *sv_entry
    PREINIT:
	SDL_TrayEntry * c_entry;
    PPCODE:
	c_entry = (SDL_TrayEntry *)bg_in_record_ptr(aTHX_ sv_entry, "SDL3::TrayEntry", "SDL_ClickTrayEntry(entry)");
	SDL_ClickTrayEntry(c_entry);
	XSRETURN(0);

void
SDL_DestroyTray(sv_tray)
	SV *sv_tray
    PREINIT:
	SDL_Tray * c_tray;
    PPCODE:
	c_tray = (SDL_Tray *)bg_in_record_ptr(aTHX_ sv_tray, "SDL3::Tray", "SDL_DestroyTray(tray)");
	SDL_DestroyTray(c_tray);
	XSRETURN(0);

void
SDL_GetTrayEntryParent(sv_entry)
	SV *sv_entry
    PREINIT:
	SDL_TrayEntry * c_entry;
	SDL_TrayMenu * c_bg_ret;
    PPCODE:
	c_entry = (SDL_TrayEntry *)bg_in_record_ptr(aTHX_ sv_entry, "SDL3::TrayEntry", "SDL_GetTrayEntryParent(entry)");
	c_bg_ret = SDL_GetTrayEntryParent(c_entry);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::TrayMenu"));
	XSRETURN(1);

void
SDL_GetTrayMenuParentEntry(sv_menu)
	SV *sv_menu
    PREINIT:
	SDL_TrayMenu * c_menu;
	SDL_TrayEntry * c_bg_ret;
    PPCODE:
	c_menu = (SDL_TrayMenu *)bg_in_record_ptr(aTHX_ sv_menu, "SDL3::TrayMenu", "SDL_GetTrayMenuParentEntry(menu)");
	c_bg_ret = SDL_GetTrayMenuParentEntry(c_menu);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::TrayEntry"));
	XSRETURN(1);

void
SDL_GetTrayMenuParentTray(sv_menu)
	SV *sv_menu
    PREINIT:
	SDL_TrayMenu * c_menu;
	SDL_Tray * c_bg_ret;
    PPCODE:
	c_menu = (SDL_TrayMenu *)bg_in_record_ptr(aTHX_ sv_menu, "SDL3::TrayMenu", "SDL_GetTrayMenuParentTray(menu)");
	c_bg_ret = SDL_GetTrayMenuParentTray(c_menu);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Tray"));
	XSRETURN(1);

void
SDL_UpdateTrays()
    PPCODE:
	SDL_UpdateTrays();
	XSRETURN(0);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Tray", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_TRAYENTRY_BUTTON", BG_CONST_SV(SDL_TRAYENTRY_BUTTON));
	bg_export_constant(aTHX_ stash, "SDL_TRAYENTRY_CHECKBOX", BG_CONST_SV(SDL_TRAYENTRY_CHECKBOX));
	bg_export_constant(aTHX_ stash, "SDL_TRAYENTRY_CHECKED", BG_CONST_SV(SDL_TRAYENTRY_CHECKED));
	bg_export_constant(aTHX_ stash, "SDL_TRAYENTRY_DISABLED", BG_CONST_SV(SDL_TRAYENTRY_DISABLED));
	bg_export_constant(aTHX_ stash, "SDL_TRAYENTRY_SUBMENU", BG_CONST_SV(SDL_TRAYENTRY_SUBMENU));
	}



