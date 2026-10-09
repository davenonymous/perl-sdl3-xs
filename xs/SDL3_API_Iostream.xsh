MODULE = SDL3  PACKAGE = SDL3::API::Iostream

void
SDL_IOFromFile(sv_file, sv_mode)
	SV *sv_file
	SV *sv_mode
    PREINIT:
	const char * c_file;
	const char * c_mode;
	SDL_IOStream * c_bg_ret;
    PPCODE:
	c_file = (const char *)bg_in_string(aTHX_ sv_file, "SDL_IOFromFile(file)");
	c_mode = (const char *)bg_in_string(aTHX_ sv_mode, "SDL_IOFromFile(mode)");
	c_bg_ret = SDL_IOFromFile(c_file, c_mode);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::IOStream"));
	XSRETURN(1);

void
SDL_IOFromMem(sv_mem, sv_size)
	SV *sv_mem
	SV *sv_size
    PREINIT:
	void * c_mem;
	size_t c_size;
	SDL_IOStream * c_bg_ret;
    PPCODE:
	c_mem = (void *)bg_in_raw_ptr(aTHX_ sv_mem, "SDL_IOFromMem(mem)");
	c_size = (size_t)bg_in_uv(aTHX_ sv_size, "SDL_IOFromMem(size)");
	c_bg_ret = SDL_IOFromMem(c_mem, c_size);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::IOStream"));
	XSRETURN(1);

void
SDL_IOFromConstMem(sv_mem, sv_size)
	SV *sv_mem
	SV *sv_size
    PREINIT:
	const void * c_mem;
	size_t c_size;
	SDL_IOStream * c_bg_ret;
    PPCODE:
	c_mem = (const void *)bg_in_raw_ptr(aTHX_ sv_mem, "SDL_IOFromConstMem(mem)");
	c_size = (size_t)bg_in_uv(aTHX_ sv_size, "SDL_IOFromConstMem(size)");
	c_bg_ret = SDL_IOFromConstMem(c_mem, c_size);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::IOStream"));
	XSRETURN(1);

void
SDL_IOFromDynamicMem()
    PREINIT:
	SDL_IOStream * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_IOFromDynamicMem();
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::IOStream"));
	XSRETURN(1);

void
SDL_OpenIO(sv_iface, sv_userdata)
	SV *sv_iface
	SV *sv_userdata
    PREINIT:
	const SDL_IOStreamInterface * c_iface;
	void * c_userdata;
	SDL_IOStream * c_bg_ret;
    PPCODE:
	c_iface = (const SDL_IOStreamInterface *)bg_in_record_ptr(aTHX_ sv_iface, "SDL3::IOStreamInterface", "SDL_OpenIO(iface)");
	c_userdata = (void *)bg_in_raw_ptr(aTHX_ sv_userdata, "SDL_OpenIO(userdata)");
	c_bg_ret = SDL_OpenIO(c_iface, c_userdata);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::IOStream"));
	XSRETURN(1);

