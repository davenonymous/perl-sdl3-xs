MODULE = SDL3  PACKAGE = SDL3::API::Gpu

void
SDL_GPUSupportsShaderFormats(sv_format_flags, sv_name)
	SV *sv_format_flags
	SV *sv_name
    PREINIT:
	SDL_GPUShaderFormat c_format_flags;
	const char * c_name;
	_Bool c_bg_ret;
    PPCODE:
	c_format_flags = (SDL_GPUShaderFormat)bg_in_uv(aTHX_ sv_format_flags, "SDL_GPUSupportsShaderFormats(format_flags)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_GPUSupportsShaderFormats(name)");
	c_bg_ret = SDL_GPUSupportsShaderFormats(c_format_flags, c_name);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GPUSupportsProperties(sv_props)
	SV *sv_props
    PREINIT:
	SDL_PropertiesID c_props;
	_Bool c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_GPUSupportsProperties(props)");
	c_bg_ret = SDL_GPUSupportsProperties(c_props);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CreateGPUDevice(sv_format_flags, sv_debug_mode, sv_name)
	SV *sv_format_flags
	SV *sv_debug_mode
	SV *sv_name
    PREINIT:
	SDL_GPUShaderFormat c_format_flags;
	_Bool c_debug_mode;
	const char * c_name;
	SDL_GPUDevice * c_bg_ret;
    PPCODE:
	c_format_flags = (SDL_GPUShaderFormat)bg_in_uv(aTHX_ sv_format_flags, "SDL_CreateGPUDevice(format_flags)");
	c_debug_mode = (_Bool)SvTRUE(sv_debug_mode);
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_CreateGPUDevice(name)");
	c_bg_ret = SDL_CreateGPUDevice(c_format_flags, c_debug_mode, c_name);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPUDevice"));
	XSRETURN(1);

void
SDL_CreateGPUDeviceWithProperties(sv_props)
	SV *sv_props
    PREINIT:
	SDL_PropertiesID c_props;
	SDL_GPUDevice * c_bg_ret;
    PPCODE:
	c_props = (SDL_PropertiesID)bg_in_uv(aTHX_ sv_props, "SDL_CreateGPUDeviceWithProperties(props)");
	c_bg_ret = SDL_CreateGPUDeviceWithProperties(c_props);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPUDevice"));
	XSRETURN(1);

void
SDL_DestroyGPUDevice(sv_device)
	SV *sv_device
    PREINIT:
	SDL_GPUDevice * c_device;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_DestroyGPUDevice(device)");
	SDL_DestroyGPUDevice(c_device);
	XSRETURN(0);

void
SDL_GetNumGPUDrivers()
    PREINIT:
	int c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_GetNumGPUDrivers();
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGPUDriver(sv_index)
	SV *sv_index
    PREINIT:
	int c_index;
	const char * c_bg_ret;
    PPCODE:
	c_index = (int)bg_in_iv(aTHX_ sv_index, "SDL_GetGPUDriver(index)");
	c_bg_ret = SDL_GetGPUDriver(c_index);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGPUDeviceDriver(sv_device)
	SV *sv_device
    PREINIT:
	SDL_GPUDevice * c_device;
	const char * c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_GetGPUDeviceDriver(device)");
	c_bg_ret = SDL_GetGPUDeviceDriver(c_device);
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGPUShaderFormats(sv_device)
	SV *sv_device
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUShaderFormat c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_GetGPUShaderFormats(device)");
	c_bg_ret = SDL_GetGPUShaderFormats(c_device);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGPUDeviceProperties(sv_device)
	SV *sv_device
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_GetGPUDeviceProperties(device)");
	c_bg_ret = SDL_GetGPUDeviceProperties(c_device);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_CreateGPUComputePipeline(sv_device, sv_createinfo)
	SV *sv_device
	SV *sv_createinfo
    PREINIT:
	SDL_GPUDevice * c_device;
	const SDL_GPUComputePipelineCreateInfo * c_createinfo;
	SDL_GPUComputePipeline * c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_CreateGPUComputePipeline(device)");
	c_createinfo = (const SDL_GPUComputePipelineCreateInfo *)bg_in_record_ptr(aTHX_ sv_createinfo, "SDL3::GPUComputePipelineCreateInfo", "SDL_CreateGPUComputePipeline(createinfo)");
	c_bg_ret = SDL_CreateGPUComputePipeline(c_device, c_createinfo);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPUComputePipeline"));
	XSRETURN(1);

void
SDL_CreateGPUGraphicsPipeline(sv_device, sv_createinfo)
	SV *sv_device
	SV *sv_createinfo
    PREINIT:
	SDL_GPUDevice * c_device;
	const SDL_GPUGraphicsPipelineCreateInfo * c_createinfo;
	SDL_GPUGraphicsPipeline * c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_CreateGPUGraphicsPipeline(device)");
	c_createinfo = (const SDL_GPUGraphicsPipelineCreateInfo *)bg_in_record_ptr(aTHX_ sv_createinfo, "SDL3::GPUGraphicsPipelineCreateInfo", "SDL_CreateGPUGraphicsPipeline(createinfo)");
	c_bg_ret = SDL_CreateGPUGraphicsPipeline(c_device, c_createinfo);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPUGraphicsPipeline"));
	XSRETURN(1);

void
SDL_CreateGPUSampler(sv_device, sv_createinfo)
	SV *sv_device
	SV *sv_createinfo
    PREINIT:
	SDL_GPUDevice * c_device;
	const SDL_GPUSamplerCreateInfo * c_createinfo;
	SDL_GPUSampler * c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_CreateGPUSampler(device)");
	c_createinfo = (const SDL_GPUSamplerCreateInfo *)bg_in_record_ptr(aTHX_ sv_createinfo, "SDL3::GPUSamplerCreateInfo", "SDL_CreateGPUSampler(createinfo)");
	c_bg_ret = SDL_CreateGPUSampler(c_device, c_createinfo);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPUSampler"));
	XSRETURN(1);

void
SDL_CreateGPUShader(sv_device, sv_createinfo)
	SV *sv_device
	SV *sv_createinfo
    PREINIT:
	SDL_GPUDevice * c_device;
	const SDL_GPUShaderCreateInfo * c_createinfo;
	SDL_GPUShader * c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_CreateGPUShader(device)");
	c_createinfo = (const SDL_GPUShaderCreateInfo *)bg_in_record_ptr(aTHX_ sv_createinfo, "SDL3::GPUShaderCreateInfo", "SDL_CreateGPUShader(createinfo)");
	c_bg_ret = SDL_CreateGPUShader(c_device, c_createinfo);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPUShader"));
	XSRETURN(1);

void
SDL_CreateGPUTexture(sv_device, sv_createinfo)
	SV *sv_device
	SV *sv_createinfo
    PREINIT:
	SDL_GPUDevice * c_device;
	const SDL_GPUTextureCreateInfo * c_createinfo;
	SDL_GPUTexture * c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_CreateGPUTexture(device)");
	c_createinfo = (const SDL_GPUTextureCreateInfo *)bg_in_record_ptr(aTHX_ sv_createinfo, "SDL3::GPUTextureCreateInfo", "SDL_CreateGPUTexture(createinfo)");
	c_bg_ret = SDL_CreateGPUTexture(c_device, c_createinfo);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPUTexture"));
	XSRETURN(1);

void
SDL_CreateGPUBuffer(sv_device, sv_createinfo)
	SV *sv_device
	SV *sv_createinfo
    PREINIT:
	SDL_GPUDevice * c_device;
	const SDL_GPUBufferCreateInfo * c_createinfo;
	SDL_GPUBuffer * c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_CreateGPUBuffer(device)");
	c_createinfo = (const SDL_GPUBufferCreateInfo *)bg_in_record_ptr(aTHX_ sv_createinfo, "SDL3::GPUBufferCreateInfo", "SDL_CreateGPUBuffer(createinfo)");
	c_bg_ret = SDL_CreateGPUBuffer(c_device, c_createinfo);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPUBuffer"));
	XSRETURN(1);

void
SDL_CreateGPUTransferBuffer(sv_device, sv_createinfo)
	SV *sv_device
	SV *sv_createinfo
    PREINIT:
	SDL_GPUDevice * c_device;
	const SDL_GPUTransferBufferCreateInfo * c_createinfo;
	SDL_GPUTransferBuffer * c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_CreateGPUTransferBuffer(device)");
	c_createinfo = (const SDL_GPUTransferBufferCreateInfo *)bg_in_record_ptr(aTHX_ sv_createinfo, "SDL3::GPUTransferBufferCreateInfo", "SDL_CreateGPUTransferBuffer(createinfo)");
	c_bg_ret = SDL_CreateGPUTransferBuffer(c_device, c_createinfo);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPUTransferBuffer"));
	XSRETURN(1);

void
SDL_SetGPUBufferName(sv_device, sv_buffer, sv_text)
	SV *sv_device
	SV *sv_buffer
	SV *sv_text
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUBuffer * c_buffer;
	const char * c_text;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_SetGPUBufferName(device)");
	c_buffer = (SDL_GPUBuffer *)bg_in_record_ptr(aTHX_ sv_buffer, "SDL3::GPUBuffer", "SDL_SetGPUBufferName(buffer)");
	c_text = (const char *)bg_in_string(aTHX_ sv_text, "SDL_SetGPUBufferName(text)");
	SDL_SetGPUBufferName(c_device, c_buffer, c_text);
	XSRETURN(0);

void
SDL_SetGPUTextureName(sv_device, sv_texture, sv_text)
	SV *sv_device
	SV *sv_texture
	SV *sv_text
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUTexture * c_texture;
	const char * c_text;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_SetGPUTextureName(device)");
	c_texture = (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::GPUTexture", "SDL_SetGPUTextureName(texture)");
	c_text = (const char *)bg_in_string(aTHX_ sv_text, "SDL_SetGPUTextureName(text)");
	SDL_SetGPUTextureName(c_device, c_texture, c_text);
	XSRETURN(0);

void
SDL_InsertGPUDebugLabel(sv_command_buffer, sv_text)
	SV *sv_command_buffer
	SV *sv_text
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
	const char * c_text;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_InsertGPUDebugLabel(command_buffer)");
	c_text = (const char *)bg_in_string(aTHX_ sv_text, "SDL_InsertGPUDebugLabel(text)");
	SDL_InsertGPUDebugLabel(c_command_buffer, c_text);
	XSRETURN(0);

void
SDL_PushGPUDebugGroup(sv_command_buffer, sv_name)
	SV *sv_command_buffer
	SV *sv_name
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
	const char * c_name;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_PushGPUDebugGroup(command_buffer)");
	c_name = (const char *)bg_in_string(aTHX_ sv_name, "SDL_PushGPUDebugGroup(name)");
	SDL_PushGPUDebugGroup(c_command_buffer, c_name);
	XSRETURN(0);

void
SDL_PopGPUDebugGroup(sv_command_buffer)
	SV *sv_command_buffer
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_PopGPUDebugGroup(command_buffer)");
	SDL_PopGPUDebugGroup(c_command_buffer);
	XSRETURN(0);

void
SDL_ReleaseGPUTexture(sv_device, sv_texture)
	SV *sv_device
	SV *sv_texture
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUTexture * c_texture;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_ReleaseGPUTexture(device)");
	c_texture = (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::GPUTexture", "SDL_ReleaseGPUTexture(texture)");
	SDL_ReleaseGPUTexture(c_device, c_texture);
	XSRETURN(0);

void
SDL_ReleaseGPUSampler(sv_device, sv_sampler)
	SV *sv_device
	SV *sv_sampler
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUSampler * c_sampler;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_ReleaseGPUSampler(device)");
	c_sampler = (SDL_GPUSampler *)bg_in_record_ptr(aTHX_ sv_sampler, "SDL3::GPUSampler", "SDL_ReleaseGPUSampler(sampler)");
	SDL_ReleaseGPUSampler(c_device, c_sampler);
	XSRETURN(0);

void
SDL_ReleaseGPUBuffer(sv_device, sv_buffer)
	SV *sv_device
	SV *sv_buffer
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUBuffer * c_buffer;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_ReleaseGPUBuffer(device)");
	c_buffer = (SDL_GPUBuffer *)bg_in_record_ptr(aTHX_ sv_buffer, "SDL3::GPUBuffer", "SDL_ReleaseGPUBuffer(buffer)");
	SDL_ReleaseGPUBuffer(c_device, c_buffer);
	XSRETURN(0);

void
SDL_ReleaseGPUTransferBuffer(sv_device, sv_transfer_buffer)
	SV *sv_device
	SV *sv_transfer_buffer
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUTransferBuffer * c_transfer_buffer;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_ReleaseGPUTransferBuffer(device)");
	c_transfer_buffer = (SDL_GPUTransferBuffer *)bg_in_record_ptr(aTHX_ sv_transfer_buffer, "SDL3::GPUTransferBuffer", "SDL_ReleaseGPUTransferBuffer(transfer_buffer)");
	SDL_ReleaseGPUTransferBuffer(c_device, c_transfer_buffer);
	XSRETURN(0);

void
SDL_ReleaseGPUComputePipeline(sv_device, sv_compute_pipeline)
	SV *sv_device
	SV *sv_compute_pipeline
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUComputePipeline * c_compute_pipeline;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_ReleaseGPUComputePipeline(device)");
	c_compute_pipeline = (SDL_GPUComputePipeline *)bg_in_record_ptr(aTHX_ sv_compute_pipeline, "SDL3::GPUComputePipeline", "SDL_ReleaseGPUComputePipeline(compute_pipeline)");
	SDL_ReleaseGPUComputePipeline(c_device, c_compute_pipeline);
	XSRETURN(0);

void
SDL_ReleaseGPUShader(sv_device, sv_shader)
	SV *sv_device
	SV *sv_shader
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUShader * c_shader;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_ReleaseGPUShader(device)");
	c_shader = (SDL_GPUShader *)bg_in_record_ptr(aTHX_ sv_shader, "SDL3::GPUShader", "SDL_ReleaseGPUShader(shader)");
	SDL_ReleaseGPUShader(c_device, c_shader);
	XSRETURN(0);

void
SDL_ReleaseGPUGraphicsPipeline(sv_device, sv_graphics_pipeline)
	SV *sv_device
	SV *sv_graphics_pipeline
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUGraphicsPipeline * c_graphics_pipeline;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_ReleaseGPUGraphicsPipeline(device)");
	c_graphics_pipeline = (SDL_GPUGraphicsPipeline *)bg_in_record_ptr(aTHX_ sv_graphics_pipeline, "SDL3::GPUGraphicsPipeline", "SDL_ReleaseGPUGraphicsPipeline(graphics_pipeline)");
	SDL_ReleaseGPUGraphicsPipeline(c_device, c_graphics_pipeline);
	XSRETURN(0);

void
SDL_AcquireGPUCommandBuffer(sv_device)
	SV *sv_device
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUCommandBuffer * c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_AcquireGPUCommandBuffer(device)");
	c_bg_ret = SDL_AcquireGPUCommandBuffer(c_device);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPUCommandBuffer"));
	XSRETURN(1);

void
SDL_PushGPUVertexUniformData(sv_command_buffer, sv_slot_index, sv_data, sv_length)
	SV *sv_command_buffer
	SV *sv_slot_index
	SV *sv_data
	SV *sv_length
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
	Uint32 c_slot_index;
	const void * c_data;
	Uint32 c_length;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_PushGPUVertexUniformData(command_buffer)");
	c_slot_index = (Uint32)bg_in_uv(aTHX_ sv_slot_index, "SDL_PushGPUVertexUniformData(slot_index)");
	c_data = (const void *)bg_in_raw_ptr(aTHX_ sv_data, "SDL_PushGPUVertexUniformData(data)");
	c_length = (Uint32)bg_in_uv(aTHX_ sv_length, "SDL_PushGPUVertexUniformData(length)");
	SDL_PushGPUVertexUniformData(c_command_buffer, c_slot_index, c_data, c_length);
	XSRETURN(0);

void
SDL_PushGPUFragmentUniformData(sv_command_buffer, sv_slot_index, sv_data, sv_length)
	SV *sv_command_buffer
	SV *sv_slot_index
	SV *sv_data
	SV *sv_length
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
	Uint32 c_slot_index;
	const void * c_data;
	Uint32 c_length;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_PushGPUFragmentUniformData(command_buffer)");
	c_slot_index = (Uint32)bg_in_uv(aTHX_ sv_slot_index, "SDL_PushGPUFragmentUniformData(slot_index)");
	c_data = (const void *)bg_in_raw_ptr(aTHX_ sv_data, "SDL_PushGPUFragmentUniformData(data)");
	c_length = (Uint32)bg_in_uv(aTHX_ sv_length, "SDL_PushGPUFragmentUniformData(length)");
	SDL_PushGPUFragmentUniformData(c_command_buffer, c_slot_index, c_data, c_length);
	XSRETURN(0);

void
SDL_PushGPUComputeUniformData(sv_command_buffer, sv_slot_index, sv_data, sv_length)
	SV *sv_command_buffer
	SV *sv_slot_index
	SV *sv_data
	SV *sv_length
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
	Uint32 c_slot_index;
	const void * c_data;
	Uint32 c_length;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_PushGPUComputeUniformData(command_buffer)");
	c_slot_index = (Uint32)bg_in_uv(aTHX_ sv_slot_index, "SDL_PushGPUComputeUniformData(slot_index)");
	c_data = (const void *)bg_in_raw_ptr(aTHX_ sv_data, "SDL_PushGPUComputeUniformData(data)");
	c_length = (Uint32)bg_in_uv(aTHX_ sv_length, "SDL_PushGPUComputeUniformData(length)");
	SDL_PushGPUComputeUniformData(c_command_buffer, c_slot_index, c_data, c_length);
	XSRETURN(0);

void
SDL_BeginGPURenderPass(sv_command_buffer, sv_color_target_infos, sv_num_color_targets, sv_depth_stencil_target_info)
	SV *sv_command_buffer
	SV *sv_color_target_infos
	SV *sv_num_color_targets
	SV *sv_depth_stencil_target_info
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
	const SDL_GPUColorTargetInfo * c_color_target_infos;
	Uint32 c_num_color_targets;
	const SDL_GPUDepthStencilTargetInfo * c_depth_stencil_target_info;
	SDL_GPURenderPass * c_bg_ret;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_BeginGPURenderPass(command_buffer)");
	c_color_target_infos = (const SDL_GPUColorTargetInfo *)bg_in_record_ptr(aTHX_ sv_color_target_infos, "SDL3::GPUColorTargetInfo", "SDL_BeginGPURenderPass(color_target_infos)");
	c_num_color_targets = (Uint32)bg_in_uv(aTHX_ sv_num_color_targets, "SDL_BeginGPURenderPass(num_color_targets)");
	c_depth_stencil_target_info = (const SDL_GPUDepthStencilTargetInfo *)bg_in_record_ptr(aTHX_ sv_depth_stencil_target_info, "SDL3::GPUDepthStencilTargetInfo", "SDL_BeginGPURenderPass(depth_stencil_target_info)");
	c_bg_ret = SDL_BeginGPURenderPass(c_command_buffer, c_color_target_infos, c_num_color_targets, c_depth_stencil_target_info);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPURenderPass"));
	XSRETURN(1);

void
SDL_BindGPUGraphicsPipeline(sv_render_pass, sv_graphics_pipeline)
	SV *sv_render_pass
	SV *sv_graphics_pipeline
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	SDL_GPUGraphicsPipeline * c_graphics_pipeline;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_BindGPUGraphicsPipeline(render_pass)");
	c_graphics_pipeline = (SDL_GPUGraphicsPipeline *)bg_in_record_ptr(aTHX_ sv_graphics_pipeline, "SDL3::GPUGraphicsPipeline", "SDL_BindGPUGraphicsPipeline(graphics_pipeline)");
	SDL_BindGPUGraphicsPipeline(c_render_pass, c_graphics_pipeline);
	XSRETURN(0);

void
SDL_SetGPUViewport(sv_render_pass, sv_viewport)
	SV *sv_render_pass
	SV *sv_viewport
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	const SDL_GPUViewport * c_viewport;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_SetGPUViewport(render_pass)");
	c_viewport = (const SDL_GPUViewport *)bg_in_record_ptr(aTHX_ sv_viewport, "SDL3::GPUViewport", "SDL_SetGPUViewport(viewport)");
	SDL_SetGPUViewport(c_render_pass, c_viewport);
	XSRETURN(0);

void
SDL_SetGPUScissor(sv_render_pass, sv_scissor)
	SV *sv_render_pass
	SV *sv_scissor
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	const SDL_Rect * c_scissor;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_SetGPUScissor(render_pass)");
	c_scissor = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_scissor, "SDL3::Rect", "SDL_SetGPUScissor(scissor)");
	SDL_SetGPUScissor(c_render_pass, c_scissor);
	XSRETURN(0);

void
SDL_SetGPUBlendConstants(sv_render_pass, sv_blend_constants)
	SV *sv_render_pass
	SV *sv_blend_constants
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	struct SDL_FColor c_blend_constants;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_SetGPUBlendConstants(render_pass)");
	c_blend_constants = *(struct SDL_FColor *)bg_in_record_value_ptr(aTHX_ sv_blend_constants, "SDL3::FColor", "SDL_SetGPUBlendConstants(blend_constants)");
	SDL_SetGPUBlendConstants(c_render_pass, c_blend_constants);
	XSRETURN(0);

void
SDL_SetGPUStencilReference(sv_render_pass, sv_reference)
	SV *sv_render_pass
	SV *sv_reference
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	Uint8 c_reference;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_SetGPUStencilReference(render_pass)");
	c_reference = (Uint8)bg_in_uv(aTHX_ sv_reference, "SDL_SetGPUStencilReference(reference)");
	SDL_SetGPUStencilReference(c_render_pass, c_reference);
	XSRETURN(0);

void
SDL_BindGPUVertexBuffers(sv_render_pass, sv_first_slot, sv_bindings, sv_num_bindings)
	SV *sv_render_pass
	SV *sv_first_slot
	SV *sv_bindings
	SV *sv_num_bindings
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	Uint32 c_first_slot;
	const SDL_GPUBufferBinding * c_bindings;
	Uint32 c_num_bindings;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_BindGPUVertexBuffers(render_pass)");
	c_first_slot = (Uint32)bg_in_uv(aTHX_ sv_first_slot, "SDL_BindGPUVertexBuffers(first_slot)");
	c_bindings = (const SDL_GPUBufferBinding *)bg_in_record_ptr(aTHX_ sv_bindings, "SDL3::GPUBufferBinding", "SDL_BindGPUVertexBuffers(bindings)");
	c_num_bindings = (Uint32)bg_in_uv(aTHX_ sv_num_bindings, "SDL_BindGPUVertexBuffers(num_bindings)");
	SDL_BindGPUVertexBuffers(c_render_pass, c_first_slot, c_bindings, c_num_bindings);
	XSRETURN(0);

void
SDL_BindGPUIndexBuffer(sv_render_pass, sv_binding, sv_index_element_size)
	SV *sv_render_pass
	SV *sv_binding
	SV *sv_index_element_size
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	const SDL_GPUBufferBinding * c_binding;
	SDL_GPUIndexElementSize c_index_element_size;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_BindGPUIndexBuffer(render_pass)");
	c_binding = (const SDL_GPUBufferBinding *)bg_in_record_ptr(aTHX_ sv_binding, "SDL3::GPUBufferBinding", "SDL_BindGPUIndexBuffer(binding)");
	c_index_element_size = (SDL_GPUIndexElementSize)bg_in_iv(aTHX_ sv_index_element_size, "SDL_BindGPUIndexBuffer(index_element_size)");
	SDL_BindGPUIndexBuffer(c_render_pass, c_binding, c_index_element_size);
	XSRETURN(0);

void
SDL_BindGPUVertexSamplers(sv_render_pass, sv_first_slot, sv_texture_sampler_bindings, sv_num_bindings)
	SV *sv_render_pass
	SV *sv_first_slot
	SV *sv_texture_sampler_bindings
	SV *sv_num_bindings
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	Uint32 c_first_slot;
	const SDL_GPUTextureSamplerBinding * c_texture_sampler_bindings;
	Uint32 c_num_bindings;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_BindGPUVertexSamplers(render_pass)");
	c_first_slot = (Uint32)bg_in_uv(aTHX_ sv_first_slot, "SDL_BindGPUVertexSamplers(first_slot)");
	c_texture_sampler_bindings = (const SDL_GPUTextureSamplerBinding *)bg_in_record_ptr(aTHX_ sv_texture_sampler_bindings, "SDL3::GPUTextureSamplerBinding", "SDL_BindGPUVertexSamplers(texture_sampler_bindings)");
	c_num_bindings = (Uint32)bg_in_uv(aTHX_ sv_num_bindings, "SDL_BindGPUVertexSamplers(num_bindings)");
	SDL_BindGPUVertexSamplers(c_render_pass, c_first_slot, c_texture_sampler_bindings, c_num_bindings);
	XSRETURN(0);

void
SDL_BindGPUVertexStorageTextures(sv_render_pass, sv_first_slot, sv_storage_textures, sv_num_bindings)
	SV *sv_render_pass
	SV *sv_first_slot
	SV *sv_storage_textures
	SV *sv_num_bindings
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	Uint32 c_first_slot;
	SDL_GPUTexture * c_storage_textures; SDL_GPUTexture * const * p_storage_textures; SV *t_storage_textures;
	Uint32 c_num_bindings;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_BindGPUVertexStorageTextures(render_pass)");
	c_first_slot = (Uint32)bg_in_uv(aTHX_ sv_first_slot, "SDL_BindGPUVertexStorageTextures(first_slot)");
	t_storage_textures = bg_outref_target(aTHX_ sv_storage_textures);
	c_storage_textures = (t_storage_textures && SvOK(t_storage_textures)) ? (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ t_storage_textures, "SDL3::GPUTexture", "SDL_BindGPUVertexStorageTextures(storage_textures)") : (SDL_GPUTexture *)0;
	p_storage_textures = t_storage_textures ? &c_storage_textures : (SDL_GPUTexture * const *)bg_outref_raw(aTHX_ sv_storage_textures, "SDL_BindGPUVertexStorageTextures(storage_textures)");
	c_num_bindings = (Uint32)bg_in_uv(aTHX_ sv_num_bindings, "SDL_BindGPUVertexStorageTextures(num_bindings)");
	SDL_BindGPUVertexStorageTextures(c_render_pass, c_first_slot, p_storage_textures, c_num_bindings);
	if (t_storage_textures) sv_setsv(t_storage_textures, sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_storage_textures), "SDL3::GPUTexture")));
	XSRETURN(0);

