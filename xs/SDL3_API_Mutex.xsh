MODULE = SDL3  PACKAGE = SDL3::API::Mutex

void
SDL_CreateMutex()
    PREINIT:
	SDL_Mutex * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_CreateMutex();
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Mutex"));
	XSRETURN(1);

void
SDL_LockMutex(sv_mutex)
	SV *sv_mutex
    PREINIT:
	SDL_Mutex * c_mutex;
    PPCODE:
	c_mutex = (SDL_Mutex *)bg_in_record_ptr(aTHX_ sv_mutex, "SDL3::Mutex", "SDL_LockMutex(mutex)");
	SDL_LockMutex(c_mutex);
	XSRETURN(0);

void
SDL_TryLockMutex(sv_mutex)
	SV *sv_mutex
    PREINIT:
	SDL_Mutex * c_mutex;
	_Bool c_bg_ret;
    PPCODE:
	c_mutex = (SDL_Mutex *)bg_in_record_ptr(aTHX_ sv_mutex, "SDL3::Mutex", "SDL_TryLockMutex(mutex)");
	c_bg_ret = SDL_TryLockMutex(c_mutex);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_UnlockMutex(sv_mutex)
	SV *sv_mutex
    PREINIT:
	SDL_Mutex * c_mutex;
    PPCODE:
	c_mutex = (SDL_Mutex *)bg_in_record_ptr(aTHX_ sv_mutex, "SDL3::Mutex", "SDL_UnlockMutex(mutex)");
	SDL_UnlockMutex(c_mutex);
	XSRETURN(0);

void
SDL_DestroyMutex(sv_mutex)
	SV *sv_mutex
    PREINIT:
	SDL_Mutex * c_mutex;
    PPCODE:
	c_mutex = (SDL_Mutex *)bg_in_record_ptr(aTHX_ sv_mutex, "SDL3::Mutex", "SDL_DestroyMutex(mutex)");
	SDL_DestroyMutex(c_mutex);
	XSRETURN(0);

void
SDL_CreateRWLock()
    PREINIT:
	SDL_RWLock * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_CreateRWLock();
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::RWLock"));
	XSRETURN(1);

void
SDL_LockRWLockForReading(sv_rwlock)
	SV *sv_rwlock
    PREINIT:
	SDL_RWLock * c_rwlock;
    PPCODE:
	c_rwlock = (SDL_RWLock *)bg_in_record_ptr(aTHX_ sv_rwlock, "SDL3::RWLock", "SDL_LockRWLockForReading(rwlock)");
	SDL_LockRWLockForReading(c_rwlock);
	XSRETURN(0);

void
SDL_LockRWLockForWriting(sv_rwlock)
	SV *sv_rwlock
    PREINIT:
	SDL_RWLock * c_rwlock;
    PPCODE:
	c_rwlock = (SDL_RWLock *)bg_in_record_ptr(aTHX_ sv_rwlock, "SDL3::RWLock", "SDL_LockRWLockForWriting(rwlock)");
	SDL_LockRWLockForWriting(c_rwlock);
	XSRETURN(0);

void
SDL_TryLockRWLockForReading(sv_rwlock)
	SV *sv_rwlock
    PREINIT:
	SDL_RWLock * c_rwlock;
	_Bool c_bg_ret;
    PPCODE:
	c_rwlock = (SDL_RWLock *)bg_in_record_ptr(aTHX_ sv_rwlock, "SDL3::RWLock", "SDL_TryLockRWLockForReading(rwlock)");
	c_bg_ret = SDL_TryLockRWLockForReading(c_rwlock);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_TryLockRWLockForWriting(sv_rwlock)
	SV *sv_rwlock
    PREINIT:
	SDL_RWLock * c_rwlock;
	_Bool c_bg_ret;
    PPCODE:
	c_rwlock = (SDL_RWLock *)bg_in_record_ptr(aTHX_ sv_rwlock, "SDL3::RWLock", "SDL_TryLockRWLockForWriting(rwlock)");
	c_bg_ret = SDL_TryLockRWLockForWriting(c_rwlock);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_UnlockRWLock(sv_rwlock)
	SV *sv_rwlock
    PREINIT:
	SDL_RWLock * c_rwlock;
    PPCODE:
	c_rwlock = (SDL_RWLock *)bg_in_record_ptr(aTHX_ sv_rwlock, "SDL3::RWLock", "SDL_UnlockRWLock(rwlock)");
	SDL_UnlockRWLock(c_rwlock);
	XSRETURN(0);

void
SDL_DestroyRWLock(sv_rwlock)
	SV *sv_rwlock
    PREINIT:
	SDL_RWLock * c_rwlock;
    PPCODE:
	c_rwlock = (SDL_RWLock *)bg_in_record_ptr(aTHX_ sv_rwlock, "SDL3::RWLock", "SDL_DestroyRWLock(rwlock)");
	SDL_DestroyRWLock(c_rwlock);
	XSRETURN(0);

