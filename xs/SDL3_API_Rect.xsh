MODULE = SDL3  PACKAGE = SDL3::API::Rect

void
SDL_RectToFRect(sv_rect, sv_frect)
	SV *sv_rect
	SV *sv_frect
    PREINIT:
	const SDL_Rect * c_rect;
	SDL_FRect * c_frect;
    PPCODE:
	c_rect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_RectToFRect(rect)");
	c_frect = (SDL_FRect *)bg_in_record_ptr(aTHX_ sv_frect, "SDL3::FRect", "SDL_RectToFRect(frect)");
	SDL_RectToFRect(c_rect, c_frect);
	XSRETURN(0);

void
SDL_PointInRect(sv_p, sv_r)
	SV *sv_p
	SV *sv_r
    PREINIT:
	const SDL_Point * c_p;
	const SDL_Rect * c_r;
	_Bool c_bg_ret;
    PPCODE:
	c_p = (const SDL_Point *)bg_in_record_ptr(aTHX_ sv_p, "SDL3::Point", "SDL_PointInRect(p)");
	c_r = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_r, "SDL3::Rect", "SDL_PointInRect(r)");
	c_bg_ret = SDL_PointInRect(c_p, c_r);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RectEmpty(sv_r)
	SV *sv_r
    PREINIT:
	const SDL_Rect * c_r;
	_Bool c_bg_ret;
    PPCODE:
	c_r = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_r, "SDL3::Rect", "SDL_RectEmpty(r)");
	c_bg_ret = SDL_RectEmpty(c_r);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RectsEqual(sv_a, sv_b)
	SV *sv_a
	SV *sv_b
    PREINIT:
	const SDL_Rect * c_a;
	const SDL_Rect * c_b;
	_Bool c_bg_ret;
    PPCODE:
	c_a = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_a, "SDL3::Rect", "SDL_RectsEqual(a)");
	c_b = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_b, "SDL3::Rect", "SDL_RectsEqual(b)");
	c_bg_ret = SDL_RectsEqual(c_a, c_b);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasRectIntersection(sv_A, sv_B)
	SV *sv_A
	SV *sv_B
    PREINIT:
	const SDL_Rect * c_A;
	const SDL_Rect * c_B;
	_Bool c_bg_ret;
    PPCODE:
	c_A = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_A, "SDL3::Rect", "SDL_HasRectIntersection(A)");
	c_B = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_B, "SDL3::Rect", "SDL_HasRectIntersection(B)");
	c_bg_ret = SDL_HasRectIntersection(c_A, c_B);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRectIntersection(sv_A, sv_B, sv_result)
	SV *sv_A
	SV *sv_B
	SV *sv_result
    PREINIT:
	const SDL_Rect * c_A;
	const SDL_Rect * c_B;
	SDL_Rect * c_result;
	_Bool c_bg_ret;
    PPCODE:
	c_A = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_A, "SDL3::Rect", "SDL_GetRectIntersection(A)");
	c_B = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_B, "SDL3::Rect", "SDL_GetRectIntersection(B)");
	c_result = (SDL_Rect *)bg_in_record_ptr(aTHX_ sv_result, "SDL3::Rect", "SDL_GetRectIntersection(result)");
	c_bg_ret = SDL_GetRectIntersection(c_A, c_B, c_result);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRectUnion(sv_A, sv_B, sv_result)
	SV *sv_A
	SV *sv_B
	SV *sv_result
    PREINIT:
	const SDL_Rect * c_A;
	const SDL_Rect * c_B;
	SDL_Rect * c_result;
	_Bool c_bg_ret;
    PPCODE:
	c_A = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_A, "SDL3::Rect", "SDL_GetRectUnion(A)");
	c_B = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_B, "SDL3::Rect", "SDL_GetRectUnion(B)");
	c_result = (SDL_Rect *)bg_in_record_ptr(aTHX_ sv_result, "SDL3::Rect", "SDL_GetRectUnion(result)");
	c_bg_ret = SDL_GetRectUnion(c_A, c_B, c_result);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRectEnclosingPoints(sv_points, sv_count, sv_clip, sv_result)
	SV *sv_points
	SV *sv_count
	SV *sv_clip
	SV *sv_result
    PREINIT:
	const SDL_Point * c_points;
	int c_count;
	const SDL_Rect * c_clip;
	SDL_Rect * c_result;
	_Bool c_bg_ret;
    PPCODE:
	c_points = (const SDL_Point *)bg_in_record_ptr(aTHX_ sv_points, "SDL3::Point", "SDL_GetRectEnclosingPoints(points)");
	c_count = (int)bg_in_iv(aTHX_ sv_count, "SDL_GetRectEnclosingPoints(count)");
	c_clip = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_clip, "SDL3::Rect", "SDL_GetRectEnclosingPoints(clip)");
	c_result = (SDL_Rect *)bg_in_record_ptr(aTHX_ sv_result, "SDL3::Rect", "SDL_GetRectEnclosingPoints(result)");
	c_bg_ret = SDL_GetRectEnclosingPoints(c_points, c_count, c_clip, c_result);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRectAndLineIntersection(sv_rect, sv_X1, sv_Y1, sv_X2, sv_Y2)
	SV *sv_rect
	SV *sv_X1
	SV *sv_Y1
	SV *sv_X2
	SV *sv_Y2
    PREINIT:
	const SDL_Rect * c_rect;
	int c_X1; int * p_X1; SV *t_X1;
	int c_Y1; int * p_Y1; SV *t_Y1;
	int c_X2; int * p_X2; SV *t_X2;
	int c_Y2; int * p_Y2; SV *t_Y2;
	_Bool c_bg_ret;
    PPCODE:
	c_rect = (const SDL_Rect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::Rect", "SDL_GetRectAndLineIntersection(rect)");
	t_X1 = bg_outref_target(aTHX_ sv_X1);
	c_X1 = (t_X1 && SvOK(t_X1)) ? (int)bg_in_iv(aTHX_ t_X1, "SDL_GetRectAndLineIntersection(X1)") : (int)0;
	p_X1 = t_X1 ? &c_X1 : (int *)bg_outref_raw(aTHX_ sv_X1, "SDL_GetRectAndLineIntersection(X1)");
	t_Y1 = bg_outref_target(aTHX_ sv_Y1);
	c_Y1 = (t_Y1 && SvOK(t_Y1)) ? (int)bg_in_iv(aTHX_ t_Y1, "SDL_GetRectAndLineIntersection(Y1)") : (int)0;
	p_Y1 = t_Y1 ? &c_Y1 : (int *)bg_outref_raw(aTHX_ sv_Y1, "SDL_GetRectAndLineIntersection(Y1)");
	t_X2 = bg_outref_target(aTHX_ sv_X2);
	c_X2 = (t_X2 && SvOK(t_X2)) ? (int)bg_in_iv(aTHX_ t_X2, "SDL_GetRectAndLineIntersection(X2)") : (int)0;
	p_X2 = t_X2 ? &c_X2 : (int *)bg_outref_raw(aTHX_ sv_X2, "SDL_GetRectAndLineIntersection(X2)");
	t_Y2 = bg_outref_target(aTHX_ sv_Y2);
	c_Y2 = (t_Y2 && SvOK(t_Y2)) ? (int)bg_in_iv(aTHX_ t_Y2, "SDL_GetRectAndLineIntersection(Y2)") : (int)0;
	p_Y2 = t_Y2 ? &c_Y2 : (int *)bg_outref_raw(aTHX_ sv_Y2, "SDL_GetRectAndLineIntersection(Y2)");
	c_bg_ret = SDL_GetRectAndLineIntersection(c_rect, p_X1, p_Y1, p_X2, p_Y2);
	if (t_X1) sv_setsv(t_X1, sv_2mortal(newSViv((IV)(c_X1))));
	if (t_Y1) sv_setsv(t_Y1, sv_2mortal(newSViv((IV)(c_Y1))));
	if (t_X2) sv_setsv(t_X2, sv_2mortal(newSViv((IV)(c_X2))));
	if (t_Y2) sv_setsv(t_Y2, sv_2mortal(newSViv((IV)(c_Y2))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_PointInRectFloat(sv_p, sv_r)
	SV *sv_p
	SV *sv_r
    PREINIT:
	const SDL_FPoint * c_p;
	const SDL_FRect * c_r;
	_Bool c_bg_ret;
    PPCODE:
	c_p = (const SDL_FPoint *)bg_in_record_ptr(aTHX_ sv_p, "SDL3::FPoint", "SDL_PointInRectFloat(p)");
	c_r = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_r, "SDL3::FRect", "SDL_PointInRectFloat(r)");
	c_bg_ret = SDL_PointInRectFloat(c_p, c_r);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RectEmptyFloat(sv_r)
	SV *sv_r
    PREINIT:
	const SDL_FRect * c_r;
	_Bool c_bg_ret;
    PPCODE:
	c_r = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_r, "SDL3::FRect", "SDL_RectEmptyFloat(r)");
	c_bg_ret = SDL_RectEmptyFloat(c_r);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RectsEqualEpsilon(sv_a, sv_b, sv_epsilon)
	SV *sv_a
	SV *sv_b
	SV *sv_epsilon
    PREINIT:
	const SDL_FRect * c_a;
	const SDL_FRect * c_b;
	float c_epsilon;
	_Bool c_bg_ret;
    PPCODE:
	c_a = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_a, "SDL3::FRect", "SDL_RectsEqualEpsilon(a)");
	c_b = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_b, "SDL3::FRect", "SDL_RectsEqualEpsilon(b)");
	c_epsilon = (float)bg_in_nv(aTHX_ sv_epsilon, "SDL_RectsEqualEpsilon(epsilon)");
	c_bg_ret = SDL_RectsEqualEpsilon(c_a, c_b, c_epsilon);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_RectsEqualFloat(sv_a, sv_b)
	SV *sv_a
	SV *sv_b
    PREINIT:
	const SDL_FRect * c_a;
	const SDL_FRect * c_b;
	_Bool c_bg_ret;
    PPCODE:
	c_a = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_a, "SDL3::FRect", "SDL_RectsEqualFloat(a)");
	c_b = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_b, "SDL3::FRect", "SDL_RectsEqualFloat(b)");
	c_bg_ret = SDL_RectsEqualFloat(c_a, c_b);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_HasRectIntersectionFloat(sv_A, sv_B)
	SV *sv_A
	SV *sv_B
    PREINIT:
	const SDL_FRect * c_A;
	const SDL_FRect * c_B;
	_Bool c_bg_ret;
    PPCODE:
	c_A = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_A, "SDL3::FRect", "SDL_HasRectIntersectionFloat(A)");
	c_B = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_B, "SDL3::FRect", "SDL_HasRectIntersectionFloat(B)");
	c_bg_ret = SDL_HasRectIntersectionFloat(c_A, c_B);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRectIntersectionFloat(sv_A, sv_B, sv_result)
	SV *sv_A
	SV *sv_B
	SV *sv_result
    PREINIT:
	const SDL_FRect * c_A;
	const SDL_FRect * c_B;
	SDL_FRect * c_result;
	_Bool c_bg_ret;
    PPCODE:
	c_A = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_A, "SDL3::FRect", "SDL_GetRectIntersectionFloat(A)");
	c_B = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_B, "SDL3::FRect", "SDL_GetRectIntersectionFloat(B)");
	c_result = (SDL_FRect *)bg_in_record_ptr(aTHX_ sv_result, "SDL3::FRect", "SDL_GetRectIntersectionFloat(result)");
	c_bg_ret = SDL_GetRectIntersectionFloat(c_A, c_B, c_result);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRectUnionFloat(sv_A, sv_B, sv_result)
	SV *sv_A
	SV *sv_B
	SV *sv_result
    PREINIT:
	const SDL_FRect * c_A;
	const SDL_FRect * c_B;
	SDL_FRect * c_result;
	_Bool c_bg_ret;
    PPCODE:
	c_A = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_A, "SDL3::FRect", "SDL_GetRectUnionFloat(A)");
	c_B = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_B, "SDL3::FRect", "SDL_GetRectUnionFloat(B)");
	c_result = (SDL_FRect *)bg_in_record_ptr(aTHX_ sv_result, "SDL3::FRect", "SDL_GetRectUnionFloat(result)");
	c_bg_ret = SDL_GetRectUnionFloat(c_A, c_B, c_result);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRectEnclosingPointsFloat(sv_points, sv_count, sv_clip, sv_result)
	SV *sv_points
	SV *sv_count
	SV *sv_clip
	SV *sv_result
    PREINIT:
	const SDL_FPoint * c_points;
	int c_count;
	const SDL_FRect * c_clip;
	SDL_FRect * c_result;
	_Bool c_bg_ret;
    PPCODE:
	c_points = (const SDL_FPoint *)bg_in_record_ptr(aTHX_ sv_points, "SDL3::FPoint", "SDL_GetRectEnclosingPointsFloat(points)");
	c_count = (int)bg_in_iv(aTHX_ sv_count, "SDL_GetRectEnclosingPointsFloat(count)");
	c_clip = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_clip, "SDL3::FRect", "SDL_GetRectEnclosingPointsFloat(clip)");
	c_result = (SDL_FRect *)bg_in_record_ptr(aTHX_ sv_result, "SDL3::FRect", "SDL_GetRectEnclosingPointsFloat(result)");
	c_bg_ret = SDL_GetRectEnclosingPointsFloat(c_points, c_count, c_clip, c_result);
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

