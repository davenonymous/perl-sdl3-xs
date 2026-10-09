MODULE = SDL3  PACKAGE = SDL3::API::Atomic

void
SDL_TryLockSpinlock(sv_lock)
	SV *sv_lock
    PREINIT:
	SDL_SpinLock c_lock; SDL_SpinLock * p_lock; SV *t_lock;
	_Bool c_bg_ret;
    PPCODE:
	t_lock = bg_outref_target(aTHX_ sv_lock);
	c_lock = (t_lock && SvOK(t_lock)) ? (SDL_SpinLock)bg_in_iv(aTHX_ t_lock, "SDL_TryLockSpinlock(lock)") : (SDL_SpinLock)0;
	p_lock = t_lock ? &c_lock : (SDL_SpinLock *)bg_outref_raw(aTHX_ sv_lock, "SDL_TryLockSpinlock(lock)");
	c_bg_ret = SDL_TryLockSpinlock(p_lock);
	if (t_lock) sv_setsv(t_lock, sv_2mortal(newSViv((IV)(c_lock))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_LockSpinlock(sv_lock)
	SV *sv_lock
    PREINIT:
	SDL_SpinLock c_lock; SDL_SpinLock * p_lock; SV *t_lock;
    PPCODE:
	t_lock = bg_outref_target(aTHX_ sv_lock);
	c_lock = (t_lock && SvOK(t_lock)) ? (SDL_SpinLock)bg_in_iv(aTHX_ t_lock, "SDL_LockSpinlock(lock)") : (SDL_SpinLock)0;
	p_lock = t_lock ? &c_lock : (SDL_SpinLock *)bg_outref_raw(aTHX_ sv_lock, "SDL_LockSpinlock(lock)");
	SDL_LockSpinlock(p_lock);
	if (t_lock) sv_setsv(t_lock, sv_2mortal(newSViv((IV)(c_lock))));
	XSRETURN(0);

void
SDL_UnlockSpinlock(sv_lock)
	SV *sv_lock
    PREINIT:
	SDL_SpinLock c_lock; SDL_SpinLock * p_lock; SV *t_lock;
    PPCODE:
	t_lock = bg_outref_target(aTHX_ sv_lock);
	c_lock = (t_lock && SvOK(t_lock)) ? (SDL_SpinLock)bg_in_iv(aTHX_ t_lock, "SDL_UnlockSpinlock(lock)") : (SDL_SpinLock)0;
	p_lock = t_lock ? &c_lock : (SDL_SpinLock *)bg_outref_raw(aTHX_ sv_lock, "SDL_UnlockSpinlock(lock)");
	SDL_UnlockSpinlock(p_lock);
	if (t_lock) sv_setsv(t_lock, sv_2mortal(newSViv((IV)(c_lock))));
	XSRETURN(0);

void
SDL_MemoryBarrierReleaseFunction()
    PPCODE:
	SDL_MemoryBarrierReleaseFunction();
	XSRETURN(0);

void
SDL_MemoryBarrierAcquireFunction()
    PPCODE:
	SDL_MemoryBarrierAcquireFunction();
	XSRETURN(0);

void
SDL_CompareAndSwapAtomicInt(sv_a, sv_oldval, sv_newval)
	SV *sv_a
	SV *sv_oldval
	SV *sv_newval
    PREINIT:
	SDL_AtomicInt * c_a;
	int c_oldval;
	int c_newval;
	_Bool c_bg_ret;
    PPCODE:
	c_a = (SDL_AtomicInt *)bg_in_record_ptr(aTHX_ sv_a, "SDL3::AtomicInt", "SDL_CompareAndSwapAtomicInt(a)");
	c_oldval = (int)bg_in_iv(aTHX_ sv_oldval, "SDL_CompareAndSwapAtomicInt(oldval)");
	c_newval = (int)bg_in_iv(aTHX_ sv_newval, "SDL_CompareAndSwapAtomicInt(newval)");
	c_bg_ret = SDL_CompareAndSwapAtomicInt(c_a, c_oldval, c_newval);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetAtomicInt(sv_a, sv_v)
	SV *sv_a
	SV *sv_v
    PREINIT:
	SDL_AtomicInt * c_a;
	int c_v;
	int c_bg_ret;
    PPCODE:
	c_a = (SDL_AtomicInt *)bg_in_record_ptr(aTHX_ sv_a, "SDL3::AtomicInt", "SDL_SetAtomicInt(a)");
	c_v = (int)bg_in_iv(aTHX_ sv_v, "SDL_SetAtomicInt(v)");
	c_bg_ret = SDL_SetAtomicInt(c_a, c_v);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAtomicInt(sv_a)
	SV *sv_a
    PREINIT:
	SDL_AtomicInt * c_a;
	int c_bg_ret;
    PPCODE:
	c_a = (SDL_AtomicInt *)bg_in_record_ptr(aTHX_ sv_a, "SDL3::AtomicInt", "SDL_GetAtomicInt(a)");
	c_bg_ret = SDL_GetAtomicInt(c_a);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_AddAtomicInt(sv_a, sv_v)
	SV *sv_a
	SV *sv_v
    PREINIT:
	SDL_AtomicInt * c_a;
	int c_v;
	int c_bg_ret;
    PPCODE:
	c_a = (SDL_AtomicInt *)bg_in_record_ptr(aTHX_ sv_a, "SDL3::AtomicInt", "SDL_AddAtomicInt(a)");
	c_v = (int)bg_in_iv(aTHX_ sv_v, "SDL_AddAtomicInt(v)");
	c_bg_ret = SDL_AddAtomicInt(c_a, c_v);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_CompareAndSwapAtomicU32(sv_a, sv_oldval, sv_newval)
	SV *sv_a
	SV *sv_oldval
	SV *sv_newval
    PREINIT:
	SDL_AtomicU32 * c_a;
	Uint32 c_oldval;
	Uint32 c_newval;
	_Bool c_bg_ret;
    PPCODE:
	c_a = (SDL_AtomicU32 *)bg_in_record_ptr(aTHX_ sv_a, "SDL3::AtomicU32", "SDL_CompareAndSwapAtomicU32(a)");
	c_oldval = (Uint32)bg_in_uv(aTHX_ sv_oldval, "SDL_CompareAndSwapAtomicU32(oldval)");
	c_newval = (Uint32)bg_in_uv(aTHX_ sv_newval, "SDL_CompareAndSwapAtomicU32(newval)");
	c_bg_ret = SDL_CompareAndSwapAtomicU32(c_a, c_oldval, c_newval);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetAtomicU32(sv_a, sv_v)
	SV *sv_a
	SV *sv_v
    PREINIT:
	SDL_AtomicU32 * c_a;
	Uint32 c_v;
	Uint32 c_bg_ret;
    PPCODE:
	c_a = (SDL_AtomicU32 *)bg_in_record_ptr(aTHX_ sv_a, "SDL3::AtomicU32", "SDL_SetAtomicU32(a)");
	c_v = (Uint32)bg_in_uv(aTHX_ sv_v, "SDL_SetAtomicU32(v)");
	c_bg_ret = SDL_SetAtomicU32(c_a, c_v);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAtomicU32(sv_a)
	SV *sv_a
    PREINIT:
	SDL_AtomicU32 * c_a;
	Uint32 c_bg_ret;
    PPCODE:
	c_a = (SDL_AtomicU32 *)bg_in_record_ptr(aTHX_ sv_a, "SDL3::AtomicU32", "SDL_GetAtomicU32(a)");
	c_bg_ret = SDL_GetAtomicU32(c_a);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_AddAtomicU32(sv_a, sv_v)
	SV *sv_a
	SV *sv_v
    PREINIT:
	SDL_AtomicU32 * c_a;
	int c_v;
	Uint32 c_bg_ret;
    PPCODE:
	c_a = (SDL_AtomicU32 *)bg_in_record_ptr(aTHX_ sv_a, "SDL3::AtomicU32", "SDL_AddAtomicU32(a)");
	c_v = (int)bg_in_iv(aTHX_ sv_v, "SDL_AddAtomicU32(v)");
	c_bg_ret = SDL_AddAtomicU32(c_a, c_v);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_CompareAndSwapAtomicPointer(sv_a, sv_oldval, sv_newval)
	SV *sv_a
	SV *sv_oldval
	SV *sv_newval
    PREINIT:
	void * c_a; void ** p_a; SV *t_a;
	void * c_oldval;
	void * c_newval;
	_Bool c_bg_ret;
    PPCODE:
	t_a = bg_outref_target(aTHX_ sv_a);
	c_a = (t_a && SvOK(t_a)) ? (void *)bg_in_raw_ptr(aTHX_ t_a, "SDL_CompareAndSwapAtomicPointer(a)") : (void *)0;
	p_a = t_a ? &c_a : (void **)bg_outref_raw(aTHX_ sv_a, "SDL_CompareAndSwapAtomicPointer(a)");
	c_oldval = (void *)bg_in_raw_ptr(aTHX_ sv_oldval, "SDL_CompareAndSwapAtomicPointer(oldval)");
	c_newval = (void *)bg_in_raw_ptr(aTHX_ sv_newval, "SDL_CompareAndSwapAtomicPointer(newval)");
	c_bg_ret = SDL_CompareAndSwapAtomicPointer(p_a, c_oldval, c_newval);
	if (t_a) sv_setsv(t_a, sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_a), "SDL3::Pointer")));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetAtomicPointer(sv_a, sv_v)
	SV *sv_a
	SV *sv_v
    PREINIT:
	void * c_a; void ** p_a; SV *t_a;
	void * c_v;
	void * c_bg_ret;
    PPCODE:
	t_a = bg_outref_target(aTHX_ sv_a);
	c_a = (t_a && SvOK(t_a)) ? (void *)bg_in_raw_ptr(aTHX_ t_a, "SDL_SetAtomicPointer(a)") : (void *)0;
	p_a = t_a ? &c_a : (void **)bg_outref_raw(aTHX_ sv_a, "SDL_SetAtomicPointer(a)");
	c_v = (void *)bg_in_raw_ptr(aTHX_ sv_v, "SDL_SetAtomicPointer(v)");
	c_bg_ret = SDL_SetAtomicPointer(p_a, c_v);
	if (t_a) sv_setsv(t_a, sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_a), "SDL3::Pointer")));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetAtomicPointer(sv_a)
	SV *sv_a
    PREINIT:
	void * c_a; void ** p_a; SV *t_a;
	void * c_bg_ret;
    PPCODE:
	t_a = bg_outref_target(aTHX_ sv_a);
	c_a = (t_a && SvOK(t_a)) ? (void *)bg_in_raw_ptr(aTHX_ t_a, "SDL_GetAtomicPointer(a)") : (void *)0;
	p_a = t_a ? &c_a : (void **)bg_outref_raw(aTHX_ sv_a, "SDL_GetAtomicPointer(a)");
	c_bg_ret = SDL_GetAtomicPointer(p_a);
	if (t_a) sv_setsv(t_a, sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_a), "SDL3::Pointer")));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::AtomicInt

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_AtomicInt), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_AtomicInt)));
	XSRETURN(1);

void
value(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AtomicInt *self;
    PPCODE:
	self = (struct SDL_AtomicInt *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AtomicInt", "SDL3::AtomicInt::value");
	if (items > 1) {
		self->value = (int)bg_in_iv(aTHX_ ST(1), "SDL3::AtomicInt::value");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->value)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::AtomicU32

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_AtomicU32), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_AtomicU32)));
	XSRETURN(1);

void
value(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AtomicU32 *self;
    PPCODE:
	self = (struct SDL_AtomicU32 *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AtomicU32", "SDL3::AtomicU32::value");
	if (items > 1) {
		self->value = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::AtomicU32::value");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->value)));
	XSRETURN(1);