void
SDL_CreateSemaphore(sv_initial_value)
	SV *sv_initial_value
    PREINIT:
	Uint32 c_initial_value;
	SDL_Semaphore * c_bg_ret;
    PPCODE:
	c_initial_value = (Uint32)bg_in_uv(aTHX_ sv_initial_value, "SDL_CreateSemaphore(initial_value)");
	c_bg_ret = SDL_CreateSemaphore(c_initial_value);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Semaphore"));
	XSRETURN(1);

void
SDL_DestroySemaphore(sv_sem)
	SV *sv_sem
    PREINIT:
	SDL_Semaphore * c_sem;
    PPCODE:
	c_sem = (SDL_Semaphore *)bg_in_record_ptr(aTHX_ sv_sem, "SDL3::Semaphore", "SDL_DestroySemaphore(sem)");
	SDL_DestroySemaphore(c_sem);
	XSRETURN(0);

void
SDL_WaitSemaphore(sv_sem)
	SV *sv_sem
    PREINIT:
	SDL_Semaphore * c_sem;
    PPCODE:
	c_sem = (SDL_Semaphore *)bg_in_record_ptr(aTHX_ sv_sem, "SDL3::Semaphore", "SDL_WaitSemaphore(sem)");
	SDL_WaitSemaphore(c_sem);
	XSRETURN(0);

void
SDL_TryWaitSemaphore(sv_sem)
	SV *sv_sem
    PREINIT:
	SDL_Semaphore * c_sem;
	_Bool c_bg_ret;
    PPCODE:
	c_sem = (SDL_Semaphore *)bg_in_record_ptr(aTHX_ sv_sem, "SDL3::Semaphore", "SDL_TryWaitSemaphore(sem)");
	c_bg_ret = SDL_TryWaitSemaphore(c_sem);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WaitSemaphoreTimeout(sv_sem, sv_timeoutMS)
	SV *sv_sem
	SV *sv_timeoutMS
    PREINIT:
	SDL_Semaphore * c_sem;
	Sint32 c_timeoutMS;
	_Bool c_bg_ret;
    PPCODE:
	c_sem = (SDL_Semaphore *)bg_in_record_ptr(aTHX_ sv_sem, "SDL3::Semaphore", "SDL_WaitSemaphoreTimeout(sem)");
	c_timeoutMS = (Sint32)bg_in_iv(aTHX_ sv_timeoutMS, "SDL_WaitSemaphoreTimeout(timeoutMS)");
	c_bg_ret = SDL_WaitSemaphoreTimeout(c_sem, c_timeoutMS);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SignalSemaphore(sv_sem)
	SV *sv_sem
    PREINIT:
	SDL_Semaphore * c_sem;
    PPCODE:
	c_sem = (SDL_Semaphore *)bg_in_record_ptr(aTHX_ sv_sem, "SDL3::Semaphore", "SDL_SignalSemaphore(sem)");
	SDL_SignalSemaphore(c_sem);
	XSRETURN(0);

void
SDL_GetSemaphoreValue(sv_sem)
	SV *sv_sem
    PREINIT:
	SDL_Semaphore * c_sem;
	Uint32 c_bg_ret;
    PPCODE:
	c_sem = (SDL_Semaphore *)bg_in_record_ptr(aTHX_ sv_sem, "SDL3::Semaphore", "SDL_GetSemaphoreValue(sem)");
	c_bg_ret = SDL_GetSemaphoreValue(c_sem);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_CreateCondition()
    PREINIT:
	SDL_Condition * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_CreateCondition();
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Condition"));
	XSRETURN(1);

void
SDL_DestroyCondition(sv_cond)
	SV *sv_cond
    PREINIT:
	SDL_Condition * c_cond;
    PPCODE:
	c_cond = (SDL_Condition *)bg_in_record_ptr(aTHX_ sv_cond, "SDL3::Condition", "SDL_DestroyCondition(cond)");
	SDL_DestroyCondition(c_cond);
	XSRETURN(0);

void
SDL_SignalCondition(sv_cond)
	SV *sv_cond
    PREINIT:
	SDL_Condition * c_cond;
    PPCODE:
	c_cond = (SDL_Condition *)bg_in_record_ptr(aTHX_ sv_cond, "SDL3::Condition", "SDL_SignalCondition(cond)");
	SDL_SignalCondition(c_cond);
	XSRETURN(0);

void
SDL_BroadcastCondition(sv_cond)
	SV *sv_cond
    PREINIT:
	SDL_Condition * c_cond;
    PPCODE:
	c_cond = (SDL_Condition *)bg_in_record_ptr(aTHX_ sv_cond, "SDL3::Condition", "SDL_BroadcastCondition(cond)");
	SDL_BroadcastCondition(c_cond);
	XSRETURN(0);

