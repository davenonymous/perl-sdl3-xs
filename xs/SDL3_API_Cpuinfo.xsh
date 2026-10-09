MODULE = SDL3  PACKAGE = SDL3::API::Cpuinfo

void
SDL_GetNumLogicalCPUCores()
    PREINIT:
	int c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetNumLogicalCPUCores();
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetCPUCacheLineSize()
    PREINIT:
	int c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetCPUCacheLineSize();
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasAltiVec()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasAltiVec();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasMMX()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasMMX();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasSSE()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasSSE();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasSSE2()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasSSE2();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasSSE3()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasSSE3();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasSSE41()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasSSE41();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasSSE42()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasSSE42();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasAVX()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasAVX();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasAVX2()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasAVX2();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasAVX512F()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasAVX512F();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasARMSIMD()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasARMSIMD();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasNEON()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasNEON();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasLSX()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasLSX();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasLASX()
    PREINIT:
	_Bool c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_HasLASX();
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSystemRAM()
    PREINIT:
	int c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetSystemRAM();
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSIMDAlignment()
    PREINIT:
	size_t c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetSIMDAlignment();
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSystemPageSize()
    PREINIT:
	int c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetSystemPageSize();
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Cpuinfo", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_CACHELINE_SIZE", BG_CONST_SV(SDL_CACHELINE_SIZE));
	}
