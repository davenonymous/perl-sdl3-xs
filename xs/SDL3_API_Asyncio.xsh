MODULE = SDL3  PACKAGE = SDL3::API::Asyncio

void
SDL_AsyncIOFromFile(sv_file, sv_mode)
	SV *sv_file
	SV *sv_mode
    PREINIT:
	const char * c_file;
	const char * c_mode;
	SDL_AsyncIO * c_bg_ret;
    PPCODE:
	c_file = (const char *)bg_in_string(aTHX_ sv_file, "SDL_AsyncIOFromFile(file)");
	c_mode = (const char *)bg_in_string(aTHX_ sv_mode, "SDL_AsyncIOFromFile(mode)");
	c_bg_ret = SDL_AsyncIOFromFile(c_file, c_mode);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::AsyncIO"));
	XSRETURN(1);

void
SDL_GetAsyncIOSize(sv_asyncio)
	SV *sv_asyncio
    PREINIT:
	SDL_AsyncIO * c_asyncio;
	Sint64 c_bg_ret;
    PPCODE:
	c_asyncio = (SDL_AsyncIO *)bg_in_record_ptr(aTHX_ sv_asyncio, "SDL3::AsyncIO", "SDL_GetAsyncIOSize(asyncio)");
	c_bg_ret = SDL_GetAsyncIOSize(c_asyncio);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadAsyncIO(sv_asyncio, sv_ptr, sv_offset, sv_size, sv_queue, sv_userdata)
	SV *sv_asyncio
	SV *sv_ptr
	SV *sv_offset
	SV *sv_size
	SV *sv_queue
	SV *sv_userdata
    PREINIT:
	SDL_AsyncIO * c_asyncio;
	void * c_ptr;
	Uint64 c_offset;
	Uint64 c_size;
	SDL_AsyncIOQueue * c_queue;
	void * c_userdata;
	_Bool c_bg_ret;
    PPCODE:
	c_asyncio = (SDL_AsyncIO *)bg_in_record_ptr(aTHX_ sv_asyncio, "SDL3::AsyncIO", "SDL_ReadAsyncIO(asyncio)");
	c_ptr = (void *)bg_in_raw_ptr(aTHX_ sv_ptr, "SDL_ReadAsyncIO(ptr)");
	c_offset = (Uint64)bg_in_uv(aTHX_ sv_offset, "SDL_ReadAsyncIO(offset)");
	c_size = (Uint64)bg_in_uv(aTHX_ sv_size, "SDL_ReadAsyncIO(size)");
	c_queue = (SDL_AsyncIOQueue *)bg_in_record_ptr(aTHX_ sv_queue, "SDL3::AsyncIOQueue", "SDL_ReadAsyncIO(queue)");
	c_userdata = (void *)bg_in_raw_ptr(aTHX_ sv_userdata, "SDL_ReadAsyncIO(userdata)");
	c_bg_ret = SDL_ReadAsyncIO(c_asyncio, c_ptr, c_offset, c_size, c_queue, c_userdata);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteAsyncIO(sv_asyncio, sv_ptr, sv_offset, sv_size, sv_queue, sv_userdata)
	SV *sv_asyncio
	SV *sv_ptr
	SV *sv_offset
	SV *sv_size
	SV *sv_queue
	SV *sv_userdata
    PREINIT:
	SDL_AsyncIO * c_asyncio;
	void * c_ptr;
	Uint64 c_offset;
	Uint64 c_size;
	SDL_AsyncIOQueue * c_queue;
	void * c_userdata;
	_Bool c_bg_ret;
    PPCODE:
	c_asyncio = (SDL_AsyncIO *)bg_in_record_ptr(aTHX_ sv_asyncio, "SDL3::AsyncIO", "SDL_WriteAsyncIO(asyncio)");
	c_ptr = (void *)bg_in_raw_ptr(aTHX_ sv_ptr, "SDL_WriteAsyncIO(ptr)");
	c_offset = (Uint64)bg_in_uv(aTHX_ sv_offset, "SDL_WriteAsyncIO(offset)");
	c_size = (Uint64)bg_in_uv(aTHX_ sv_size, "SDL_WriteAsyncIO(size)");
	c_queue = (SDL_AsyncIOQueue *)bg_in_record_ptr(aTHX_ sv_queue, "SDL3::AsyncIOQueue", "SDL_WriteAsyncIO(queue)");
	c_userdata = (void *)bg_in_raw_ptr(aTHX_ sv_userdata, "SDL_WriteAsyncIO(userdata)");
	c_bg_ret = SDL_WriteAsyncIO(c_asyncio, c_ptr, c_offset, c_size, c_queue, c_userdata);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CloseAsyncIO(sv_asyncio, sv_flush, sv_queue, sv_userdata)
	SV *sv_asyncio
	SV *sv_flush
	SV *sv_queue
	SV *sv_userdata
    PREINIT:
	SDL_AsyncIO * c_asyncio;
	_Bool c_flush;
	SDL_AsyncIOQueue * c_queue;
	void * c_userdata;
	_Bool c_bg_ret;
    PPCODE:
	c_asyncio = (SDL_AsyncIO *)bg_in_record_ptr(aTHX_ sv_asyncio, "SDL3::AsyncIO", "SDL_CloseAsyncIO(asyncio)");
	c_flush = (_Bool)SvTRUE(sv_flush);
	c_queue = (SDL_AsyncIOQueue *)bg_in_record_ptr(aTHX_ sv_queue, "SDL3::AsyncIOQueue", "SDL_CloseAsyncIO(queue)");
	c_userdata = (void *)bg_in_raw_ptr(aTHX_ sv_userdata, "SDL_CloseAsyncIO(userdata)");
	c_bg_ret = SDL_CloseAsyncIO(c_asyncio, c_flush, c_queue, c_userdata);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CreateAsyncIOQueue()
    PREINIT:
	SDL_AsyncIOQueue * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_CreateAsyncIOQueue();
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::AsyncIOQueue"));
	XSRETURN(1);