void
SDL_GetRectAndLineIntersectionFloat(sv_rect, sv_X1, sv_Y1, sv_X2, sv_Y2)
	SV *sv_rect
	SV *sv_X1
	SV *sv_Y1
	SV *sv_X2
	SV *sv_Y2
    PREINIT:
	const SDL_FRect * c_rect;
	float c_X1; float * p_X1; SV *t_X1;
	float c_Y1; float * p_Y1; SV *t_Y1;
	float c_X2; float * p_X2; SV *t_X2;
	float c_Y2; float * p_Y2; SV *t_Y2;
	_Bool c_bg_ret;
    PPCODE:
	c_rect = (const SDL_FRect *)bg_in_record_ptr(aTHX_ sv_rect, "SDL3::FRect", "SDL_GetRectAndLineIntersectionFloat(rect)");
	t_X1 = bg_outref_target(aTHX_ sv_X1);
	c_X1 = (t_X1 && SvOK(t_X1)) ? (float)bg_in_nv(aTHX_ t_X1, "SDL_GetRectAndLineIntersectionFloat(X1)") : (float)0;
	p_X1 = t_X1 ? &c_X1 : (float *)bg_outref_raw(aTHX_ sv_X1, "SDL_GetRectAndLineIntersectionFloat(X1)");
	t_Y1 = bg_outref_target(aTHX_ sv_Y1);
	c_Y1 = (t_Y1 && SvOK(t_Y1)) ? (float)bg_in_nv(aTHX_ t_Y1, "SDL_GetRectAndLineIntersectionFloat(Y1)") : (float)0;
	p_Y1 = t_Y1 ? &c_Y1 : (float *)bg_outref_raw(aTHX_ sv_Y1, "SDL_GetRectAndLineIntersectionFloat(Y1)");
	t_X2 = bg_outref_target(aTHX_ sv_X2);
	c_X2 = (t_X2 && SvOK(t_X2)) ? (float)bg_in_nv(aTHX_ t_X2, "SDL_GetRectAndLineIntersectionFloat(X2)") : (float)0;
	p_X2 = t_X2 ? &c_X2 : (float *)bg_outref_raw(aTHX_ sv_X2, "SDL_GetRectAndLineIntersectionFloat(X2)");
	t_Y2 = bg_outref_target(aTHX_ sv_Y2);
	c_Y2 = (t_Y2 && SvOK(t_Y2)) ? (float)bg_in_nv(aTHX_ t_Y2, "SDL_GetRectAndLineIntersectionFloat(Y2)") : (float)0;
	p_Y2 = t_Y2 ? &c_Y2 : (float *)bg_outref_raw(aTHX_ sv_Y2, "SDL_GetRectAndLineIntersectionFloat(Y2)");
	c_bg_ret = SDL_GetRectAndLineIntersectionFloat(c_rect, p_X1, p_Y1, p_X2, p_Y2);
	if (t_X1) sv_setsv(t_X1, sv_2mortal(newSVnv((NV)(c_X1))));
	if (t_Y1) sv_setsv(t_Y1, sv_2mortal(newSVnv((NV)(c_Y1))));
	if (t_X2) sv_setsv(t_X2, sv_2mortal(newSVnv((NV)(c_X2))));
	if (t_Y2) sv_setsv(t_Y2, sv_2mortal(newSVnv((NV)(c_Y2))));
	ST(0) = sv_2mortal(newSVsv(boolSV(c_bg_ret)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::Point

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_Point), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_Point)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Point *self;
    PPCODE:
	self = (struct SDL_Point *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Point", "SDL3::Point::x");
	if (items > 1) {
		self->x = (int)bg_in_iv(aTHX_ ST(1), "SDL3::Point::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Point *self;
    PPCODE:
	self = (struct SDL_Point *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Point", "SDL3::Point::y");
	if (items > 1) {
		self->y = (int)bg_in_iv(aTHX_ ST(1), "SDL3::Point::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->y)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::FPoint

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_FPoint), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_FPoint)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_FPoint *self;
    PPCODE:
	self = (struct SDL_FPoint *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::FPoint", "SDL3::FPoint::x");
	if (items > 1) {
		self->x = (float)bg_in_nv(aTHX_ ST(1), "SDL3::FPoint::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_FPoint *self;
    PPCODE:
	self = (struct SDL_FPoint *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::FPoint", "SDL3::FPoint::y");
	if (items > 1) {
		self->y = (float)bg_in_nv(aTHX_ ST(1), "SDL3::FPoint::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->y)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::Rect

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_Rect), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_Rect)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Rect *self;
    PPCODE:
	self = (struct SDL_Rect *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Rect", "SDL3::Rect::x");
	if (items > 1) {
		self->x = (int)bg_in_iv(aTHX_ ST(1), "SDL3::Rect::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Rect *self;
    PPCODE:
	self = (struct SDL_Rect *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Rect", "SDL3::Rect::y");
	if (items > 1) {
		self->y = (int)bg_in_iv(aTHX_ ST(1), "SDL3::Rect::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->y)));
	XSRETURN(1);

void
w(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Rect *self;
    PPCODE:
	self = (struct SDL_Rect *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Rect", "SDL3::Rect::w");
	if (items > 1) {
		self->w = (int)bg_in_iv(aTHX_ ST(1), "SDL3::Rect::w");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->w)));
	XSRETURN(1);

void
h(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_Rect *self;
    PPCODE:
	self = (struct SDL_Rect *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::Rect", "SDL3::Rect::h");
	if (items > 1) {
		self->h = (int)bg_in_iv(aTHX_ ST(1), "SDL3::Rect::h");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->h)));
	XSRETURN(1);

MODULE = SDL3  PACKAGE = SDL3::FRect

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_FRect), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_FRect)));
	XSRETURN(1);

void
x(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_FRect *self;
    PPCODE:
	self = (struct SDL_FRect *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::FRect", "SDL3::FRect::x");
	if (items > 1) {
		self->x = (float)bg_in_nv(aTHX_ ST(1), "SDL3::FRect::x");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->x)));
	XSRETURN(1);

void
y(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_FRect *self;
    PPCODE:
	self = (struct SDL_FRect *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::FRect", "SDL3::FRect::y");
	if (items > 1) {
		self->y = (float)bg_in_nv(aTHX_ ST(1), "SDL3::FRect::y");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->y)));
	XSRETURN(1);

void
w(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_FRect *self;
    PPCODE:
	self = (struct SDL_FRect *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::FRect", "SDL3::FRect::w");
	if (items > 1) {
		self->w = (float)bg_in_nv(aTHX_ ST(1), "SDL3::FRect::w");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->w)));
	XSRETURN(1);

void
h(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_FRect *self;
    PPCODE:
	self = (struct SDL_FRect *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::FRect", "SDL3::FRect::h");
	if (items > 1) {
		self->h = (float)bg_in_nv(aTHX_ ST(1), "SDL3::FRect::h");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVnv((NV)(self->h)));
	XSRETURN(1);