void
SDL_BindGPUVertexStorageBuffers(sv_render_pass, sv_first_slot, sv_storage_buffers, sv_num_bindings)
	SV *sv_render_pass
	SV *sv_first_slot
	SV *sv_storage_buffers
	SV *sv_num_bindings
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	Uint32 c_first_slot;
	SDL_GPUBuffer * c_storage_buffers; SDL_GPUBuffer * const * p_storage_buffers; SV *t_storage_buffers;
	Uint32 c_num_bindings;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_BindGPUVertexStorageBuffers(render_pass)");
	c_first_slot = (Uint32)bg_in_uv(aTHX_ sv_first_slot, "SDL_BindGPUVertexStorageBuffers(first_slot)");
	t_storage_buffers = bg_outref_target(aTHX_ sv_storage_buffers);
	c_storage_buffers = (t_storage_buffers && SvOK(t_storage_buffers)) ? (SDL_GPUBuffer *)bg_in_record_ptr(aTHX_ t_storage_buffers, "SDL3::GPUBuffer", "SDL_BindGPUVertexStorageBuffers(storage_buffers)") : (SDL_GPUBuffer *)0;
	p_storage_buffers = t_storage_buffers ? &c_storage_buffers : (SDL_GPUBuffer * const *)bg_outref_raw(aTHX_ sv_storage_buffers, "SDL_BindGPUVertexStorageBuffers(storage_buffers)");
	c_num_bindings = (Uint32)bg_in_uv(aTHX_ sv_num_bindings, "SDL_BindGPUVertexStorageBuffers(num_bindings)");
	SDL_BindGPUVertexStorageBuffers(c_render_pass, c_first_slot, p_storage_buffers, c_num_bindings);
	if (t_storage_buffers) sv_setsv(t_storage_buffers, sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_storage_buffers), "SDL3::GPUBuffer")));
	XSRETURN(0);

void
SDL_BindGPUFragmentSamplers(sv_render_pass, sv_first_slot, sv_texture_sampler_bindings, sv_num_bindings)
	SV *sv_render_pass
	SV *sv_first_slot
	SV *sv_texture_sampler_bindings
	SV *sv_num_bindings
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	Uint32 c_first_slot;
	const SDL_GPUTextureSamplerBinding * c_texture_sampler_bindings;
	Uint32 c_num_bindings;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_BindGPUFragmentSamplers(render_pass)");
	c_first_slot = (Uint32)bg_in_uv(aTHX_ sv_first_slot, "SDL_BindGPUFragmentSamplers(first_slot)");
	c_texture_sampler_bindings = (const SDL_GPUTextureSamplerBinding *)bg_in_record_ptr(aTHX_ sv_texture_sampler_bindings, "SDL3::GPUTextureSamplerBinding", "SDL_BindGPUFragmentSamplers(texture_sampler_bindings)");
	c_num_bindings = (Uint32)bg_in_uv(aTHX_ sv_num_bindings, "SDL_BindGPUFragmentSamplers(num_bindings)");
	SDL_BindGPUFragmentSamplers(c_render_pass, c_first_slot, c_texture_sampler_bindings, c_num_bindings);
	XSRETURN(0);

void
SDL_BindGPUFragmentStorageTextures(sv_render_pass, sv_first_slot, sv_storage_textures, sv_num_bindings)
	SV *sv_render_pass
	SV *sv_first_slot
	SV *sv_storage_textures
	SV *sv_num_bindings
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	Uint32 c_first_slot;
	SDL_GPUTexture * c_storage_textures; SDL_GPUTexture * const * p_storage_textures; SV *t_storage_textures;
	Uint32 c_num_bindings;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_BindGPUFragmentStorageTextures(render_pass)");
	c_first_slot = (Uint32)bg_in_uv(aTHX_ sv_first_slot, "SDL_BindGPUFragmentStorageTextures(first_slot)");
	t_storage_textures = bg_outref_target(aTHX_ sv_storage_textures);
	c_storage_textures = (t_storage_textures && SvOK(t_storage_textures)) ? (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ t_storage_textures, "SDL3::GPUTexture", "SDL_BindGPUFragmentStorageTextures(storage_textures)") : (SDL_GPUTexture *)0;
	p_storage_textures = t_storage_textures ? &c_storage_textures : (SDL_GPUTexture * const *)bg_outref_raw(aTHX_ sv_storage_textures, "SDL_BindGPUFragmentStorageTextures(storage_textures)");
	c_num_bindings = (Uint32)bg_in_uv(aTHX_ sv_num_bindings, "SDL_BindGPUFragmentStorageTextures(num_bindings)");
	SDL_BindGPUFragmentStorageTextures(c_render_pass, c_first_slot, p_storage_textures, c_num_bindings);
	if (t_storage_textures) sv_setsv(t_storage_textures, sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_storage_textures), "SDL3::GPUTexture")));
	XSRETURN(0);

void
SDL_BindGPUFragmentStorageBuffers(sv_render_pass, sv_first_slot, sv_storage_buffers, sv_num_bindings)
	SV *sv_render_pass
	SV *sv_first_slot
	SV *sv_storage_buffers
	SV *sv_num_bindings
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	Uint32 c_first_slot;
	SDL_GPUBuffer * c_storage_buffers; SDL_GPUBuffer * const * p_storage_buffers; SV *t_storage_buffers;
	Uint32 c_num_bindings;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_BindGPUFragmentStorageBuffers(render_pass)");
	c_first_slot = (Uint32)bg_in_uv(aTHX_ sv_first_slot, "SDL_BindGPUFragmentStorageBuffers(first_slot)");
	t_storage_buffers = bg_outref_target(aTHX_ sv_storage_buffers);
	c_storage_buffers = (t_storage_buffers && SvOK(t_storage_buffers)) ? (SDL_GPUBuffer *)bg_in_record_ptr(aTHX_ t_storage_buffers, "SDL3::GPUBuffer", "SDL_BindGPUFragmentStorageBuffers(storage_buffers)") : (SDL_GPUBuffer *)0;
	p_storage_buffers = t_storage_buffers ? &c_storage_buffers : (SDL_GPUBuffer * const *)bg_outref_raw(aTHX_ sv_storage_buffers, "SDL_BindGPUFragmentStorageBuffers(storage_buffers)");
	c_num_bindings = (Uint32)bg_in_uv(aTHX_ sv_num_bindings, "SDL_BindGPUFragmentStorageBuffers(num_bindings)");
	SDL_BindGPUFragmentStorageBuffers(c_render_pass, c_first_slot, p_storage_buffers, c_num_bindings);
	if (t_storage_buffers) sv_setsv(t_storage_buffers, sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_storage_buffers), "SDL3::GPUBuffer")));
	XSRETURN(0);

void
SDL_DrawGPUIndexedPrimitives(sv_render_pass, sv_num_indices, sv_num_instances, sv_first_index, sv_vertex_offset, sv_first_instance)
	SV *sv_render_pass
	SV *sv_num_indices
	SV *sv_num_instances
	SV *sv_first_index
	SV *sv_vertex_offset
	SV *sv_first_instance
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	Uint32 c_num_indices;
	Uint32 c_num_instances;
	Uint32 c_first_index;
	Sint32 c_vertex_offset;
	Uint32 c_first_instance;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_DrawGPUIndexedPrimitives(render_pass)");
	c_num_indices = (Uint32)bg_in_uv(aTHX_ sv_num_indices, "SDL_DrawGPUIndexedPrimitives(num_indices)");
	c_num_instances = (Uint32)bg_in_uv(aTHX_ sv_num_instances, "SDL_DrawGPUIndexedPrimitives(num_instances)");
	c_first_index = (Uint32)bg_in_uv(aTHX_ sv_first_index, "SDL_DrawGPUIndexedPrimitives(first_index)");
	c_vertex_offset = (Sint32)bg_in_iv(aTHX_ sv_vertex_offset, "SDL_DrawGPUIndexedPrimitives(vertex_offset)");
	c_first_instance = (Uint32)bg_in_uv(aTHX_ sv_first_instance, "SDL_DrawGPUIndexedPrimitives(first_instance)");
	SDL_DrawGPUIndexedPrimitives(c_render_pass, c_num_indices, c_num_instances, c_first_index, c_vertex_offset, c_first_instance);
	XSRETURN(0);

void
SDL_DrawGPUPrimitives(sv_render_pass, sv_num_vertices, sv_num_instances, sv_first_vertex, sv_first_instance)
	SV *sv_render_pass
	SV *sv_num_vertices
	SV *sv_num_instances
	SV *sv_first_vertex
	SV *sv_first_instance
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	Uint32 c_num_vertices;
	Uint32 c_num_instances;
	Uint32 c_first_vertex;
	Uint32 c_first_instance;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_DrawGPUPrimitives(render_pass)");
	c_num_vertices = (Uint32)bg_in_uv(aTHX_ sv_num_vertices, "SDL_DrawGPUPrimitives(num_vertices)");
	c_num_instances = (Uint32)bg_in_uv(aTHX_ sv_num_instances, "SDL_DrawGPUPrimitives(num_instances)");
	c_first_vertex = (Uint32)bg_in_uv(aTHX_ sv_first_vertex, "SDL_DrawGPUPrimitives(first_vertex)");
	c_first_instance = (Uint32)bg_in_uv(aTHX_ sv_first_instance, "SDL_DrawGPUPrimitives(first_instance)");
	SDL_DrawGPUPrimitives(c_render_pass, c_num_vertices, c_num_instances, c_first_vertex, c_first_instance);
	XSRETURN(0);

void
SDL_DrawGPUPrimitivesIndirect(sv_render_pass, sv_buffer, sv_offset, sv_draw_count)
	SV *sv_render_pass
	SV *sv_buffer
	SV *sv_offset
	SV *sv_draw_count
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	SDL_GPUBuffer * c_buffer;
	Uint32 c_offset;
	Uint32 c_draw_count;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_DrawGPUPrimitivesIndirect(render_pass)");
	c_buffer = (SDL_GPUBuffer *)bg_in_record_ptr(aTHX_ sv_buffer, "SDL3::GPUBuffer", "SDL_DrawGPUPrimitivesIndirect(buffer)");
	c_offset = (Uint32)bg_in_uv(aTHX_ sv_offset, "SDL_DrawGPUPrimitivesIndirect(offset)");
	c_draw_count = (Uint32)bg_in_uv(aTHX_ sv_draw_count, "SDL_DrawGPUPrimitivesIndirect(draw_count)");
	SDL_DrawGPUPrimitivesIndirect(c_render_pass, c_buffer, c_offset, c_draw_count);
	XSRETURN(0);

void
SDL_DrawGPUIndexedPrimitivesIndirect(sv_render_pass, sv_buffer, sv_offset, sv_draw_count)
	SV *sv_render_pass
	SV *sv_buffer
	SV *sv_offset
	SV *sv_draw_count
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
	SDL_GPUBuffer * c_buffer;
	Uint32 c_offset;
	Uint32 c_draw_count;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_DrawGPUIndexedPrimitivesIndirect(render_pass)");
	c_buffer = (SDL_GPUBuffer *)bg_in_record_ptr(aTHX_ sv_buffer, "SDL3::GPUBuffer", "SDL_DrawGPUIndexedPrimitivesIndirect(buffer)");
	c_offset = (Uint32)bg_in_uv(aTHX_ sv_offset, "SDL_DrawGPUIndexedPrimitivesIndirect(offset)");
	c_draw_count = (Uint32)bg_in_uv(aTHX_ sv_draw_count, "SDL_DrawGPUIndexedPrimitivesIndirect(draw_count)");
	SDL_DrawGPUIndexedPrimitivesIndirect(c_render_pass, c_buffer, c_offset, c_draw_count);
	XSRETURN(0);

void
SDL_EndGPURenderPass(sv_render_pass)
	SV *sv_render_pass
    PREINIT:
	SDL_GPURenderPass * c_render_pass;
    PPCODE:
	c_render_pass = (SDL_GPURenderPass *)bg_in_record_ptr(aTHX_ sv_render_pass, "SDL3::GPURenderPass", "SDL_EndGPURenderPass(render_pass)");
	SDL_EndGPURenderPass(c_render_pass);
	XSRETURN(0);

void
SDL_BeginGPUComputePass(sv_command_buffer, sv_storage_texture_bindings, sv_num_storage_texture_bindings, sv_storage_buffer_bindings, sv_num_storage_buffer_bindings)
	SV *sv_command_buffer
	SV *sv_storage_texture_bindings
	SV *sv_num_storage_texture_bindings
	SV *sv_storage_buffer_bindings
	SV *sv_num_storage_buffer_bindings
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
	const SDL_GPUStorageTextureReadWriteBinding * c_storage_texture_bindings;
	Uint32 c_num_storage_texture_bindings;
	const SDL_GPUStorageBufferReadWriteBinding * c_storage_buffer_bindings;
	Uint32 c_num_storage_buffer_bindings;
	SDL_GPUComputePass * c_bg_ret;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_BeginGPUComputePass(command_buffer)");
	c_storage_texture_bindings = (const SDL_GPUStorageTextureReadWriteBinding *)bg_in_record_ptr(aTHX_ sv_storage_texture_bindings, "SDL3::GPUStorageTextureReadWriteBinding", "SDL_BeginGPUComputePass(storage_texture_bindings)");
	c_num_storage_texture_bindings = (Uint32)bg_in_uv(aTHX_ sv_num_storage_texture_bindings, "SDL_BeginGPUComputePass(num_storage_texture_bindings)");
	c_storage_buffer_bindings = (const SDL_GPUStorageBufferReadWriteBinding *)bg_in_record_ptr(aTHX_ sv_storage_buffer_bindings, "SDL3::GPUStorageBufferReadWriteBinding", "SDL_BeginGPUComputePass(storage_buffer_bindings)");
	c_num_storage_buffer_bindings = (Uint32)bg_in_uv(aTHX_ sv_num_storage_buffer_bindings, "SDL_BeginGPUComputePass(num_storage_buffer_bindings)");
	c_bg_ret = SDL_BeginGPUComputePass(c_command_buffer, c_storage_texture_bindings, c_num_storage_texture_bindings, c_storage_buffer_bindings, c_num_storage_buffer_bindings);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPUComputePass"));
	XSRETURN(1);

void
SDL_BindGPUComputePipeline(sv_compute_pass, sv_compute_pipeline)
	SV *sv_compute_pass
	SV *sv_compute_pipeline
    PREINIT:
	SDL_GPUComputePass * c_compute_pass;
	SDL_GPUComputePipeline * c_compute_pipeline;
    PPCODE:
	c_compute_pass = (SDL_GPUComputePass *)bg_in_record_ptr(aTHX_ sv_compute_pass, "SDL3::GPUComputePass", "SDL_BindGPUComputePipeline(compute_pass)");
	c_compute_pipeline = (SDL_GPUComputePipeline *)bg_in_record_ptr(aTHX_ sv_compute_pipeline, "SDL3::GPUComputePipeline", "SDL_BindGPUComputePipeline(compute_pipeline)");
	SDL_BindGPUComputePipeline(c_compute_pass, c_compute_pipeline);
	XSRETURN(0);

void
SDL_BindGPUComputeSamplers(sv_compute_pass, sv_first_slot, sv_texture_sampler_bindings, sv_num_bindings)
	SV *sv_compute_pass
	SV *sv_first_slot
	SV *sv_texture_sampler_bindings
	SV *sv_num_bindings
    PREINIT:
	SDL_GPUComputePass * c_compute_pass;
	Uint32 c_first_slot;
	const SDL_GPUTextureSamplerBinding * c_texture_sampler_bindings;
	Uint32 c_num_bindings;
    PPCODE:
	c_compute_pass = (SDL_GPUComputePass *)bg_in_record_ptr(aTHX_ sv_compute_pass, "SDL3::GPUComputePass", "SDL_BindGPUComputeSamplers(compute_pass)");
	c_first_slot = (Uint32)bg_in_uv(aTHX_ sv_first_slot, "SDL_BindGPUComputeSamplers(first_slot)");
	c_texture_sampler_bindings = (const SDL_GPUTextureSamplerBinding *)bg_in_record_ptr(aTHX_ sv_texture_sampler_bindings, "SDL3::GPUTextureSamplerBinding", "SDL_BindGPUComputeSamplers(texture_sampler_bindings)");
	c_num_bindings = (Uint32)bg_in_uv(aTHX_ sv_num_bindings, "SDL_BindGPUComputeSamplers(num_bindings)");
	SDL_BindGPUComputeSamplers(c_compute_pass, c_first_slot, c_texture_sampler_bindings, c_num_bindings);
	XSRETURN(0);

void
SDL_BindGPUComputeStorageTextures(sv_compute_pass, sv_first_slot, sv_storage_textures, sv_num_bindings)
	SV *sv_compute_pass
	SV *sv_first_slot
	SV *sv_storage_textures
	SV *sv_num_bindings
    PREINIT:
	SDL_GPUComputePass * c_compute_pass;
	Uint32 c_first_slot;
	SDL_GPUTexture * c_storage_textures; SDL_GPUTexture * const * p_storage_textures; SV *t_storage_textures;
	Uint32 c_num_bindings;
    PPCODE:
	c_compute_pass = (SDL_GPUComputePass *)bg_in_record_ptr(aTHX_ sv_compute_pass, "SDL3::GPUComputePass", "SDL_BindGPUComputeStorageTextures(compute_pass)");
	c_first_slot = (Uint32)bg_in_uv(aTHX_ sv_first_slot, "SDL_BindGPUComputeStorageTextures(first_slot)");
	t_storage_textures = bg_outref_target(aTHX_ sv_storage_textures);
	c_storage_textures = (t_storage_textures && SvOK(t_storage_textures)) ? (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ t_storage_textures, "SDL3::GPUTexture", "SDL_BindGPUComputeStorageTextures(storage_textures)") : (SDL_GPUTexture *)0;
	p_storage_textures = t_storage_textures ? &c_storage_textures : (SDL_GPUTexture * const *)bg_outref_raw(aTHX_ sv_storage_textures, "SDL_BindGPUComputeStorageTextures(storage_textures)");
	c_num_bindings = (Uint32)bg_in_uv(aTHX_ sv_num_bindings, "SDL_BindGPUComputeStorageTextures(num_bindings)");
	SDL_BindGPUComputeStorageTextures(c_compute_pass, c_first_slot, p_storage_textures, c_num_bindings);
	if (t_storage_textures) sv_setsv(t_storage_textures, sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_storage_textures), "SDL3::GPUTexture")));
	XSRETURN(0);