void
SDL_WaitCondition(sv_cond, sv_mutex)
	SV *sv_cond
	SV *sv_mutex
    PREINIT:
	SDL_Condition * c_cond;
	SDL_Mutex * c_mutex;
    PPCODE:
	c_cond = (SDL_Condition *)bg_in_record_ptr(aTHX_ sv_cond, "SDL3::Condition", "SDL_WaitCondition(cond)");
	c_mutex = (SDL_Mutex *)bg_in_record_ptr(aTHX_ sv_mutex, "SDL3::Mutex", "SDL_WaitCondition(mutex)");
	SDL_WaitCondition(c_cond, c_mutex);
	XSRETURN(0);

void
SDL_WaitConditionTimeout(sv_cond, sv_mutex, sv_timeoutMS)
	SV *sv_cond
	SV *sv_mutex
	SV *sv_timeoutMS
    PREINIT:
	SDL_Condition * c_cond;
	SDL_Mutex * c_mutex;
	Sint32 c_timeoutMS;
	_Bool c_bg_ret;
    PPCODE:
	c_cond = (SDL_Condition *)bg_in_record_ptr(aTHX_ sv_cond, "SDL3::Condition", "SDL_WaitConditionTimeout(cond)");
	c_mutex = (SDL_Mutex *)bg_in_record_ptr(aTHX_ sv_mutex, "SDL3::Mutex", "SDL_WaitConditionTimeout(mutex)");
	c_timeoutMS = (Sint32)bg_in_iv(aTHX_ sv_timeoutMS, "SDL_WaitConditionTimeout(timeoutMS)");
	c_bg_ret = SDL_WaitConditionTimeout(c_cond, c_mutex, c_timeoutMS);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ShouldInit(sv_state)
	SV *sv_state
    PREINIT:
	SDL_InitState * c_state;
	_Bool c_bg_ret;
    PPCODE:
	c_state = (SDL_InitState *)bg_in_record_ptr(aTHX_ sv_state, "SDL3::InitState", "SDL_ShouldInit(state)");
	c_bg_ret = SDL_ShouldInit(c_state);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ShouldQuit(sv_state)
	SV *sv_state
    PREINIT:
	SDL_InitState * c_state;
	_Bool c_bg_ret;
    PPCODE:
	c_state = (SDL_InitState *)bg_in_record_ptr(aTHX_ sv_state, "SDL3::InitState", "SDL_ShouldQuit(state)");
	c_bg_ret = SDL_ShouldQuit(c_state);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetInitialized(sv_state, sv_initialized)
	SV *sv_state
	SV *sv_initialized
    PREINIT:
	SDL_InitState * c_state;
	_Bool c_initialized;
    PPCODE:
	c_state = (SDL_InitState *)bg_in_record_ptr(aTHX_ sv_state, "SDL3::InitState", "SDL_SetInitialized(state)");
	c_initialized = (_Bool)SvTRUE(sv_initialized);
	SDL_SetInitialized(c_state, c_initialized);
	XSRETURN(0);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Mutex", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_INIT_STATUS_UNINITIALIZED", BG_CONST_SV(SDL_INIT_STATUS_UNINITIALIZED));
	bg_export_constant(aTHX_ stash, "SDL_INIT_STATUS_INITIALIZING", BG_CONST_SV(SDL_INIT_STATUS_INITIALIZING));
	bg_export_constant(aTHX_ stash, "SDL_INIT_STATUS_INITIALIZED", BG_CONST_SV(SDL_INIT_STATUS_INITIALIZED));
	bg_export_constant(aTHX_ stash, "SDL_INIT_STATUS_UNINITIALIZING", BG_CONST_SV(SDL_INIT_STATUS_UNINITIALIZING));
	}





MODULE = SDL3  PACKAGE = SDL3::InitState

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_InitState), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_InitState)));
	XSRETURN(1);

void
status(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_InitState *self;
    PPCODE:
	self = (struct SDL_InitState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::InitState", "SDL3::InitState::status");
	if (items > 1) {
		self->status = *(struct SDL_AtomicInt *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::AtomicInt", "SDL3::InitState::status");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->status), "SDL3::AtomicInt"));
	XSRETURN(1);

void
thread(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_InitState *self;
    PPCODE:
	self = (struct SDL_InitState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::InitState", "SDL3::InitState::thread");
	if (items > 1) {
		self->thread = (SDL_ThreadID)bg_in_uv(aTHX_ ST(1), "SDL3::InitState::thread");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->thread)));
	XSRETURN(1);

void
reserved(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_InitState *self;
    PPCODE:
	self = (struct SDL_InitState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::InitState", "SDL3::InitState::reserved");
	if (items > 1) {
		self->reserved = (void *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::InitState::reserved");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->reserved), "SDL3::Pointer"));
	XSRETURN(1);