void
SDL_CloseIO(sv_context)
	SV *sv_context
    PREINIT:
	SDL_IOStream * c_context;
	_Bool c_bg_ret;
    PPCODE:
	c_context = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_context, "SDL3::IOStream", "SDL_CloseIO(context)");
	c_bg_ret = SDL_CloseIO(c_context);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetIOProperties(sv_context)
	SV *sv_context
    PREINIT:
	SDL_IOStream * c_context;
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_context = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_context, "SDL3::IOStream", "SDL_GetIOProperties(context)");
	c_bg_ret = SDL_GetIOProperties(c_context);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetIOStatus(sv_context)
	SV *sv_context
    PREINIT:
	SDL_IOStream * c_context;
	SDL_IOStatus c_bg_ret;
    PPCODE:
	c_context = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_context, "SDL3::IOStream", "SDL_GetIOStatus(context)");
	c_bg_ret = SDL_GetIOStatus(c_context);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetIOSize(sv_context)
	SV *sv_context
    PREINIT:
	SDL_IOStream * c_context;
	Sint64 c_bg_ret;
    PPCODE:
	c_context = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_context, "SDL3::IOStream", "SDL_GetIOSize(context)");
	c_bg_ret = SDL_GetIOSize(c_context);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SeekIO(sv_context, sv_offset, sv_whence)
	SV *sv_context
	SV *sv_offset
	SV *sv_whence
    PREINIT:
	SDL_IOStream * c_context;
	Sint64 c_offset;
	SDL_IOWhence c_whence;
	Sint64 c_bg_ret;
    PPCODE:
	c_context = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_context, "SDL3::IOStream", "SDL_SeekIO(context)");
	c_offset = (Sint64)bg_in_iv(aTHX_ sv_offset, "SDL_SeekIO(offset)");
	c_whence = (SDL_IOWhence)bg_in_iv(aTHX_ sv_whence, "SDL_SeekIO(whence)");
	c_bg_ret = SDL_SeekIO(c_context, c_offset, c_whence);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_TellIO(sv_context)
	SV *sv_context
    PREINIT:
	SDL_IOStream * c_context;
	Sint64 c_bg_ret;
    PPCODE:
	c_context = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_context, "SDL3::IOStream", "SDL_TellIO(context)");
	c_bg_ret = SDL_TellIO(c_context);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadIO(sv_context, sv_ptr, sv_size)
	SV *sv_context
	SV *sv_ptr
	SV *sv_size
    PREINIT:
	SDL_IOStream * c_context;
	void * c_ptr;
	size_t c_size;
	size_t c_bg_ret;
    PPCODE:
	c_context = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_context, "SDL3::IOStream", "SDL_ReadIO(context)");
	c_ptr = (void *)bg_in_raw_ptr(aTHX_ sv_ptr, "SDL_ReadIO(ptr)");
	c_size = (size_t)bg_in_uv(aTHX_ sv_size, "SDL_ReadIO(size)");
	c_bg_ret = SDL_ReadIO(c_context, c_ptr, c_size);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteIO(sv_context, sv_ptr, sv_size)
	SV *sv_context
	SV *sv_ptr
	SV *sv_size
    PREINIT:
	SDL_IOStream * c_context;
	const void * c_ptr;
	size_t c_size;
	size_t c_bg_ret;
    PPCODE:
	c_context = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_context, "SDL3::IOStream", "SDL_WriteIO(context)");
	c_ptr = (const void *)bg_in_raw_ptr(aTHX_ sv_ptr, "SDL_WriteIO(ptr)");
	c_size = (size_t)bg_in_uv(aTHX_ sv_size, "SDL_WriteIO(size)");
	c_bg_ret = SDL_WriteIO(c_context, c_ptr, c_size);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_IOprintf(sv_context, sv_message)
	SV *sv_context
	SV *sv_message
    PREINIT:
	SDL_IOStream * c_context;
	const char *c_message;
	size_t c_bg_ret;
    PPCODE:
	c_context = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_context, "SDL3::IOStream", "SDL_IOprintf(context)");
	c_message = bg_in_string(aTHX_ sv_message, "SDL_IOprintf(message)");
	c_bg_ret = SDL_IOprintf(c_context, "%s", (c_message ? c_message : ""));
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_FlushIO(sv_context)
	SV *sv_context
    PREINIT:
	SDL_IOStream * c_context;
	_Bool c_bg_ret;
    PPCODE:
	c_context = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_context, "SDL3::IOStream", "SDL_FlushIO(context)");
	c_bg_ret = SDL_FlushIO(c_context);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_LoadFile_IO(sv_src, sv_datasize, sv_closeio)
	SV *sv_src
	SV *sv_datasize
	SV *sv_closeio
    PREINIT:
	SDL_IOStream * c_src;
	size_t c_datasize; size_t * p_datasize; SV *t_datasize;
	_Bool c_closeio;
	void * c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_LoadFile_IO(src)");
	t_datasize = bg_outref_target(aTHX_ sv_datasize);
	c_datasize = (t_datasize && SvOK(t_datasize)) ? (size_t)bg_in_uv(aTHX_ t_datasize, "SDL_LoadFile_IO(datasize)") : (size_t)0;
	p_datasize = t_datasize ? &c_datasize : (size_t *)bg_outref_raw(aTHX_ sv_datasize, "SDL_LoadFile_IO(datasize)");
	c_closeio = (_Bool)SvTRUE(sv_closeio);
	c_bg_ret = SDL_LoadFile_IO(c_src, p_datasize, c_closeio);
	if (t_datasize) sv_setsv(t_datasize, sv_2mortal(newSVuv((UV)(c_datasize))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_LoadFile(sv_file, sv_datasize)
	SV *sv_file
	SV *sv_datasize
    PREINIT:
	const char * c_file;
	size_t c_datasize; size_t * p_datasize; SV *t_datasize;
	void * c_bg_ret;
    PPCODE:
	c_file = (const char *)bg_in_string(aTHX_ sv_file, "SDL_LoadFile(file)");
	t_datasize = bg_outref_target(aTHX_ sv_datasize);
	c_datasize = (t_datasize && SvOK(t_datasize)) ? (size_t)bg_in_uv(aTHX_ t_datasize, "SDL_LoadFile(datasize)") : (size_t)0;
	p_datasize = t_datasize ? &c_datasize : (size_t *)bg_outref_raw(aTHX_ sv_datasize, "SDL_LoadFile(datasize)");
	c_bg_ret = SDL_LoadFile(c_file, p_datasize);
	if (t_datasize) sv_setsv(t_datasize, sv_2mortal(newSVuv((UV)(c_datasize))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_SaveFile_IO(sv_src, sv_data, sv_datasize, sv_closeio)
	SV *sv_src
	SV *sv_data
	SV *sv_datasize
	SV *sv_closeio
    PREINIT:
	SDL_IOStream * c_src;
	const void * c_data;
	size_t c_datasize;
	_Bool c_closeio;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_SaveFile_IO(src)");
	c_data = (const void *)bg_in_raw_ptr(aTHX_ sv_data, "SDL_SaveFile_IO(data)");
	c_datasize = (size_t)bg_in_uv(aTHX_ sv_datasize, "SDL_SaveFile_IO(datasize)");
	c_closeio = (_Bool)SvTRUE(sv_closeio);
	c_bg_ret = SDL_SaveFile_IO(c_src, c_data, c_datasize, c_closeio);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SaveFile(sv_file, sv_data, sv_datasize)
	SV *sv_file
	SV *sv_data
	SV *sv_datasize
    PREINIT:
	const char * c_file;
	const void * c_data;
	size_t c_datasize;
	_Bool c_bg_ret;
    PPCODE:
	c_file = (const char *)bg_in_string(aTHX_ sv_file, "SDL_SaveFile(file)");
	c_data = (const void *)bg_in_raw_ptr(aTHX_ sv_data, "SDL_SaveFile(data)");
	c_datasize = (size_t)bg_in_uv(aTHX_ sv_datasize, "SDL_SaveFile(datasize)");
	c_bg_ret = SDL_SaveFile(c_file, c_data, c_datasize);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadU8(sv_src, sv_value)
	SV *sv_src
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_src;
	Uint8 c_value; Uint8 * p_value; SV *t_value;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_ReadU8(src)");
	t_value = bg_outref_target(aTHX_ sv_value);
	c_value = (t_value && SvOK(t_value)) ? (Uint8)bg_in_uv(aTHX_ t_value, "SDL_ReadU8(value)") : (Uint8)0;
	p_value = t_value ? &c_value : (Uint8 *)bg_outref_raw(aTHX_ sv_value, "SDL_ReadU8(value)");
	c_bg_ret = SDL_ReadU8(c_src, p_value);
	if (t_value) sv_setsv(t_value, sv_2mortal(newSVuv((UV)(c_value))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadS8(sv_src, sv_value)
	SV *sv_src
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_src;
	Sint8 c_value; Sint8 * p_value; SV *t_value;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_ReadS8(src)");
	t_value = bg_outref_target(aTHX_ sv_value);
	c_value = (t_value && SvOK(t_value)) ? (Sint8)bg_in_iv(aTHX_ t_value, "SDL_ReadS8(value)") : (Sint8)0;
	p_value = t_value ? &c_value : (Sint8 *)bg_outref_raw(aTHX_ sv_value, "SDL_ReadS8(value)");
	c_bg_ret = SDL_ReadS8(c_src, p_value);
	if (t_value) sv_setsv(t_value, sv_2mortal(newSViv((IV)(c_value))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadU16LE(sv_src, sv_value)
	SV *sv_src
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_src;
	Uint16 c_value; Uint16 * p_value; SV *t_value;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_ReadU16LE(src)");
	t_value = bg_outref_target(aTHX_ sv_value);
	c_value = (t_value && SvOK(t_value)) ? (Uint16)bg_in_uv(aTHX_ t_value, "SDL_ReadU16LE(value)") : (Uint16)0;
	p_value = t_value ? &c_value : (Uint16 *)bg_outref_raw(aTHX_ sv_value, "SDL_ReadU16LE(value)");
	c_bg_ret = SDL_ReadU16LE(c_src, p_value);
	if (t_value) sv_setsv(t_value, sv_2mortal(newSVuv((UV)(c_value))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadS16LE(sv_src, sv_value)
	SV *sv_src
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_src;
	Sint16 c_value; Sint16 * p_value; SV *t_value;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_ReadS16LE(src)");
	t_value = bg_outref_target(aTHX_ sv_value);
	c_value = (t_value && SvOK(t_value)) ? (Sint16)bg_in_iv(aTHX_ t_value, "SDL_ReadS16LE(value)") : (Sint16)0;
	p_value = t_value ? &c_value : (Sint16 *)bg_outref_raw(aTHX_ sv_value, "SDL_ReadS16LE(value)");
	c_bg_ret = SDL_ReadS16LE(c_src, p_value);
	if (t_value) sv_setsv(t_value, sv_2mortal(newSViv((IV)(c_value))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadU16BE(sv_src, sv_value)
	SV *sv_src
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_src;
	Uint16 c_value; Uint16 * p_value; SV *t_value;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_ReadU16BE(src)");
	t_value = bg_outref_target(aTHX_ sv_value);
	c_value = (t_value && SvOK(t_value)) ? (Uint16)bg_in_uv(aTHX_ t_value, "SDL_ReadU16BE(value)") : (Uint16)0;
	p_value = t_value ? &c_value : (Uint16 *)bg_outref_raw(aTHX_ sv_value, "SDL_ReadU16BE(value)");
	c_bg_ret = SDL_ReadU16BE(c_src, p_value);
	if (t_value) sv_setsv(t_value, sv_2mortal(newSVuv((UV)(c_value))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadS16BE(sv_src, sv_value)
	SV *sv_src
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_src;
	Sint16 c_value; Sint16 * p_value; SV *t_value;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_ReadS16BE(src)");
	t_value = bg_outref_target(aTHX_ sv_value);
	c_value = (t_value && SvOK(t_value)) ? (Sint16)bg_in_iv(aTHX_ t_value, "SDL_ReadS16BE(value)") : (Sint16)0;
	p_value = t_value ? &c_value : (Sint16 *)bg_outref_raw(aTHX_ sv_value, "SDL_ReadS16BE(value)");
	c_bg_ret = SDL_ReadS16BE(c_src, p_value);
	if (t_value) sv_setsv(t_value, sv_2mortal(newSViv((IV)(c_value))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadU32LE(sv_src, sv_value)
	SV *sv_src
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_src;
	Uint32 c_value; Uint32 * p_value; SV *t_value;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_ReadU32LE(src)");
	t_value = bg_outref_target(aTHX_ sv_value);
	c_value = (t_value && SvOK(t_value)) ? (Uint32)bg_in_uv(aTHX_ t_value, "SDL_ReadU32LE(value)") : (Uint32)0;
	p_value = t_value ? &c_value : (Uint32 *)bg_outref_raw(aTHX_ sv_value, "SDL_ReadU32LE(value)");
	c_bg_ret = SDL_ReadU32LE(c_src, p_value);
	if (t_value) sv_setsv(t_value, sv_2mortal(newSVuv((UV)(c_value))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadS32LE(sv_src, sv_value)
	SV *sv_src
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_src;
	Sint32 c_value; Sint32 * p_value; SV *t_value;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_ReadS32LE(src)");
	t_value = bg_outref_target(aTHX_ sv_value);
	c_value = (t_value && SvOK(t_value)) ? (Sint32)bg_in_iv(aTHX_ t_value, "SDL_ReadS32LE(value)") : (Sint32)0;
	p_value = t_value ? &c_value : (Sint32 *)bg_outref_raw(aTHX_ sv_value, "SDL_ReadS32LE(value)");
	c_bg_ret = SDL_ReadS32LE(c_src, p_value);
	if (t_value) sv_setsv(t_value, sv_2mortal(newSViv((IV)(c_value))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadU32BE(sv_src, sv_value)
	SV *sv_src
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_src;
	Uint32 c_value; Uint32 * p_value; SV *t_value;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_ReadU32BE(src)");
	t_value = bg_outref_target(aTHX_ sv_value);
	c_value = (t_value && SvOK(t_value)) ? (Uint32)bg_in_uv(aTHX_ t_value, "SDL_ReadU32BE(value)") : (Uint32)0;
	p_value = t_value ? &c_value : (Uint32 *)bg_outref_raw(aTHX_ sv_value, "SDL_ReadU32BE(value)");
	c_bg_ret = SDL_ReadU32BE(c_src, p_value);
	if (t_value) sv_setsv(t_value, sv_2mortal(newSVuv((UV)(c_value))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadS32BE(sv_src, sv_value)
	SV *sv_src
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_src;
	Sint32 c_value; Sint32 * p_value; SV *t_value;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_ReadS32BE(src)");
	t_value = bg_outref_target(aTHX_ sv_value);
	c_value = (t_value && SvOK(t_value)) ? (Sint32)bg_in_iv(aTHX_ t_value, "SDL_ReadS32BE(value)") : (Sint32)0;
	p_value = t_value ? &c_value : (Sint32 *)bg_outref_raw(aTHX_ sv_value, "SDL_ReadS32BE(value)");
	c_bg_ret = SDL_ReadS32BE(c_src, p_value);
	if (t_value) sv_setsv(t_value, sv_2mortal(newSViv((IV)(c_value))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadU64LE(sv_src, sv_value)
	SV *sv_src
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_src;
	Uint64 c_value; Uint64 * p_value; SV *t_value;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_ReadU64LE(src)");
	t_value = bg_outref_target(aTHX_ sv_value);
	c_value = (t_value && SvOK(t_value)) ? (Uint64)bg_in_uv(aTHX_ t_value, "SDL_ReadU64LE(value)") : (Uint64)0;
	p_value = t_value ? &c_value : (Uint64 *)bg_outref_raw(aTHX_ sv_value, "SDL_ReadU64LE(value)");
	c_bg_ret = SDL_ReadU64LE(c_src, p_value);
	if (t_value) sv_setsv(t_value, sv_2mortal(newSVuv((UV)(c_value))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadS64LE(sv_src, sv_value)
	SV *sv_src
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_src;
	Sint64 c_value; Sint64 * p_value; SV *t_value;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_ReadS64LE(src)");
	t_value = bg_outref_target(aTHX_ sv_value);
	c_value = (t_value && SvOK(t_value)) ? (Sint64)bg_in_iv(aTHX_ t_value, "SDL_ReadS64LE(value)") : (Sint64)0;
	p_value = t_value ? &c_value : (Sint64 *)bg_outref_raw(aTHX_ sv_value, "SDL_ReadS64LE(value)");
	c_bg_ret = SDL_ReadS64LE(c_src, p_value);
	if (t_value) sv_setsv(t_value, sv_2mortal(newSViv((IV)(c_value))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadU64BE(sv_src, sv_value)
	SV *sv_src
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_src;
	Uint64 c_value; Uint64 * p_value; SV *t_value;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_ReadU64BE(src)");
	t_value = bg_outref_target(aTHX_ sv_value);
	c_value = (t_value && SvOK(t_value)) ? (Uint64)bg_in_uv(aTHX_ t_value, "SDL_ReadU64BE(value)") : (Uint64)0;
	p_value = t_value ? &c_value : (Uint64 *)bg_outref_raw(aTHX_ sv_value, "SDL_ReadU64BE(value)");
	c_bg_ret = SDL_ReadU64BE(c_src, p_value);
	if (t_value) sv_setsv(t_value, sv_2mortal(newSVuv((UV)(c_value))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadS64BE(sv_src, sv_value)
	SV *sv_src
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_src;
	Sint64 c_value; Sint64 * p_value; SV *t_value;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_ReadS64BE(src)");
	t_value = bg_outref_target(aTHX_ sv_value);
	c_value = (t_value && SvOK(t_value)) ? (Sint64)bg_in_iv(aTHX_ t_value, "SDL_ReadS64BE(value)") : (Sint64)0;
	p_value = t_value ? &c_value : (Sint64 *)bg_outref_raw(aTHX_ sv_value, "SDL_ReadS64BE(value)");
	c_bg_ret = SDL_ReadS64BE(c_src, p_value);
	if (t_value) sv_setsv(t_value, sv_2mortal(newSViv((IV)(c_value))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteU8(sv_dst, sv_value)
	SV *sv_dst
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_dst;
	Uint8 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_WriteU8(dst)");
	c_value = (Uint8)bg_in_uv(aTHX_ sv_value, "SDL_WriteU8(value)");
	c_bg_ret = SDL_WriteU8(c_dst, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteS8(sv_dst, sv_value)
	SV *sv_dst
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_dst;
	Sint8 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_WriteS8(dst)");
	c_value = (Sint8)bg_in_iv(aTHX_ sv_value, "SDL_WriteS8(value)");
	c_bg_ret = SDL_WriteS8(c_dst, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteU16LE(sv_dst, sv_value)
	SV *sv_dst
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_dst;
	Uint16 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_WriteU16LE(dst)");
	c_value = (Uint16)bg_in_uv(aTHX_ sv_value, "SDL_WriteU16LE(value)");
	c_bg_ret = SDL_WriteU16LE(c_dst, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteS16LE(sv_dst, sv_value)
	SV *sv_dst
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_dst;
	Sint16 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_WriteS16LE(dst)");
	c_value = (Sint16)bg_in_iv(aTHX_ sv_value, "SDL_WriteS16LE(value)");
	c_bg_ret = SDL_WriteS16LE(c_dst, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteU16BE(sv_dst, sv_value)
	SV *sv_dst
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_dst;
	Uint16 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_WriteU16BE(dst)");
	c_value = (Uint16)bg_in_uv(aTHX_ sv_value, "SDL_WriteU16BE(value)");
	c_bg_ret = SDL_WriteU16BE(c_dst, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteS16BE(sv_dst, sv_value)
	SV *sv_dst
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_dst;
	Sint16 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_WriteS16BE(dst)");
	c_value = (Sint16)bg_in_iv(aTHX_ sv_value, "SDL_WriteS16BE(value)");
	c_bg_ret = SDL_WriteS16BE(c_dst, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteU32LE(sv_dst, sv_value)
	SV *sv_dst
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_dst;
	Uint32 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_WriteU32LE(dst)");
	c_value = (Uint32)bg_in_uv(aTHX_ sv_value, "SDL_WriteU32LE(value)");
	c_bg_ret = SDL_WriteU32LE(c_dst, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteS32LE(sv_dst, sv_value)
	SV *sv_dst
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_dst;
	Sint32 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_WriteS32LE(dst)");
	c_value = (Sint32)bg_in_iv(aTHX_ sv_value, "SDL_WriteS32LE(value)");
	c_bg_ret = SDL_WriteS32LE(c_dst, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteU32BE(sv_dst, sv_value)
	SV *sv_dst
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_dst;
	Uint32 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_WriteU32BE(dst)");
	c_value = (Uint32)bg_in_uv(aTHX_ sv_value, "SDL_WriteU32BE(value)");
	c_bg_ret = SDL_WriteU32BE(c_dst, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteS32BE(sv_dst, sv_value)
	SV *sv_dst
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_dst;
	Sint32 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_WriteS32BE(dst)");
	c_value = (Sint32)bg_in_iv(aTHX_ sv_value, "SDL_WriteS32BE(value)");
	c_bg_ret = SDL_WriteS32BE(c_dst, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteU64LE(sv_dst, sv_value)
	SV *sv_dst
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_dst;
	Uint64 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_WriteU64LE(dst)");
	c_value = (Uint64)bg_in_uv(aTHX_ sv_value, "SDL_WriteU64LE(value)");
	c_bg_ret = SDL_WriteU64LE(c_dst, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteS64LE(sv_dst, sv_value)
	SV *sv_dst
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_dst;
	Sint64 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_WriteS64LE(dst)");
	c_value = (Sint64)bg_in_iv(aTHX_ sv_value, "SDL_WriteS64LE(value)");
	c_bg_ret = SDL_WriteS64LE(c_dst, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteU64BE(sv_dst, sv_value)
	SV *sv_dst
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_dst;
	Uint64 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_WriteU64BE(dst)");
	c_value = (Uint64)bg_in_uv(aTHX_ sv_value, "SDL_WriteU64BE(value)");
	c_bg_ret = SDL_WriteU64BE(c_dst, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WriteS64BE(sv_dst, sv_value)
	SV *sv_dst
	SV *sv_value
    PREINIT:
	SDL_IOStream * c_dst;
	Sint64 c_value;
	_Bool c_bg_ret;
    PPCODE:
	c_dst = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_dst, "SDL3::IOStream", "SDL_WriteS64BE(dst)");
	c_value = (Sint64)bg_in_iv(aTHX_ sv_value, "SDL_WriteS64BE(value)");
	c_bg_ret = SDL_WriteS64BE(c_dst, c_value);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Iostream", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_PROP_IOSTREAM_ANDROID_AASSET_POINTER", BG_CONST_SV(SDL_PROP_IOSTREAM_ANDROID_AASSET_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER", BG_CONST_SV(SDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER", BG_CONST_SV(SDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER", BG_CONST_SV(SDL_PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_IOSTREAM_MEMORY_FREE_FUNC_POINTER", BG_CONST_SV(SDL_PROP_IOSTREAM_MEMORY_FREE_FUNC_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_IOSTREAM_MEMORY_POINTER", BG_CONST_SV(SDL_PROP_IOSTREAM_MEMORY_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER", BG_CONST_SV(SDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_IOSTREAM_STDIO_FILE_POINTER", BG_CONST_SV(SDL_PROP_IOSTREAM_STDIO_FILE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_IOSTREAM_WINDOWS_HANDLE_POINTER", BG_CONST_SV(SDL_PROP_IOSTREAM_WINDOWS_HANDLE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_IO_STATUS_READY", BG_CONST_SV(SDL_IO_STATUS_READY));
	bg_export_constant(aTHX_ stash, "SDL_IO_STATUS_ERROR", BG_CONST_SV(SDL_IO_STATUS_ERROR));
	bg_export_constant(aTHX_ stash, "SDL_IO_STATUS_EOF", BG_CONST_SV(SDL_IO_STATUS_EOF));
	bg_export_constant(aTHX_ stash, "SDL_IO_STATUS_NOT_READY", BG_CONST_SV(SDL_IO_STATUS_NOT_READY));
	bg_export_constant(aTHX_ stash, "SDL_IO_STATUS_READONLY", BG_CONST_SV(SDL_IO_STATUS_READONLY));
	bg_export_constant(aTHX_ stash, "SDL_IO_STATUS_WRITEONLY", BG_CONST_SV(SDL_IO_STATUS_WRITEONLY));
	bg_export_constant(aTHX_ stash, "SDL_IO_SEEK_SET", BG_CONST_SV(SDL_IO_SEEK_SET));
	bg_export_constant(aTHX_ stash, "SDL_IO_SEEK_CUR", BG_CONST_SV(SDL_IO_SEEK_CUR));
	bg_export_constant(aTHX_ stash, "SDL_IO_SEEK_END", BG_CONST_SV(SDL_IO_SEEK_END));
	}

MODULE = SDL3  PACKAGE = SDL3::IOStreamInterface

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_IOStreamInterface), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_IOStreamInterface)));
	XSRETURN(1);

void
version(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_IOStreamInterface *self;
    PPCODE:
	self = (struct SDL_IOStreamInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::IOStreamInterface", "SDL3::IOStreamInterface::version");
	if (items > 1) {
		self->version = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::IOStreamInterface::version");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->version)));
	XSRETURN(1);

void
size(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_IOStreamInterface *self;
    PPCODE:
	self = (struct SDL_IOStreamInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::IOStreamInterface", "SDL3::IOStreamInterface::size");
	if (items > 1) {
		self->size = (Sint64 (*)(void *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::IOStreamInterface::size");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->size), "SDL3::Pointer"));
	XSRETURN(1);

void
seek(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_IOStreamInterface *self;
    PPCODE:
	self = (struct SDL_IOStreamInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::IOStreamInterface", "SDL3::IOStreamInterface::seek");
	if (items > 1) {
		self->seek = (Sint64 (*)(void *, Sint64, SDL_IOWhence))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::IOStreamInterface::seek");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->seek), "SDL3::Pointer"));
	XSRETURN(1);

void
read(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_IOStreamInterface *self;
    PPCODE:
	self = (struct SDL_IOStreamInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::IOStreamInterface", "SDL3::IOStreamInterface::read");
	if (items > 1) {
		self->read = (size_t (*)(void *, void *, size_t, SDL_IOStatus *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::IOStreamInterface::read");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->read), "SDL3::Pointer"));
	XSRETURN(1);

void
write(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_IOStreamInterface *self;
    PPCODE:
	self = (struct SDL_IOStreamInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::IOStreamInterface", "SDL3::IOStreamInterface::write");
	if (items > 1) {
		self->write = (size_t (*)(void *, const void *, size_t, SDL_IOStatus *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::IOStreamInterface::write");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->write), "SDL3::Pointer"));
	XSRETURN(1);

void
flush(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_IOStreamInterface *self;
    PPCODE:
	self = (struct SDL_IOStreamInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::IOStreamInterface", "SDL3::IOStreamInterface::flush");
	if (items > 1) {
		self->flush = (_Bool (*)(void *, SDL_IOStatus *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::IOStreamInterface::flush");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->flush), "SDL3::Pointer"));
	XSRETURN(1);

void
close(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_IOStreamInterface *self;
    PPCODE:
	self = (struct SDL_IOStreamInterface *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::IOStreamInterface", "SDL3::IOStreamInterface::close");
	if (items > 1) {
		self->close = (_Bool (*)(void *))bg_in_raw_ptr(aTHX_ ST(1), "SDL3::IOStreamInterface::close");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->close), "SDL3::Pointer"));
	XSRETURN(1);