void
SDL_BindGPUComputeStorageBuffers(sv_compute_pass, sv_first_slot, sv_storage_buffers, sv_num_bindings)
	SV *sv_compute_pass
	SV *sv_first_slot
	SV *sv_storage_buffers
	SV *sv_num_bindings
    PREINIT:
	SDL_GPUComputePass * c_compute_pass;
	Uint32 c_first_slot;
	SDL_GPUBuffer * c_storage_buffers; SDL_GPUBuffer * const * p_storage_buffers; SV *t_storage_buffers;
	Uint32 c_num_bindings;
    PPCODE:
	c_compute_pass = (SDL_GPUComputePass *)bg_in_record_ptr(aTHX_ sv_compute_pass, "SDL3::GPUComputePass", "SDL_BindGPUComputeStorageBuffers(compute_pass)");
	c_first_slot = (Uint32)bg_in_uv(aTHX_ sv_first_slot, "SDL_BindGPUComputeStorageBuffers(first_slot)");
	t_storage_buffers = bg_outref_target(aTHX_ sv_storage_buffers);
	c_storage_buffers = (t_storage_buffers && SvOK(t_storage_buffers)) ? (SDL_GPUBuffer *)bg_in_record_ptr(aTHX_ t_storage_buffers, "SDL3::GPUBuffer", "SDL_BindGPUComputeStorageBuffers(storage_buffers)") : (SDL_GPUBuffer *)0;
	p_storage_buffers = t_storage_buffers ? &c_storage_buffers : (SDL_GPUBuffer * const *)bg_outref_raw(aTHX_ sv_storage_buffers, "SDL_BindGPUComputeStorageBuffers(storage_buffers)");
	c_num_bindings = (Uint32)bg_in_uv(aTHX_ sv_num_bindings, "SDL_BindGPUComputeStorageBuffers(num_bindings)");
	SDL_BindGPUComputeStorageBuffers(c_compute_pass, c_first_slot, p_storage_buffers, c_num_bindings);
	if (t_storage_buffers) sv_setsv(t_storage_buffers, sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_storage_buffers), "SDL3::GPUBuffer")));
	XSRETURN(0);

void
SDL_DispatchGPUCompute(sv_compute_pass, sv_groupcount_x, sv_groupcount_y, sv_groupcount_z)
	SV *sv_compute_pass
	SV *sv_groupcount_x
	SV *sv_groupcount_y
	SV *sv_groupcount_z
    PREINIT:
	SDL_GPUComputePass * c_compute_pass;
	Uint32 c_groupcount_x;
	Uint32 c_groupcount_y;
	Uint32 c_groupcount_z;
    PPCODE:
	c_compute_pass = (SDL_GPUComputePass *)bg_in_record_ptr(aTHX_ sv_compute_pass, "SDL3::GPUComputePass", "SDL_DispatchGPUCompute(compute_pass)");
	c_groupcount_x = (Uint32)bg_in_uv(aTHX_ sv_groupcount_x, "SDL_DispatchGPUCompute(groupcount_x)");
	c_groupcount_y = (Uint32)bg_in_uv(aTHX_ sv_groupcount_y, "SDL_DispatchGPUCompute(groupcount_y)");
	c_groupcount_z = (Uint32)bg_in_uv(aTHX_ sv_groupcount_z, "SDL_DispatchGPUCompute(groupcount_z)");
	SDL_DispatchGPUCompute(c_compute_pass, c_groupcount_x, c_groupcount_y, c_groupcount_z);
	XSRETURN(0);

void
SDL_DispatchGPUComputeIndirect(sv_compute_pass, sv_buffer, sv_offset)
	SV *sv_compute_pass
	SV *sv_buffer
	SV *sv_offset
    PREINIT:
	SDL_GPUComputePass * c_compute_pass;
	SDL_GPUBuffer * c_buffer;
	Uint32 c_offset;
    PPCODE:
	c_compute_pass = (SDL_GPUComputePass *)bg_in_record_ptr(aTHX_ sv_compute_pass, "SDL3::GPUComputePass", "SDL_DispatchGPUComputeIndirect(compute_pass)");
	c_buffer = (SDL_GPUBuffer *)bg_in_record_ptr(aTHX_ sv_buffer, "SDL3::GPUBuffer", "SDL_DispatchGPUComputeIndirect(buffer)");
	c_offset = (Uint32)bg_in_uv(aTHX_ sv_offset, "SDL_DispatchGPUComputeIndirect(offset)");
	SDL_DispatchGPUComputeIndirect(c_compute_pass, c_buffer, c_offset);
	XSRETURN(0);

void
SDL_EndGPUComputePass(sv_compute_pass)
	SV *sv_compute_pass
    PREINIT:
	SDL_GPUComputePass * c_compute_pass;
    PPCODE:
	c_compute_pass = (SDL_GPUComputePass *)bg_in_record_ptr(aTHX_ sv_compute_pass, "SDL3::GPUComputePass", "SDL_EndGPUComputePass(compute_pass)");
	SDL_EndGPUComputePass(c_compute_pass);
	XSRETURN(0);

void
SDL_MapGPUTransferBuffer(sv_device, sv_transfer_buffer, sv_cycle)
	SV *sv_device
	SV *sv_transfer_buffer
	SV *sv_cycle
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUTransferBuffer * c_transfer_buffer;
	_Bool c_cycle;
	void * c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_MapGPUTransferBuffer(device)");
	c_transfer_buffer = (SDL_GPUTransferBuffer *)bg_in_record_ptr(aTHX_ sv_transfer_buffer, "SDL3::GPUTransferBuffer", "SDL_MapGPUTransferBuffer(transfer_buffer)");
	c_cycle = (_Bool)SvTRUE(sv_cycle);
	c_bg_ret = SDL_MapGPUTransferBuffer(c_device, c_transfer_buffer, c_cycle);
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::Pointer"));
	XSRETURN(1);

void
SDL_UnmapGPUTransferBuffer(sv_device, sv_transfer_buffer)
	SV *sv_device
	SV *sv_transfer_buffer
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUTransferBuffer * c_transfer_buffer;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_UnmapGPUTransferBuffer(device)");
	c_transfer_buffer = (SDL_GPUTransferBuffer *)bg_in_record_ptr(aTHX_ sv_transfer_buffer, "SDL3::GPUTransferBuffer", "SDL_UnmapGPUTransferBuffer(transfer_buffer)");
	SDL_UnmapGPUTransferBuffer(c_device, c_transfer_buffer);
	XSRETURN(0);

void
SDL_BeginGPUCopyPass(sv_command_buffer)
	SV *sv_command_buffer
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
	SDL_GPUCopyPass * c_bg_ret;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_BeginGPUCopyPass(command_buffer)");
	c_bg_ret = SDL_BeginGPUCopyPass(c_command_buffer);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPUCopyPass"));
	XSRETURN(1);

void
SDL_UploadToGPUTexture(sv_copy_pass, sv_source, sv_destination, sv_cycle)
	SV *sv_copy_pass
	SV *sv_source
	SV *sv_destination
	SV *sv_cycle
    PREINIT:
	SDL_GPUCopyPass * c_copy_pass;
	const SDL_GPUTextureTransferInfo * c_source;
	const SDL_GPUTextureRegion * c_destination;
	_Bool c_cycle;
    PPCODE:
	c_copy_pass = (SDL_GPUCopyPass *)bg_in_record_ptr(aTHX_ sv_copy_pass, "SDL3::GPUCopyPass", "SDL_UploadToGPUTexture(copy_pass)");
	c_source = (const SDL_GPUTextureTransferInfo *)bg_in_record_ptr(aTHX_ sv_source, "SDL3::GPUTextureTransferInfo", "SDL_UploadToGPUTexture(source)");
	c_destination = (const SDL_GPUTextureRegion *)bg_in_record_ptr(aTHX_ sv_destination, "SDL3::GPUTextureRegion", "SDL_UploadToGPUTexture(destination)");
	c_cycle = (_Bool)SvTRUE(sv_cycle);
	SDL_UploadToGPUTexture(c_copy_pass, c_source, c_destination, c_cycle);
	XSRETURN(0);

void
SDL_UploadToGPUBuffer(sv_copy_pass, sv_source, sv_destination, sv_cycle)
	SV *sv_copy_pass
	SV *sv_source
	SV *sv_destination
	SV *sv_cycle
    PREINIT:
	SDL_GPUCopyPass * c_copy_pass;
	const SDL_GPUTransferBufferLocation * c_source;
	const SDL_GPUBufferRegion * c_destination;
	_Bool c_cycle;
    PPCODE:
	c_copy_pass = (SDL_GPUCopyPass *)bg_in_record_ptr(aTHX_ sv_copy_pass, "SDL3::GPUCopyPass", "SDL_UploadToGPUBuffer(copy_pass)");
	c_source = (const SDL_GPUTransferBufferLocation *)bg_in_record_ptr(aTHX_ sv_source, "SDL3::GPUTransferBufferLocation", "SDL_UploadToGPUBuffer(source)");
	c_destination = (const SDL_GPUBufferRegion *)bg_in_record_ptr(aTHX_ sv_destination, "SDL3::GPUBufferRegion", "SDL_UploadToGPUBuffer(destination)");
	c_cycle = (_Bool)SvTRUE(sv_cycle);
	SDL_UploadToGPUBuffer(c_copy_pass, c_source, c_destination, c_cycle);
	XSRETURN(0);

void
SDL_CopyGPUTextureToTexture(sv_copy_pass, sv_source, sv_destination, sv_w, sv_h, sv_d, sv_cycle)
	SV *sv_copy_pass
	SV *sv_source
	SV *sv_destination
	SV *sv_w
	SV *sv_h
	SV *sv_d
	SV *sv_cycle
    PREINIT:
	SDL_GPUCopyPass * c_copy_pass;
	const SDL_GPUTextureLocation * c_source;
	const SDL_GPUTextureLocation * c_destination;
	Uint32 c_w;
	Uint32 c_h;
	Uint32 c_d;
	_Bool c_cycle;
    PPCODE:
	c_copy_pass = (SDL_GPUCopyPass *)bg_in_record_ptr(aTHX_ sv_copy_pass, "SDL3::GPUCopyPass", "SDL_CopyGPUTextureToTexture(copy_pass)");
	c_source = (const SDL_GPUTextureLocation *)bg_in_record_ptr(aTHX_ sv_source, "SDL3::GPUTextureLocation", "SDL_CopyGPUTextureToTexture(source)");
	c_destination = (const SDL_GPUTextureLocation *)bg_in_record_ptr(aTHX_ sv_destination, "SDL3::GPUTextureLocation", "SDL_CopyGPUTextureToTexture(destination)");
	c_w = (Uint32)bg_in_uv(aTHX_ sv_w, "SDL_CopyGPUTextureToTexture(w)");
	c_h = (Uint32)bg_in_uv(aTHX_ sv_h, "SDL_CopyGPUTextureToTexture(h)");
	c_d = (Uint32)bg_in_uv(aTHX_ sv_d, "SDL_CopyGPUTextureToTexture(d)");
	c_cycle = (_Bool)SvTRUE(sv_cycle);
	SDL_CopyGPUTextureToTexture(c_copy_pass, c_source, c_destination, c_w, c_h, c_d, c_cycle);
	XSRETURN(0);

void
SDL_CopyGPUBufferToBuffer(sv_copy_pass, sv_source, sv_destination, sv_size, sv_cycle)
	SV *sv_copy_pass
	SV *sv_source
	SV *sv_destination
	SV *sv_size
	SV *sv_cycle
    PREINIT:
	SDL_GPUCopyPass * c_copy_pass;
	const SDL_GPUBufferLocation * c_source;
	const SDL_GPUBufferLocation * c_destination;
	Uint32 c_size;
	_Bool c_cycle;
    PPCODE:
	c_copy_pass = (SDL_GPUCopyPass *)bg_in_record_ptr(aTHX_ sv_copy_pass, "SDL3::GPUCopyPass", "SDL_CopyGPUBufferToBuffer(copy_pass)");
	c_source = (const SDL_GPUBufferLocation *)bg_in_record_ptr(aTHX_ sv_source, "SDL3::GPUBufferLocation", "SDL_CopyGPUBufferToBuffer(source)");
	c_destination = (const SDL_GPUBufferLocation *)bg_in_record_ptr(aTHX_ sv_destination, "SDL3::GPUBufferLocation", "SDL_CopyGPUBufferToBuffer(destination)");
	c_size = (Uint32)bg_in_uv(aTHX_ sv_size, "SDL_CopyGPUBufferToBuffer(size)");
	c_cycle = (_Bool)SvTRUE(sv_cycle);
	SDL_CopyGPUBufferToBuffer(c_copy_pass, c_source, c_destination, c_size, c_cycle);
	XSRETURN(0);

void
SDL_DownloadFromGPUTexture(sv_copy_pass, sv_source, sv_destination)
	SV *sv_copy_pass
	SV *sv_source
	SV *sv_destination
    PREINIT:
	SDL_GPUCopyPass * c_copy_pass;
	const SDL_GPUTextureRegion * c_source;
	const SDL_GPUTextureTransferInfo * c_destination;
    PPCODE:
	c_copy_pass = (SDL_GPUCopyPass *)bg_in_record_ptr(aTHX_ sv_copy_pass, "SDL3::GPUCopyPass", "SDL_DownloadFromGPUTexture(copy_pass)");
	c_source = (const SDL_GPUTextureRegion *)bg_in_record_ptr(aTHX_ sv_source, "SDL3::GPUTextureRegion", "SDL_DownloadFromGPUTexture(source)");
	c_destination = (const SDL_GPUTextureTransferInfo *)bg_in_record_ptr(aTHX_ sv_destination, "SDL3::GPUTextureTransferInfo", "SDL_DownloadFromGPUTexture(destination)");
	SDL_DownloadFromGPUTexture(c_copy_pass, c_source, c_destination);
	XSRETURN(0);

void
SDL_DownloadFromGPUBuffer(sv_copy_pass, sv_source, sv_destination)
	SV *sv_copy_pass
	SV *sv_source
	SV *sv_destination
    PREINIT:
	SDL_GPUCopyPass * c_copy_pass;
	const SDL_GPUBufferRegion * c_source;
	const SDL_GPUTransferBufferLocation * c_destination;
    PPCODE:
	c_copy_pass = (SDL_GPUCopyPass *)bg_in_record_ptr(aTHX_ sv_copy_pass, "SDL3::GPUCopyPass", "SDL_DownloadFromGPUBuffer(copy_pass)");
	c_source = (const SDL_GPUBufferRegion *)bg_in_record_ptr(aTHX_ sv_source, "SDL3::GPUBufferRegion", "SDL_DownloadFromGPUBuffer(source)");
	c_destination = (const SDL_GPUTransferBufferLocation *)bg_in_record_ptr(aTHX_ sv_destination, "SDL3::GPUTransferBufferLocation", "SDL_DownloadFromGPUBuffer(destination)");
	SDL_DownloadFromGPUBuffer(c_copy_pass, c_source, c_destination);
	XSRETURN(0);

void
SDL_EndGPUCopyPass(sv_copy_pass)
	SV *sv_copy_pass
    PREINIT:
	SDL_GPUCopyPass * c_copy_pass;
    PPCODE:
	c_copy_pass = (SDL_GPUCopyPass *)bg_in_record_ptr(aTHX_ sv_copy_pass, "SDL3::GPUCopyPass", "SDL_EndGPUCopyPass(copy_pass)");
	SDL_EndGPUCopyPass(c_copy_pass);
	XSRETURN(0);

void
SDL_GenerateMipmapsForGPUTexture(sv_command_buffer, sv_texture)
	SV *sv_command_buffer
	SV *sv_texture
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
	SDL_GPUTexture * c_texture;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_GenerateMipmapsForGPUTexture(command_buffer)");
	c_texture = (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ sv_texture, "SDL3::GPUTexture", "SDL_GenerateMipmapsForGPUTexture(texture)");
	SDL_GenerateMipmapsForGPUTexture(c_command_buffer, c_texture);
	XSRETURN(0);

void
SDL_BlitGPUTexture(sv_command_buffer, sv_info)
	SV *sv_command_buffer
	SV *sv_info
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
	const SDL_GPUBlitInfo * c_info;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_BlitGPUTexture(command_buffer)");
	c_info = (const SDL_GPUBlitInfo *)bg_in_record_ptr(aTHX_ sv_info, "SDL3::GPUBlitInfo", "SDL_BlitGPUTexture(info)");
	SDL_BlitGPUTexture(c_command_buffer, c_info);
	XSRETURN(0);

