MODULE = SDL3  PACKAGE = SDL3::API::Haptic

void
SDL_GetHaptics(sv_count)
	SV *sv_count
    PREINIT:
	int c_count; int * p_count; SV *t_count;
	SDL_HapticID * c_bg_ret;
    PPCODE:
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetHaptics(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetHaptics(count)");
	c_bg_ret = SDL_GetHaptics(p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetHapticNameForID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_HapticID c_instance_id;
	const char * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_HapticID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetHapticNameForID(instance_id)");
	c_bg_ret = SDL_GetHapticNameForID(c_instance_id);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_OpenHaptic(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_HapticID c_instance_id;
	SDL_Haptic * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_HapticID)bg_in_uv(aTHX_ sv_instance_id, "SDL_OpenHaptic(instance_id)");
	c_bg_ret = SDL_OpenHaptic(c_instance_id);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Haptic"));
	XSRETURN(1);

void
SDL_GetHapticFromID(sv_instance_id)
	SV *sv_instance_id
    PREINIT:
	SDL_HapticID c_instance_id;
	SDL_Haptic * c_bg_ret;
    PPCODE:
	c_instance_id = (SDL_HapticID)bg_in_uv(aTHX_ sv_instance_id, "SDL_GetHapticFromID(instance_id)");
	c_bg_ret = SDL_GetHapticFromID(c_instance_id);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Haptic"));
	XSRETURN(1);

void
SDL_GetHapticID(sv_haptic)
	SV *sv_haptic
    PREINIT:
	SDL_Haptic * c_haptic;
	SDL_HapticID c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_GetHapticID(haptic)");
	c_bg_ret = SDL_GetHapticID(c_haptic);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetHapticName(sv_haptic)
	SV *sv_haptic
    PREINIT:
	SDL_Haptic * c_haptic;
	const char * c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_GetHapticName(haptic)");
	c_bg_ret = SDL_GetHapticName(c_haptic);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_IsMouseHaptic()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_IsMouseHaptic();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_OpenHapticFromMouse()
    PREINIT:
	SDL_Haptic * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_OpenHapticFromMouse();
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Haptic"));
	XSRETURN(1);

void
SDL_IsJoystickHaptic(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	_Bool c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_IsJoystickHaptic(joystick)");
	c_bg_ret = SDL_IsJoystickHaptic(c_joystick);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_OpenHapticFromJoystick(sv_joystick)
	SV *sv_joystick
    PREINIT:
	SDL_Joystick * c_joystick;
	SDL_Haptic * c_bg_ret;
    PPCODE:
	c_joystick = (SDL_Joystick *)bg_in_record_ptr(aTHX_ sv_joystick, "SDL3::Joystick", "SDL_OpenHapticFromJoystick(joystick)");
	c_bg_ret = SDL_OpenHapticFromJoystick(c_joystick);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Haptic"));
	XSRETURN(1);

void
SDL_CloseHaptic(sv_haptic)
	SV *sv_haptic
    PREINIT:
	SDL_Haptic * c_haptic;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_CloseHaptic(haptic)");
	SDL_CloseHaptic(c_haptic);
	XSRETURN(0);

void
SDL_GetMaxHapticEffects(sv_haptic)
	SV *sv_haptic
    PREINIT:
	SDL_Haptic * c_haptic;
	int c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_GetMaxHapticEffects(haptic)");
	c_bg_ret = SDL_GetMaxHapticEffects(c_haptic);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetMaxHapticEffectsPlaying(sv_haptic)
	SV *sv_haptic
    PREINIT:
	SDL_Haptic * c_haptic;
	int c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_GetMaxHapticEffectsPlaying(haptic)");
	c_bg_ret = SDL_GetMaxHapticEffectsPlaying(c_haptic);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetHapticFeatures(sv_haptic)
	SV *sv_haptic
    PREINIT:
	SDL_Haptic * c_haptic;
	Uint32 c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_GetHapticFeatures(haptic)");
	c_bg_ret = SDL_GetHapticFeatures(c_haptic);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetNumHapticAxes(sv_haptic)
	SV *sv_haptic
    PREINIT:
	SDL_Haptic * c_haptic;
	int c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_GetNumHapticAxes(haptic)");
	c_bg_ret = SDL_GetNumHapticAxes(c_haptic);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_HapticEffectSupported(sv_haptic, sv_effect)
	SV *sv_haptic
	SV *sv_effect
    PREINIT:
	SDL_Haptic * c_haptic;
	const SDL_HapticEffect * c_effect;
	_Bool c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_HapticEffectSupported(haptic)");
	c_effect = (const SDL_HapticEffect *)bg_in_record_ptr(aTHX_ sv_effect, "SDL3::HapticEffect", "SDL_HapticEffectSupported(effect)");
	c_bg_ret = SDL_HapticEffectSupported(c_haptic, c_effect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CreateHapticEffect(sv_haptic, sv_effect)
	SV *sv_haptic
	SV *sv_effect
    PREINIT:
	SDL_Haptic * c_haptic;
	const SDL_HapticEffect * c_effect;
	SDL_HapticEffectID c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_CreateHapticEffect(haptic)");
	c_effect = (const SDL_HapticEffect *)bg_in_record_ptr(aTHX_ sv_effect, "SDL3::HapticEffect", "SDL_CreateHapticEffect(effect)");
	c_bg_ret = SDL_CreateHapticEffect(c_haptic, c_effect);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_UpdateHapticEffect(sv_haptic, sv_effect, sv_data)
	SV *sv_haptic
	SV *sv_effect
	SV *sv_data
    PREINIT:
	SDL_Haptic * c_haptic;
	SDL_HapticEffectID c_effect;
	const SDL_HapticEffect * c_data;
	_Bool c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_UpdateHapticEffect(haptic)");
	c_effect = (SDL_HapticEffectID)bg_in_iv(aTHX_ sv_effect, "SDL_UpdateHapticEffect(effect)");
	c_data = (const SDL_HapticEffect *)bg_in_record_ptr(aTHX_ sv_data, "SDL3::HapticEffect", "SDL_UpdateHapticEffect(data)");
	c_bg_ret = SDL_UpdateHapticEffect(c_haptic, c_effect, c_data);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RunHapticEffect(sv_haptic, sv_effect, sv_iterations)
	SV *sv_haptic
	SV *sv_effect
	SV *sv_iterations
    PREINIT:
	SDL_Haptic * c_haptic;
	SDL_HapticEffectID c_effect;
	Uint32 c_iterations;
	_Bool c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_RunHapticEffect(haptic)");
	c_effect = (SDL_HapticEffectID)bg_in_iv(aTHX_ sv_effect, "SDL_RunHapticEffect(effect)");
	c_iterations = (Uint32)bg_in_uv(aTHX_ sv_iterations, "SDL_RunHapticEffect(iterations)");
	c_bg_ret = SDL_RunHapticEffect(c_haptic, c_effect, c_iterations);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_StopHapticEffect(sv_haptic, sv_effect)
	SV *sv_haptic
	SV *sv_effect
    PREINIT:
	SDL_Haptic * c_haptic;
	SDL_HapticEffectID c_effect;
	_Bool c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_StopHapticEffect(haptic)");
	c_effect = (SDL_HapticEffectID)bg_in_iv(aTHX_ sv_effect, "SDL_StopHapticEffect(effect)");
	c_bg_ret = SDL_StopHapticEffect(c_haptic, c_effect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_DestroyHapticEffect(sv_haptic, sv_effect)
	SV *sv_haptic
	SV *sv_effect
    PREINIT:
	SDL_Haptic * c_haptic;
	SDL_HapticEffectID c_effect;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_DestroyHapticEffect(haptic)");
	c_effect = (SDL_HapticEffectID)bg_in_iv(aTHX_ sv_effect, "SDL_DestroyHapticEffect(effect)");
	SDL_DestroyHapticEffect(c_haptic, c_effect);
	XSRETURN(0);

void
SDL_GetHapticEffectStatus(sv_haptic, sv_effect)
	SV *sv_haptic
	SV *sv_effect
    PREINIT:
	SDL_Haptic * c_haptic;
	SDL_HapticEffectID c_effect;
	_Bool c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_GetHapticEffectStatus(haptic)");
	c_effect = (SDL_HapticEffectID)bg_in_iv(aTHX_ sv_effect, "SDL_GetHapticEffectStatus(effect)");
	c_bg_ret = SDL_GetHapticEffectStatus(c_haptic, c_effect);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetHapticGain(sv_haptic, sv_gain)
	SV *sv_haptic
	SV *sv_gain
    PREINIT:
	SDL_Haptic * c_haptic;
	int c_gain;
	_Bool c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_SetHapticGain(haptic)");
	c_gain = (int)bg_in_iv(aTHX_ sv_gain, "SDL_SetHapticGain(gain)");
	c_bg_ret = SDL_SetHapticGain(c_haptic, c_gain);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetHapticAutocenter(sv_haptic, sv_autocenter)
	SV *sv_haptic
	SV *sv_autocenter
    PREINIT:
	SDL_Haptic * c_haptic;
	int c_autocenter;
	_Bool c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_SetHapticAutocenter(haptic)");
	c_autocenter = (int)bg_in_iv(aTHX_ sv_autocenter, "SDL_SetHapticAutocenter(autocenter)");
	c_bg_ret = SDL_SetHapticAutocenter(c_haptic, c_autocenter);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_PauseHaptic(sv_haptic)
	SV *sv_haptic
    PREINIT:
	SDL_Haptic * c_haptic;
	_Bool c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_PauseHaptic(haptic)");
	c_bg_ret = SDL_PauseHaptic(c_haptic);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ResumeHaptic(sv_haptic)
	SV *sv_haptic
    PREINIT:
	SDL_Haptic * c_haptic;
	_Bool c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_ResumeHaptic(haptic)");
	c_bg_ret = SDL_ResumeHaptic(c_haptic);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_StopHapticEffects(sv_haptic)
	SV *sv_haptic
    PREINIT:
	SDL_Haptic * c_haptic;
	_Bool c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_StopHapticEffects(haptic)");
	c_bg_ret = SDL_StopHapticEffects(c_haptic);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HapticRumbleSupported(sv_haptic)
	SV *sv_haptic
    PREINIT:
	SDL_Haptic * c_haptic;
	_Bool c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_HapticRumbleSupported(haptic)");
	c_bg_ret = SDL_HapticRumbleSupported(c_haptic);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_InitHapticRumble(sv_haptic)
	SV *sv_haptic
    PREINIT:
	SDL_Haptic * c_haptic;
	_Bool c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_InitHapticRumble(haptic)");
	c_bg_ret = SDL_InitHapticRumble(c_haptic);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_PlayHapticRumble(sv_haptic, sv_strength, sv_length)
	SV *sv_haptic
	SV *sv_strength
	SV *sv_length
    PREINIT:
	SDL_Haptic * c_haptic;
	float c_strength;
	Uint32 c_length;
	_Bool c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_PlayHapticRumble(haptic)");
	c_strength = (float)bg_in_nv(aTHX_ sv_strength, "SDL_PlayHapticRumble(strength)");
	c_length = (Uint32)bg_in_uv(aTHX_ sv_length, "SDL_PlayHapticRumble(length)");
	c_bg_ret = SDL_PlayHapticRumble(c_haptic, c_strength, c_length);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_StopHapticRumble(sv_haptic)
	SV *sv_haptic
    PREINIT:
	SDL_Haptic * c_haptic;
	_Bool c_bg_ret;
    PPCODE:
	c_haptic = (SDL_Haptic *)bg_in_record_ptr(aTHX_ sv_haptic, "SDL3::Haptic", "SDL_StopHapticRumble(haptic)");
	c_bg_ret = SDL_StopHapticRumble(c_haptic);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Haptic", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_AUTOCENTER", BG_CONST_SV(SDL_HAPTIC_AUTOCENTER));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_CARTESIAN", BG_CONST_SV(SDL_HAPTIC_CARTESIAN));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_CONSTANT", BG_CONST_SV(SDL_HAPTIC_CONSTANT));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_CUSTOM", BG_CONST_SV(SDL_HAPTIC_CUSTOM));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_DAMPER", BG_CONST_SV(SDL_HAPTIC_DAMPER));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_FRICTION", BG_CONST_SV(SDL_HAPTIC_FRICTION));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_GAIN", BG_CONST_SV(SDL_HAPTIC_GAIN));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_INERTIA", BG_CONST_SV(SDL_HAPTIC_INERTIA));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_INFINITY", BG_CONST_SV(SDL_HAPTIC_INFINITY));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_LEFTRIGHT", BG_CONST_SV(SDL_HAPTIC_LEFTRIGHT));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_PAUSE", BG_CONST_SV(SDL_HAPTIC_PAUSE));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_POLAR", BG_CONST_SV(SDL_HAPTIC_POLAR));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_RAMP", BG_CONST_SV(SDL_HAPTIC_RAMP));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_RESERVED1", BG_CONST_SV(SDL_HAPTIC_RESERVED1));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_RESERVED2", BG_CONST_SV(SDL_HAPTIC_RESERVED2));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_RESERVED3", BG_CONST_SV(SDL_HAPTIC_RESERVED3));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_SAWTOOTHDOWN", BG_CONST_SV(SDL_HAPTIC_SAWTOOTHDOWN));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_SAWTOOTHUP", BG_CONST_SV(SDL_HAPTIC_SAWTOOTHUP));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_SINE", BG_CONST_SV(SDL_HAPTIC_SINE));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_SPHERICAL", BG_CONST_SV(SDL_HAPTIC_SPHERICAL));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_SPRING", BG_CONST_SV(SDL_HAPTIC_SPRING));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_SQUARE", BG_CONST_SV(SDL_HAPTIC_SQUARE));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_STATUS", BG_CONST_SV(SDL_HAPTIC_STATUS));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_STEERING_AXIS", BG_CONST_SV(SDL_HAPTIC_STEERING_AXIS));
	bg_export_constant(aTHX_ stash, "SDL_HAPTIC_TRIANGLE", BG_CONST_SV(SDL_HAPTIC_TRIANGLE));
	}


