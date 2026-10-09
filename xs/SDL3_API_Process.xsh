MODULE = SDL3  PACKAGE = SDL3::API::Process

void
SDL_CreateProcess(sv_args, sv_pipe_stdio)
	SV *sv_args
	SV *sv_pipe_stdio
    PREINIT:
	const char * c_args; const char * const * p_args; SV *t_args;
	_Bool c_pipe_stdio;
	SDL_Process * c_bg_ret;
    PPCODE:
	t_args = bg_outref_target(aTHX_ sv_args);
	c_args = (t_args && SvOK(t_args)) ? (const char *)bg_in_string(aTHX_ t_args, "SDL_CreateProcess(args)") : (const char *)0;
	p_args = t_args ? &c_args : (const char * const *)bg_outref_raw(aTHX_ sv_args, "SDL_CreateProcess(args)");
	c_pipe_stdio = (_Bool)SvTRUE(sv_pipe_stdio);
	c_bg_ret = SDL_CreateProcess(p_args, c_pipe_stdio);
	if (t_args) sv_setsv(t_args, sv_2mortal(bg_out_string(aTHX_ (const char *)(c_args))));
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Process"));
	XSRETURN(1);

void
SDL_CreateProcessWithProperties(sv_props)
	SV *sv_props
    PREINIT:
	SDL_PropertiesID c_props;
	SDL_Process * c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_CreateProcessWithProperties(props)");
	c_bg_ret = SDL_CreateProcessWithProperties(c_props);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Process"));
	XSRETURN(1);