void
SDL_WindowSupportsGPUSwapchainComposition(sv_device, sv_window, sv_swapchain_composition)
	SV *sv_device
	SV *sv_window
	SV *sv_swapchain_composition
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_Window * c_window;
	SDL_GPUSwapchainComposition c_swapchain_composition;
	_Bool c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_WindowSupportsGPUSwapchainComposition(device)");
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_WindowSupportsGPUSwapchainComposition(window)");
	c_swapchain_composition = (SDL_GPUSwapchainComposition)bg_in_iv(aTHX_ sv_swapchain_composition, "SDL_WindowSupportsGPUSwapchainComposition(swapchain_composition)");
	c_bg_ret = SDL_WindowSupportsGPUSwapchainComposition(c_device, c_window, c_swapchain_composition);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WindowSupportsGPUPresentMode(sv_device, sv_window, sv_present_mode)
	SV *sv_device
	SV *sv_window
	SV *sv_present_mode
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_Window * c_window;
	SDL_GPUPresentMode c_present_mode;
	_Bool c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_WindowSupportsGPUPresentMode(device)");
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_WindowSupportsGPUPresentMode(window)");
	c_present_mode = (SDL_GPUPresentMode)bg_in_iv(aTHX_ sv_present_mode, "SDL_WindowSupportsGPUPresentMode(present_mode)");
	c_bg_ret = SDL_WindowSupportsGPUPresentMode(c_device, c_window, c_present_mode);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ClaimWindowForGPUDevice(sv_device, sv_window)
	SV *sv_device
	SV *sv_window
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_ClaimWindowForGPUDevice(device)");
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_ClaimWindowForGPUDevice(window)");
	c_bg_ret = SDL_ClaimWindowForGPUDevice(c_device, c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReleaseWindowFromGPUDevice(sv_device, sv_window)
	SV *sv_device
	SV *sv_window
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_Window * c_window;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_ReleaseWindowFromGPUDevice(device)");
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_ReleaseWindowFromGPUDevice(window)");
	SDL_ReleaseWindowFromGPUDevice(c_device, c_window);
	XSRETURN(0);

void
SDL_SetGPUSwapchainParameters(sv_device, sv_window, sv_swapchain_composition, sv_present_mode)
	SV *sv_device
	SV *sv_window
	SV *sv_swapchain_composition
	SV *sv_present_mode
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_Window * c_window;
	SDL_GPUSwapchainComposition c_swapchain_composition;
	SDL_GPUPresentMode c_present_mode;
	_Bool c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_SetGPUSwapchainParameters(device)");
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_SetGPUSwapchainParameters(window)");
	c_swapchain_composition = (SDL_GPUSwapchainComposition)bg_in_iv(aTHX_ sv_swapchain_composition, "SDL_SetGPUSwapchainParameters(swapchain_composition)");
	c_present_mode = (SDL_GPUPresentMode)bg_in_iv(aTHX_ sv_present_mode, "SDL_SetGPUSwapchainParameters(present_mode)");
	c_bg_ret = SDL_SetGPUSwapchainParameters(c_device, c_window, c_swapchain_composition, c_present_mode);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SetGPUAllowedFramesInFlight(sv_device, sv_allowed_frames_in_flight)
	SV *sv_device
	SV *sv_allowed_frames_in_flight
    PREINIT:
	SDL_GPUDevice * c_device;
	Uint32 c_allowed_frames_in_flight;
	_Bool c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_SetGPUAllowedFramesInFlight(device)");
	c_allowed_frames_in_flight = (Uint32)bg_in_uv(aTHX_ sv_allowed_frames_in_flight, "SDL_SetGPUAllowedFramesInFlight(allowed_frames_in_flight)");
	c_bg_ret = SDL_SetGPUAllowedFramesInFlight(c_device, c_allowed_frames_in_flight);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGPUSwapchainTextureFormat(sv_device, sv_window)
	SV *sv_device
	SV *sv_window
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_Window * c_window;
	SDL_GPUTextureFormat c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_GetGPUSwapchainTextureFormat(device)");
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_GetGPUSwapchainTextureFormat(window)");
	c_bg_ret = SDL_GetGPUSwapchainTextureFormat(c_device, c_window);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_AcquireGPUSwapchainTexture(sv_command_buffer, sv_window, sv_swapchain_texture, sv_swapchain_texture_width, sv_swapchain_texture_height)
	SV *sv_command_buffer
	SV *sv_window
	SV *sv_swapchain_texture
	SV *sv_swapchain_texture_width
	SV *sv_swapchain_texture_height
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
	SDL_Window * c_window;
	SDL_GPUTexture * c_swapchain_texture; SDL_GPUTexture ** p_swapchain_texture; SV *t_swapchain_texture;
	Uint32 c_swapchain_texture_width; Uint32 * p_swapchain_texture_width; SV *t_swapchain_texture_width;
	Uint32 c_swapchain_texture_height; Uint32 * p_swapchain_texture_height; SV *t_swapchain_texture_height;
	_Bool c_bg_ret;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_AcquireGPUSwapchainTexture(command_buffer)");
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_AcquireGPUSwapchainTexture(window)");
	t_swapchain_texture = bg_outref_target(aTHX_ sv_swapchain_texture);
	c_swapchain_texture = (t_swapchain_texture && SvOK(t_swapchain_texture)) ? (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ t_swapchain_texture, "SDL3::GPUTexture", "SDL_AcquireGPUSwapchainTexture(swapchain_texture)") : (SDL_GPUTexture *)0;
	p_swapchain_texture = t_swapchain_texture ? &c_swapchain_texture : (SDL_GPUTexture **)bg_outref_raw(aTHX_ sv_swapchain_texture, "SDL_AcquireGPUSwapchainTexture(swapchain_texture)");
	t_swapchain_texture_width = bg_outref_target(aTHX_ sv_swapchain_texture_width);
	c_swapchain_texture_width = (t_swapchain_texture_width && SvOK(t_swapchain_texture_width)) ? (Uint32)bg_in_uv(aTHX_ t_swapchain_texture_width, "SDL_AcquireGPUSwapchainTexture(swapchain_texture_width)") : (Uint32)0;
	p_swapchain_texture_width = t_swapchain_texture_width ? &c_swapchain_texture_width : (Uint32 *)bg_outref_raw(aTHX_ sv_swapchain_texture_width, "SDL_AcquireGPUSwapchainTexture(swapchain_texture_width)");
	t_swapchain_texture_height = bg_outref_target(aTHX_ sv_swapchain_texture_height);
	c_swapchain_texture_height = (t_swapchain_texture_height && SvOK(t_swapchain_texture_height)) ? (Uint32)bg_in_uv(aTHX_ t_swapchain_texture_height, "SDL_AcquireGPUSwapchainTexture(swapchain_texture_height)") : (Uint32)0;
	p_swapchain_texture_height = t_swapchain_texture_height ? &c_swapchain_texture_height : (Uint32 *)bg_outref_raw(aTHX_ sv_swapchain_texture_height, "SDL_AcquireGPUSwapchainTexture(swapchain_texture_height)");
	c_bg_ret = SDL_AcquireGPUSwapchainTexture(c_command_buffer, c_window, p_swapchain_texture, p_swapchain_texture_width, p_swapchain_texture_height);
	if (t_swapchain_texture) sv_setsv(t_swapchain_texture, sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_swapchain_texture), "SDL3::GPUTexture")));
	if (t_swapchain_texture_width) sv_setsv(t_swapchain_texture_width, sv_2mortal(newSVuv((UV)(c_swapchain_texture_width))));
	if (t_swapchain_texture_height) sv_setsv(t_swapchain_texture_height, sv_2mortal(newSVuv((UV)(c_swapchain_texture_height))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WaitForGPUSwapchain(sv_device, sv_window)
	SV *sv_device
	SV *sv_window
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_Window * c_window;
	_Bool c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_WaitForGPUSwapchain(device)");
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_WaitForGPUSwapchain(window)");
	c_bg_ret = SDL_WaitForGPUSwapchain(c_device, c_window);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WaitAndAcquireGPUSwapchainTexture(sv_command_buffer, sv_window, sv_swapchain_texture, sv_swapchain_texture_width, sv_swapchain_texture_height)
	SV *sv_command_buffer
	SV *sv_window
	SV *sv_swapchain_texture
	SV *sv_swapchain_texture_width
	SV *sv_swapchain_texture_height
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
	SDL_Window * c_window;
	SDL_GPUTexture * c_swapchain_texture; SDL_GPUTexture ** p_swapchain_texture; SV *t_swapchain_texture;
	Uint32 c_swapchain_texture_width; Uint32 * p_swapchain_texture_width; SV *t_swapchain_texture_width;
	Uint32 c_swapchain_texture_height; Uint32 * p_swapchain_texture_height; SV *t_swapchain_texture_height;
	_Bool c_bg_ret;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_WaitAndAcquireGPUSwapchainTexture(command_buffer)");
	c_window = (SDL_Window *)bg_in_record_ptr(aTHX_ sv_window, "SDL3::Window", "SDL_WaitAndAcquireGPUSwapchainTexture(window)");
	t_swapchain_texture = bg_outref_target(aTHX_ sv_swapchain_texture);
	c_swapchain_texture = (t_swapchain_texture && SvOK(t_swapchain_texture)) ? (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ t_swapchain_texture, "SDL3::GPUTexture", "SDL_WaitAndAcquireGPUSwapchainTexture(swapchain_texture)") : (SDL_GPUTexture *)0;
	p_swapchain_texture = t_swapchain_texture ? &c_swapchain_texture : (SDL_GPUTexture **)bg_outref_raw(aTHX_ sv_swapchain_texture, "SDL_WaitAndAcquireGPUSwapchainTexture(swapchain_texture)");
	t_swapchain_texture_width = bg_outref_target(aTHX_ sv_swapchain_texture_width);
	c_swapchain_texture_width = (t_swapchain_texture_width && SvOK(t_swapchain_texture_width)) ? (Uint32)bg_in_uv(aTHX_ t_swapchain_texture_width, "SDL_WaitAndAcquireGPUSwapchainTexture(swapchain_texture_width)") : (Uint32)0;
	p_swapchain_texture_width = t_swapchain_texture_width ? &c_swapchain_texture_width : (Uint32 *)bg_outref_raw(aTHX_ sv_swapchain_texture_width, "SDL_WaitAndAcquireGPUSwapchainTexture(swapchain_texture_width)");
	t_swapchain_texture_height = bg_outref_target(aTHX_ sv_swapchain_texture_height);
	c_swapchain_texture_height = (t_swapchain_texture_height && SvOK(t_swapchain_texture_height)) ? (Uint32)bg_in_uv(aTHX_ t_swapchain_texture_height, "SDL_WaitAndAcquireGPUSwapchainTexture(swapchain_texture_height)") : (Uint32)0;
	p_swapchain_texture_height = t_swapchain_texture_height ? &c_swapchain_texture_height : (Uint32 *)bg_outref_raw(aTHX_ sv_swapchain_texture_height, "SDL_WaitAndAcquireGPUSwapchainTexture(swapchain_texture_height)");
	c_bg_ret = SDL_WaitAndAcquireGPUSwapchainTexture(c_command_buffer, c_window, p_swapchain_texture, p_swapchain_texture_width, p_swapchain_texture_height);
	if (t_swapchain_texture) sv_setsv(t_swapchain_texture, sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_swapchain_texture), "SDL3::GPUTexture")));
	if (t_swapchain_texture_width) sv_setsv(t_swapchain_texture_width, sv_2mortal(newSVuv((UV)(c_swapchain_texture_width))));
	if (t_swapchain_texture_height) sv_setsv(t_swapchain_texture_height, sv_2mortal(newSVuv((UV)(c_swapchain_texture_height))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SubmitGPUCommandBuffer(sv_command_buffer)
	SV *sv_command_buffer
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
	_Bool c_bg_ret;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_SubmitGPUCommandBuffer(command_buffer)");
	c_bg_ret = SDL_SubmitGPUCommandBuffer(c_command_buffer);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_SubmitGPUCommandBufferAndAcquireFence(sv_command_buffer)
	SV *sv_command_buffer
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
	SDL_GPUFence * c_bg_ret;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_SubmitGPUCommandBufferAndAcquireFence(command_buffer)");
	c_bg_ret = SDL_SubmitGPUCommandBufferAndAcquireFence(c_command_buffer);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::GPUFence"));
	XSRETURN(1);

void
SDL_CancelGPUCommandBuffer(sv_command_buffer)
	SV *sv_command_buffer
    PREINIT:
	SDL_GPUCommandBuffer * c_command_buffer;
	_Bool c_bg_ret;
    PPCODE:
	c_command_buffer = (SDL_GPUCommandBuffer *)bg_in_record_ptr(aTHX_ sv_command_buffer, "SDL3::GPUCommandBuffer", "SDL_CancelGPUCommandBuffer(command_buffer)");
	c_bg_ret = SDL_CancelGPUCommandBuffer(c_command_buffer);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WaitForGPUIdle(sv_device)
	SV *sv_device
    PREINIT:
	SDL_GPUDevice * c_device;
	_Bool c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_WaitForGPUIdle(device)");
	c_bg_ret = SDL_WaitForGPUIdle(c_device);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_WaitForGPUFences(sv_device, sv_wait_all, sv_fences, sv_num_fences)
	SV *sv_device
	SV *sv_wait_all
	SV *sv_fences
	SV *sv_num_fences
    PREINIT:
	SDL_GPUDevice * c_device;
	_Bool c_wait_all;
	SDL_GPUFence * c_fences; SDL_GPUFence * const * p_fences; SV *t_fences;
	Uint32 c_num_fences;
	_Bool c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_WaitForGPUFences(device)");
	c_wait_all = (_Bool)SvTRUE(sv_wait_all);
	t_fences = bg_outref_target(aTHX_ sv_fences);
	c_fences = (t_fences && SvOK(t_fences)) ? (SDL_GPUFence *)bg_in_record_ptr(aTHX_ t_fences, "SDL3::GPUFence", "SDL_WaitForGPUFences(fences)") : (SDL_GPUFence *)0;
	p_fences = t_fences ? &c_fences : (SDL_GPUFence * const *)bg_outref_raw(aTHX_ sv_fences, "SDL_WaitForGPUFences(fences)");
	c_num_fences = (Uint32)bg_in_uv(aTHX_ sv_num_fences, "SDL_WaitForGPUFences(num_fences)");
	c_bg_ret = SDL_WaitForGPUFences(c_device, c_wait_all, p_fences, c_num_fences);
	if (t_fences) sv_setsv(t_fences, sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_fences), "SDL3::GPUFence")));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_QueryGPUFence(sv_device, sv_fence)
	SV *sv_device
	SV *sv_fence
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUFence * c_fence;
	_Bool c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_QueryGPUFence(device)");
	c_fence = (SDL_GPUFence *)bg_in_record_ptr(aTHX_ sv_fence, "SDL3::GPUFence", "SDL_QueryGPUFence(fence)");
	c_bg_ret = SDL_QueryGPUFence(c_device, c_fence);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_ReleaseGPUFence(sv_device, sv_fence)
	SV *sv_device
	SV *sv_fence
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUFence * c_fence;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_ReleaseGPUFence(device)");
	c_fence = (SDL_GPUFence *)bg_in_record_ptr(aTHX_ sv_fence, "SDL3::GPUFence", "SDL_ReleaseGPUFence(fence)");
	SDL_ReleaseGPUFence(c_device, c_fence);
	XSRETURN(0);