void
SDL_DestroyAsyncIOQueue(sv_queue)
	SV *sv_queue
    PREINIT:
	SDL_AsyncIOQueue * c_queue;
    PPCODE:
	c_queue = (SDL_AsyncIOQueue *)bg_in_record_ptr(aTHX_ sv_queue, "SDL3::AsyncIOQueue", "SDL_DestroyAsyncIOQueue(queue)");
	SDL_DestroyAsyncIOQueue(c_queue);
	XSRETURN(0);

void
SDL_GetAsyncIOResult(sv_queue, sv_outcome)
	SV *sv_queue
	SV *sv_outcome
    PREINIT:
	SDL_AsyncIOQueue * c_queue;
	SDL_AsyncIOOutcome * c_outcome;
	_Bool c_bg_ret;
    PPCODE:
	c_queue = (SDL_AsyncIOQueue *)bg_in_record_ptr(aTHX_ sv_queue, "SDL3::AsyncIOQueue", "SDL_GetAsyncIOResult(queue)");
	c_outcome = (SDL_AsyncIOOutcome *)bg_in_record_ptr(aTHX_ sv_outcome, "SDL3::AsyncIOOutcome", "SDL_GetAsyncIOResult(outcome)");
	c_bg_ret = SDL_GetAsyncIOResult(c_queue, c_outcome);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WaitAsyncIOResult(sv_queue, sv_outcome, sv_timeoutMS)
	SV *sv_queue
	SV *sv_outcome
	SV *sv_timeoutMS
    PREINIT:
	SDL_AsyncIOQueue * c_queue;
	SDL_AsyncIOOutcome * c_outcome;
	Sint32 c_timeoutMS;
	_Bool c_bg_ret;
    PPCODE:
	c_queue = (SDL_AsyncIOQueue *)bg_in_record_ptr(aTHX_ sv_queue, "SDL3::AsyncIOQueue", "SDL_WaitAsyncIOResult(queue)");
	c_outcome = (SDL_AsyncIOOutcome *)bg_in_record_ptr(aTHX_ sv_outcome, "SDL3::AsyncIOOutcome", "SDL_WaitAsyncIOResult(outcome)");
	c_timeoutMS = (Sint32)bg_in_iv(aTHX_ sv_timeoutMS, "SDL_WaitAsyncIOResult(timeoutMS)");
	c_bg_ret = SDL_WaitAsyncIOResult(c_queue, c_outcome, c_timeoutMS);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SignalAsyncIOQueue(sv_queue)
	SV *sv_queue
    PREINIT:
	SDL_AsyncIOQueue * c_queue;
    PPCODE:
	c_queue = (SDL_AsyncIOQueue *)bg_in_record_ptr(aTHX_ sv_queue, "SDL3::AsyncIOQueue", "SDL_SignalAsyncIOQueue(queue)");
	SDL_SignalAsyncIOQueue(c_queue);
	XSRETURN(0);