MODULE = SDL3  PACKAGE = SDL3::HapticDirection

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_HapticDirection), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_HapticDirection)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticDirection *self;
    PPCODE:
	self = (struct SDL_HapticDirection *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticDirection", "SDL3::HapticDirection::type");
	if (items > 1) {
		self->type = (SDL_HapticDirectionType)bg_in_uv(aTHX_ ST(1), "SDL3::HapticDirection::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->type)));
	XSRETURN(1);

void
dir(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticDirection *self;
	Size_t bg_i;
    PPCODE:
	self = (struct SDL_HapticDirection *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticDirection", "SDL3::HapticDirection::dir");
	if (items > 1) {
		if (items - 1 != 3) croak("%s expects 3 values, got %d", "SDL3::HapticDirection::dir", (int)(items - 1));
		for (bg_i = 0; bg_i < 3; bg_i++) self->dir[bg_i] = (Sint32)bg_in_iv(aTHX_ ST(1 + bg_i), "SDL3::HapticDirection::dir");
		XSRETURN(1);
	}
	EXTEND(SP, 3);
	for (bg_i = 0; bg_i < 3; bg_i++) mPUSHs(newSViv((IV)(self->dir[bg_i])));
	XSRETURN(3);

MODULE = SDL3  PACKAGE = SDL3::HapticConstant

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_HapticConstant), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_HapticConstant)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticConstant *self;
    PPCODE:
	self = (struct SDL_HapticConstant *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticConstant", "SDL3::HapticConstant::type");
	if (items > 1) {
		self->type = (SDL_HapticEffectType)bg_in_uv(aTHX_ ST(1), "SDL3::HapticConstant::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->type)));
	XSRETURN(1);

void
direction(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticConstant *self;
    PPCODE:
	self = (struct SDL_HapticConstant *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticConstant", "SDL3::HapticConstant::direction");
	if (items > 1) {
		self->direction = *(struct SDL_HapticDirection *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::HapticDirection", "SDL3::HapticConstant::direction");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->direction), "SDL3::HapticDirection"));
	XSRETURN(1);

void
length(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticConstant *self;
    PPCODE:
	self = (struct SDL_HapticConstant *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticConstant", "SDL3::HapticConstant::length");
	if (items > 1) {
		self->length = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::HapticConstant::length");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->length)));
	XSRETURN(1);

void
delay(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticConstant *self;
    PPCODE:
	self = (struct SDL_HapticConstant *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticConstant", "SDL3::HapticConstant::delay");
	if (items > 1) {
		self->delay = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticConstant::delay");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->delay)));
	XSRETURN(1);

void
button(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticConstant *self;
    PPCODE:
	self = (struct SDL_HapticConstant *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticConstant", "SDL3::HapticConstant::button");
	if (items > 1) {
		self->button = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticConstant::button");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->button)));
	XSRETURN(1);

void
interval(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticConstant *self;
    PPCODE:
	self = (struct SDL_HapticConstant *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticConstant", "SDL3::HapticConstant::interval");
	if (items > 1) {
		self->interval = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticConstant::interval");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->interval)));
	XSRETURN(1);

void
level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticConstant *self;
    PPCODE:
	self = (struct SDL_HapticConstant *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticConstant", "SDL3::HapticConstant::level");
	if (items > 1) {
		self->level = (Sint16)bg_in_iv(aTHX_ ST(1), "SDL3::HapticConstant::level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->level)));
	XSRETURN(1);

void
attack_length(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticConstant *self;
    PPCODE:
	self = (struct SDL_HapticConstant *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticConstant", "SDL3::HapticConstant::attack_length");
	if (items > 1) {
		self->attack_length = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticConstant::attack_length");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->attack_length)));
	XSRETURN(1);

void
attack_level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticConstant *self;
    PPCODE:
	self = (struct SDL_HapticConstant *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticConstant", "SDL3::HapticConstant::attack_level");
	if (items > 1) {
		self->attack_level = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticConstant::attack_level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->attack_level)));
	XSRETURN(1);

void
fade_length(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticConstant *self;
    PPCODE:
	self = (struct SDL_HapticConstant *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticConstant", "SDL3::HapticConstant::fade_length");
	if (items > 1) {
		self->fade_length = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticConstant::fade_length");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->fade_length)));
	XSRETURN(1);

void
fade_level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticConstant *self;
    PPCODE:
	self = (struct SDL_HapticConstant *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticConstant", "SDL3::HapticConstant::fade_level");
	if (items > 1) {
		self->fade_level = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticConstant::fade_level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->fade_level)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::HapticPeriodic

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_HapticPeriodic), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_HapticPeriodic)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticPeriodic *self;
    PPCODE:
	self = (struct SDL_HapticPeriodic *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticPeriodic", "SDL3::HapticPeriodic::type");
	if (items > 1) {
		self->type = (SDL_HapticEffectType)bg_in_uv(aTHX_ ST(1), "SDL3::HapticPeriodic::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->type)));
	XSRETURN(1);

void
direction(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticPeriodic *self;
    PPCODE:
	self = (struct SDL_HapticPeriodic *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticPeriodic", "SDL3::HapticPeriodic::direction");
	if (items > 1) {
		self->direction = *(struct SDL_HapticDirection *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::HapticDirection", "SDL3::HapticPeriodic::direction");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->direction), "SDL3::HapticDirection"));
	XSRETURN(1);

void
length(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticPeriodic *self;
    PPCODE:
	self = (struct SDL_HapticPeriodic *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticPeriodic", "SDL3::HapticPeriodic::length");
	if (items > 1) {
		self->length = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::HapticPeriodic::length");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->length)));
	XSRETURN(1);

void
delay(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticPeriodic *self;
    PPCODE:
	self = (struct SDL_HapticPeriodic *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticPeriodic", "SDL3::HapticPeriodic::delay");
	if (items > 1) {
		self->delay = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticPeriodic::delay");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->delay)));
	XSRETURN(1);

void
button(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticPeriodic *self;
    PPCODE:
	self = (struct SDL_HapticPeriodic *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticPeriodic", "SDL3::HapticPeriodic::button");
	if (items > 1) {
		self->button = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticPeriodic::button");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->button)));
	XSRETURN(1);

void
interval(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticPeriodic *self;
    PPCODE:
	self = (struct SDL_HapticPeriodic *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticPeriodic", "SDL3::HapticPeriodic::interval");
	if (items > 1) {
		self->interval = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticPeriodic::interval");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->interval)));
	XSRETURN(1);

void
period(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticPeriodic *self;
    PPCODE:
	self = (struct SDL_HapticPeriodic *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticPeriodic", "SDL3::HapticPeriodic::period");
	if (items > 1) {
		self->period = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticPeriodic::period");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->period)));
	XSRETURN(1);

void
magnitude(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticPeriodic *self;
    PPCODE:
	self = (struct SDL_HapticPeriodic *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticPeriodic", "SDL3::HapticPeriodic::magnitude");
	if (items > 1) {
		self->magnitude = (Sint16)bg_in_iv(aTHX_ ST(1), "SDL3::HapticPeriodic::magnitude");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->magnitude)));
	XSRETURN(1);

void
offset(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticPeriodic *self;
    PPCODE:
	self = (struct SDL_HapticPeriodic *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticPeriodic", "SDL3::HapticPeriodic::offset");
	if (items > 1) {
		self->offset = (Sint16)bg_in_iv(aTHX_ ST(1), "SDL3::HapticPeriodic::offset");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->offset)));
	XSRETURN(1);

void
phase(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticPeriodic *self;
    PPCODE:
	self = (struct SDL_HapticPeriodic *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticPeriodic", "SDL3::HapticPeriodic::phase");
	if (items > 1) {
		self->phase = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticPeriodic::phase");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->phase)));
	XSRETURN(1);

void
attack_length(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticPeriodic *self;
    PPCODE:
	self = (struct SDL_HapticPeriodic *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticPeriodic", "SDL3::HapticPeriodic::attack_length");
	if (items > 1) {
		self->attack_length = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticPeriodic::attack_length");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->attack_length)));
	XSRETURN(1);

void
attack_level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticPeriodic *self;
    PPCODE:
	self = (struct SDL_HapticPeriodic *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticPeriodic", "SDL3::HapticPeriodic::attack_level");
	if (items > 1) {
		self->attack_level = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticPeriodic::attack_level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->attack_level)));
	XSRETURN(1);

void
fade_length(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticPeriodic *self;
    PPCODE:
	self = (struct SDL_HapticPeriodic *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticPeriodic", "SDL3::HapticPeriodic::fade_length");
	if (items > 1) {
		self->fade_length = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticPeriodic::fade_length");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->fade_length)));
	XSRETURN(1);

void
fade_level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticPeriodic *self;
    PPCODE:
	self = (struct SDL_HapticPeriodic *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticPeriodic", "SDL3::HapticPeriodic::fade_level");
	if (items > 1) {
		self->fade_level = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticPeriodic::fade_level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->fade_level)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::HapticCondition

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_HapticCondition), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_HapticCondition)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCondition *self;
    PPCODE:
	self = (struct SDL_HapticCondition *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCondition", "SDL3::HapticCondition::type");
	if (items > 1) {
		self->type = (SDL_HapticEffectType)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCondition::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->type)));
	XSRETURN(1);

void
direction(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCondition *self;
    PPCODE:
	self = (struct SDL_HapticCondition *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCondition", "SDL3::HapticCondition::direction");
	if (items > 1) {
		self->direction = *(struct SDL_HapticDirection *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::HapticDirection", "SDL3::HapticCondition::direction");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->direction), "SDL3::HapticDirection"));
	XSRETURN(1);

void
length(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCondition *self;
    PPCODE:
	self = (struct SDL_HapticCondition *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCondition", "SDL3::HapticCondition::length");
	if (items > 1) {
		self->length = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCondition::length");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->length)));
	XSRETURN(1);

void
delay(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCondition *self;
    PPCODE:
	self = (struct SDL_HapticCondition *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCondition", "SDL3::HapticCondition::delay");
	if (items > 1) {
		self->delay = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCondition::delay");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->delay)));
	XSRETURN(1);

void
button(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCondition *self;
    PPCODE:
	self = (struct SDL_HapticCondition *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCondition", "SDL3::HapticCondition::button");
	if (items > 1) {
		self->button = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCondition::button");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->button)));
	XSRETURN(1);

void
interval(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCondition *self;
    PPCODE:
	self = (struct SDL_HapticCondition *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCondition", "SDL3::HapticCondition::interval");
	if (items > 1) {
		self->interval = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCondition::interval");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->interval)));
	XSRETURN(1);

void
right_sat(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCondition *self;
	Size_t bg_i;
    PPCODE:
	self = (struct SDL_HapticCondition *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCondition", "SDL3::HapticCondition::right_sat");
	if (items > 1) {
		if (items - 1 != 3) croak("%s expects 3 values, got %d", "SDL3::HapticCondition::right_sat", (int)(items - 1));
		for (bg_i = 0; bg_i < 3; bg_i++) self->right_sat[bg_i] = (Uint16)bg_in_uv(aTHX_ ST(1 + bg_i), "SDL3::HapticCondition::right_sat");
		XSRETURN(1);
	}
	EXTEND(SP, 3);
	for (bg_i = 0; bg_i < 3; bg_i++) mPUSHs(newSVuv((UV)(self->right_sat[bg_i])));
	XSRETURN(3);

void
left_sat(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCondition *self;
	Size_t bg_i;
    PPCODE:
	self = (struct SDL_HapticCondition *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCondition", "SDL3::HapticCondition::left_sat");
	if (items > 1) {
		if (items - 1 != 3) croak("%s expects 3 values, got %d", "SDL3::HapticCondition::left_sat", (int)(items - 1));
		for (bg_i = 0; bg_i < 3; bg_i++) self->left_sat[bg_i] = (Uint16)bg_in_uv(aTHX_ ST(1 + bg_i), "SDL3::HapticCondition::left_sat");
		XSRETURN(1);
	}
	EXTEND(SP, 3);
	for (bg_i = 0; bg_i < 3; bg_i++) mPUSHs(newSVuv((UV)(self->left_sat[bg_i])));
	XSRETURN(3);

void
right_coeff(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCondition *self;
	Size_t bg_i;
    PPCODE:
	self = (struct SDL_HapticCondition *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCondition", "SDL3::HapticCondition::right_coeff");
	if (items > 1) {
		if (items - 1 != 3) croak("%s expects 3 values, got %d", "SDL3::HapticCondition::right_coeff", (int)(items - 1));
		for (bg_i = 0; bg_i < 3; bg_i++) self->right_coeff[bg_i] = (Sint16)bg_in_iv(aTHX_ ST(1 + bg_i), "SDL3::HapticCondition::right_coeff");
		XSRETURN(1);
	}
	EXTEND(SP, 3);
	for (bg_i = 0; bg_i < 3; bg_i++) mPUSHs(newSViv((IV)(self->right_coeff[bg_i])));
	XSRETURN(3);

void
left_coeff(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCondition *self;
	Size_t bg_i;
    PPCODE:
	self = (struct SDL_HapticCondition *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCondition", "SDL3::HapticCondition::left_coeff");
	if (items > 1) {
		if (items - 1 != 3) croak("%s expects 3 values, got %d", "SDL3::HapticCondition::left_coeff", (int)(items - 1));
		for (bg_i = 0; bg_i < 3; bg_i++) self->left_coeff[bg_i] = (Sint16)bg_in_iv(aTHX_ ST(1 + bg_i), "SDL3::HapticCondition::left_coeff");
		XSRETURN(1);
	}
	EXTEND(SP, 3);
	for (bg_i = 0; bg_i < 3; bg_i++) mPUSHs(newSViv((IV)(self->left_coeff[bg_i])));
	XSRETURN(3);

void
deadband(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCondition *self;
	Size_t bg_i;
    PPCODE:
	self = (struct SDL_HapticCondition *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCondition", "SDL3::HapticCondition::deadband");
	if (items > 1) {
		if (items - 1 != 3) croak("%s expects 3 values, got %d", "SDL3::HapticCondition::deadband", (int)(items - 1));
		for (bg_i = 0; bg_i < 3; bg_i++) self->deadband[bg_i] = (Uint16)bg_in_uv(aTHX_ ST(1 + bg_i), "SDL3::HapticCondition::deadband");
		XSRETURN(1);
	}
	EXTEND(SP, 3);
	for (bg_i = 0; bg_i < 3; bg_i++) mPUSHs(newSVuv((UV)(self->deadband[bg_i])));
	XSRETURN(3);

void
center(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCondition *self;
	Size_t bg_i;
    PPCODE:
	self = (struct SDL_HapticCondition *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCondition", "SDL3::HapticCondition::center");
	if (items > 1) {
		if (items - 1 != 3) croak("%s expects 3 values, got %d", "SDL3::HapticCondition::center", (int)(items - 1));
		for (bg_i = 0; bg_i < 3; bg_i++) self->center[bg_i] = (Sint16)bg_in_iv(aTHX_ ST(1 + bg_i), "SDL3::HapticCondition::center");
		XSRETURN(1);
	}
	EXTEND(SP, 3);
	for (bg_i = 0; bg_i < 3; bg_i++) mPUSHs(newSViv((IV)(self->center[bg_i])));
	XSRETURN(3);

MODULE = SDL3  PACKAGE = SDL3::HapticRamp

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_HapticRamp), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_HapticRamp)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticRamp *self;
    PPCODE:
	self = (struct SDL_HapticRamp *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticRamp", "SDL3::HapticRamp::type");
	if (items > 1) {
		self->type = (SDL_HapticEffectType)bg_in_uv(aTHX_ ST(1), "SDL3::HapticRamp::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->type)));
	XSRETURN(1);

void
direction(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticRamp *self;
    PPCODE:
	self = (struct SDL_HapticRamp *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticRamp", "SDL3::HapticRamp::direction");
	if (items > 1) {
		self->direction = *(struct SDL_HapticDirection *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::HapticDirection", "SDL3::HapticRamp::direction");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->direction), "SDL3::HapticDirection"));
	XSRETURN(1);

void
length(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticRamp *self;
    PPCODE:
	self = (struct SDL_HapticRamp *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticRamp", "SDL3::HapticRamp::length");
	if (items > 1) {
		self->length = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::HapticRamp::length");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->length)));
	XSRETURN(1);

void
delay(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticRamp *self;
    PPCODE:
	self = (struct SDL_HapticRamp *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticRamp", "SDL3::HapticRamp::delay");
	if (items > 1) {
		self->delay = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticRamp::delay");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->delay)));
	XSRETURN(1);

void
button(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticRamp *self;
    PPCODE:
	self = (struct SDL_HapticRamp *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticRamp", "SDL3::HapticRamp::button");
	if (items > 1) {
		self->button = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticRamp::button");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->button)));
	XSRETURN(1);

void
interval(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticRamp *self;
    PPCODE:
	self = (struct SDL_HapticRamp *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticRamp", "SDL3::HapticRamp::interval");
	if (items > 1) {
		self->interval = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticRamp::interval");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->interval)));
	XSRETURN(1);

void
start(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticRamp *self;
    PPCODE:
	self = (struct SDL_HapticRamp *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticRamp", "SDL3::HapticRamp::start");
	if (items > 1) {
		self->start = (Sint16)bg_in_iv(aTHX_ ST(1), "SDL3::HapticRamp::start");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->start)));
	XSRETURN(1);

void
end(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticRamp *self;
    PPCODE:
	self = (struct SDL_HapticRamp *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticRamp", "SDL3::HapticRamp::end");
	if (items > 1) {
		self->end = (Sint16)bg_in_iv(aTHX_ ST(1), "SDL3::HapticRamp::end");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->end)));
	XSRETURN(1);

void
attack_length(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticRamp *self;
    PPCODE:
	self = (struct SDL_HapticRamp *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticRamp", "SDL3::HapticRamp::attack_length");
	if (items > 1) {
		self->attack_length = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticRamp::attack_length");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->attack_length)));
	XSRETURN(1);

void
attack_level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticRamp *self;
    PPCODE:
	self = (struct SDL_HapticRamp *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticRamp", "SDL3::HapticRamp::attack_level");
	if (items > 1) {
		self->attack_level = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticRamp::attack_level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->attack_level)));
	XSRETURN(1);

void
fade_length(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticRamp *self;
    PPCODE:
	self = (struct SDL_HapticRamp *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticRamp", "SDL3::HapticRamp::fade_length");
	if (items > 1) {
		self->fade_length = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticRamp::fade_length");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->fade_length)));
	XSRETURN(1);

void
fade_level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticRamp *self;
    PPCODE:
	self = (struct SDL_HapticRamp *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticRamp", "SDL3::HapticRamp::fade_level");
	if (items > 1) {
		self->fade_level = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticRamp::fade_level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->fade_level)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::HapticLeftRight

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_HapticLeftRight), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_HapticLeftRight)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticLeftRight *self;
    PPCODE:
	self = (struct SDL_HapticLeftRight *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticLeftRight", "SDL3::HapticLeftRight::type");
	if (items > 1) {
		self->type = (SDL_HapticEffectType)bg_in_uv(aTHX_ ST(1), "SDL3::HapticLeftRight::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->type)));
	XSRETURN(1);

void
length(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticLeftRight *self;
    PPCODE:
	self = (struct SDL_HapticLeftRight *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticLeftRight", "SDL3::HapticLeftRight::length");
	if (items > 1) {
		self->length = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::HapticLeftRight::length");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->length)));
	XSRETURN(1);

void
large_magnitude(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticLeftRight *self;
    PPCODE:
	self = (struct SDL_HapticLeftRight *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticLeftRight", "SDL3::HapticLeftRight::large_magnitude");
	if (items > 1) {
		self->large_magnitude = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticLeftRight::large_magnitude");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->large_magnitude)));
	XSRETURN(1);

void
small_magnitude(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticLeftRight *self;
    PPCODE:
	self = (struct SDL_HapticLeftRight *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticLeftRight", "SDL3::HapticLeftRight::small_magnitude");
	if (items > 1) {
		self->small_magnitude = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticLeftRight::small_magnitude");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->small_magnitude)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::HapticCustom

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_HapticCustom), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_HapticCustom)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCustom *self;
    PPCODE:
	self = (struct SDL_HapticCustom *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCustom", "SDL3::HapticCustom::type");
	if (items > 1) {
		self->type = (SDL_HapticEffectType)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCustom::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->type)));
	XSRETURN(1);

void
direction(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCustom *self;
    PPCODE:
	self = (struct SDL_HapticCustom *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCustom", "SDL3::HapticCustom::direction");
	if (items > 1) {
		self->direction = *(struct SDL_HapticDirection *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::HapticDirection", "SDL3::HapticCustom::direction");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->direction), "SDL3::HapticDirection"));
	XSRETURN(1);

void
length(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCustom *self;
    PPCODE:
	self = (struct SDL_HapticCustom *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCustom", "SDL3::HapticCustom::length");
	if (items > 1) {
		self->length = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCustom::length");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->length)));
	XSRETURN(1);

void
delay(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCustom *self;
    PPCODE:
	self = (struct SDL_HapticCustom *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCustom", "SDL3::HapticCustom::delay");
	if (items > 1) {
		self->delay = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCustom::delay");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->delay)));
	XSRETURN(1);

void
button(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCustom *self;
    PPCODE:
	self = (struct SDL_HapticCustom *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCustom", "SDL3::HapticCustom::button");
	if (items > 1) {
		self->button = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCustom::button");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->button)));
	XSRETURN(1);

void
interval(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCustom *self;
    PPCODE:
	self = (struct SDL_HapticCustom *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCustom", "SDL3::HapticCustom::interval");
	if (items > 1) {
		self->interval = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCustom::interval");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->interval)));
	XSRETURN(1);

void
channels(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCustom *self;
    PPCODE:
	self = (struct SDL_HapticCustom *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCustom", "SDL3::HapticCustom::channels");
	if (items > 1) {
		self->channels = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCustom::channels");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->channels)));
	XSRETURN(1);

void
period(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCustom *self;
    PPCODE:
	self = (struct SDL_HapticCustom *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCustom", "SDL3::HapticCustom::period");
	if (items > 1) {
		self->period = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCustom::period");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->period)));
	XSRETURN(1);

void
samples(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCustom *self;
    PPCODE:
	self = (struct SDL_HapticCustom *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCustom", "SDL3::HapticCustom::samples");
	if (items > 1) {
		self->samples = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCustom::samples");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->samples)));
	XSRETURN(1);

void
data(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCustom *self;
    PPCODE:
	self = (struct SDL_HapticCustom *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCustom", "SDL3::HapticCustom::data");
	if (items > 1) {
		self->data = (Uint16 *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::HapticCustom::data");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->data), "SDL3::Pointer"));
	XSRETURN(1);

void
attack_length(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCustom *self;
    PPCODE:
	self = (struct SDL_HapticCustom *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCustom", "SDL3::HapticCustom::attack_length");
	if (items > 1) {
		self->attack_length = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCustom::attack_length");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->attack_length)));
	XSRETURN(1);

void
attack_level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCustom *self;
    PPCODE:
	self = (struct SDL_HapticCustom *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCustom", "SDL3::HapticCustom::attack_level");
	if (items > 1) {
		self->attack_level = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCustom::attack_level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->attack_level)));
	XSRETURN(1);

void
fade_length(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCustom *self;
    PPCODE:
	self = (struct SDL_HapticCustom *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCustom", "SDL3::HapticCustom::fade_length");
	if (items > 1) {
		self->fade_length = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCustom::fade_length");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->fade_length)));
	XSRETURN(1);

void
fade_level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_HapticCustom *self;
    PPCODE:
	self = (struct SDL_HapticCustom *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticCustom", "SDL3::HapticCustom::fade_level");
	if (items > 1) {
		self->fade_level = (Uint16)bg_in_uv(aTHX_ ST(1), "SDL3::HapticCustom::fade_level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->fade_level)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::HapticEffect

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(union SDL_HapticEffect), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(union SDL_HapticEffect)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_HapticEffect *self;
    PPCODE:
	self = (union SDL_HapticEffect *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticEffect", "SDL3::HapticEffect::type");
	if (items > 1) {
		self->type = (SDL_HapticEffectType)bg_in_uv(aTHX_ ST(1), "SDL3::HapticEffect::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->type)));
	XSRETURN(1);

void
constant(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_HapticEffect *self;
    PPCODE:
	self = (union SDL_HapticEffect *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticEffect", "SDL3::HapticEffect::constant");
	if (items > 1) {
		self->constant = *(struct SDL_HapticConstant *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::HapticConstant", "SDL3::HapticEffect::constant");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->constant), "SDL3::HapticConstant"));
	XSRETURN(1);

void
periodic(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_HapticEffect *self;
    PPCODE:
	self = (union SDL_HapticEffect *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticEffect", "SDL3::HapticEffect::periodic");
	if (items > 1) {
		self->periodic = *(struct SDL_HapticPeriodic *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::HapticPeriodic", "SDL3::HapticEffect::periodic");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->periodic), "SDL3::HapticPeriodic"));
	XSRETURN(1);

void
condition(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_HapticEffect *self;
    PPCODE:
	self = (union SDL_HapticEffect *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticEffect", "SDL3::HapticEffect::condition");
	if (items > 1) {
		self->condition = *(struct SDL_HapticCondition *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::HapticCondition", "SDL3::HapticEffect::condition");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->condition), "SDL3::HapticCondition"));
	XSRETURN(1);

void
ramp(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_HapticEffect *self;
    PPCODE:
	self = (union SDL_HapticEffect *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticEffect", "SDL3::HapticEffect::ramp");
	if (items > 1) {
		self->ramp = *(struct SDL_HapticRamp *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::HapticRamp", "SDL3::HapticEffect::ramp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->ramp), "SDL3::HapticRamp"));
	XSRETURN(1);

void
leftright(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_HapticEffect *self;
    PPCODE:
	self = (union SDL_HapticEffect *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticEffect", "SDL3::HapticEffect::leftright");
	if (items > 1) {
		self->leftright = *(struct SDL_HapticLeftRight *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::HapticLeftRight", "SDL3::HapticEffect::leftright");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->leftright), "SDL3::HapticLeftRight"));
	XSRETURN(1);

void
custom(sv_self, ...)
	SV *sv_self
    PREINIT:
	union SDL_HapticEffect *self;
    PPCODE:
	self = (union SDL_HapticEffect *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HapticEffect", "SDL3::HapticEffect::custom");
	if (items > 1) {
		self->custom = *(struct SDL_HapticCustom *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::HapticCustom", "SDL3::HapticEffect::custom");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->custom), "SDL3::HapticCustom"));
	XSRETURN(1);