void
SDL_GPUTextureFormatTexelBlockSize(sv_format)
	SV *sv_format
    PREINIT:
	SDL_GPUTextureFormat c_format;
	Uint32 c_bg_ret;
    PPCODE:
	c_format = (SDL_GPUTextureFormat)bg_in_iv(aTHX_ sv_format, "SDL_GPUTextureFormatTexelBlockSize(format)");
	c_bg_ret = SDL_GPUTextureFormatTexelBlockSize(c_format);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GPUTextureSupportsFormat(sv_device, sv_format, sv_type, sv_usage)
	SV *sv_device
	SV *sv_format
	SV *sv_type
	SV *sv_usage
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUTextureFormat c_format;
	SDL_GPUTextureType c_type;
	SDL_GPUTextureUsageFlags c_usage;
	_Bool c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_GPUTextureSupportsFormat(device)");
	c_format = (SDL_GPUTextureFormat)bg_in_iv(aTHX_ sv_format, "SDL_GPUTextureSupportsFormat(format)");
	c_type = (SDL_GPUTextureType)bg_in_iv(aTHX_ sv_type, "SDL_GPUTextureSupportsFormat(type)");
	c_usage = (SDL_GPUTextureUsageFlags)bg_in_uv(aTHX_ sv_usage, "SDL_GPUTextureSupportsFormat(usage)");
	c_bg_ret = SDL_GPUTextureSupportsFormat(c_device, c_format, c_type, c_usage);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GPUTextureSupportsSampleCount(sv_device, sv_format, sv_sample_count)
	SV *sv_device
	SV *sv_format
	SV *sv_sample_count
    PREINIT:
	SDL_GPUDevice * c_device;
	SDL_GPUTextureFormat c_format;
	SDL_GPUSampleCount c_sample_count;
	_Bool c_bg_ret;
    PPCODE:
	c_device = (SDL_GPUDevice *)bg_in_record_ptr(aTHX_ sv_device, "SDL3::GPUDevice", "SDL_GPUTextureSupportsSampleCount(device)");
	c_format = (SDL_GPUTextureFormat)bg_in_iv(aTHX_ sv_format, "SDL_GPUTextureSupportsSampleCount(format)");
	c_sample_count = (SDL_GPUSampleCount)bg_in_iv(aTHX_ sv_sample_count, "SDL_GPUTextureSupportsSampleCount(sample_count)");
	c_bg_ret = SDL_GPUTextureSupportsSampleCount(c_device, c_format, c_sample_count);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_CalculateGPUTextureFormatSize(sv_format, sv_width, sv_height, sv_depth_or_layer_count)
	SV *sv_format
	SV *sv_width
	SV *sv_height
	SV *sv_depth_or_layer_count
    PREINIT:
	SDL_GPUTextureFormat c_format;
	Uint32 c_width;
	Uint32 c_height;
	Uint32 c_depth_or_layer_count;
	Uint32 c_bg_ret;
    PPCODE:
	c_format = (SDL_GPUTextureFormat)bg_in_iv(aTHX_ sv_format, "SDL_CalculateGPUTextureFormatSize(format)");
	c_width = (Uint32)bg_in_uv(aTHX_ sv_width, "SDL_CalculateGPUTextureFormatSize(width)");
	c_height = (Uint32)bg_in_uv(aTHX_ sv_height, "SDL_CalculateGPUTextureFormatSize(height)");
	c_depth_or_layer_count = (Uint32)bg_in_uv(aTHX_ sv_depth_or_layer_count, "SDL_CalculateGPUTextureFormatSize(depth_or_layer_count)");
	c_bg_ret = SDL_CalculateGPUTextureFormatSize(c_format, c_width, c_height, c_depth_or_layer_count);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetPixelFormatFromGPUTextureFormat(sv_format)
	SV *sv_format
    PREINIT:
	SDL_GPUTextureFormat c_format;
	SDL_PixelFormat c_bg_ret;
    PPCODE:
	c_format = (SDL_GPUTextureFormat)bg_in_iv(aTHX_ sv_format, "SDL_GetPixelFormatFromGPUTextureFormat(format)");
	c_bg_ret = SDL_GetPixelFormatFromGPUTextureFormat(c_format);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetGPUTextureFormatFromPixelFormat(sv_format)
	SV *sv_format
    PREINIT:
	SDL_PixelFormat c_format;
	SDL_GPUTextureFormat c_bg_ret;
    PPCODE:
	c_format = (SDL_PixelFormat)bg_in_iv(aTHX_ sv_format, "SDL_GetGPUTextureFormatFromPixelFormat(format)");
	c_bg_ret = SDL_GetGPUTextureFormatFromPixelFormat(c_format);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Gpu", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ", BG_CONST_SV(SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE", BG_CONST_SV(SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ", BG_CONST_SV(SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BUFFERUSAGE_INDEX", BG_CONST_SV(SDL_GPU_BUFFERUSAGE_INDEX));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BUFFERUSAGE_INDIRECT", BG_CONST_SV(SDL_GPU_BUFFERUSAGE_INDIRECT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BUFFERUSAGE_VERTEX", BG_CONST_SV(SDL_GPU_BUFFERUSAGE_VERTEX));
	bg_export_constant(aTHX_ stash, "SDL_GPU_COLORCOMPONENT_A", BG_CONST_SV(SDL_GPU_COLORCOMPONENT_A));
	bg_export_constant(aTHX_ stash, "SDL_GPU_COLORCOMPONENT_B", BG_CONST_SV(SDL_GPU_COLORCOMPONENT_B));
	bg_export_constant(aTHX_ stash, "SDL_GPU_COLORCOMPONENT_G", BG_CONST_SV(SDL_GPU_COLORCOMPONENT_G));
	bg_export_constant(aTHX_ stash, "SDL_GPU_COLORCOMPONENT_R", BG_CONST_SV(SDL_GPU_COLORCOMPONENT_R));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SHADERFORMAT_DXBC", BG_CONST_SV(SDL_GPU_SHADERFORMAT_DXBC));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SHADERFORMAT_DXIL", BG_CONST_SV(SDL_GPU_SHADERFORMAT_DXIL));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SHADERFORMAT_INVALID", BG_CONST_SV(SDL_GPU_SHADERFORMAT_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SHADERFORMAT_METALLIB", BG_CONST_SV(SDL_GPU_SHADERFORMAT_METALLIB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SHADERFORMAT_MSL", BG_CONST_SV(SDL_GPU_SHADERFORMAT_MSL));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SHADERFORMAT_PRIVATE", BG_CONST_SV(SDL_GPU_SHADERFORMAT_PRIVATE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SHADERFORMAT_SPIRV", BG_CONST_SV(SDL_GPU_SHADERFORMAT_SPIRV));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREUSAGE_COLOR_TARGET", BG_CONST_SV(SDL_GPU_TEXTUREUSAGE_COLOR_TARGET));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ", BG_CONST_SV(SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE", BG_CONST_SV(SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE", BG_CONST_SV(SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET", BG_CONST_SV(SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ", BG_CONST_SV(SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREUSAGE_SAMPLER", BG_CONST_SV(SDL_GPU_TEXTUREUSAGE_SAMPLER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING", BG_CONST_SV(SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING", BG_CONST_SV(SDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_METAL_ALLOW_MACFAMILY1_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_METAL_ALLOW_MACFAMILY1_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN", BG_CONST_SV(SDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING", BG_CONST_SV(SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING", BG_CONST_SV(SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING", BG_CONST_SV(SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_DEVICE_NAME_STRING", BG_CONST_SV(SDL_PROP_GPU_DEVICE_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING", BG_CONST_SV(SDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING", BG_CONST_SV(SDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_SHADER_CREATE_NAME_STRING", BG_CONST_SV(SDL_PROP_GPU_SHADER_CREATE_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT", BG_CONST_SV(SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT", BG_CONST_SV(SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT", BG_CONST_SV(SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT", BG_CONST_SV(SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT", BG_CONST_SV(SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER", BG_CONST_SV(SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING", BG_CONST_SV(SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING", BG_CONST_SV(SDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING));
	bg_export_constant(aTHX_ stash, "SDL_GPU_PRIMITIVETYPE_TRIANGLELIST", BG_CONST_SV(SDL_GPU_PRIMITIVETYPE_TRIANGLELIST));
	bg_export_constant(aTHX_ stash, "SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP", BG_CONST_SV(SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP));
	bg_export_constant(aTHX_ stash, "SDL_GPU_PRIMITIVETYPE_LINELIST", BG_CONST_SV(SDL_GPU_PRIMITIVETYPE_LINELIST));
	bg_export_constant(aTHX_ stash, "SDL_GPU_PRIMITIVETYPE_LINESTRIP", BG_CONST_SV(SDL_GPU_PRIMITIVETYPE_LINESTRIP));
	bg_export_constant(aTHX_ stash, "SDL_GPU_PRIMITIVETYPE_POINTLIST", BG_CONST_SV(SDL_GPU_PRIMITIVETYPE_POINTLIST));
	bg_export_constant(aTHX_ stash, "SDL_GPU_LOADOP_LOAD", BG_CONST_SV(SDL_GPU_LOADOP_LOAD));
	bg_export_constant(aTHX_ stash, "SDL_GPU_LOADOP_CLEAR", BG_CONST_SV(SDL_GPU_LOADOP_CLEAR));
	bg_export_constant(aTHX_ stash, "SDL_GPU_LOADOP_DONT_CARE", BG_CONST_SV(SDL_GPU_LOADOP_DONT_CARE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_STOREOP_STORE", BG_CONST_SV(SDL_GPU_STOREOP_STORE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_STOREOP_DONT_CARE", BG_CONST_SV(SDL_GPU_STOREOP_DONT_CARE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_STOREOP_RESOLVE", BG_CONST_SV(SDL_GPU_STOREOP_RESOLVE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_STOREOP_RESOLVE_AND_STORE", BG_CONST_SV(SDL_GPU_STOREOP_RESOLVE_AND_STORE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_INDEXELEMENTSIZE_16BIT", BG_CONST_SV(SDL_GPU_INDEXELEMENTSIZE_16BIT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_INDEXELEMENTSIZE_32BIT", BG_CONST_SV(SDL_GPU_INDEXELEMENTSIZE_32BIT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_INVALID", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_A8_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_A8_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R8_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R8_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R8G8_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R8G8_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R16_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R16_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R16G16_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R16G16_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R8_SNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R8_SNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R8G8_SNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R8G8_SNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R16_SNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R16_SNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R16G16_SNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R16G16_SNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R16_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R16_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R32_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R32_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R8_UINT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R8_UINT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R8G8_UINT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R8G8_UINT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R16_UINT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R16_UINT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R16G16_UINT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R16G16_UINT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R32_UINT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R32_UINT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R32G32_UINT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R32G32_UINT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R8_INT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R8_INT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R8G8_INT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R8G8_INT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R16_INT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R16_INT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R16G16_INT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R16G16_INT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R32_INT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R32_INT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R32G32_INT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R32G32_INT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_D16_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_D16_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_D24_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_D24_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_D32_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_D32_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT", BG_CONST_SV(SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTURETYPE_2D", BG_CONST_SV(SDL_GPU_TEXTURETYPE_2D));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTURETYPE_2D_ARRAY", BG_CONST_SV(SDL_GPU_TEXTURETYPE_2D_ARRAY));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTURETYPE_3D", BG_CONST_SV(SDL_GPU_TEXTURETYPE_3D));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTURETYPE_CUBE", BG_CONST_SV(SDL_GPU_TEXTURETYPE_CUBE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TEXTURETYPE_CUBE_ARRAY", BG_CONST_SV(SDL_GPU_TEXTURETYPE_CUBE_ARRAY));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SAMPLECOUNT_1", BG_CONST_SV(SDL_GPU_SAMPLECOUNT_1));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SAMPLECOUNT_2", BG_CONST_SV(SDL_GPU_SAMPLECOUNT_2));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SAMPLECOUNT_4", BG_CONST_SV(SDL_GPU_SAMPLECOUNT_4));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SAMPLECOUNT_8", BG_CONST_SV(SDL_GPU_SAMPLECOUNT_8));
	bg_export_constant(aTHX_ stash, "SDL_GPU_CUBEMAPFACE_POSITIVEX", BG_CONST_SV(SDL_GPU_CUBEMAPFACE_POSITIVEX));
	bg_export_constant(aTHX_ stash, "SDL_GPU_CUBEMAPFACE_NEGATIVEX", BG_CONST_SV(SDL_GPU_CUBEMAPFACE_NEGATIVEX));
	bg_export_constant(aTHX_ stash, "SDL_GPU_CUBEMAPFACE_POSITIVEY", BG_CONST_SV(SDL_GPU_CUBEMAPFACE_POSITIVEY));
	bg_export_constant(aTHX_ stash, "SDL_GPU_CUBEMAPFACE_NEGATIVEY", BG_CONST_SV(SDL_GPU_CUBEMAPFACE_NEGATIVEY));
	bg_export_constant(aTHX_ stash, "SDL_GPU_CUBEMAPFACE_POSITIVEZ", BG_CONST_SV(SDL_GPU_CUBEMAPFACE_POSITIVEZ));
	bg_export_constant(aTHX_ stash, "SDL_GPU_CUBEMAPFACE_NEGATIVEZ", BG_CONST_SV(SDL_GPU_CUBEMAPFACE_NEGATIVEZ));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD", BG_CONST_SV(SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD));
	bg_export_constant(aTHX_ stash, "SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD", BG_CONST_SV(SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SHADERSTAGE_VERTEX", BG_CONST_SV(SDL_GPU_SHADERSTAGE_VERTEX));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SHADERSTAGE_FRAGMENT", BG_CONST_SV(SDL_GPU_SHADERSTAGE_FRAGMENT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_INVALID", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_INT", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_INT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_INT2", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_INT2));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_INT3", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_INT3));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_INT4", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_INT4));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_UINT", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_UINT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_UINT2", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_UINT2));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_UINT3", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_UINT3));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_UINT4", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_UINT4));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_FLOAT", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_FLOAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_BYTE2", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_BYTE2));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_BYTE4", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_BYTE4));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_SHORT2", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_SHORT2));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_SHORT4", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_SHORT4));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_USHORT2", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_USHORT2));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_USHORT4", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_USHORT4));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_HALF2", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_HALF2));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXELEMENTFORMAT_HALF4", BG_CONST_SV(SDL_GPU_VERTEXELEMENTFORMAT_HALF4));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXINPUTRATE_VERTEX", BG_CONST_SV(SDL_GPU_VERTEXINPUTRATE_VERTEX));
	bg_export_constant(aTHX_ stash, "SDL_GPU_VERTEXINPUTRATE_INSTANCE", BG_CONST_SV(SDL_GPU_VERTEXINPUTRATE_INSTANCE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_FILLMODE_FILL", BG_CONST_SV(SDL_GPU_FILLMODE_FILL));
	bg_export_constant(aTHX_ stash, "SDL_GPU_FILLMODE_LINE", BG_CONST_SV(SDL_GPU_FILLMODE_LINE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_CULLMODE_NONE", BG_CONST_SV(SDL_GPU_CULLMODE_NONE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_CULLMODE_FRONT", BG_CONST_SV(SDL_GPU_CULLMODE_FRONT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_CULLMODE_BACK", BG_CONST_SV(SDL_GPU_CULLMODE_BACK));
	bg_export_constant(aTHX_ stash, "SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE", BG_CONST_SV(SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_FRONTFACE_CLOCKWISE", BG_CONST_SV(SDL_GPU_FRONTFACE_CLOCKWISE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_COMPAREOP_INVALID", BG_CONST_SV(SDL_GPU_COMPAREOP_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_GPU_COMPAREOP_NEVER", BG_CONST_SV(SDL_GPU_COMPAREOP_NEVER));
	bg_export_constant(aTHX_ stash, "SDL_GPU_COMPAREOP_LESS", BG_CONST_SV(SDL_GPU_COMPAREOP_LESS));
	bg_export_constant(aTHX_ stash, "SDL_GPU_COMPAREOP_EQUAL", BG_CONST_SV(SDL_GPU_COMPAREOP_EQUAL));
	bg_export_constant(aTHX_ stash, "SDL_GPU_COMPAREOP_LESS_OR_EQUAL", BG_CONST_SV(SDL_GPU_COMPAREOP_LESS_OR_EQUAL));
	bg_export_constant(aTHX_ stash, "SDL_GPU_COMPAREOP_GREATER", BG_CONST_SV(SDL_GPU_COMPAREOP_GREATER));
	bg_export_constant(aTHX_ stash, "SDL_GPU_COMPAREOP_NOT_EQUAL", BG_CONST_SV(SDL_GPU_COMPAREOP_NOT_EQUAL));
	bg_export_constant(aTHX_ stash, "SDL_GPU_COMPAREOP_GREATER_OR_EQUAL", BG_CONST_SV(SDL_GPU_COMPAREOP_GREATER_OR_EQUAL));
	bg_export_constant(aTHX_ stash, "SDL_GPU_COMPAREOP_ALWAYS", BG_CONST_SV(SDL_GPU_COMPAREOP_ALWAYS));
	bg_export_constant(aTHX_ stash, "SDL_GPU_STENCILOP_INVALID", BG_CONST_SV(SDL_GPU_STENCILOP_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_GPU_STENCILOP_KEEP", BG_CONST_SV(SDL_GPU_STENCILOP_KEEP));
	bg_export_constant(aTHX_ stash, "SDL_GPU_STENCILOP_ZERO", BG_CONST_SV(SDL_GPU_STENCILOP_ZERO));
	bg_export_constant(aTHX_ stash, "SDL_GPU_STENCILOP_REPLACE", BG_CONST_SV(SDL_GPU_STENCILOP_REPLACE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP", BG_CONST_SV(SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP));
	bg_export_constant(aTHX_ stash, "SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP", BG_CONST_SV(SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP));
	bg_export_constant(aTHX_ stash, "SDL_GPU_STENCILOP_INVERT", BG_CONST_SV(SDL_GPU_STENCILOP_INVERT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_STENCILOP_INCREMENT_AND_WRAP", BG_CONST_SV(SDL_GPU_STENCILOP_INCREMENT_AND_WRAP));
	bg_export_constant(aTHX_ stash, "SDL_GPU_STENCILOP_DECREMENT_AND_WRAP", BG_CONST_SV(SDL_GPU_STENCILOP_DECREMENT_AND_WRAP));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDOP_INVALID", BG_CONST_SV(SDL_GPU_BLENDOP_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDOP_ADD", BG_CONST_SV(SDL_GPU_BLENDOP_ADD));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDOP_SUBTRACT", BG_CONST_SV(SDL_GPU_BLENDOP_SUBTRACT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDOP_REVERSE_SUBTRACT", BG_CONST_SV(SDL_GPU_BLENDOP_REVERSE_SUBTRACT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDOP_MIN", BG_CONST_SV(SDL_GPU_BLENDOP_MIN));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDOP_MAX", BG_CONST_SV(SDL_GPU_BLENDOP_MAX));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDFACTOR_INVALID", BG_CONST_SV(SDL_GPU_BLENDFACTOR_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDFACTOR_ZERO", BG_CONST_SV(SDL_GPU_BLENDFACTOR_ZERO));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDFACTOR_ONE", BG_CONST_SV(SDL_GPU_BLENDFACTOR_ONE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDFACTOR_SRC_COLOR", BG_CONST_SV(SDL_GPU_BLENDFACTOR_SRC_COLOR));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR", BG_CONST_SV(SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDFACTOR_DST_COLOR", BG_CONST_SV(SDL_GPU_BLENDFACTOR_DST_COLOR));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR", BG_CONST_SV(SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDFACTOR_SRC_ALPHA", BG_CONST_SV(SDL_GPU_BLENDFACTOR_SRC_ALPHA));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA", BG_CONST_SV(SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDFACTOR_DST_ALPHA", BG_CONST_SV(SDL_GPU_BLENDFACTOR_DST_ALPHA));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA", BG_CONST_SV(SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDFACTOR_CONSTANT_COLOR", BG_CONST_SV(SDL_GPU_BLENDFACTOR_CONSTANT_COLOR));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR", BG_CONST_SV(SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR));
	bg_export_constant(aTHX_ stash, "SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE", BG_CONST_SV(SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_FILTER_NEAREST", BG_CONST_SV(SDL_GPU_FILTER_NEAREST));
	bg_export_constant(aTHX_ stash, "SDL_GPU_FILTER_LINEAR", BG_CONST_SV(SDL_GPU_FILTER_LINEAR));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SAMPLERMIPMAPMODE_NEAREST", BG_CONST_SV(SDL_GPU_SAMPLERMIPMAPMODE_NEAREST));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SAMPLERMIPMAPMODE_LINEAR", BG_CONST_SV(SDL_GPU_SAMPLERMIPMAPMODE_LINEAR));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SAMPLERADDRESSMODE_REPEAT", BG_CONST_SV(SDL_GPU_SAMPLERADDRESSMODE_REPEAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT", BG_CONST_SV(SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE", BG_CONST_SV(SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_PRESENTMODE_VSYNC", BG_CONST_SV(SDL_GPU_PRESENTMODE_VSYNC));
	bg_export_constant(aTHX_ stash, "SDL_GPU_PRESENTMODE_IMMEDIATE", BG_CONST_SV(SDL_GPU_PRESENTMODE_IMMEDIATE));
	bg_export_constant(aTHX_ stash, "SDL_GPU_PRESENTMODE_MAILBOX", BG_CONST_SV(SDL_GPU_PRESENTMODE_MAILBOX));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SWAPCHAINCOMPOSITION_SDR", BG_CONST_SV(SDL_GPU_SWAPCHAINCOMPOSITION_SDR));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR", BG_CONST_SV(SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR", BG_CONST_SV(SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR));
	bg_export_constant(aTHX_ stash, "SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084", BG_CONST_SV(SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084));
	}














MODULE = SDL3  PACKAGE = SDL3::GPUViewport

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUViewport), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUViewport)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUViewport *self;
    PPCODE:
	self = (struct SDL_GPUViewport *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUViewport", "SDL3::GPUViewport::x");
	if (items > 1) {
		self->x = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GPUViewport::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUViewport *self;
    PPCODE:
	self = (struct SDL_GPUViewport *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUViewport", "SDL3::GPUViewport::y");
	if (items > 1) {
		self->y = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GPUViewport::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->y)));
	XSRETURN(1);

void
w(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUViewport *self;
    PPCODE:
	self = (struct SDL_GPUViewport *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUViewport", "SDL3::GPUViewport::w");
	if (items > 1) {
		self->w = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GPUViewport::w");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->w)));
	XSRETURN(1);

void
h(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUViewport *self;
    PPCODE:
	self = (struct SDL_GPUViewport *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUViewport", "SDL3::GPUViewport::h");
	if (items > 1) {
		self->h = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GPUViewport::h");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->h)));
	XSRETURN(1);

void
min_depth(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUViewport *self;
    PPCODE:
	self = (struct SDL_GPUViewport *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUViewport", "SDL3::GPUViewport::min_depth");
	if (items > 1) {
		self->min_depth = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GPUViewport::min_depth");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->min_depth)));
	XSRETURN(1);

void
max_depth(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUViewport *self;
    PPCODE:
	self = (struct SDL_GPUViewport *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUViewport", "SDL3::GPUViewport::max_depth");
	if (items > 1) {
		self->max_depth = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GPUViewport::max_depth");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->max_depth)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUTextureTransferInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUTextureTransferInfo), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUTextureTransferInfo)));
	XSRETURN(1);

void
transfer_buffer(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureTransferInfo *self;
    PPCODE:
	self = (struct SDL_GPUTextureTransferInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureTransferInfo", "SDL3::GPUTextureTransferInfo::transfer_buffer");
	if (items > 1) {
		self->transfer_buffer = (SDL_GPUTransferBuffer *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUTransferBuffer", "SDL3::GPUTextureTransferInfo::transfer_buffer");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->transfer_buffer), "SDL3::GPUTransferBuffer"));
	XSRETURN(1);

void
offset(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureTransferInfo *self;
    PPCODE:
	self = (struct SDL_GPUTextureTransferInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureTransferInfo", "SDL3::GPUTextureTransferInfo::offset");
	if (items > 1) {
		self->offset = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureTransferInfo::offset");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->offset)));
	XSRETURN(1);

void
pixels_per_row(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureTransferInfo *self;
    PPCODE:
	self = (struct SDL_GPUTextureTransferInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureTransferInfo", "SDL3::GPUTextureTransferInfo::pixels_per_row");
	if (items > 1) {
		self->pixels_per_row = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureTransferInfo::pixels_per_row");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->pixels_per_row)));
	XSRETURN(1);

void
rows_per_layer(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureTransferInfo *self;
    PPCODE:
	self = (struct SDL_GPUTextureTransferInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureTransferInfo", "SDL3::GPUTextureTransferInfo::rows_per_layer");
	if (items > 1) {
		self->rows_per_layer = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureTransferInfo::rows_per_layer");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->rows_per_layer)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUTransferBufferLocation

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUTransferBufferLocation), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUTransferBufferLocation)));
	XSRETURN(1);

void
transfer_buffer(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTransferBufferLocation *self;
    PPCODE:
	self = (struct SDL_GPUTransferBufferLocation *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTransferBufferLocation", "SDL3::GPUTransferBufferLocation::transfer_buffer");
	if (items > 1) {
		self->transfer_buffer = (SDL_GPUTransferBuffer *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUTransferBuffer", "SDL3::GPUTransferBufferLocation::transfer_buffer");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->transfer_buffer), "SDL3::GPUTransferBuffer"));
	XSRETURN(1);

void
offset(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTransferBufferLocation *self;
    PPCODE:
	self = (struct SDL_GPUTransferBufferLocation *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTransferBufferLocation", "SDL3::GPUTransferBufferLocation::offset");
	if (items > 1) {
		self->offset = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTransferBufferLocation::offset");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->offset)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUTextureLocation

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUTextureLocation), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUTextureLocation)));
	XSRETURN(1);

void
texture(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureLocation *self;
    PPCODE:
	self = (struct SDL_GPUTextureLocation *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureLocation", "SDL3::GPUTextureLocation::texture");
	if (items > 1) {
		self->texture = (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUTexture", "SDL3::GPUTextureLocation::texture");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->texture), "SDL3::GPUTexture"));
	XSRETURN(1);

void
mip_level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureLocation *self;
    PPCODE:
	self = (struct SDL_GPUTextureLocation *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureLocation", "SDL3::GPUTextureLocation::mip_level");
	if (items > 1) {
		self->mip_level = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureLocation::mip_level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->mip_level)));
	XSRETURN(1);

void
layer(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureLocation *self;
    PPCODE:
	self = (struct SDL_GPUTextureLocation *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureLocation", "SDL3::GPUTextureLocation::layer");
	if (items > 1) {
		self->layer = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureLocation::layer");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->layer)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureLocation *self;
    PPCODE:
	self = (struct SDL_GPUTextureLocation *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureLocation", "SDL3::GPUTextureLocation::x");
	if (items > 1) {
		self->x = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureLocation::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureLocation *self;
    PPCODE:
	self = (struct SDL_GPUTextureLocation *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureLocation", "SDL3::GPUTextureLocation::y");
	if (items > 1) {
		self->y = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureLocation::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->y)));
	XSRETURN(1);

void
z(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureLocation *self;
    PPCODE:
	self = (struct SDL_GPUTextureLocation *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureLocation", "SDL3::GPUTextureLocation::z");
	if (items > 1) {
		self->z = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureLocation::z");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->z)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUTextureRegion

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUTextureRegion), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUTextureRegion)));
	XSRETURN(1);

void
texture(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureRegion *self;
    PPCODE:
	self = (struct SDL_GPUTextureRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureRegion", "SDL3::GPUTextureRegion::texture");
	if (items > 1) {
		self->texture = (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUTexture", "SDL3::GPUTextureRegion::texture");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->texture), "SDL3::GPUTexture"));
	XSRETURN(1);

void
mip_level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureRegion *self;
    PPCODE:
	self = (struct SDL_GPUTextureRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureRegion", "SDL3::GPUTextureRegion::mip_level");
	if (items > 1) {
		self->mip_level = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureRegion::mip_level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->mip_level)));
	XSRETURN(1);

void
layer(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureRegion *self;
    PPCODE:
	self = (struct SDL_GPUTextureRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureRegion", "SDL3::GPUTextureRegion::layer");
	if (items > 1) {
		self->layer = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureRegion::layer");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->layer)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureRegion *self;
    PPCODE:
	self = (struct SDL_GPUTextureRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureRegion", "SDL3::GPUTextureRegion::x");
	if (items > 1) {
		self->x = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureRegion::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureRegion *self;
    PPCODE:
	self = (struct SDL_GPUTextureRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureRegion", "SDL3::GPUTextureRegion::y");
	if (items > 1) {
		self->y = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureRegion::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->y)));
	XSRETURN(1);

void
z(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureRegion *self;
    PPCODE:
	self = (struct SDL_GPUTextureRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureRegion", "SDL3::GPUTextureRegion::z");
	if (items > 1) {
		self->z = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureRegion::z");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->z)));
	XSRETURN(1);

void
w(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureRegion *self;
    PPCODE:
	self = (struct SDL_GPUTextureRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureRegion", "SDL3::GPUTextureRegion::w");
	if (items > 1) {
		self->w = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureRegion::w");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->w)));
	XSRETURN(1);

void
h(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureRegion *self;
    PPCODE:
	self = (struct SDL_GPUTextureRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureRegion", "SDL3::GPUTextureRegion::h");
	if (items > 1) {
		self->h = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureRegion::h");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->h)));
	XSRETURN(1);

void
d(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureRegion *self;
    PPCODE:
	self = (struct SDL_GPUTextureRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureRegion", "SDL3::GPUTextureRegion::d");
	if (items > 1) {
		self->d = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureRegion::d");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->d)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUBlitRegion

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUBlitRegion), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUBlitRegion)));
	XSRETURN(1);

void
texture(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitRegion *self;
    PPCODE:
	self = (struct SDL_GPUBlitRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitRegion", "SDL3::GPUBlitRegion::texture");
	if (items > 1) {
		self->texture = (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUTexture", "SDL3::GPUBlitRegion::texture");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->texture), "SDL3::GPUTexture"));
	XSRETURN(1);

void
mip_level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitRegion *self;
    PPCODE:
	self = (struct SDL_GPUBlitRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitRegion", "SDL3::GPUBlitRegion::mip_level");
	if (items > 1) {
		self->mip_level = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBlitRegion::mip_level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->mip_level)));
	XSRETURN(1);

void
layer_or_depth_plane(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitRegion *self;
    PPCODE:
	self = (struct SDL_GPUBlitRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitRegion", "SDL3::GPUBlitRegion::layer_or_depth_plane");
	if (items > 1) {
		self->layer_or_depth_plane = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBlitRegion::layer_or_depth_plane");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->layer_or_depth_plane)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitRegion *self;
    PPCODE:
	self = (struct SDL_GPUBlitRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitRegion", "SDL3::GPUBlitRegion::x");
	if (items > 1) {
		self->x = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBlitRegion::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitRegion *self;
    PPCODE:
	self = (struct SDL_GPUBlitRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitRegion", "SDL3::GPUBlitRegion::y");
	if (items > 1) {
		self->y = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBlitRegion::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->y)));
	XSRETURN(1);

void
w(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitRegion *self;
    PPCODE:
	self = (struct SDL_GPUBlitRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitRegion", "SDL3::GPUBlitRegion::w");
	if (items > 1) {
		self->w = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBlitRegion::w");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->w)));
	XSRETURN(1);

void
h(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitRegion *self;
    PPCODE:
	self = (struct SDL_GPUBlitRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitRegion", "SDL3::GPUBlitRegion::h");
	if (items > 1) {
		self->h = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBlitRegion::h");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->h)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUBufferLocation

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUBufferLocation), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUBufferLocation)));
	XSRETURN(1);

void
buffer(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBufferLocation *self;
    PPCODE:
	self = (struct SDL_GPUBufferLocation *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBufferLocation", "SDL3::GPUBufferLocation::buffer");
	if (items > 1) {
		self->buffer = (SDL_GPUBuffer *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUBuffer", "SDL3::GPUBufferLocation::buffer");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->buffer), "SDL3::GPUBuffer"));
	XSRETURN(1);

void
offset(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBufferLocation *self;
    PPCODE:
	self = (struct SDL_GPUBufferLocation *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBufferLocation", "SDL3::GPUBufferLocation::offset");
	if (items > 1) {
		self->offset = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBufferLocation::offset");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->offset)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUBufferRegion

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUBufferRegion), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUBufferRegion)));
	XSRETURN(1);

void
buffer(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBufferRegion *self;
    PPCODE:
	self = (struct SDL_GPUBufferRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBufferRegion", "SDL3::GPUBufferRegion::buffer");
	if (items > 1) {
		self->buffer = (SDL_GPUBuffer *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUBuffer", "SDL3::GPUBufferRegion::buffer");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->buffer), "SDL3::GPUBuffer"));
	XSRETURN(1);

void
offset(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBufferRegion *self;
    PPCODE:
	self = (struct SDL_GPUBufferRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBufferRegion", "SDL3::GPUBufferRegion::offset");
	if (items > 1) {
		self->offset = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBufferRegion::offset");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->offset)));
	XSRETURN(1);

void
size(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBufferRegion *self;
    PPCODE:
	self = (struct SDL_GPUBufferRegion *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBufferRegion", "SDL3::GPUBufferRegion::size");
	if (items > 1) {
		self->size = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBufferRegion::size");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->size)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUIndirectDrawCommand

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUIndirectDrawCommand), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUIndirectDrawCommand)));
	XSRETURN(1);

void
num_vertices(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUIndirectDrawCommand *self;
    PPCODE:
	self = (struct SDL_GPUIndirectDrawCommand *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUIndirectDrawCommand", "SDL3::GPUIndirectDrawCommand::num_vertices");
	if (items > 1) {
		self->num_vertices = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUIndirectDrawCommand::num_vertices");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_vertices)));
	XSRETURN(1);

void
num_instances(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUIndirectDrawCommand *self;
    PPCODE:
	self = (struct SDL_GPUIndirectDrawCommand *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUIndirectDrawCommand", "SDL3::GPUIndirectDrawCommand::num_instances");
	if (items > 1) {
		self->num_instances = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUIndirectDrawCommand::num_instances");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_instances)));
	XSRETURN(1);

void
first_vertex(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUIndirectDrawCommand *self;
    PPCODE:
	self = (struct SDL_GPUIndirectDrawCommand *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUIndirectDrawCommand", "SDL3::GPUIndirectDrawCommand::first_vertex");
	if (items > 1) {
		self->first_vertex = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUIndirectDrawCommand::first_vertex");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->first_vertex)));
	XSRETURN(1);

void
first_instance(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUIndirectDrawCommand *self;
    PPCODE:
	self = (struct SDL_GPUIndirectDrawCommand *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUIndirectDrawCommand", "SDL3::GPUIndirectDrawCommand::first_instance");
	if (items > 1) {
		self->first_instance = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUIndirectDrawCommand::first_instance");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->first_instance)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUIndexedIndirectDrawCommand

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUIndexedIndirectDrawCommand), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUIndexedIndirectDrawCommand)));
	XSRETURN(1);

void
num_indices(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUIndexedIndirectDrawCommand *self;
    PPCODE:
	self = (struct SDL_GPUIndexedIndirectDrawCommand *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUIndexedIndirectDrawCommand", "SDL3::GPUIndexedIndirectDrawCommand::num_indices");
	if (items > 1) {
		self->num_indices = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUIndexedIndirectDrawCommand::num_indices");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_indices)));
	XSRETURN(1);

void
num_instances(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUIndexedIndirectDrawCommand *self;
    PPCODE:
	self = (struct SDL_GPUIndexedIndirectDrawCommand *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUIndexedIndirectDrawCommand", "SDL3::GPUIndexedIndirectDrawCommand::num_instances");
	if (items > 1) {
		self->num_instances = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUIndexedIndirectDrawCommand::num_instances");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_instances)));
	XSRETURN(1);

void
first_index(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUIndexedIndirectDrawCommand *self;
    PPCODE:
	self = (struct SDL_GPUIndexedIndirectDrawCommand *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUIndexedIndirectDrawCommand", "SDL3::GPUIndexedIndirectDrawCommand::first_index");
	if (items > 1) {
		self->first_index = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUIndexedIndirectDrawCommand::first_index");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->first_index)));
	XSRETURN(1);

void
vertex_offset(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUIndexedIndirectDrawCommand *self;
    PPCODE:
	self = (struct SDL_GPUIndexedIndirectDrawCommand *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUIndexedIndirectDrawCommand", "SDL3::GPUIndexedIndirectDrawCommand::vertex_offset");
	if (items > 1) {
		self->vertex_offset = (Sint32)bg_in_iv(aTHX_ ST(1), "SDL3::GPUIndexedIndirectDrawCommand::vertex_offset");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->vertex_offset)));
	XSRETURN(1);

void
first_instance(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUIndexedIndirectDrawCommand *self;
    PPCODE:
	self = (struct SDL_GPUIndexedIndirectDrawCommand *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUIndexedIndirectDrawCommand", "SDL3::GPUIndexedIndirectDrawCommand::first_instance");
	if (items > 1) {
		self->first_instance = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUIndexedIndirectDrawCommand::first_instance");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->first_instance)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUIndirectDispatchCommand

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUIndirectDispatchCommand), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUIndirectDispatchCommand)));
	XSRETURN(1);

void
groupcount_x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUIndirectDispatchCommand *self;
    PPCODE:
	self = (struct SDL_GPUIndirectDispatchCommand *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUIndirectDispatchCommand", "SDL3::GPUIndirectDispatchCommand::groupcount_x");
	if (items > 1) {
		self->groupcount_x = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUIndirectDispatchCommand::groupcount_x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->groupcount_x)));
	XSRETURN(1);

void
groupcount_y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUIndirectDispatchCommand *self;
    PPCODE:
	self = (struct SDL_GPUIndirectDispatchCommand *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUIndirectDispatchCommand", "SDL3::GPUIndirectDispatchCommand::groupcount_y");
	if (items > 1) {
		self->groupcount_y = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUIndirectDispatchCommand::groupcount_y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->groupcount_y)));
	XSRETURN(1);

void
groupcount_z(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUIndirectDispatchCommand *self;
    PPCODE:
	self = (struct SDL_GPUIndirectDispatchCommand *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUIndirectDispatchCommand", "SDL3::GPUIndirectDispatchCommand::groupcount_z");
	if (items > 1) {
		self->groupcount_z = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUIndirectDispatchCommand::groupcount_z");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->groupcount_z)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUSamplerCreateInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUSamplerCreateInfo), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUSamplerCreateInfo)));
	XSRETURN(1);

void
min_filter(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::min_filter");
	if (items > 1) {
		self->min_filter = (SDL_GPUFilter)bg_in_iv(aTHX_ ST(1), "SDL3::GPUSamplerCreateInfo::min_filter");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->min_filter)));
	XSRETURN(1);

void
mag_filter(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::mag_filter");
	if (items > 1) {
		self->mag_filter = (SDL_GPUFilter)bg_in_iv(aTHX_ ST(1), "SDL3::GPUSamplerCreateInfo::mag_filter");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->mag_filter)));
	XSRETURN(1);

void
mipmap_mode(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::mipmap_mode");
	if (items > 1) {
		self->mipmap_mode = (SDL_GPUSamplerMipmapMode)bg_in_iv(aTHX_ ST(1), "SDL3::GPUSamplerCreateInfo::mipmap_mode");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->mipmap_mode)));
	XSRETURN(1);

void
address_mode_u(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::address_mode_u");
	if (items > 1) {
		self->address_mode_u = (SDL_GPUSamplerAddressMode)bg_in_iv(aTHX_ ST(1), "SDL3::GPUSamplerCreateInfo::address_mode_u");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->address_mode_u)));
	XSRETURN(1);

void
address_mode_v(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::address_mode_v");
	if (items > 1) {
		self->address_mode_v = (SDL_GPUSamplerAddressMode)bg_in_iv(aTHX_ ST(1), "SDL3::GPUSamplerCreateInfo::address_mode_v");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->address_mode_v)));
	XSRETURN(1);

void
address_mode_w(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::address_mode_w");
	if (items > 1) {
		self->address_mode_w = (SDL_GPUSamplerAddressMode)bg_in_iv(aTHX_ ST(1), "SDL3::GPUSamplerCreateInfo::address_mode_w");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->address_mode_w)));
	XSRETURN(1);

void
mip_lod_bias(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::mip_lod_bias");
	if (items > 1) {
		self->mip_lod_bias = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GPUSamplerCreateInfo::mip_lod_bias");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->mip_lod_bias)));
	XSRETURN(1);

void
max_anisotropy(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::max_anisotropy");
	if (items > 1) {
		self->max_anisotropy = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GPUSamplerCreateInfo::max_anisotropy");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->max_anisotropy)));
	XSRETURN(1);

void
compare_op(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::compare_op");
	if (items > 1) {
		self->compare_op = (SDL_GPUCompareOp)bg_in_iv(aTHX_ ST(1), "SDL3::GPUSamplerCreateInfo::compare_op");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->compare_op)));
	XSRETURN(1);

void
min_lod(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::min_lod");
	if (items > 1) {
		self->min_lod = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GPUSamplerCreateInfo::min_lod");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->min_lod)));
	XSRETURN(1);

void
max_lod(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::max_lod");
	if (items > 1) {
		self->max_lod = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GPUSamplerCreateInfo::max_lod");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->max_lod)));
	XSRETURN(1);

void
enable_anisotropy(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::enable_anisotropy");
	if (items > 1) {
		self->enable_anisotropy = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->enable_anisotropy)));
	XSRETURN(1);

void
enable_compare(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::enable_compare");
	if (items > 1) {
		self->enable_compare = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->enable_compare)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUSamplerCreateInfo::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUSamplerCreateInfo::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

void
props(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUSamplerCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUSamplerCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUSamplerCreateInfo", "SDL3::GPUSamplerCreateInfo::props");
	if (items > 1) {
		self->props = (SDL_PropertiesID)bg_in_uv(aTHX_ ST(1), "SDL3::GPUSamplerCreateInfo::props");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->props)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUVertexBufferDescription

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUVertexBufferDescription), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUVertexBufferDescription)));
	XSRETURN(1);

void
slot(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVertexBufferDescription *self;
    PPCODE:
	self = (struct SDL_GPUVertexBufferDescription *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVertexBufferDescription", "SDL3::GPUVertexBufferDescription::slot");
	if (items > 1) {
		self->slot = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUVertexBufferDescription::slot");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->slot)));
	XSRETURN(1);

void
pitch(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVertexBufferDescription *self;
    PPCODE:
	self = (struct SDL_GPUVertexBufferDescription *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVertexBufferDescription", "SDL3::GPUVertexBufferDescription::pitch");
	if (items > 1) {
		self->pitch = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUVertexBufferDescription::pitch");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->pitch)));
	XSRETURN(1);

void
input_rate(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVertexBufferDescription *self;
    PPCODE:
	self = (struct SDL_GPUVertexBufferDescription *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVertexBufferDescription", "SDL3::GPUVertexBufferDescription::input_rate");
	if (items > 1) {
		self->input_rate = (SDL_GPUVertexInputRate)bg_in_iv(aTHX_ ST(1), "SDL3::GPUVertexBufferDescription::input_rate");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->input_rate)));
	XSRETURN(1);

void
instance_step_rate(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVertexBufferDescription *self;
    PPCODE:
	self = (struct SDL_GPUVertexBufferDescription *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVertexBufferDescription", "SDL3::GPUVertexBufferDescription::instance_step_rate");
	if (items > 1) {
		self->instance_step_rate = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUVertexBufferDescription::instance_step_rate");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->instance_step_rate)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUVertexAttribute

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUVertexAttribute), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUVertexAttribute)));
	XSRETURN(1);

void
location(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVertexAttribute *self;
    PPCODE:
	self = (struct SDL_GPUVertexAttribute *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVertexAttribute", "SDL3::GPUVertexAttribute::location");
	if (items > 1) {
		self->location = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUVertexAttribute::location");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->location)));
	XSRETURN(1);

void
buffer_slot(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVertexAttribute *self;
    PPCODE:
	self = (struct SDL_GPUVertexAttribute *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVertexAttribute", "SDL3::GPUVertexAttribute::buffer_slot");
	if (items > 1) {
		self->buffer_slot = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUVertexAttribute::buffer_slot");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->buffer_slot)));
	XSRETURN(1);

void
format(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVertexAttribute *self;
    PPCODE:
	self = (struct SDL_GPUVertexAttribute *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVertexAttribute", "SDL3::GPUVertexAttribute::format");
	if (items > 1) {
		self->format = (SDL_GPUVertexElementFormat)bg_in_iv(aTHX_ ST(1), "SDL3::GPUVertexAttribute::format");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->format)));
	XSRETURN(1);

void
offset(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVertexAttribute *self;
    PPCODE:
	self = (struct SDL_GPUVertexAttribute *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVertexAttribute", "SDL3::GPUVertexAttribute::offset");
	if (items > 1) {
		self->offset = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUVertexAttribute::offset");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->offset)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUVertexInputState

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUVertexInputState), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUVertexInputState)));
	XSRETURN(1);

void
vertex_buffer_descriptions(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVertexInputState *self;
    PPCODE:
	self = (struct SDL_GPUVertexInputState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVertexInputState", "SDL3::GPUVertexInputState::vertex_buffer_descriptions");
	if (items > 1) {
		self->vertex_buffer_descriptions = (const SDL_GPUVertexBufferDescription *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUVertexBufferDescription", "SDL3::GPUVertexInputState::vertex_buffer_descriptions");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->vertex_buffer_descriptions), "SDL3::GPUVertexBufferDescription"));
	XSRETURN(1);

void
num_vertex_buffers(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVertexInputState *self;
    PPCODE:
	self = (struct SDL_GPUVertexInputState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVertexInputState", "SDL3::GPUVertexInputState::num_vertex_buffers");
	if (items > 1) {
		self->num_vertex_buffers = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUVertexInputState::num_vertex_buffers");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_vertex_buffers)));
	XSRETURN(1);

void
vertex_attributes(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVertexInputState *self;
    PPCODE:
	self = (struct SDL_GPUVertexInputState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVertexInputState", "SDL3::GPUVertexInputState::vertex_attributes");
	if (items > 1) {
		self->vertex_attributes = (const SDL_GPUVertexAttribute *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUVertexAttribute", "SDL3::GPUVertexInputState::vertex_attributes");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->vertex_attributes), "SDL3::GPUVertexAttribute"));
	XSRETURN(1);

void
num_vertex_attributes(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVertexInputState *self;
    PPCODE:
	self = (struct SDL_GPUVertexInputState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVertexInputState", "SDL3::GPUVertexInputState::num_vertex_attributes");
	if (items > 1) {
		self->num_vertex_attributes = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUVertexInputState::num_vertex_attributes");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_vertex_attributes)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUStencilOpState

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUStencilOpState), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUStencilOpState)));
	XSRETURN(1);

void
fail_op(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStencilOpState *self;
    PPCODE:
	self = (struct SDL_GPUStencilOpState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStencilOpState", "SDL3::GPUStencilOpState::fail_op");
	if (items > 1) {
		self->fail_op = (SDL_GPUStencilOp)bg_in_iv(aTHX_ ST(1), "SDL3::GPUStencilOpState::fail_op");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->fail_op)));
	XSRETURN(1);

void
pass_op(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStencilOpState *self;
    PPCODE:
	self = (struct SDL_GPUStencilOpState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStencilOpState", "SDL3::GPUStencilOpState::pass_op");
	if (items > 1) {
		self->pass_op = (SDL_GPUStencilOp)bg_in_iv(aTHX_ ST(1), "SDL3::GPUStencilOpState::pass_op");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->pass_op)));
	XSRETURN(1);

void
depth_fail_op(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStencilOpState *self;
    PPCODE:
	self = (struct SDL_GPUStencilOpState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStencilOpState", "SDL3::GPUStencilOpState::depth_fail_op");
	if (items > 1) {
		self->depth_fail_op = (SDL_GPUStencilOp)bg_in_iv(aTHX_ ST(1), "SDL3::GPUStencilOpState::depth_fail_op");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->depth_fail_op)));
	XSRETURN(1);

void
compare_op(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStencilOpState *self;
    PPCODE:
	self = (struct SDL_GPUStencilOpState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStencilOpState", "SDL3::GPUStencilOpState::compare_op");
	if (items > 1) {
		self->compare_op = (SDL_GPUCompareOp)bg_in_iv(aTHX_ ST(1), "SDL3::GPUStencilOpState::compare_op");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->compare_op)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUColorTargetBlendState

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUColorTargetBlendState), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUColorTargetBlendState)));
	XSRETURN(1);

void
src_color_blendfactor(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetBlendState *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetBlendState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetBlendState", "SDL3::GPUColorTargetBlendState::src_color_blendfactor");
	if (items > 1) {
		self->src_color_blendfactor = (SDL_GPUBlendFactor)bg_in_iv(aTHX_ ST(1), "SDL3::GPUColorTargetBlendState::src_color_blendfactor");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->src_color_blendfactor)));
	XSRETURN(1);

void
dst_color_blendfactor(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetBlendState *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetBlendState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetBlendState", "SDL3::GPUColorTargetBlendState::dst_color_blendfactor");
	if (items > 1) {
		self->dst_color_blendfactor = (SDL_GPUBlendFactor)bg_in_iv(aTHX_ ST(1), "SDL3::GPUColorTargetBlendState::dst_color_blendfactor");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->dst_color_blendfactor)));
	XSRETURN(1);

void
color_blend_op(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetBlendState *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetBlendState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetBlendState", "SDL3::GPUColorTargetBlendState::color_blend_op");
	if (items > 1) {
		self->color_blend_op = (SDL_GPUBlendOp)bg_in_iv(aTHX_ ST(1), "SDL3::GPUColorTargetBlendState::color_blend_op");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->color_blend_op)));
	XSRETURN(1);

void
src_alpha_blendfactor(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetBlendState *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetBlendState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetBlendState", "SDL3::GPUColorTargetBlendState::src_alpha_blendfactor");
	if (items > 1) {
		self->src_alpha_blendfactor = (SDL_GPUBlendFactor)bg_in_iv(aTHX_ ST(1), "SDL3::GPUColorTargetBlendState::src_alpha_blendfactor");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->src_alpha_blendfactor)));
	XSRETURN(1);

void
dst_alpha_blendfactor(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetBlendState *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetBlendState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetBlendState", "SDL3::GPUColorTargetBlendState::dst_alpha_blendfactor");
	if (items > 1) {
		self->dst_alpha_blendfactor = (SDL_GPUBlendFactor)bg_in_iv(aTHX_ ST(1), "SDL3::GPUColorTargetBlendState::dst_alpha_blendfactor");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->dst_alpha_blendfactor)));
	XSRETURN(1);

void
alpha_blend_op(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetBlendState *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetBlendState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetBlendState", "SDL3::GPUColorTargetBlendState::alpha_blend_op");
	if (items > 1) {
		self->alpha_blend_op = (SDL_GPUBlendOp)bg_in_iv(aTHX_ ST(1), "SDL3::GPUColorTargetBlendState::alpha_blend_op");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->alpha_blend_op)));
	XSRETURN(1);

void
color_write_mask(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetBlendState *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetBlendState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetBlendState", "SDL3::GPUColorTargetBlendState::color_write_mask");
	if (items > 1) {
		self->color_write_mask = (SDL_GPUColorComponentFlags)bg_in_uv(aTHX_ ST(1), "SDL3::GPUColorTargetBlendState::color_write_mask");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->color_write_mask)));
	XSRETURN(1);

void
enable_blend(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetBlendState *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetBlendState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetBlendState", "SDL3::GPUColorTargetBlendState::enable_blend");
	if (items > 1) {
		self->enable_blend = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->enable_blend)));
	XSRETURN(1);

void
enable_color_write_mask(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetBlendState *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetBlendState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetBlendState", "SDL3::GPUColorTargetBlendState::enable_color_write_mask");
	if (items > 1) {
		self->enable_color_write_mask = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->enable_color_write_mask)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetBlendState *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetBlendState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetBlendState", "SDL3::GPUColorTargetBlendState::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUColorTargetBlendState::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetBlendState *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetBlendState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetBlendState", "SDL3::GPUColorTargetBlendState::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUColorTargetBlendState::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUShaderCreateInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUShaderCreateInfo), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUShaderCreateInfo)));
	XSRETURN(1);

void
code_size(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUShaderCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUShaderCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUShaderCreateInfo", "SDL3::GPUShaderCreateInfo::code_size");
	if (items > 1) {
		self->code_size = (size_t)bg_in_uv(aTHX_ ST(1), "SDL3::GPUShaderCreateInfo::code_size");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->code_size)));
	XSRETURN(1);

void
code(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUShaderCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUShaderCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUShaderCreateInfo", "SDL3::GPUShaderCreateInfo::code");
	if (items > 1) {
		self->code = (const Uint8 *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::GPUShaderCreateInfo::code");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->code), "SDL3::Pointer"));
	XSRETURN(1);

void
entrypoint(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUShaderCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUShaderCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUShaderCreateInfo", "SDL3::GPUShaderCreateInfo::entrypoint");
	if (items > 1) {
		self->entrypoint = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::GPUShaderCreateInfo::entrypoint");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->entrypoint)));
	XSRETURN(1);

void
format(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUShaderCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUShaderCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUShaderCreateInfo", "SDL3::GPUShaderCreateInfo::format");
	if (items > 1) {
		self->format = (SDL_GPUShaderFormat)bg_in_uv(aTHX_ ST(1), "SDL3::GPUShaderCreateInfo::format");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->format)));
	XSRETURN(1);

void
stage(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUShaderCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUShaderCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUShaderCreateInfo", "SDL3::GPUShaderCreateInfo::stage");
	if (items > 1) {
		self->stage = (SDL_GPUShaderStage)bg_in_iv(aTHX_ ST(1), "SDL3::GPUShaderCreateInfo::stage");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->stage)));
	XSRETURN(1);

void
num_samplers(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUShaderCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUShaderCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUShaderCreateInfo", "SDL3::GPUShaderCreateInfo::num_samplers");
	if (items > 1) {
		self->num_samplers = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUShaderCreateInfo::num_samplers");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_samplers)));
	XSRETURN(1);

void
num_storage_textures(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUShaderCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUShaderCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUShaderCreateInfo", "SDL3::GPUShaderCreateInfo::num_storage_textures");
	if (items > 1) {
		self->num_storage_textures = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUShaderCreateInfo::num_storage_textures");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_storage_textures)));
	XSRETURN(1);

void
num_storage_buffers(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUShaderCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUShaderCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUShaderCreateInfo", "SDL3::GPUShaderCreateInfo::num_storage_buffers");
	if (items > 1) {
		self->num_storage_buffers = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUShaderCreateInfo::num_storage_buffers");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_storage_buffers)));
	XSRETURN(1);

void
num_uniform_buffers(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUShaderCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUShaderCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUShaderCreateInfo", "SDL3::GPUShaderCreateInfo::num_uniform_buffers");
	if (items > 1) {
		self->num_uniform_buffers = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUShaderCreateInfo::num_uniform_buffers");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_uniform_buffers)));
	XSRETURN(1);

void
props(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUShaderCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUShaderCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUShaderCreateInfo", "SDL3::GPUShaderCreateInfo::props");
	if (items > 1) {
		self->props = (SDL_PropertiesID)bg_in_uv(aTHX_ ST(1), "SDL3::GPUShaderCreateInfo::props");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->props)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUTextureCreateInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUTextureCreateInfo), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUTextureCreateInfo)));
	XSRETURN(1);

void
type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUTextureCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureCreateInfo", "SDL3::GPUTextureCreateInfo::type");
	if (items > 1) {
		self->type = (SDL_GPUTextureType)bg_in_iv(aTHX_ ST(1), "SDL3::GPUTextureCreateInfo::type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->type)));
	XSRETURN(1);

void
format(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUTextureCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureCreateInfo", "SDL3::GPUTextureCreateInfo::format");
	if (items > 1) {
		self->format = (SDL_GPUTextureFormat)bg_in_iv(aTHX_ ST(1), "SDL3::GPUTextureCreateInfo::format");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->format)));
	XSRETURN(1);

void
usage(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUTextureCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureCreateInfo", "SDL3::GPUTextureCreateInfo::usage");
	if (items > 1) {
		self->usage = (SDL_GPUTextureUsageFlags)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureCreateInfo::usage");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->usage)));
	XSRETURN(1);

void
width(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUTextureCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureCreateInfo", "SDL3::GPUTextureCreateInfo::width");
	if (items > 1) {
		self->width = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureCreateInfo::width");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->width)));
	XSRETURN(1);

void
height(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUTextureCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureCreateInfo", "SDL3::GPUTextureCreateInfo::height");
	if (items > 1) {
		self->height = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureCreateInfo::height");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->height)));
	XSRETURN(1);

void
layer_count_or_depth(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUTextureCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureCreateInfo", "SDL3::GPUTextureCreateInfo::layer_count_or_depth");
	if (items > 1) {
		self->layer_count_or_depth = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureCreateInfo::layer_count_or_depth");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->layer_count_or_depth)));
	XSRETURN(1);

void
num_levels(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUTextureCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureCreateInfo", "SDL3::GPUTextureCreateInfo::num_levels");
	if (items > 1) {
		self->num_levels = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureCreateInfo::num_levels");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_levels)));
	XSRETURN(1);

void
sample_count(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUTextureCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureCreateInfo", "SDL3::GPUTextureCreateInfo::sample_count");
	if (items > 1) {
		self->sample_count = (SDL_GPUSampleCount)bg_in_iv(aTHX_ ST(1), "SDL3::GPUTextureCreateInfo::sample_count");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->sample_count)));
	XSRETURN(1);

void
props(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUTextureCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureCreateInfo", "SDL3::GPUTextureCreateInfo::props");
	if (items > 1) {
		self->props = (SDL_PropertiesID)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTextureCreateInfo::props");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->props)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUBufferCreateInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUBufferCreateInfo), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUBufferCreateInfo)));
	XSRETURN(1);

void
usage(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBufferCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUBufferCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBufferCreateInfo", "SDL3::GPUBufferCreateInfo::usage");
	if (items > 1) {
		self->usage = (SDL_GPUBufferUsageFlags)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBufferCreateInfo::usage");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->usage)));
	XSRETURN(1);

void
size(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBufferCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUBufferCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBufferCreateInfo", "SDL3::GPUBufferCreateInfo::size");
	if (items > 1) {
		self->size = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBufferCreateInfo::size");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->size)));
	XSRETURN(1);

void
props(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBufferCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUBufferCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBufferCreateInfo", "SDL3::GPUBufferCreateInfo::props");
	if (items > 1) {
		self->props = (SDL_PropertiesID)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBufferCreateInfo::props");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->props)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUTransferBufferCreateInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUTransferBufferCreateInfo), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUTransferBufferCreateInfo)));
	XSRETURN(1);

void
usage(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTransferBufferCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUTransferBufferCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTransferBufferCreateInfo", "SDL3::GPUTransferBufferCreateInfo::usage");
	if (items > 1) {
		self->usage = (SDL_GPUTransferBufferUsage)bg_in_iv(aTHX_ ST(1), "SDL3::GPUTransferBufferCreateInfo::usage");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->usage)));
	XSRETURN(1);

void
size(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTransferBufferCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUTransferBufferCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTransferBufferCreateInfo", "SDL3::GPUTransferBufferCreateInfo::size");
	if (items > 1) {
		self->size = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTransferBufferCreateInfo::size");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->size)));
	XSRETURN(1);

void
props(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTransferBufferCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUTransferBufferCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTransferBufferCreateInfo", "SDL3::GPUTransferBufferCreateInfo::props");
	if (items > 1) {
		self->props = (SDL_PropertiesID)bg_in_uv(aTHX_ ST(1), "SDL3::GPUTransferBufferCreateInfo::props");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->props)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPURasterizerState

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPURasterizerState), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPURasterizerState)));
	XSRETURN(1);

void
fill_mode(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURasterizerState *self;
    PPCODE:
	self = (struct SDL_GPURasterizerState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURasterizerState", "SDL3::GPURasterizerState::fill_mode");
	if (items > 1) {
		self->fill_mode = (SDL_GPUFillMode)bg_in_iv(aTHX_ ST(1), "SDL3::GPURasterizerState::fill_mode");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->fill_mode)));
	XSRETURN(1);

void
cull_mode(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURasterizerState *self;
    PPCODE:
	self = (struct SDL_GPURasterizerState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURasterizerState", "SDL3::GPURasterizerState::cull_mode");
	if (items > 1) {
		self->cull_mode = (SDL_GPUCullMode)bg_in_iv(aTHX_ ST(1), "SDL3::GPURasterizerState::cull_mode");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->cull_mode)));
	XSRETURN(1);

void
front_face(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURasterizerState *self;
    PPCODE:
	self = (struct SDL_GPURasterizerState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURasterizerState", "SDL3::GPURasterizerState::front_face");
	if (items > 1) {
		self->front_face = (SDL_GPUFrontFace)bg_in_iv(aTHX_ ST(1), "SDL3::GPURasterizerState::front_face");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->front_face)));
	XSRETURN(1);

void
depth_bias_constant_factor(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURasterizerState *self;
    PPCODE:
	self = (struct SDL_GPURasterizerState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURasterizerState", "SDL3::GPURasterizerState::depth_bias_constant_factor");
	if (items > 1) {
		self->depth_bias_constant_factor = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GPURasterizerState::depth_bias_constant_factor");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->depth_bias_constant_factor)));
	XSRETURN(1);

void
depth_bias_clamp(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURasterizerState *self;
    PPCODE:
	self = (struct SDL_GPURasterizerState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURasterizerState", "SDL3::GPURasterizerState::depth_bias_clamp");
	if (items > 1) {
		self->depth_bias_clamp = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GPURasterizerState::depth_bias_clamp");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->depth_bias_clamp)));
	XSRETURN(1);

void
depth_bias_slope_factor(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURasterizerState *self;
    PPCODE:
	self = (struct SDL_GPURasterizerState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURasterizerState", "SDL3::GPURasterizerState::depth_bias_slope_factor");
	if (items > 1) {
		self->depth_bias_slope_factor = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GPURasterizerState::depth_bias_slope_factor");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->depth_bias_slope_factor)));
	XSRETURN(1);

void
enable_depth_bias(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURasterizerState *self;
    PPCODE:
	self = (struct SDL_GPURasterizerState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURasterizerState", "SDL3::GPURasterizerState::enable_depth_bias");
	if (items > 1) {
		self->enable_depth_bias = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->enable_depth_bias)));
	XSRETURN(1);

void
enable_depth_clip(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURasterizerState *self;
    PPCODE:
	self = (struct SDL_GPURasterizerState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURasterizerState", "SDL3::GPURasterizerState::enable_depth_clip");
	if (items > 1) {
		self->enable_depth_clip = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->enable_depth_clip)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURasterizerState *self;
    PPCODE:
	self = (struct SDL_GPURasterizerState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURasterizerState", "SDL3::GPURasterizerState::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPURasterizerState::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPURasterizerState *self;
    PPCODE:
	self = (struct SDL_GPURasterizerState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPURasterizerState", "SDL3::GPURasterizerState::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPURasterizerState::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUMultisampleState

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUMultisampleState), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUMultisampleState)));
	XSRETURN(1);

void
sample_count(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUMultisampleState *self;
    PPCODE:
	self = (struct SDL_GPUMultisampleState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUMultisampleState", "SDL3::GPUMultisampleState::sample_count");
	if (items > 1) {
		self->sample_count = (SDL_GPUSampleCount)bg_in_iv(aTHX_ ST(1), "SDL3::GPUMultisampleState::sample_count");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->sample_count)));
	XSRETURN(1);

void
sample_mask(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUMultisampleState *self;
    PPCODE:
	self = (struct SDL_GPUMultisampleState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUMultisampleState", "SDL3::GPUMultisampleState::sample_mask");
	if (items > 1) {
		self->sample_mask = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUMultisampleState::sample_mask");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->sample_mask)));
	XSRETURN(1);

void
enable_mask(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUMultisampleState *self;
    PPCODE:
	self = (struct SDL_GPUMultisampleState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUMultisampleState", "SDL3::GPUMultisampleState::enable_mask");
	if (items > 1) {
		self->enable_mask = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->enable_mask)));
	XSRETURN(1);

void
enable_alpha_to_coverage(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUMultisampleState *self;
    PPCODE:
	self = (struct SDL_GPUMultisampleState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUMultisampleState", "SDL3::GPUMultisampleState::enable_alpha_to_coverage");
	if (items > 1) {
		self->enable_alpha_to_coverage = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->enable_alpha_to_coverage)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUMultisampleState *self;
    PPCODE:
	self = (struct SDL_GPUMultisampleState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUMultisampleState", "SDL3::GPUMultisampleState::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUMultisampleState::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

void
padding3(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUMultisampleState *self;
    PPCODE:
	self = (struct SDL_GPUMultisampleState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUMultisampleState", "SDL3::GPUMultisampleState::padding3");
	if (items > 1) {
		self->padding3 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUMultisampleState::padding3");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding3)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUDepthStencilState

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUDepthStencilState), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUDepthStencilState)));
	XSRETURN(1);

void
compare_op(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilState *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilState", "SDL3::GPUDepthStencilState::compare_op");
	if (items > 1) {
		self->compare_op = (SDL_GPUCompareOp)bg_in_iv(aTHX_ ST(1), "SDL3::GPUDepthStencilState::compare_op");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->compare_op)));
	XSRETURN(1);

void
back_stencil_state(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilState *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilState", "SDL3::GPUDepthStencilState::back_stencil_state");
	if (items > 1) {
		self->back_stencil_state = *(struct SDL_GPUStencilOpState *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GPUStencilOpState", "SDL3::GPUDepthStencilState::back_stencil_state");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->back_stencil_state), "SDL3::GPUStencilOpState"));
	XSRETURN(1);

void
front_stencil_state(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilState *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilState", "SDL3::GPUDepthStencilState::front_stencil_state");
	if (items > 1) {
		self->front_stencil_state = *(struct SDL_GPUStencilOpState *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GPUStencilOpState", "SDL3::GPUDepthStencilState::front_stencil_state");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->front_stencil_state), "SDL3::GPUStencilOpState"));
	XSRETURN(1);

void
compare_mask(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilState *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilState", "SDL3::GPUDepthStencilState::compare_mask");
	if (items > 1) {
		self->compare_mask = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUDepthStencilState::compare_mask");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->compare_mask)));
	XSRETURN(1);

void
write_mask(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilState *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilState", "SDL3::GPUDepthStencilState::write_mask");
	if (items > 1) {
		self->write_mask = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUDepthStencilState::write_mask");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->write_mask)));
	XSRETURN(1);

void
enable_depth_test(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilState *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilState", "SDL3::GPUDepthStencilState::enable_depth_test");
	if (items > 1) {
		self->enable_depth_test = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->enable_depth_test)));
	XSRETURN(1);

void
enable_depth_write(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilState *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilState", "SDL3::GPUDepthStencilState::enable_depth_write");
	if (items > 1) {
		self->enable_depth_write = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->enable_depth_write)));
	XSRETURN(1);

void
enable_stencil_test(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilState *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilState", "SDL3::GPUDepthStencilState::enable_stencil_test");
	if (items > 1) {
		self->enable_stencil_test = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->enable_stencil_test)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilState *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilState", "SDL3::GPUDepthStencilState::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUDepthStencilState::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilState *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilState", "SDL3::GPUDepthStencilState::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUDepthStencilState::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

void
padding3(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilState *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilState *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilState", "SDL3::GPUDepthStencilState::padding3");
	if (items > 1) {
		self->padding3 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUDepthStencilState::padding3");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding3)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUColorTargetDescription

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUColorTargetDescription), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUColorTargetDescription)));
	XSRETURN(1);

void
format(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetDescription *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetDescription *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetDescription", "SDL3::GPUColorTargetDescription::format");
	if (items > 1) {
		self->format = (SDL_GPUTextureFormat)bg_in_iv(aTHX_ ST(1), "SDL3::GPUColorTargetDescription::format");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->format)));
	XSRETURN(1);

void
blend_state(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetDescription *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetDescription *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetDescription", "SDL3::GPUColorTargetDescription::blend_state");
	if (items > 1) {
		self->blend_state = *(struct SDL_GPUColorTargetBlendState *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GPUColorTargetBlendState", "SDL3::GPUColorTargetDescription::blend_state");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->blend_state), "SDL3::GPUColorTargetBlendState"));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUGraphicsPipelineTargetInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUGraphicsPipelineTargetInfo), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUGraphicsPipelineTargetInfo)));
	XSRETURN(1);

void
color_target_descriptions(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineTargetInfo", "SDL3::GPUGraphicsPipelineTargetInfo::color_target_descriptions");
	if (items > 1) {
		self->color_target_descriptions = (const SDL_GPUColorTargetDescription *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUColorTargetDescription", "SDL3::GPUGraphicsPipelineTargetInfo::color_target_descriptions");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->color_target_descriptions), "SDL3::GPUColorTargetDescription"));
	XSRETURN(1);

void
num_color_targets(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineTargetInfo", "SDL3::GPUGraphicsPipelineTargetInfo::num_color_targets");
	if (items > 1) {
		self->num_color_targets = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUGraphicsPipelineTargetInfo::num_color_targets");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_color_targets)));
	XSRETURN(1);

void
depth_stencil_format(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineTargetInfo", "SDL3::GPUGraphicsPipelineTargetInfo::depth_stencil_format");
	if (items > 1) {
		self->depth_stencil_format = (SDL_GPUTextureFormat)bg_in_iv(aTHX_ ST(1), "SDL3::GPUGraphicsPipelineTargetInfo::depth_stencil_format");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->depth_stencil_format)));
	XSRETURN(1);

void
has_depth_stencil_target(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineTargetInfo", "SDL3::GPUGraphicsPipelineTargetInfo::has_depth_stencil_target");
	if (items > 1) {
		self->has_depth_stencil_target = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->has_depth_stencil_target)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineTargetInfo", "SDL3::GPUGraphicsPipelineTargetInfo::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUGraphicsPipelineTargetInfo::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineTargetInfo", "SDL3::GPUGraphicsPipelineTargetInfo::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUGraphicsPipelineTargetInfo::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

void
padding3(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineTargetInfo", "SDL3::GPUGraphicsPipelineTargetInfo::padding3");
	if (items > 1) {
		self->padding3 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUGraphicsPipelineTargetInfo::padding3");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding3)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUGraphicsPipelineCreateInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUGraphicsPipelineCreateInfo), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUGraphicsPipelineCreateInfo)));
	XSRETURN(1);

void
vertex_shader(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineCreateInfo", "SDL3::GPUGraphicsPipelineCreateInfo::vertex_shader");
	if (items > 1) {
		self->vertex_shader = (SDL_GPUShader *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUShader", "SDL3::GPUGraphicsPipelineCreateInfo::vertex_shader");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->vertex_shader), "SDL3::GPUShader"));
	XSRETURN(1);

void
fragment_shader(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineCreateInfo", "SDL3::GPUGraphicsPipelineCreateInfo::fragment_shader");
	if (items > 1) {
		self->fragment_shader = (SDL_GPUShader *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUShader", "SDL3::GPUGraphicsPipelineCreateInfo::fragment_shader");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->fragment_shader), "SDL3::GPUShader"));
	XSRETURN(1);

void
vertex_input_state(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineCreateInfo", "SDL3::GPUGraphicsPipelineCreateInfo::vertex_input_state");
	if (items > 1) {
		self->vertex_input_state = *(struct SDL_GPUVertexInputState *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GPUVertexInputState", "SDL3::GPUGraphicsPipelineCreateInfo::vertex_input_state");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->vertex_input_state), "SDL3::GPUVertexInputState"));
	XSRETURN(1);

void
primitive_type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineCreateInfo", "SDL3::GPUGraphicsPipelineCreateInfo::primitive_type");
	if (items > 1) {
		self->primitive_type = (SDL_GPUPrimitiveType)bg_in_iv(aTHX_ ST(1), "SDL3::GPUGraphicsPipelineCreateInfo::primitive_type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->primitive_type)));
	XSRETURN(1);

void
rasterizer_state(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineCreateInfo", "SDL3::GPUGraphicsPipelineCreateInfo::rasterizer_state");
	if (items > 1) {
		self->rasterizer_state = *(struct SDL_GPURasterizerState *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GPURasterizerState", "SDL3::GPUGraphicsPipelineCreateInfo::rasterizer_state");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->rasterizer_state), "SDL3::GPURasterizerState"));
	XSRETURN(1);

void
multisample_state(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineCreateInfo", "SDL3::GPUGraphicsPipelineCreateInfo::multisample_state");
	if (items > 1) {
		self->multisample_state = *(struct SDL_GPUMultisampleState *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GPUMultisampleState", "SDL3::GPUGraphicsPipelineCreateInfo::multisample_state");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->multisample_state), "SDL3::GPUMultisampleState"));
	XSRETURN(1);

void
depth_stencil_state(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineCreateInfo", "SDL3::GPUGraphicsPipelineCreateInfo::depth_stencil_state");
	if (items > 1) {
		self->depth_stencil_state = *(struct SDL_GPUDepthStencilState *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GPUDepthStencilState", "SDL3::GPUGraphicsPipelineCreateInfo::depth_stencil_state");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->depth_stencil_state), "SDL3::GPUDepthStencilState"));
	XSRETURN(1);

void
target_info(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineCreateInfo", "SDL3::GPUGraphicsPipelineCreateInfo::target_info");
	if (items > 1) {
		self->target_info = *(struct SDL_GPUGraphicsPipelineTargetInfo *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GPUGraphicsPipelineTargetInfo", "SDL3::GPUGraphicsPipelineCreateInfo::target_info");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->target_info), "SDL3::GPUGraphicsPipelineTargetInfo"));
	XSRETURN(1);

void
props(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUGraphicsPipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUGraphicsPipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUGraphicsPipelineCreateInfo", "SDL3::GPUGraphicsPipelineCreateInfo::props");
	if (items > 1) {
		self->props = (SDL_PropertiesID)bg_in_uv(aTHX_ ST(1), "SDL3::GPUGraphicsPipelineCreateInfo::props");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->props)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUComputePipelineCreateInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUComputePipelineCreateInfo), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUComputePipelineCreateInfo)));
	XSRETURN(1);

void
code_size(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUComputePipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUComputePipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUComputePipelineCreateInfo", "SDL3::GPUComputePipelineCreateInfo::code_size");
	if (items > 1) {
		self->code_size = (size_t)bg_in_uv(aTHX_ ST(1), "SDL3::GPUComputePipelineCreateInfo::code_size");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->code_size)));
	XSRETURN(1);

void
code(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUComputePipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUComputePipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUComputePipelineCreateInfo", "SDL3::GPUComputePipelineCreateInfo::code");
	if (items > 1) {
		self->code = (const Uint8 *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::GPUComputePipelineCreateInfo::code");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->code), "SDL3::Pointer"));
	XSRETURN(1);

void
entrypoint(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUComputePipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUComputePipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUComputePipelineCreateInfo", "SDL3::GPUComputePipelineCreateInfo::entrypoint");
	if (items > 1) {
		self->entrypoint = (const char *)bg_in_string(aTHX_ ST(1), "SDL3::GPUComputePipelineCreateInfo::entrypoint");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_string(aTHX_ (const char *)(self->entrypoint)));
	XSRETURN(1);

void
format(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUComputePipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUComputePipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUComputePipelineCreateInfo", "SDL3::GPUComputePipelineCreateInfo::format");
	if (items > 1) {
		self->format = (SDL_GPUShaderFormat)bg_in_uv(aTHX_ ST(1), "SDL3::GPUComputePipelineCreateInfo::format");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->format)));
	XSRETURN(1);

void
num_samplers(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUComputePipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUComputePipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUComputePipelineCreateInfo", "SDL3::GPUComputePipelineCreateInfo::num_samplers");
	if (items > 1) {
		self->num_samplers = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUComputePipelineCreateInfo::num_samplers");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_samplers)));
	XSRETURN(1);

void
num_readonly_storage_textures(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUComputePipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUComputePipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUComputePipelineCreateInfo", "SDL3::GPUComputePipelineCreateInfo::num_readonly_storage_textures");
	if (items > 1) {
		self->num_readonly_storage_textures = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUComputePipelineCreateInfo::num_readonly_storage_textures");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_readonly_storage_textures)));
	XSRETURN(1);

void
num_readonly_storage_buffers(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUComputePipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUComputePipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUComputePipelineCreateInfo", "SDL3::GPUComputePipelineCreateInfo::num_readonly_storage_buffers");
	if (items > 1) {
		self->num_readonly_storage_buffers = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUComputePipelineCreateInfo::num_readonly_storage_buffers");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_readonly_storage_buffers)));
	XSRETURN(1);

void
num_readwrite_storage_textures(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUComputePipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUComputePipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUComputePipelineCreateInfo", "SDL3::GPUComputePipelineCreateInfo::num_readwrite_storage_textures");
	if (items > 1) {
		self->num_readwrite_storage_textures = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUComputePipelineCreateInfo::num_readwrite_storage_textures");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_readwrite_storage_textures)));
	XSRETURN(1);

void
num_readwrite_storage_buffers(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUComputePipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUComputePipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUComputePipelineCreateInfo", "SDL3::GPUComputePipelineCreateInfo::num_readwrite_storage_buffers");
	if (items > 1) {
		self->num_readwrite_storage_buffers = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUComputePipelineCreateInfo::num_readwrite_storage_buffers");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_readwrite_storage_buffers)));
	XSRETURN(1);

void
num_uniform_buffers(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUComputePipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUComputePipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUComputePipelineCreateInfo", "SDL3::GPUComputePipelineCreateInfo::num_uniform_buffers");
	if (items > 1) {
		self->num_uniform_buffers = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUComputePipelineCreateInfo::num_uniform_buffers");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->num_uniform_buffers)));
	XSRETURN(1);

void
threadcount_x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUComputePipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUComputePipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUComputePipelineCreateInfo", "SDL3::GPUComputePipelineCreateInfo::threadcount_x");
	if (items > 1) {
		self->threadcount_x = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUComputePipelineCreateInfo::threadcount_x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->threadcount_x)));
	XSRETURN(1);

void
threadcount_y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUComputePipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUComputePipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUComputePipelineCreateInfo", "SDL3::GPUComputePipelineCreateInfo::threadcount_y");
	if (items > 1) {
		self->threadcount_y = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUComputePipelineCreateInfo::threadcount_y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->threadcount_y)));
	XSRETURN(1);

void
threadcount_z(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUComputePipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUComputePipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUComputePipelineCreateInfo", "SDL3::GPUComputePipelineCreateInfo::threadcount_z");
	if (items > 1) {
		self->threadcount_z = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUComputePipelineCreateInfo::threadcount_z");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->threadcount_z)));
	XSRETURN(1);

void
props(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUComputePipelineCreateInfo *self;
    PPCODE:
	self = (struct SDL_GPUComputePipelineCreateInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUComputePipelineCreateInfo", "SDL3::GPUComputePipelineCreateInfo::props");
	if (items > 1) {
		self->props = (SDL_PropertiesID)bg_in_uv(aTHX_ ST(1), "SDL3::GPUComputePipelineCreateInfo::props");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->props)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUColorTargetInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUColorTargetInfo), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUColorTargetInfo)));
	XSRETURN(1);

void
texture(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetInfo", "SDL3::GPUColorTargetInfo::texture");
	if (items > 1) {
		self->texture = (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUTexture", "SDL3::GPUColorTargetInfo::texture");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->texture), "SDL3::GPUTexture"));
	XSRETURN(1);

void
mip_level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetInfo", "SDL3::GPUColorTargetInfo::mip_level");
	if (items > 1) {
		self->mip_level = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUColorTargetInfo::mip_level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->mip_level)));
	XSRETURN(1);

void
layer_or_depth_plane(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetInfo", "SDL3::GPUColorTargetInfo::layer_or_depth_plane");
	if (items > 1) {
		self->layer_or_depth_plane = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUColorTargetInfo::layer_or_depth_plane");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->layer_or_depth_plane)));
	XSRETURN(1);

void
clear_color(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetInfo", "SDL3::GPUColorTargetInfo::clear_color");
	if (items > 1) {
		self->clear_color = *(struct SDL_FColor *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::FColor", "SDL3::GPUColorTargetInfo::clear_color");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->clear_color), "SDL3::FColor"));
	XSRETURN(1);

void
load_op(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetInfo", "SDL3::GPUColorTargetInfo::load_op");
	if (items > 1) {
		self->load_op = (SDL_GPULoadOp)bg_in_iv(aTHX_ ST(1), "SDL3::GPUColorTargetInfo::load_op");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->load_op)));
	XSRETURN(1);

void
store_op(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetInfo", "SDL3::GPUColorTargetInfo::store_op");
	if (items > 1) {
		self->store_op = (SDL_GPUStoreOp)bg_in_iv(aTHX_ ST(1), "SDL3::GPUColorTargetInfo::store_op");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->store_op)));
	XSRETURN(1);

void
resolve_texture(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetInfo", "SDL3::GPUColorTargetInfo::resolve_texture");
	if (items > 1) {
		self->resolve_texture = (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUTexture", "SDL3::GPUColorTargetInfo::resolve_texture");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->resolve_texture), "SDL3::GPUTexture"));
	XSRETURN(1);

void
resolve_mip_level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetInfo", "SDL3::GPUColorTargetInfo::resolve_mip_level");
	if (items > 1) {
		self->resolve_mip_level = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUColorTargetInfo::resolve_mip_level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->resolve_mip_level)));
	XSRETURN(1);

void
resolve_layer(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetInfo", "SDL3::GPUColorTargetInfo::resolve_layer");
	if (items > 1) {
		self->resolve_layer = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUColorTargetInfo::resolve_layer");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->resolve_layer)));
	XSRETURN(1);

void
cycle(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetInfo", "SDL3::GPUColorTargetInfo::cycle");
	if (items > 1) {
		self->cycle = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->cycle)));
	XSRETURN(1);

void
cycle_resolve_texture(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetInfo", "SDL3::GPUColorTargetInfo::cycle_resolve_texture");
	if (items > 1) {
		self->cycle_resolve_texture = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->cycle_resolve_texture)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetInfo", "SDL3::GPUColorTargetInfo::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUColorTargetInfo::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUColorTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUColorTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUColorTargetInfo", "SDL3::GPUColorTargetInfo::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUColorTargetInfo::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUDepthStencilTargetInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUDepthStencilTargetInfo), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUDepthStencilTargetInfo)));
	XSRETURN(1);

void
texture(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilTargetInfo", "SDL3::GPUDepthStencilTargetInfo::texture");
	if (items > 1) {
		self->texture = (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUTexture", "SDL3::GPUDepthStencilTargetInfo::texture");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->texture), "SDL3::GPUTexture"));
	XSRETURN(1);

void
clear_depth(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilTargetInfo", "SDL3::GPUDepthStencilTargetInfo::clear_depth");
	if (items > 1) {
		self->clear_depth = (float)bg_in_nv(aTHX_ ST(1), "SDL3::GPUDepthStencilTargetInfo::clear_depth");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->clear_depth)));
	XSRETURN(1);

void
load_op(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilTargetInfo", "SDL3::GPUDepthStencilTargetInfo::load_op");
	if (items > 1) {
		self->load_op = (SDL_GPULoadOp)bg_in_iv(aTHX_ ST(1), "SDL3::GPUDepthStencilTargetInfo::load_op");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->load_op)));
	XSRETURN(1);

void
store_op(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilTargetInfo", "SDL3::GPUDepthStencilTargetInfo::store_op");
	if (items > 1) {
		self->store_op = (SDL_GPUStoreOp)bg_in_iv(aTHX_ ST(1), "SDL3::GPUDepthStencilTargetInfo::store_op");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->store_op)));
	XSRETURN(1);

void
stencil_load_op(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilTargetInfo", "SDL3::GPUDepthStencilTargetInfo::stencil_load_op");
	if (items > 1) {
		self->stencil_load_op = (SDL_GPULoadOp)bg_in_iv(aTHX_ ST(1), "SDL3::GPUDepthStencilTargetInfo::stencil_load_op");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->stencil_load_op)));
	XSRETURN(1);

void
stencil_store_op(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilTargetInfo", "SDL3::GPUDepthStencilTargetInfo::stencil_store_op");
	if (items > 1) {
		self->stencil_store_op = (SDL_GPUStoreOp)bg_in_iv(aTHX_ ST(1), "SDL3::GPUDepthStencilTargetInfo::stencil_store_op");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->stencil_store_op)));
	XSRETURN(1);

void
cycle(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilTargetInfo", "SDL3::GPUDepthStencilTargetInfo::cycle");
	if (items > 1) {
		self->cycle = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->cycle)));
	XSRETURN(1);

void
clear_stencil(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilTargetInfo", "SDL3::GPUDepthStencilTargetInfo::clear_stencil");
	if (items > 1) {
		self->clear_stencil = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUDepthStencilTargetInfo::clear_stencil");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->clear_stencil)));
	XSRETURN(1);

void
mip_level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilTargetInfo", "SDL3::GPUDepthStencilTargetInfo::mip_level");
	if (items > 1) {
		self->mip_level = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUDepthStencilTargetInfo::mip_level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->mip_level)));
	XSRETURN(1);

void
layer(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUDepthStencilTargetInfo *self;
    PPCODE:
	self = (struct SDL_GPUDepthStencilTargetInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUDepthStencilTargetInfo", "SDL3::GPUDepthStencilTargetInfo::layer");
	if (items > 1) {
		self->layer = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUDepthStencilTargetInfo::layer");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->layer)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUBlitInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUBlitInfo), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUBlitInfo)));
	XSRETURN(1);

void
source(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitInfo *self;
    PPCODE:
	self = (struct SDL_GPUBlitInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitInfo", "SDL3::GPUBlitInfo::source");
	if (items > 1) {
		self->source = *(struct SDL_GPUBlitRegion *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GPUBlitRegion", "SDL3::GPUBlitInfo::source");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->source), "SDL3::GPUBlitRegion"));
	XSRETURN(1);

void
destination(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitInfo *self;
    PPCODE:
	self = (struct SDL_GPUBlitInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitInfo", "SDL3::GPUBlitInfo::destination");
	if (items > 1) {
		self->destination = *(struct SDL_GPUBlitRegion *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::GPUBlitRegion", "SDL3::GPUBlitInfo::destination");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->destination), "SDL3::GPUBlitRegion"));
	XSRETURN(1);

void
load_op(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitInfo *self;
    PPCODE:
	self = (struct SDL_GPUBlitInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitInfo", "SDL3::GPUBlitInfo::load_op");
	if (items > 1) {
		self->load_op = (SDL_GPULoadOp)bg_in_iv(aTHX_ ST(1), "SDL3::GPUBlitInfo::load_op");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->load_op)));
	XSRETURN(1);

void
clear_color(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitInfo *self;
    PPCODE:
	self = (struct SDL_GPUBlitInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitInfo", "SDL3::GPUBlitInfo::clear_color");
	if (items > 1) {
		self->clear_color = *(struct SDL_FColor *)bg_in_record_value_ptr(aTHX_ ST(1), "SDL3::FColor", "SDL3::GPUBlitInfo::clear_color");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)&(self->clear_color), "SDL3::FColor"));
	XSRETURN(1);

void
flip_mode(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitInfo *self;
    PPCODE:
	self = (struct SDL_GPUBlitInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitInfo", "SDL3::GPUBlitInfo::flip_mode");
	if (items > 1) {
		self->flip_mode = (SDL_FlipMode)bg_in_iv(aTHX_ ST(1), "SDL3::GPUBlitInfo::flip_mode");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->flip_mode)));
	XSRETURN(1);

void
filter(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitInfo *self;
    PPCODE:
	self = (struct SDL_GPUBlitInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitInfo", "SDL3::GPUBlitInfo::filter");
	if (items > 1) {
		self->filter = (SDL_GPUFilter)bg_in_iv(aTHX_ ST(1), "SDL3::GPUBlitInfo::filter");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->filter)));
	XSRETURN(1);

void
cycle(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitInfo *self;
    PPCODE:
	self = (struct SDL_GPUBlitInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitInfo", "SDL3::GPUBlitInfo::cycle");
	if (items > 1) {
		self->cycle = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->cycle)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitInfo *self;
    PPCODE:
	self = (struct SDL_GPUBlitInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitInfo", "SDL3::GPUBlitInfo::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBlitInfo::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitInfo *self;
    PPCODE:
	self = (struct SDL_GPUBlitInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitInfo", "SDL3::GPUBlitInfo::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBlitInfo::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

void
padding3(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBlitInfo *self;
    PPCODE:
	self = (struct SDL_GPUBlitInfo *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBlitInfo", "SDL3::GPUBlitInfo::padding3");
	if (items > 1) {
		self->padding3 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBlitInfo::padding3");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding3)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUBufferBinding

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUBufferBinding), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUBufferBinding)));
	XSRETURN(1);

void
buffer(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBufferBinding *self;
    PPCODE:
	self = (struct SDL_GPUBufferBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBufferBinding", "SDL3::GPUBufferBinding::buffer");
	if (items > 1) {
		self->buffer = (SDL_GPUBuffer *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUBuffer", "SDL3::GPUBufferBinding::buffer");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->buffer), "SDL3::GPUBuffer"));
	XSRETURN(1);

void
offset(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUBufferBinding *self;
    PPCODE:
	self = (struct SDL_GPUBufferBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUBufferBinding", "SDL3::GPUBufferBinding::offset");
	if (items > 1) {
		self->offset = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUBufferBinding::offset");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->offset)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUTextureSamplerBinding

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUTextureSamplerBinding), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUTextureSamplerBinding)));
	XSRETURN(1);

void
texture(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureSamplerBinding *self;
    PPCODE:
	self = (struct SDL_GPUTextureSamplerBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureSamplerBinding", "SDL3::GPUTextureSamplerBinding::texture");
	if (items > 1) {
		self->texture = (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUTexture", "SDL3::GPUTextureSamplerBinding::texture");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->texture), "SDL3::GPUTexture"));
	XSRETURN(1);

void
sampler(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUTextureSamplerBinding *self;
    PPCODE:
	self = (struct SDL_GPUTextureSamplerBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUTextureSamplerBinding", "SDL3::GPUTextureSamplerBinding::sampler");
	if (items > 1) {
		self->sampler = (SDL_GPUSampler *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUSampler", "SDL3::GPUTextureSamplerBinding::sampler");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->sampler), "SDL3::GPUSampler"));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUStorageBufferReadWriteBinding

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUStorageBufferReadWriteBinding), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUStorageBufferReadWriteBinding)));
	XSRETURN(1);

void
buffer(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStorageBufferReadWriteBinding *self;
    PPCODE:
	self = (struct SDL_GPUStorageBufferReadWriteBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStorageBufferReadWriteBinding", "SDL3::GPUStorageBufferReadWriteBinding::buffer");
	if (items > 1) {
		self->buffer = (SDL_GPUBuffer *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUBuffer", "SDL3::GPUStorageBufferReadWriteBinding::buffer");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->buffer), "SDL3::GPUBuffer"));
	XSRETURN(1);

void
cycle(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStorageBufferReadWriteBinding *self;
    PPCODE:
	self = (struct SDL_GPUStorageBufferReadWriteBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStorageBufferReadWriteBinding", "SDL3::GPUStorageBufferReadWriteBinding::cycle");
	if (items > 1) {
		self->cycle = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->cycle)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStorageBufferReadWriteBinding *self;
    PPCODE:
	self = (struct SDL_GPUStorageBufferReadWriteBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStorageBufferReadWriteBinding", "SDL3::GPUStorageBufferReadWriteBinding::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUStorageBufferReadWriteBinding::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStorageBufferReadWriteBinding *self;
    PPCODE:
	self = (struct SDL_GPUStorageBufferReadWriteBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStorageBufferReadWriteBinding", "SDL3::GPUStorageBufferReadWriteBinding::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUStorageBufferReadWriteBinding::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

void
padding3(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStorageBufferReadWriteBinding *self;
    PPCODE:
	self = (struct SDL_GPUStorageBufferReadWriteBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStorageBufferReadWriteBinding", "SDL3::GPUStorageBufferReadWriteBinding::padding3");
	if (items > 1) {
		self->padding3 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUStorageBufferReadWriteBinding::padding3");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding3)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUStorageTextureReadWriteBinding

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUStorageTextureReadWriteBinding), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUStorageTextureReadWriteBinding)));
	XSRETURN(1);

void
texture(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStorageTextureReadWriteBinding *self;
    PPCODE:
	self = (struct SDL_GPUStorageTextureReadWriteBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStorageTextureReadWriteBinding", "SDL3::GPUStorageTextureReadWriteBinding::texture");
	if (items > 1) {
		self->texture = (SDL_GPUTexture *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::GPUTexture", "SDL3::GPUStorageTextureReadWriteBinding::texture");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->texture), "SDL3::GPUTexture"));
	XSRETURN(1);

void
mip_level(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStorageTextureReadWriteBinding *self;
    PPCODE:
	self = (struct SDL_GPUStorageTextureReadWriteBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStorageTextureReadWriteBinding", "SDL3::GPUStorageTextureReadWriteBinding::mip_level");
	if (items > 1) {
		self->mip_level = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUStorageTextureReadWriteBinding::mip_level");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->mip_level)));
	XSRETURN(1);

void
layer(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStorageTextureReadWriteBinding *self;
    PPCODE:
	self = (struct SDL_GPUStorageTextureReadWriteBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStorageTextureReadWriteBinding", "SDL3::GPUStorageTextureReadWriteBinding::layer");
	if (items > 1) {
		self->layer = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUStorageTextureReadWriteBinding::layer");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->layer)));
	XSRETURN(1);

void
cycle(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStorageTextureReadWriteBinding *self;
    PPCODE:
	self = (struct SDL_GPUStorageTextureReadWriteBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStorageTextureReadWriteBinding", "SDL3::GPUStorageTextureReadWriteBinding::cycle");
	if (items > 1) {
		self->cycle = (_Bool)SvTRUE(ST(1));
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVsv(boolSV(self->cycle)));
	XSRETURN(1);

void
padding1(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStorageTextureReadWriteBinding *self;
    PPCODE:
	self = (struct SDL_GPUStorageTextureReadWriteBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStorageTextureReadWriteBinding", "SDL3::GPUStorageTextureReadWriteBinding::padding1");
	if (items > 1) {
		self->padding1 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUStorageTextureReadWriteBinding::padding1");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding1)));
	XSRETURN(1);

void
padding2(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStorageTextureReadWriteBinding *self;
    PPCODE:
	self = (struct SDL_GPUStorageTextureReadWriteBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStorageTextureReadWriteBinding", "SDL3::GPUStorageTextureReadWriteBinding::padding2");
	if (items > 1) {
		self->padding2 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUStorageTextureReadWriteBinding::padding2");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding2)));
	XSRETURN(1);

void
padding3(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUStorageTextureReadWriteBinding *self;
    PPCODE:
	self = (struct SDL_GPUStorageTextureReadWriteBinding *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUStorageTextureReadWriteBinding", "SDL3::GPUStorageTextureReadWriteBinding::padding3");
	if (items > 1) {
		self->padding3 = (Uint8)bg_in_uv(aTHX_ ST(1), "SDL3::GPUStorageTextureReadWriteBinding::padding3");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->padding3)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::GPUVulkanOptions

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_GPUVulkanOptions), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_GPUVulkanOptions)));
	XSRETURN(1);

void
vulkan_api_version(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVulkanOptions *self;
    PPCODE:
	self = (struct SDL_GPUVulkanOptions *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVulkanOptions", "SDL3::GPUVulkanOptions::vulkan_api_version");
	if (items > 1) {
		self->vulkan_api_version = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUVulkanOptions::vulkan_api_version");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->vulkan_api_version)));
	XSRETURN(1);

void
feature_list(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVulkanOptions *self;
    PPCODE:
	self = (struct SDL_GPUVulkanOptions *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVulkanOptions", "SDL3::GPUVulkanOptions::feature_list");
	if (items > 1) {
		self->feature_list = (void *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::GPUVulkanOptions::feature_list");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->feature_list), "SDL3::Pointer"));
	XSRETURN(1);

void
vulkan_10_physical_device_features(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVulkanOptions *self;
    PPCODE:
	self = (struct SDL_GPUVulkanOptions *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVulkanOptions", "SDL3::GPUVulkanOptions::vulkan_10_physical_device_features");
	if (items > 1) {
		self->vulkan_10_physical_device_features = (void *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::GPUVulkanOptions::vulkan_10_physical_device_features");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->vulkan_10_physical_device_features), "SDL3::Pointer"));
	XSRETURN(1);

void
device_extension_count(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVulkanOptions *self;
    PPCODE:
	self = (struct SDL_GPUVulkanOptions *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVulkanOptions", "SDL3::GPUVulkanOptions::device_extension_count");
	if (items > 1) {
		self->device_extension_count = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUVulkanOptions::device_extension_count");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->device_extension_count)));
	XSRETURN(1);

void
device_extension_names(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVulkanOptions *self;
    PPCODE:
	self = (struct SDL_GPUVulkanOptions *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVulkanOptions", "SDL3::GPUVulkanOptions::device_extension_names");
	if (items > 1) {
		self->device_extension_names = (const char **)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::GPUVulkanOptions::device_extension_names");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->device_extension_names), "SDL3::Pointer"));
	XSRETURN(1);

void
instance_extension_count(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVulkanOptions *self;
    PPCODE:
	self = (struct SDL_GPUVulkanOptions *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVulkanOptions", "SDL3::GPUVulkanOptions::instance_extension_count");
	if (items > 1) {
		self->instance_extension_count = (Uint32)bg_in_uv(aTHX_ ST(1), "SDL3::GPUVulkanOptions::instance_extension_count");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->instance_extension_count)));
	XSRETURN(1);

void
instance_extension_names(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_GPUVulkanOptions *self;
    PPCODE:
	self = (struct SDL_GPUVulkanOptions *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::GPUVulkanOptions", "SDL3::GPUVulkanOptions::instance_extension_names");
	if (items > 1) {
		self->instance_extension_names = (const char **)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::GPUVulkanOptions::instance_extension_names");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->instance_extension_names), "SDL3::Pointer"));
	XSRETURN(1);