void
SDL_LoadFileAsync(sv_file, sv_queue, sv_userdata)
	SV *sv_file
	SV *sv_queue
	SV *sv_userdata
    PREINIT:
	const char * c_file;
	SDL_AsyncIOQueue * c_queue;
	void * c_userdata;
	_Bool c_bg_ret;
    PPCODE:
	c_file = (const char *)bg_in_string(aTHX_ sv_file, "SDL_LoadFileAsync(file)");
	c_queue = (SDL_AsyncIOQueue *)bg_in_record_ptr(aTHX_ sv_queue, "SDL3::AsyncIOQueue", "SDL_LoadFileAsync(queue)");
	c_userdata = (void *)bg_in_raw_ptr(aTHX_ sv_userdata, "SDL_LoadFileAsync(userdata)");
	c_bg_ret = SDL_LoadFileAsync(c_file, c_queue, c_userdata);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Asyncio", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_ASYNCIO_TASK_READ", BG_CONST_SV(SDL_ASYNCIO_TASK_READ));
	bg_export_constant(aTHX_ stash, "SDL_ASYNCIO_TASK_WRITE", BG_CONST_SV(SDL_ASYNCIO_TASK_WRITE));
	bg_export_constant(aTHX_ stash, "SDL_ASYNCIO_TASK_CLOSE", BG_CONST_SV(SDL_ASYNCIO_TASK_CLOSE));
	bg_export_constant(aTHX_ stash, "SDL_ASYNCIO_COMPLETE", BG_CONST_SV(SDL_ASYNCIO_COMPLETE));
	bg_export_constant(aTHX_ stash, "SDL_ASYNCIO_FAILURE", BG_CONST_SV(SDL_ASYNCIO_FAILURE));
	bg_export_constant(aTHX_ stash, "SDL_ASYNCIO_CANCELED", BG_CONST_SV(SDL_ASYNCIO_CANCELED));
	}


MODULE = SDL3  PACKAGE = SDL3::AsyncIOOutcome

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_AsyncIOOutcome), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_AsyncIOOutcome)));
	XSRETURN(1);

void
asyncio(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AsyncIOOutcome *self;
    PPCODE:
	self = (struct SDL_AsyncIOOutcome *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AsyncIOOutcome", "SDL3::AsyncIOOutcome::asyncio");
	if (items > 1) {
		self->asyncio = (SDL_AsyncIO *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::AsyncIO", "SDL3::AsyncIOOutcome::asyncio");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->asyncio), "SDL3::AsyncIO"));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AsyncIOOutcome *self;
    PPCODE:
	self = (struct SDL_AsyncIOOutcome *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AsyncIOOutcome", "SDL3::AsyncIOOutcome::type");
	if (items > 1) {
		self->type = (SDL_AsyncIOTaskType)bg_in_iv(aTHX_ ST(1), "SDL3::AsyncIOOutcome::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
result(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AsyncIOOutcome *self;
    PPCODE:
	self = (struct SDL_AsyncIOOutcome *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AsyncIOOutcome", "SDL3::AsyncIOOutcome::result");
	if (items > 1) {
		self->result = (SDL_AsyncIOResult)bg_in_iv(aTHX_ ST(1), "SDL3::AsyncIOOutcome::result");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->result)));
	XSRETURN(1);

void
buffer(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AsyncIOOutcome *self;
    PPCODE:
	self = (struct SDL_AsyncIOOutcome *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AsyncIOOutcome", "SDL3::AsyncIOOutcome::buffer");
	if (items > 1) {
		self->buffer = (void *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::AsyncIOOutcome::buffer");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->buffer), "SDL3::Pointer"));
	XSRETURN(1);

void
offset(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AsyncIOOutcome *self;
    PPCODE:
	self = (struct SDL_AsyncIOOutcome *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AsyncIOOutcome", "SDL3::AsyncIOOutcome::offset");
	if (items > 1) {
		self->offset = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::AsyncIOOutcome::offset");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->offset)));
	XSRETURN(1);

void
bytes_requested(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AsyncIOOutcome *self;
    PPCODE:
	self = (struct SDL_AsyncIOOutcome *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AsyncIOOutcome", "SDL3::AsyncIOOutcome::bytes_requested");
	if (items > 1) {
		self->bytes_requested = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::AsyncIOOutcome::bytes_requested");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->bytes_requested)));
	XSRETURN(1);

void
bytes_transferred(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AsyncIOOutcome *self;
    PPCODE:
	self = (struct SDL_AsyncIOOutcome *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AsyncIOOutcome", "SDL3::AsyncIOOutcome::bytes_transferred");
	if (items > 1) {
		self->bytes_transferred = (Uint64)bg_in_uv(aTHX_ ST(1), "SDL3::AsyncIOOutcome::bytes_transferred");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->bytes_transferred)));
	XSRETURN(1);

void
userdata(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AsyncIOOutcome *self;
    PPCODE:
	self = (struct SDL_AsyncIOOutcome *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AsyncIOOutcome", "SDL3::AsyncIOOutcome::userdata");
	if (items > 1) {
		self->userdata = (void *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::AsyncIOOutcome::userdata");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->userdata), "SDL3::Pointer"));
	XSRETURN(1);

