MODULE = SDL3  PACKAGE = SDL3::API::Audio

void
SDL_GetNumAudioDrivers()
    PREINIT:
	int c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetNumAudioDrivers();
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAudioDriver(sv_index)
	SV *sv_index
    PREINIT:
	int c_index;
	const char * c_bg_ret;
    PPCODE:
	c_index = (int)bg_in_iv(aTHX_ sv_index, "SDL_GetAudioDriver(index)");
	c_bg_ret = SDL_GetAudioDriver(c_index);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetCurrentAudioDriver()
    PREINIT:
	const char * c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetCurrentAudioDriver();
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAudioPlaybackDevices(sv_count)
	SV *sv_count
    PREINIT:
	int c_count; int * p_count; SV *t_count;
	SDL_AudioDeviceID * c_bg_ret;
    PPCODE:
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetAudioPlaybackDevices(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetAudioPlaybackDevices(count)");
	c_bg_ret = SDL_GetAudioPlaybackDevices(p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetAudioRecordingDevices(sv_count)
	SV *sv_count
    PREINIT:
	int c_count; int * p_count; SV *t_count;
	SDL_AudioDeviceID * c_bg_ret;
    PPCODE:
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetAudioRecordingDevices(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetAudioRecordingDevices(count)");
	c_bg_ret = SDL_GetAudioRecordingDevices(p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetAudioDeviceName(sv_devid)
	SV *sv_devid
    PREINIT:
	SDL_AudioDeviceID c_devid;
	const char * c_bg_ret;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_GetAudioDeviceName(devid)");
	c_bg_ret = SDL_GetAudioDeviceName(c_devid);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAudioDeviceFormat(sv_devid, sv_spec, sv_sample_frames)
	SV *sv_devid
	SV *sv_spec
	SV *sv_sample_frames
    PREINIT:
	SDL_AudioDeviceID c_devid;
	SDL_AudioSpec * c_spec;
	int c_sample_frames; int * p_sample_frames; SV *t_sample_frames;
	_Bool c_bg_ret;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_GetAudioDeviceFormat(devid)");
	c_spec = (SDL_AudioSpec *)bg_in_record_ptr(aTHX_ sv_spec, "SDL3::AudioSpec", "SDL_GetAudioDeviceFormat(spec)");
	t_sample_frames = bg_outref_target(aTHX_ sv_sample_frames);
	c_sample_frames = (t_sample_frames && SvOK(t_sample_frames)) ? (int)bg_in_iv(aTHX_ t_sample_frames, "SDL_GetAudioDeviceFormat(sample_frames)") : (int)0;
	p_sample_frames = t_sample_frames ? &c_sample_frames : (int *)bg_outref_raw(aTHX_ sv_sample_frames, "SDL_GetAudioDeviceFormat(sample_frames)");
	c_bg_ret = SDL_GetAudioDeviceFormat(c_devid, c_spec, p_sample_frames);
	if (t_sample_frames) sv_setsv(t_sample_frames, sv_2mortal(newSViv((IV)(c_sample_frames))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAudioDeviceChannelMap(sv_devid, sv_count)
	SV *sv_devid
	SV *sv_count
    PREINIT:
	SDL_AudioDeviceID c_devid;
	int c_count; int * p_count; SV *t_count;
	int * c_bg_ret;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_GetAudioDeviceChannelMap(devid)");
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetAudioDeviceChannelMap(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetAudioDeviceChannelMap(count)");
	c_bg_ret = SDL_GetAudioDeviceChannelMap(c_devid, p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_OpenAudioDevice(sv_devid, sv_spec)
	SV *sv_devid
	SV *sv_spec
    PREINIT:
	SDL_AudioDeviceID c_devid;
	const SDL_AudioSpec * c_spec;
	SDL_AudioDeviceID c_bg_ret;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_OpenAudioDevice(devid)");
	c_spec = (const SDL_AudioSpec *)bg_in_record_ptr(aTHX_ sv_spec, "SDL3::AudioSpec", "SDL_OpenAudioDevice(spec)");
	c_bg_ret = SDL_OpenAudioDevice(c_devid, c_spec);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_IsAudioDevicePhysical(sv_devid)
	SV *sv_devid
    PREINIT:
	SDL_AudioDeviceID c_devid;
	_Bool c_bg_ret;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_IsAudioDevicePhysical(devid)");
	c_bg_ret = SDL_IsAudioDevicePhysical(c_devid);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_IsAudioDevicePlayback(sv_devid)
	SV *sv_devid
    PREINIT:
	SDL_AudioDeviceID c_devid;
	_Bool c_bg_ret;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_IsAudioDevicePlayback(devid)");
	c_bg_ret = SDL_IsAudioDevicePlayback(c_devid);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_PauseAudioDevice(sv_devid)
	SV *sv_devid
    PREINIT:
	SDL_AudioDeviceID c_devid;
	_Bool c_bg_ret;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_PauseAudioDevice(devid)");
	c_bg_ret = SDL_PauseAudioDevice(c_devid);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ResumeAudioDevice(sv_devid)
	SV *sv_devid
    PREINIT:
	SDL_AudioDeviceID c_devid;
	_Bool c_bg_ret;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_ResumeAudioDevice(devid)");
	c_bg_ret = SDL_ResumeAudioDevice(c_devid);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_AudioDevicePaused(sv_devid)
	SV *sv_devid
    PREINIT:
	SDL_AudioDeviceID c_devid;
	_Bool c_bg_ret;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_AudioDevicePaused(devid)");
	c_bg_ret = SDL_AudioDevicePaused(c_devid);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAudioDeviceGain(sv_devid)
	SV *sv_devid
    PREINIT:
	SDL_AudioDeviceID c_devid;
	float c_bg_ret;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_GetAudioDeviceGain(devid)");
	c_bg_ret = SDL_GetAudioDeviceGain(c_devid);
	ST(0) = sv_2mortal(newSVnv((NV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetAudioDeviceGain(sv_devid, sv_gain)
	SV *sv_devid
	SV *sv_gain
    PREINIT:
	SDL_AudioDeviceID c_devid;
	float c_gain;
	_Bool c_bg_ret;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_SetAudioDeviceGain(devid)");
	c_gain = (float)bg_in_nv(aTHX_ sv_gain, "SDL_SetAudioDeviceGain(gain)");
	c_bg_ret = SDL_SetAudioDeviceGain(c_devid, c_gain);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CloseAudioDevice(sv_devid)
	SV *sv_devid
    PREINIT:
	SDL_AudioDeviceID c_devid;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_CloseAudioDevice(devid)");
	SDL_CloseAudioDevice(c_devid);
	XSRETURN(0);

void
SDL_BindAudioStreams(sv_devid, sv_streams, sv_num_streams)
	SV *sv_devid
	SV *sv_streams
	SV *sv_num_streams
    PREINIT:
	SDL_AudioDeviceID c_devid;
	SDL_AudioStream * c_streams; SDL_AudioStream * const * p_streams; SV *t_streams;
	int c_num_streams;
	_Bool c_bg_ret;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_BindAudioStreams(devid)");
	t_streams = bg_outref_target(aTHX_ sv_streams);
	c_streams = (t_streams && SvOK(t_streams)) ? (SDL_AudioStream *)bg_in_record_ptr(aTHX_ t_streams, "SDL3::AudioStream", "SDL_BindAudioStreams(streams)") : (SDL_AudioStream *)0;
	p_streams = t_streams ? &c_streams : (SDL_AudioStream * const *)bg_outref_raw(aTHX_ sv_streams, "SDL_BindAudioStreams(streams)");
	c_num_streams = (int)bg_in_iv(aTHX_ sv_num_streams, "SDL_BindAudioStreams(num_streams)");
	c_bg_ret = SDL_BindAudioStreams(c_devid, p_streams, c_num_streams);
	if (t_streams) sv_setsv(t_streams, sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_streams), "SDL3::AudioStream")));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_BindAudioStream(sv_devid, sv_stream)
	SV *sv_devid
	SV *sv_stream
    PREINIT:
	SDL_AudioDeviceID c_devid;
	SDL_AudioStream * c_stream;
	_Bool c_bg_ret;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_BindAudioStream(devid)");
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_BindAudioStream(stream)");
	c_bg_ret = SDL_BindAudioStream(c_devid, c_stream);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_UnbindAudioStreams(sv_streams, sv_num_streams)
	SV *sv_streams
	SV *sv_num_streams
    PREINIT:
	SDL_AudioStream * c_streams; SDL_AudioStream * const * p_streams; SV *t_streams;
	int c_num_streams;
    PPCODE:
	t_streams = bg_outref_target(aTHX_ sv_streams);
	c_streams = (t_streams && SvOK(t_streams)) ? (SDL_AudioStream *)bg_in_record_ptr(aTHX_ t_streams, "SDL3::AudioStream", "SDL_UnbindAudioStreams(streams)") : (SDL_AudioStream *)0;
	p_streams = t_streams ? &c_streams : (SDL_AudioStream * const *)bg_outref_raw(aTHX_ sv_streams, "SDL_UnbindAudioStreams(streams)");
	c_num_streams = (int)bg_in_iv(aTHX_ sv_num_streams, "SDL_UnbindAudioStreams(num_streams)");
	SDL_UnbindAudioStreams(p_streams, c_num_streams);
	if (t_streams) sv_setsv(t_streams, sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_streams), "SDL3::AudioStream")));
	XSRETURN(0);

void
SDL_UnbindAudioStream(sv_stream)
	SV *sv_stream
    PREINIT:
	SDL_AudioStream * c_stream;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_UnbindAudioStream(stream)");
	SDL_UnbindAudioStream(c_stream);
	XSRETURN(0);

void
SDL_GetAudioStreamDevice(sv_stream)
	SV *sv_stream
    PREINIT:
	SDL_AudioStream * c_stream;
	SDL_AudioDeviceID c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_GetAudioStreamDevice(stream)");
	c_bg_ret = SDL_GetAudioStreamDevice(c_stream);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_CreateAudioStream(sv_src_spec, sv_dst_spec)
	SV *sv_src_spec
	SV *sv_dst_spec
    PREINIT:
	const SDL_AudioSpec * c_src_spec;
	const SDL_AudioSpec * c_dst_spec;
	SDL_AudioStream * c_bg_ret;
    PPCODE:
	c_src_spec = (const SDL_AudioSpec *)bg_in_record_ptr(aTHX_ sv_src_spec, "SDL3::AudioSpec", "SDL_CreateAudioStream(src_spec)");
	c_dst_spec = (const SDL_AudioSpec *)bg_in_record_ptr(aTHX_ sv_dst_spec, "SDL3::AudioSpec", "SDL_CreateAudioStream(dst_spec)");
	c_bg_ret = SDL_CreateAudioStream(c_src_spec, c_dst_spec);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::AudioStream"));
	XSRETURN(1);

void
SDL_GetAudioStreamProperties(sv_stream)
	SV *sv_stream
    PREINIT:
	SDL_AudioStream * c_stream;
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_GetAudioStreamProperties(stream)");
	c_bg_ret = SDL_GetAudioStreamProperties(c_stream);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAudioStreamFormat(sv_stream, sv_src_spec, sv_dst_spec)
	SV *sv_stream
	SV *sv_src_spec
	SV *sv_dst_spec
    PREINIT:
	SDL_AudioStream * c_stream;
	SDL_AudioSpec * c_src_spec;
	SDL_AudioSpec * c_dst_spec;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_GetAudioStreamFormat(stream)");
	c_src_spec = (SDL_AudioSpec *)bg_in_record_ptr(aTHX_ sv_src_spec, "SDL3::AudioSpec", "SDL_GetAudioStreamFormat(src_spec)");
	c_dst_spec = (SDL_AudioSpec *)bg_in_record_ptr(aTHX_ sv_dst_spec, "SDL3::AudioSpec", "SDL_GetAudioStreamFormat(dst_spec)");
	c_bg_ret = SDL_GetAudioStreamFormat(c_stream, c_src_spec, c_dst_spec);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetAudioStreamFormat(sv_stream, sv_src_spec, sv_dst_spec)
	SV *sv_stream
	SV *sv_src_spec
	SV *sv_dst_spec
    PREINIT:
	SDL_AudioStream * c_stream;
	const SDL_AudioSpec * c_src_spec;
	const SDL_AudioSpec * c_dst_spec;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_SetAudioStreamFormat(stream)");
	c_src_spec = (const SDL_AudioSpec *)bg_in_record_ptr(aTHX_ sv_src_spec, "SDL3::AudioSpec", "SDL_SetAudioStreamFormat(src_spec)");
	c_dst_spec = (const SDL_AudioSpec *)bg_in_record_ptr(aTHX_ sv_dst_spec, "SDL3::AudioSpec", "SDL_SetAudioStreamFormat(dst_spec)");
	c_bg_ret = SDL_SetAudioStreamFormat(c_stream, c_src_spec, c_dst_spec);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAudioStreamFrequencyRatio(sv_stream)
	SV *sv_stream
    PREINIT:
	SDL_AudioStream * c_stream;
	float c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_GetAudioStreamFrequencyRatio(stream)");
	c_bg_ret = SDL_GetAudioStreamFrequencyRatio(c_stream);
	ST(0) = sv_2mortal(newSVnv((NV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetAudioStreamFrequencyRatio(sv_stream, sv_ratio)
	SV *sv_stream
	SV *sv_ratio
    PREINIT:
	SDL_AudioStream * c_stream;
	float c_ratio;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_SetAudioStreamFrequencyRatio(stream)");
	c_ratio = (float)bg_in_nv(aTHX_ sv_ratio, "SDL_SetAudioStreamFrequencyRatio(ratio)");
	c_bg_ret = SDL_SetAudioStreamFrequencyRatio(c_stream, c_ratio);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAudioStreamGain(sv_stream)
	SV *sv_stream
    PREINIT:
	SDL_AudioStream * c_stream;
	float c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_GetAudioStreamGain(stream)");
	c_bg_ret = SDL_GetAudioStreamGain(c_stream);
	ST(0) = sv_2mortal(newSVnv((NV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetAudioStreamGain(sv_stream, sv_gain)
	SV *sv_stream
	SV *sv_gain
    PREINIT:
	SDL_AudioStream * c_stream;
	float c_gain;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_SetAudioStreamGain(stream)");
	c_gain = (float)bg_in_nv(aTHX_ sv_gain, "SDL_SetAudioStreamGain(gain)");
	c_bg_ret = SDL_SetAudioStreamGain(c_stream, c_gain);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAudioStreamInputChannelMap(sv_stream, sv_count)
	SV *sv_stream
	SV *sv_count
    PREINIT:
	SDL_AudioStream * c_stream;
	int c_count; int * p_count; SV *t_count;
	int * c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_GetAudioStreamInputChannelMap(stream)");
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetAudioStreamInputChannelMap(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetAudioStreamInputChannelMap(count)");
	c_bg_ret = SDL_GetAudioStreamInputChannelMap(c_stream, p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_GetAudioStreamOutputChannelMap(sv_stream, sv_count)
	SV *sv_stream
	SV *sv_count
    PREINIT:
	SDL_AudioStream * c_stream;
	int c_count; int * p_count; SV *t_count;
	int * c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_GetAudioStreamOutputChannelMap(stream)");
	t_count = bg_outref_target(aTHX_ sv_count);
	c_count = (t_count && SvOK(t_count)) ? (int)bg_in_iv(aTHX_ t_count, "SDL_GetAudioStreamOutputChannelMap(count)") : (int)0;
	p_count = t_count ? &c_count : (int *)bg_outref_raw(aTHX_ sv_count, "SDL_GetAudioStreamOutputChannelMap(count)");
	c_bg_ret = SDL_GetAudioStreamOutputChannelMap(c_stream, p_count);
	if (t_count) sv_setsv(t_count, sv_2mortal(newSViv((IV)(c_count))));
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_SetAudioStreamInputChannelMap(sv_stream, sv_chmap, sv_count)
	SV *sv_stream
	SV *sv_chmap
	SV *sv_count
    PREINIT:
	SDL_AudioStream * c_stream;
	const int * c_chmap;
	int c_count;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_SetAudioStreamInputChannelMap(stream)");
	c_chmap = (const int *)bg_in_raw_ptr(aTHX_ sv_chmap, "SDL_SetAudioStreamInputChannelMap(chmap)");
	c_count = (int)bg_in_iv(aTHX_ sv_count, "SDL_SetAudioStreamInputChannelMap(count)");
	c_bg_ret = SDL_SetAudioStreamInputChannelMap(c_stream, c_chmap, c_count);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetAudioStreamOutputChannelMap(sv_stream, sv_chmap, sv_count)
	SV *sv_stream
	SV *sv_chmap
	SV *sv_count
    PREINIT:
	SDL_AudioStream * c_stream;
	const int * c_chmap;
	int c_count;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_SetAudioStreamOutputChannelMap(stream)");
	c_chmap = (const int *)bg_in_raw_ptr(aTHX_ sv_chmap, "SDL_SetAudioStreamOutputChannelMap(chmap)");
	c_count = (int)bg_in_iv(aTHX_ sv_count, "SDL_SetAudioStreamOutputChannelMap(count)");
	c_bg_ret = SDL_SetAudioStreamOutputChannelMap(c_stream, c_chmap, c_count);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_PutAudioStreamData(sv_stream, sv_buf, sv_len)
	SV *sv_stream
	SV *sv_buf
	SV *sv_len
    PREINIT:
	SDL_AudioStream * c_stream;
	const void * c_buf;
	int c_len;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_PutAudioStreamData(stream)");
	c_buf = (const void *)bg_in_raw_ptr(aTHX_ sv_buf, "SDL_PutAudioStreamData(buf)");
	c_len = (int)bg_in_iv(aTHX_ sv_len, "SDL_PutAudioStreamData(len)");
	c_bg_ret = SDL_PutAudioStreamData(c_stream, c_buf, c_len);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_PutAudioStreamDataNoCopy(sv_stream, sv_buf, sv_len, sv_callback, sv_userdata)
	SV *sv_stream
	SV *sv_buf
	SV *sv_len
	SV *sv_callback
	SV *sv_userdata
    PREINIT:
	SDL_AudioStream * c_stream;
	const void * c_buf;
	int c_len;
	SDL_AudioStreamDataCompleteCallback c_callback;
	void * c_userdata;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_PutAudioStreamDataNoCopy(stream)");
	c_buf = (const void *)bg_in_raw_ptr(aTHX_ sv_buf, "SDL_PutAudioStreamDataNoCopy(buf)");
	c_len = (int)bg_in_iv(aTHX_ sv_len, "SDL_PutAudioStreamDataNoCopy(len)");
	c_callback = SvOK(sv_callback) ? (SDL_AudioStreamDataCompleteCallback)bg_tramp_SDL_AudioStreamDataCompleteCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_PutAudioStreamDataNoCopy(userdata)") : NULL;
	c_bg_ret = SDL_PutAudioStreamDataNoCopy(c_stream, c_buf, c_len, c_callback, c_userdata);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_PutAudioStreamPlanarData(sv_stream, sv_channel_buffers, sv_num_channels, sv_num_samples)
	SV *sv_stream
	SV *sv_channel_buffers
	SV *sv_num_channels
	SV *sv_num_samples
    PREINIT:
	SDL_AudioStream * c_stream;
	const void * c_channel_buffers; const void * const * p_channel_buffers; SV *t_channel_buffers;
	int c_num_channels;
	int c_num_samples;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_PutAudioStreamPlanarData(stream)");
	t_channel_buffers = bg_outref_target(aTHX_ sv_channel_buffers);
	c_channel_buffers = (t_channel_buffers && SvOK(t_channel_buffers)) ? (const void *)bg_in_raw_ptr(aTHX_ t_channel_buffers, "SDL_PutAudioStreamPlanarData(channel_buffers)") : (const void *)0;
	p_channel_buffers = t_channel_buffers ? &c_channel_buffers : (const void * const *)bg_outref_raw(aTHX_ sv_channel_buffers, "SDL_PutAudioStreamPlanarData(channel_buffers)");
	c_num_channels = (int)bg_in_iv(aTHX_ sv_num_channels, "SDL_PutAudioStreamPlanarData(num_channels)");
	c_num_samples = (int)bg_in_iv(aTHX_ sv_num_samples, "SDL_PutAudioStreamPlanarData(num_samples)");
	c_bg_ret = SDL_PutAudioStreamPlanarData(c_stream, p_channel_buffers, c_num_channels, c_num_samples);
	if (t_channel_buffers) sv_setsv(t_channel_buffers, sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_channel_buffers), "SDL3::Pointer")));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAudioStreamData(sv_stream, sv_buf, sv_len)
	SV *sv_stream
	SV *sv_buf
	SV *sv_len
    PREINIT:
	SDL_AudioStream * c_stream;
	void * c_buf;
	int c_len;
	int c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_GetAudioStreamData(stream)");
	c_buf = (void *)bg_in_raw_ptr(aTHX_ sv_buf, "SDL_GetAudioStreamData(buf)");
	c_len = (int)bg_in_iv(aTHX_ sv_len, "SDL_GetAudioStreamData(len)");
	c_bg_ret = SDL_GetAudioStreamData(c_stream, c_buf, c_len);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAudioStreamAvailable(sv_stream)
	SV *sv_stream
    PREINIT:
	SDL_AudioStream * c_stream;
	int c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_GetAudioStreamAvailable(stream)");
	c_bg_ret = SDL_GetAudioStreamAvailable(c_stream);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAudioStreamQueued(sv_stream)
	SV *sv_stream
    PREINIT:
	SDL_AudioStream * c_stream;
	int c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_GetAudioStreamQueued(stream)");
	c_bg_ret = SDL_GetAudioStreamQueued(c_stream);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_FlushAudioStream(sv_stream)
	SV *sv_stream
    PREINIT:
	SDL_AudioStream * c_stream;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_FlushAudioStream(stream)");
	c_bg_ret = SDL_FlushAudioStream(c_stream);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ClearAudioStream(sv_stream)
	SV *sv_stream
    PREINIT:
	SDL_AudioStream * c_stream;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_ClearAudioStream(stream)");
	c_bg_ret = SDL_ClearAudioStream(c_stream);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_PauseAudioStreamDevice(sv_stream)
	SV *sv_stream
    PREINIT:
	SDL_AudioStream * c_stream;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_PauseAudioStreamDevice(stream)");
	c_bg_ret = SDL_PauseAudioStreamDevice(c_stream);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ResumeAudioStreamDevice(sv_stream)
	SV *sv_stream
    PREINIT:
	SDL_AudioStream * c_stream;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_ResumeAudioStreamDevice(stream)");
	c_bg_ret = SDL_ResumeAudioStreamDevice(c_stream);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_AudioStreamDevicePaused(sv_stream)
	SV *sv_stream
    PREINIT:
	SDL_AudioStream * c_stream;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_AudioStreamDevicePaused(stream)");
	c_bg_ret = SDL_AudioStreamDevicePaused(c_stream);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_LockAudioStream(sv_stream)
	SV *sv_stream
    PREINIT:
	SDL_AudioStream * c_stream;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_LockAudioStream(stream)");
	c_bg_ret = SDL_LockAudioStream(c_stream);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_UnlockAudioStream(sv_stream)
	SV *sv_stream
    PREINIT:
	SDL_AudioStream * c_stream;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_UnlockAudioStream(stream)");
	c_bg_ret = SDL_UnlockAudioStream(c_stream);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetAudioStreamGetCallback(sv_stream, sv_callback, sv_userdata)
	SV *sv_stream
	SV *sv_callback
	SV *sv_userdata
    PREINIT:
	SDL_AudioStream * c_stream;
	SDL_AudioStreamCallback c_callback;
	void * c_userdata;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_SetAudioStreamGetCallback(stream)");
	c_callback = SvOK(sv_callback) ? (SDL_AudioStreamCallback)bg_tramp_SDL_AudioStreamCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_SetAudioStreamGetCallback(userdata)") : NULL;
	c_bg_ret = SDL_SetAudioStreamGetCallback(c_stream, c_callback, c_userdata);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetAudioStreamPutCallback(sv_stream, sv_callback, sv_userdata)
	SV *sv_stream
	SV *sv_callback
	SV *sv_userdata
    PREINIT:
	SDL_AudioStream * c_stream;
	SDL_AudioStreamCallback c_callback;
	void * c_userdata;
	_Bool c_bg_ret;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_SetAudioStreamPutCallback(stream)");
	c_callback = SvOK(sv_callback) ? (SDL_AudioStreamCallback)bg_tramp_SDL_AudioStreamCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_SetAudioStreamPutCallback(userdata)") : NULL;
	c_bg_ret = SDL_SetAudioStreamPutCallback(c_stream, c_callback, c_userdata);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_DestroyAudioStream(sv_stream)
	SV *sv_stream
    PREINIT:
	SDL_AudioStream * c_stream;
    PPCODE:
	c_stream = (SDL_AudioStream *)bg_in_record_ptr(aTHX_ sv_stream, "SDL3::AudioStream", "SDL_DestroyAudioStream(stream)");
	SDL_DestroyAudioStream(c_stream);
	XSRETURN(0);

void
SDL_OpenAudioDeviceStream(sv_devid, sv_spec, sv_callback, sv_userdata)
	SV *sv_devid
	SV *sv_spec
	SV *sv_callback
	SV *sv_userdata
    PREINIT:
	SDL_AudioDeviceID c_devid;
	const SDL_AudioSpec * c_spec;
	SDL_AudioStreamCallback c_callback;
	void * c_userdata;
	SDL_AudioStream * c_bg_ret;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_OpenAudioDeviceStream(devid)");
	c_spec = (const SDL_AudioSpec *)bg_in_record_ptr(aTHX_ sv_spec, "SDL3::AudioSpec", "SDL_OpenAudioDeviceStream(spec)");
	c_callback = SvOK(sv_callback) ? (SDL_AudioStreamCallback)bg_tramp_SDL_AudioStreamCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_OpenAudioDeviceStream(userdata)") : NULL;
	c_bg_ret = SDL_OpenAudioDeviceStream(c_devid, c_spec, c_callback, c_userdata);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::AudioStream"));
	XSRETURN(1);

void
SDL_SetAudioPostmixCallback(sv_devid, sv_callback, sv_userdata)
	SV *sv_devid
	SV *sv_callback
	SV *sv_userdata
    PREINIT:
	SDL_AudioDeviceID c_devid;
	SDL_AudioPostmixCallback c_callback;
	void * c_userdata;
	_Bool c_bg_ret;
    PPCODE:
	c_devid = (SDL_AudioDeviceID)bg_in_uv(aTHX_ sv_devid, "SDL_SetAudioPostmixCallback(devid)");
	c_callback = SvOK(sv_callback) ? (SDL_AudioPostmixCallback)bg_tramp_SDL_AudioPostmixCallback : NULL;
	c_userdata = SvOK(sv_callback) ? (void *)bg_make_holder(aTHX_ sv_callback, sv_userdata, "SDL_SetAudioPostmixCallback(userdata)") : NULL;
	c_bg_ret = SDL_SetAudioPostmixCallback(c_devid, c_callback, c_userdata);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_LoadWAV_IO(sv_src, sv_closeio, sv_spec, sv_audio_buf, sv_audio_len)
	SV *sv_src
	SV *sv_closeio
	SV *sv_spec
	SV *sv_audio_buf
	SV *sv_audio_len
    PREINIT:
	SDL_IOStream * c_src;
	_Bool c_closeio;
	SDL_AudioSpec * c_spec;
	Uint8 * c_audio_buf; Uint8 ** p_audio_buf; SV *t_audio_buf;
	Uint32 c_audio_len; Uint32 * p_audio_len; SV *t_audio_len;
	_Bool c_bg_ret;
    PPCODE:
	c_src = (SDL_IOStream *)bg_in_record_ptr(aTHX_ sv_src, "SDL3::IOStream", "SDL_LoadWAV_IO(src)");
	c_closeio = (_Bool)SvTRUE(sv_closeio);
	c_spec = (SDL_AudioSpec *)bg_in_record_ptr(aTHX_ sv_spec, "SDL3::AudioSpec", "SDL_LoadWAV_IO(spec)");
	t_audio_buf = bg_outref_target(aTHX_ sv_audio_buf);
	c_audio_buf = (t_audio_buf && SvOK(t_audio_buf)) ? (Uint8 *)bg_in_raw_ptr(aTHX_ t_audio_buf, "SDL_LoadWAV_IO(audio_buf)") : (Uint8 *)0;
	p_audio_buf = t_audio_buf ? &c_audio_buf : (Uint8 **)bg_outref_raw(aTHX_ sv_audio_buf, "SDL_LoadWAV_IO(audio_buf)");
	t_audio_len = bg_outref_target(aTHX_ sv_audio_len);
	c_audio_len = (t_audio_len && SvOK(t_audio_len)) ? (Uint32)bg_in_uv(aTHX_ t_audio_len, "SDL_LoadWAV_IO(audio_len)") : (Uint32)0;
	p_audio_len = t_audio_len ? &c_audio_len : (Uint32 *)bg_outref_raw(aTHX_ sv_audio_len, "SDL_LoadWAV_IO(audio_len)");
	c_bg_ret = SDL_LoadWAV_IO(c_src, c_closeio, c_spec, p_audio_buf, p_audio_len);
	if (t_audio_buf) sv_setsv(t_audio_buf, sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_audio_buf), "SDL3::Pointer")));
	if (t_audio_len) sv_setsv(t_audio_len, sv_2mortal(newSVuv((UV)(c_audio_len))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_LoadWAV(sv_path, sv_spec, sv_audio_buf, sv_audio_len)
	SV *sv_path
	SV *sv_spec
	SV *sv_audio_buf
	SV *sv_audio_len
    PREINIT:
	const char * c_path;
	SDL_AudioSpec * c_spec;
	Uint8 * c_audio_buf; Uint8 ** p_audio_buf; SV *t_audio_buf;
	Uint32 c_audio_len; Uint32 * p_audio_len; SV *t_audio_len;
	_Bool c_bg_ret;
    PPCODE:
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_LoadWAV(path)");
	c_spec = (SDL_AudioSpec *)bg_in_record_ptr(aTHX_ sv_spec, "SDL3::AudioSpec", "SDL_LoadWAV(spec)");
	t_audio_buf = bg_outref_target(aTHX_ sv_audio_buf);
	c_audio_buf = (t_audio_buf && SvOK(t_audio_buf)) ? (Uint8 *)bg_in_raw_ptr(aTHX_ t_audio_buf, "SDL_LoadWAV(audio_buf)") : (Uint8 *)0;
	p_audio_buf = t_audio_buf ? &c_audio_buf : (Uint8 **)bg_outref_raw(aTHX_ sv_audio_buf, "SDL_LoadWAV(audio_buf)");
	t_audio_len = bg_outref_target(aTHX_ sv_audio_len);
	c_audio_len = (t_audio_len && SvOK(t_audio_len)) ? (Uint32)bg_in_uv(aTHX_ t_audio_len, "SDL_LoadWAV(audio_len)") : (Uint32)0;
	p_audio_len = t_audio_len ? &c_audio_len : (Uint32 *)bg_outref_raw(aTHX_ sv_audio_len, "SDL_LoadWAV(audio_len)");
	c_bg_ret = SDL_LoadWAV(c_path, c_spec, p_audio_buf, p_audio_len);
	if (t_audio_buf) sv_setsv(t_audio_buf, sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_audio_buf), "SDL3::Pointer")));
	if (t_audio_len) sv_setsv(t_audio_len, sv_2mortal(newSVuv((UV)(c_audio_len))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_MixAudio(sv_dst, sv_src, sv_format, sv_len, sv_volume)
	SV *sv_dst
	SV *sv_src
	SV *sv_format
	SV *sv_len
	SV *sv_volume
    PREINIT:
	Uint8 c_dst; Uint8 * p_dst; SV *t_dst;
	Uint8 c_src; const Uint8 * p_src; SV *t_src;
	SDL_AudioFormat c_format;
	Uint32 c_len;
	float c_volume;
	_Bool c_bg_ret;
    PPCODE:
	t_dst = bg_outref_target(aTHX_ sv_dst);
	c_dst = (t_dst && SvOK(t_dst)) ? (Uint8)bg_in_uv(aTHX_ t_dst, "SDL_MixAudio(dst)") : (Uint8)0;
	p_dst = t_dst ? &c_dst : (Uint8 *)bg_outref_raw(aTHX_ sv_dst, "SDL_MixAudio(dst)");
	t_src = bg_outref_target(aTHX_ sv_src);
	c_src = (t_src && SvOK(t_src)) ? (Uint8)bg_in_uv(aTHX_ t_src, "SDL_MixAudio(src)") : (Uint8)0;
	p_src = t_src ? &c_src : (const Uint8 *)bg_outref_raw(aTHX_ sv_src, "SDL_MixAudio(src)");
	c_format = (SDL_AudioFormat)bg_in_iv(aTHX_ sv_format, "SDL_MixAudio(format)");
	c_len = (Uint32)bg_in_uv(aTHX_ sv_len, "SDL_MixAudio(len)");
	c_volume = (float)bg_in_nv(aTHX_ sv_volume, "SDL_MixAudio(volume)");
	c_bg_ret = SDL_MixAudio(p_dst, p_src, c_format, c_len, c_volume);
	if (t_dst) sv_setsv(t_dst, sv_2mortal(newSVuv((UV)(c_dst))));
	if (t_src) sv_setsv(t_src, sv_2mortal(newSVuv((UV)(c_src))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ConvertAudioSamples(sv_src_spec, sv_src_data, sv_src_len, sv_dst_spec, sv_dst_data, sv_dst_len)
	SV *sv_src_spec
	SV *sv_src_data
	SV *sv_src_len
	SV *sv_dst_spec
	SV *sv_dst_data
	SV *sv_dst_len
    PREINIT:
	const SDL_AudioSpec * c_src_spec;
	Uint8 c_src_data; const Uint8 * p_src_data; SV *t_src_data;
	int c_src_len;
	const SDL_AudioSpec * c_dst_spec;
	Uint8 * c_dst_data; Uint8 ** p_dst_data; SV *t_dst_data;
	int c_dst_len; int * p_dst_len; SV *t_dst_len;
	_Bool c_bg_ret;
    PPCODE:
	c_src_spec = (const SDL_AudioSpec *)bg_in_record_ptr(aTHX_ sv_src_spec, "SDL3::AudioSpec", "SDL_ConvertAudioSamples(src_spec)");
	t_src_data = bg_outref_target(aTHX_ sv_src_data);
	c_src_data = (t_src_data && SvOK(t_src_data)) ? (Uint8)bg_in_uv(aTHX_ t_src_data, "SDL_ConvertAudioSamples(src_data)") : (Uint8)0;
	p_src_data = t_src_data ? &c_src_data : (const Uint8 *)bg_outref_raw(aTHX_ sv_src_data, "SDL_ConvertAudioSamples(src_data)");
	c_src_len = (int)bg_in_iv(aTHX_ sv_src_len, "SDL_ConvertAudioSamples(src_len)");
	c_dst_spec = (const SDL_AudioSpec *)bg_in_record_ptr(aTHX_ sv_dst_spec, "SDL3::AudioSpec", "SDL_ConvertAudioSamples(dst_spec)");
	t_dst_data = bg_outref_target(aTHX_ sv_dst_data);
	c_dst_data = (t_dst_data && SvOK(t_dst_data)) ? (Uint8 *)bg_in_raw_ptr(aTHX_ t_dst_data, "SDL_ConvertAudioSamples(dst_data)") : (Uint8 *)0;
	p_dst_data = t_dst_data ? &c_dst_data : (Uint8 **)bg_outref_raw(aTHX_ sv_dst_data, "SDL_ConvertAudioSamples(dst_data)");
	t_dst_len = bg_outref_target(aTHX_ sv_dst_len);
	c_dst_len = (t_dst_len && SvOK(t_dst_len)) ? (int)bg_in_iv(aTHX_ t_dst_len, "SDL_ConvertAudioSamples(dst_len)") : (int)0;
	p_dst_len = t_dst_len ? &c_dst_len : (int *)bg_outref_raw(aTHX_ sv_dst_len, "SDL_ConvertAudioSamples(dst_len)");
	c_bg_ret = SDL_ConvertAudioSamples(c_src_spec, p_src_data, c_src_len, c_dst_spec, p_dst_data, p_dst_len);
	if (t_src_data) sv_setsv(t_src_data, sv_2mortal(newSVuv((UV)(c_src_data))));
	if (t_dst_data) sv_setsv(t_dst_data, sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_dst_data), "SDL3::Pointer")));
	if (t_dst_len) sv_setsv(t_dst_len, sv_2mortal(newSViv((IV)(c_dst_len))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetAudioFormatName(sv_format)
	SV *sv_format
    PREINIT:
	SDL_AudioFormat c_format;
	const char * c_bg_ret;
    PPCODE:
	c_format = (SDL_AudioFormat)bg_in_iv(aTHX_ sv_format, "SDL_GetAudioFormatName(format)");
	c_bg_ret = SDL_GetAudioFormatName(c_format);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetSilenceValueForFormat(sv_format)
	SV *sv_format
    PREINIT:
	SDL_AudioFormat c_format;
	int c_bg_ret;
    PPCODE:
	c_format = (SDL_AudioFormat)bg_in_iv(aTHX_ sv_format, "SDL_GetSilenceValueForFormat(format)");
	c_bg_ret = SDL_GetSilenceValueForFormat(c_format);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Audio", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK", BG_CONST_SV(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_DEVICE_DEFAULT_RECORDING", BG_CONST_SV(SDL_AUDIO_DEVICE_DEFAULT_RECORDING));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_MASK_BIG_ENDIAN", BG_CONST_SV(SDL_AUDIO_MASK_BIG_ENDIAN));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_MASK_BITSIZE", BG_CONST_SV(SDL_AUDIO_MASK_BITSIZE));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_MASK_FLOAT", BG_CONST_SV(SDL_AUDIO_MASK_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_MASK_SIGNED", BG_CONST_SV(SDL_AUDIO_MASK_SIGNED));
	bg_export_constant(aTHX_ stash, "SDL_PROP_AUDIOSTREAM_AUTO_CLEANUP_BOOLEAN", BG_CONST_SV(SDL_PROP_AUDIOSTREAM_AUTO_CLEANUP_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_UNKNOWN", BG_CONST_SV(SDL_AUDIO_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_U8", BG_CONST_SV(SDL_AUDIO_U8));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_S8", BG_CONST_SV(SDL_AUDIO_S8));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_S16LE", BG_CONST_SV(SDL_AUDIO_S16LE));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_S16BE", BG_CONST_SV(SDL_AUDIO_S16BE));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_S32LE", BG_CONST_SV(SDL_AUDIO_S32LE));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_S32BE", BG_CONST_SV(SDL_AUDIO_S32BE));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_F32LE", BG_CONST_SV(SDL_AUDIO_F32LE));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_F32BE", BG_CONST_SV(SDL_AUDIO_F32BE));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_S16", BG_CONST_SV(SDL_AUDIO_S16));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_S32", BG_CONST_SV(SDL_AUDIO_S32));
	bg_export_constant(aTHX_ stash, "SDL_AUDIO_F32", BG_CONST_SV(SDL_AUDIO_F32));
	}

MODULE = SDL3  PACKAGE = SDL3::AudioSpec

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_AudioSpec), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_AudioSpec)));
	XSRETURN(1);

void
format(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AudioSpec *self;
    PPCODE:
	self = (struct SDL_AudioSpec *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AudioSpec", "SDL3::AudioSpec::format");
	if (items > 1) {
		self->format = (SDL_AudioFormat)bg_in_iv(aTHX_ ST(1), "SDL3::AudioSpec::format");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->format)));
	XSRETURN(1);

void
channels(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AudioSpec *self;
    PPCODE:
	self = (struct SDL_AudioSpec *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AudioSpec", "SDL3::AudioSpec::channels");
	if (items > 1) {
		self->channels = (int)bg_in_iv(aTHX_ ST(1), "SDL3::AudioSpec::channels");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->channels)));
	XSRETURN(1);

void
freq(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_AudioSpec *self;
    PPCODE:
	self = (struct SDL_AudioSpec *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::AudioSpec", "SDL3::AudioSpec::freq");
	if (items > 1) {
		self->freq = (int)bg_in_iv(aTHX_ ST(1), "SDL3::AudioSpec::freq");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->freq)));
	XSRETURN(1);

