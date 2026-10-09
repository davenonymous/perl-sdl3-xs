MODULE = SDL3  PACKAGE = SDL3::API::Blendmode

void
SDL_ComposeCustomBlendMode(sv_srcColorFactor, sv_dstColorFactor, sv_colorOperation, sv_srcAlphaFactor, sv_dstAlphaFactor, sv_alphaOperation)
	SV *sv_srcColorFactor
	SV *sv_dstColorFactor
	SV *sv_colorOperation
	SV *sv_srcAlphaFactor
	SV *sv_dstAlphaFactor
	SV *sv_alphaOperation
    PREINIT:
	SDL_BlendFactor c_srcColorFactor;
	SDL_BlendFactor c_dstColorFactor;
	SDL_BlendOperation c_colorOperation;
	SDL_BlendFactor c_srcAlphaFactor;
	SDL_BlendFactor c_dstAlphaFactor;
	SDL_BlendOperation c_alphaOperation;
	SDL_BlendMode c_bg_ret;
    PPCODE:
	c_srcColorFactor = (SDL_BlendFactor)bg_in_iv(aTHX_ sv_srcColorFactor, "SDL_ComposeCustomBlendMode(srcColorFactor)");
	c_dstColorFactor = (SDL_BlendFactor)bg_in_iv(aTHX_ sv_dstColorFactor, "SDL_ComposeCustomBlendMode(dstColorFactor)");
	c_colorOperation = (SDL_BlendOperation)bg_in_iv(aTHX_ sv_colorOperation, "SDL_ComposeCustomBlendMode(colorOperation)");
	c_srcAlphaFactor = (SDL_BlendFactor)bg_in_iv(aTHX_ sv_srcAlphaFactor, "SDL_ComposeCustomBlendMode(srcAlphaFactor)");
	c_dstAlphaFactor = (SDL_BlendFactor)bg_in_iv(aTHX_ sv_dstAlphaFactor, "SDL_ComposeCustomBlendMode(dstAlphaFactor)");
	c_alphaOperation = (SDL_BlendOperation)bg_in_iv(aTHX_ sv_alphaOperation, "SDL_ComposeCustomBlendMode(alphaOperation)");
	c_bg_ret = SDL_ComposeCustomBlendMode(c_srcColorFactor, c_dstColorFactor, c_colorOperation, c_srcAlphaFactor, c_dstAlphaFactor, c_alphaOperation);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Blendmode", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_BLENDMODE_ADD", BG_CONST_SV(SDL_BLENDMODE_ADD));
	bg_export_constant(aTHX_ stash, "SDL_BLENDMODE_ADD_PREMULTIPLIED", BG_CONST_SV(SDL_BLENDMODE_ADD_PREMULTIPLIED));
	bg_export_constant(aTHX_ stash, "SDL_BLENDMODE_BLEND", BG_CONST_SV(SDL_BLENDMODE_BLEND));
	bg_export_constant(aTHX_ stash, "SDL_BLENDMODE_BLEND_PREMULTIPLIED", BG_CONST_SV(SDL_BLENDMODE_BLEND_PREMULTIPLIED));
	bg_export_constant(aTHX_ stash, "SDL_BLENDMODE_INVALID", BG_CONST_SV(SDL_BLENDMODE_INVALID));
	bg_export_constant(aTHX_ stash, "SDL_BLENDMODE_MOD", BG_CONST_SV(SDL_BLENDMODE_MOD));
	bg_export_constant(aTHX_ stash, "SDL_BLENDMODE_MUL", BG_CONST_SV(SDL_BLENDMODE_MUL));
	bg_export_constant(aTHX_ stash, "SDL_BLENDMODE_NONE", BG_CONST_SV(SDL_BLENDMODE_NONE));
	bg_export_constant(aTHX_ stash, "SDL_BLENDOPERATION_ADD", BG_CONST_SV(SDL_BLENDOPERATION_ADD));
	bg_export_constant(aTHX_ stash, "SDL_BLENDOPERATION_SUBTRACT", BG_CONST_SV(SDL_BLENDOPERATION_SUBTRACT));
	bg_export_constant(aTHX_ stash, "SDL_BLENDOPERATION_REV_SUBTRACT", BG_CONST_SV(SDL_BLENDOPERATION_REV_SUBTRACT));
	bg_export_constant(aTHX_ stash, "SDL_BLENDOPERATION_MINIMUM", BG_CONST_SV(SDL_BLENDOPERATION_MINIMUM));
	bg_export_constant(aTHX_ stash, "SDL_BLENDOPERATION_MAXIMUM", BG_CONST_SV(SDL_BLENDOPERATION_MAXIMUM));
	bg_export_constant(aTHX_ stash, "SDL_BLENDFACTOR_ZERO", BG_CONST_SV(SDL_BLENDFACTOR_ZERO));
	bg_export_constant(aTHX_ stash, "SDL_BLENDFACTOR_ONE", BG_CONST_SV(SDL_BLENDFACTOR_ONE));
	bg_export_constant(aTHX_ stash, "SDL_BLENDFACTOR_SRC_COLOR", BG_CONST_SV(SDL_BLENDFACTOR_SRC_COLOR));
	bg_export_constant(aTHX_ stash, "SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR", BG_CONST_SV(SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR));
	bg_export_constant(aTHX_ stash, "SDL_BLENDFACTOR_SRC_ALPHA", BG_CONST_SV(SDL_BLENDFACTOR_SRC_ALPHA));
	bg_export_constant(aTHX_ stash, "SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA", BG_CONST_SV(SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA));
	bg_export_constant(aTHX_ stash, "SDL_BLENDFACTOR_DST_COLOR", BG_CONST_SV(SDL_BLENDFACTOR_DST_COLOR));
	bg_export_constant(aTHX_ stash, "SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR", BG_CONST_SV(SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR));
	bg_export_constant(aTHX_ stash, "SDL_BLENDFACTOR_DST_ALPHA", BG_CONST_SV(SDL_BLENDFACTOR_DST_ALPHA));
	bg_export_constant(aTHX_ stash, "SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA", BG_CONST_SV(SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA));
	}