void
SDL_GetProcessProperties(sv_process)
	SV *sv_process
    PREINIT:
	SDL_Process * c_process;
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_process = (SDL_Process *)bg_in_record_ptr(aTHX_ sv_process, "SDL3::Process", "SDL_GetProcessProperties(process)");
	c_bg_ret = SDL_GetProcessProperties(c_process);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReadProcess(sv_process, sv_datasize, sv_exitcode)
	SV *sv_process
	SV *sv_datasize
	SV *sv_exitcode
    PREINIT:
	SDL_Process * c_process;
	size_t c_datasize; size_t * p_datasize; SV *t_datasize;
	int c_exitcode; int * p_exitcode; SV *t_exitcode;
	void * c_bg_ret;
    PPCODE:
	c_process = (SDL_Process *)bg_in_record_ptr(aTHX_ sv_process, "SDL3::Process", "SDL_ReadProcess(process)");
	t_datasize = bg_outref_target(aTHX_ sv_datasize);
	c_datasize = (t_datasize && SvOK(t_datasize)) ? (size_t)bg_in_uv(aTHX_ t_datasize, "SDL_ReadProcess(datasize)") : (size_t)0;
	p_datasize = t_datasize ? &c_datasize : (size_t *)bg_outref_raw(aTHX_ sv_datasize, "SDL_ReadProcess(datasize)");
	t_exitcode = bg_outref_target(aTHX_ sv_exitcode);
	c_exitcode = (t_exitcode && SvOK(t_exitcode)) ? (int)bg_in_iv(aTHX_ t_exitcode, "SDL_ReadProcess(exitcode)") : (int)0;
	p_exitcode = t_exitcode ? &c_exitcode : (int *)bg_outref_raw(aTHX_ sv_exitcode, "SDL_ReadProcess(exitcode)");
	c_bg_ret = SDL_ReadProcess(c_process, p_datasize, p_exitcode);
	if (t_datasize) sv_setsv(t_datasize, sv_2mortal(newSVuv((UV)(c_datasize))));
	if (t_exitcode) sv_setsv(t_exitcode, sv_2mortal(newSViv((IV)(c_exitcode))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetProcessInput(sv_process)
	SV *sv_process
    PREINIT:
	SDL_Process * c_process;
	SDL_IOStream * c_bg_ret;
    PPCODE:
	c_process = (SDL_Process *)bg_in_record_ptr(aTHX_ sv_process, "SDL3::Process", "SDL_GetProcessInput(process)");
	c_bg_ret = SDL_GetProcessInput(c_process);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::IOStream"));
	XSRETURN(1);

void
SDL_GetProcessOutput(sv_process)
	SV *sv_process
    PREINIT:
	SDL_Process * c_process;
	SDL_IOStream * c_bg_ret;
    PPCODE:
	c_process = (SDL_Process *)bg_in_record_ptr(aTHX_ sv_process, "SDL3::Process", "SDL_GetProcessOutput(process)");
	c_bg_ret = SDL_GetProcessOutput(c_process);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::IOStream"));
	XSRETURN(1);

void
SDL_KillProcess(sv_process, sv_force)
	SV *sv_process
	SV *sv_force
    PREINIT:
	SDL_Process * c_process;
	_Bool c_force;
	_Bool c_bg_ret;
    PPCODE:
	c_process = (SDL_Process *)bg_in_record_ptr(aTHX_ sv_process, "SDL3::Process", "SDL_KillProcess(process)");
	c_force = (_Bool)SvTRUE(sv_force);
	c_bg_ret = SDL_KillProcess(c_process, c_force);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WaitProcess(sv_process, sv_block, sv_exitcode)
	SV *sv_process
	SV *sv_block
	SV *sv_exitcode
    PREINIT:
	SDL_Process * c_process;
	_Bool c_block;
	int c_exitcode; int * p_exitcode; SV *t_exitcode;
	_Bool c_bg_ret;
    PPCODE:
	c_process = (SDL_Process *)bg_in_record_ptr(aTHX_ sv_process, "SDL3::Process", "SDL_WaitProcess(process)");
	c_block = (_Bool)SvTRUE(sv_block);
	t_exitcode = bg_outref_target(aTHX_ sv_exitcode);
	c_exitcode = (t_exitcode && SvOK(t_exitcode)) ? (int)bg_in_iv(aTHX_ t_exitcode, "SDL_WaitProcess(exitcode)") : (int)0;
	p_exitcode = t_exitcode ? &c_exitcode : (int *)bg_outref_raw(aTHX_ sv_exitcode, "SDL_WaitProcess(exitcode)");
	c_bg_ret = SDL_WaitProcess(c_process, c_block, p_exitcode);
	if (t_exitcode) sv_setsv(t_exitcode, sv_2mortal(newSViv((IV)(c_exitcode))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_DestroyProcess(sv_process)
	SV *sv_process
    PREINIT:
	SDL_Process * c_process;
    PPCODE:
	c_process = (SDL_Process *)bg_in_record_ptr(aTHX_ sv_process, "SDL3::Process", "SDL_DestroyProcess(process)");
	SDL_DestroyProcess(c_process);
	XSRETURN(0);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Process", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_BACKGROUND_BOOLEAN", BG_CONST_SV(SDL_PROP_PROCESS_BACKGROUND_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_CREATE_ARGS_POINTER", BG_CONST_SV(SDL_PROP_PROCESS_CREATE_ARGS_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_CREATE_BACKGROUND_BOOLEAN", BG_CONST_SV(SDL_PROP_PROCESS_CREATE_BACKGROUND_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_CREATE_CMDLINE_STRING", BG_CONST_SV(SDL_PROP_PROCESS_CREATE_CMDLINE_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER", BG_CONST_SV(SDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_CREATE_STDERR_NUMBER", BG_CONST_SV(SDL_PROP_PROCESS_CREATE_STDERR_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_CREATE_STDERR_POINTER", BG_CONST_SV(SDL_PROP_PROCESS_CREATE_STDERR_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN", BG_CONST_SV(SDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_CREATE_STDIN_NUMBER", BG_CONST_SV(SDL_PROP_PROCESS_CREATE_STDIN_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_CREATE_STDIN_POINTER", BG_CONST_SV(SDL_PROP_PROCESS_CREATE_STDIN_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER", BG_CONST_SV(SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_CREATE_STDOUT_POINTER", BG_CONST_SV(SDL_PROP_PROCESS_CREATE_STDOUT_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_CREATE_WORKING_DIRECTORY_STRING", BG_CONST_SV(SDL_PROP_PROCESS_CREATE_WORKING_DIRECTORY_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_PID_NUMBER", BG_CONST_SV(SDL_PROP_PROCESS_PID_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_STDERR_POINTER", BG_CONST_SV(SDL_PROP_PROCESS_STDERR_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_STDIN_POINTER", BG_CONST_SV(SDL_PROP_PROCESS_STDIN_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_PROCESS_STDOUT_POINTER", BG_CONST_SV(SDL_PROP_PROCESS_STDOUT_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROCESS_STDIO_INHERITED", BG_CONST_SV(SDL_PROCESS_STDIO_INHERITED));
	bg_export_constant(aTHX_ stash, "SDL_PROCESS_STDIO_NULL", BG_CONST_SV(SDL_PROCESS_STDIO_NULL));
	bg_export_constant(aTHX_ stash, "SDL_PROCESS_STDIO_APP", BG_CONST_SV(SDL_PROCESS_STDIO_APP));
	bg_export_constant(aTHX_ stash, "SDL_PROCESS_STDIO_REDIRECT", BG_CONST_SV(SDL_PROCESS_STDIO_REDIRECT));
	}

