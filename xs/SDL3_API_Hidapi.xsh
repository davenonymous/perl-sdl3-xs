MODULE = SDL3  PACKAGE = SDL3::API::Hidapi

void
SDL_hid_init()
    PREINIT:
	int c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_hid_init();
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_exit()
    PREINIT:
	int c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_hid_exit();
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_device_change_count()
    PREINIT:
	Uint32 c_bg_ret;
    PPCODE:
	c_bg_ret = SDL_hid_device_change_count();
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_enumerate(sv_vendor_id, sv_product_id)
	SV *sv_vendor_id
	SV *sv_product_id
    PREINIT:
	unsigned short c_vendor_id;
	unsigned short c_product_id;
	SDL_hid_device_info * c_bg_ret;
    PPCODE:
	c_vendor_id = (unsigned short)bg_in_uv(aTHX_ sv_vendor_id, "SDL_hid_enumerate(vendor_id)");
	c_product_id = (unsigned short)bg_in_uv(aTHX_ sv_product_id, "SDL_hid_enumerate(product_id)");
	c_bg_ret = SDL_hid_enumerate(c_vendor_id, c_product_id);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::HidDeviceInfo"));
	XSRETURN(1);

void
SDL_hid_free_enumeration(sv_devs)
	SV *sv_devs
    PREINIT:
	SDL_hid_device_info * c_devs;
    PPCODE:
	c_devs = (SDL_hid_device_info *)bg_in_record_ptr(aTHX_ sv_devs, "SDL3::HidDeviceInfo", "SDL_hid_free_enumeration(devs)");
	SDL_hid_free_enumeration(c_devs);
	XSRETURN(0);

void
SDL_hid_open(sv_vendor_id, sv_product_id, sv_serial_number)
	SV *sv_vendor_id
	SV *sv_product_id
	SV *sv_serial_number
    PREINIT:
	unsigned short c_vendor_id;
	unsigned short c_product_id;
	wchar_t c_serial_number; const wchar_t * p_serial_number; SV *t_serial_number;
	SDL_hid_device * c_bg_ret;
    PPCODE:
	c_vendor_id = (unsigned short)bg_in_uv(aTHX_ sv_vendor_id, "SDL_hid_open(vendor_id)");
	c_product_id = (unsigned short)bg_in_uv(aTHX_ sv_product_id, "SDL_hid_open(product_id)");
	t_serial_number = bg_outref_target(aTHX_ sv_serial_number);
	c_serial_number = (t_serial_number && SvOK(t_serial_number)) ? (wchar_t)bg_in_iv(aTHX_ t_serial_number, "SDL_hid_open(serial_number)") : (wchar_t)0;
	p_serial_number = t_serial_number ? &c_serial_number : (const wchar_t *)bg_outref_raw(aTHX_ sv_serial_number, "SDL_hid_open(serial_number)");
	c_bg_ret = SDL_hid_open(c_vendor_id, c_product_id, p_serial_number);
	if (t_serial_number) sv_setsv(t_serial_number, sv_2mortal(newSViv((IV)(c_serial_number))));
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::HidDevice"));
	XSRETURN(1);

void
SDL_hid_open_path(sv_path)
	SV *sv_path
    PREINIT:
	const char * c_path;
	SDL_hid_device * c_bg_ret;
    PPCODE:
	c_path = (const char *)bg_in_string(aTHX_ sv_path, "SDL_hid_open_path(path)");
	c_bg_ret = SDL_hid_open_path(c_path);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::HidDevice"));
	XSRETURN(1);

void
SDL_hid_get_properties(sv_dev)
	SV *sv_dev
    PREINIT:
	SDL_hid_device * c_dev;
	SDL_PropertiesID c_bg_ret;
    PPCODE:
	c_dev = (SDL_hid_device *)bg_in_record_ptr(aTHX_ sv_dev, "SDL3::HidDevice", "SDL_hid_get_properties(dev)");
	c_bg_ret = SDL_hid_get_properties(c_dev);
	ST(0) = sv_2mortal(newSVuv((UV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_write(sv_dev, sv_data, sv_length)
	SV *sv_dev
	SV *sv_data
	SV *sv_length
    PREINIT:
	SDL_hid_device * c_dev;
	const unsigned char * c_data;
	size_t c_length;
	int c_bg_ret;
    PPCODE:
	c_dev = (SDL_hid_device *)bg_in_record_ptr(aTHX_ sv_dev, "SDL3::HidDevice", "SDL_hid_write(dev)");
	c_data = (const unsigned char *)bg_in_raw_ptr(aTHX_ sv_data, "SDL_hid_write(data)");
	c_length = (size_t)bg_in_uv(aTHX_ sv_length, "SDL_hid_write(length)");
	c_bg_ret = SDL_hid_write(c_dev, c_data, c_length);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_read_timeout(sv_dev, sv_data, sv_length, sv_milliseconds)
	SV *sv_dev
	SV *sv_data
	SV *sv_length
	SV *sv_milliseconds
    PREINIT:
	SDL_hid_device * c_dev;
	unsigned char c_data; unsigned char * p_data; SV *t_data;
	size_t c_length;
	int c_milliseconds;
	int c_bg_ret;
    PPCODE:
	c_dev = (SDL_hid_device *)bg_in_record_ptr(aTHX_ sv_dev, "SDL3::HidDevice", "SDL_hid_read_timeout(dev)");
	t_data = bg_outref_target(aTHX_ sv_data);
	c_data = (t_data && SvOK(t_data)) ? (unsigned char)bg_in_uv(aTHX_ t_data, "SDL_hid_read_timeout(data)") : (unsigned char)0;
	p_data = t_data ? &c_data : (unsigned char *)bg_outref_raw(aTHX_ sv_data, "SDL_hid_read_timeout(data)");
	c_length = (size_t)bg_in_uv(aTHX_ sv_length, "SDL_hid_read_timeout(length)");
	c_milliseconds = (int)bg_in_iv(aTHX_ sv_milliseconds, "SDL_hid_read_timeout(milliseconds)");
	c_bg_ret = SDL_hid_read_timeout(c_dev, p_data, c_length, c_milliseconds);
	if (t_data) sv_setsv(t_data, sv_2mortal(newSVuv((UV)(c_data))));
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_read(sv_dev, sv_data, sv_length)
	SV *sv_dev
	SV *sv_data
	SV *sv_length
    PREINIT:
	SDL_hid_device * c_dev;
	unsigned char c_data; unsigned char * p_data; SV *t_data;
	size_t c_length;
	int c_bg_ret;
    PPCODE:
	c_dev = (SDL_hid_device *)bg_in_record_ptr(aTHX_ sv_dev, "SDL3::HidDevice", "SDL_hid_read(dev)");
	t_data = bg_outref_target(aTHX_ sv_data);
	c_data = (t_data && SvOK(t_data)) ? (unsigned char)bg_in_uv(aTHX_ t_data, "SDL_hid_read(data)") : (unsigned char)0;
	p_data = t_data ? &c_data : (unsigned char *)bg_outref_raw(aTHX_ sv_data, "SDL_hid_read(data)");
	c_length = (size_t)bg_in_uv(aTHX_ sv_length, "SDL_hid_read(length)");
	c_bg_ret = SDL_hid_read(c_dev, p_data, c_length);
	if (t_data) sv_setsv(t_data, sv_2mortal(newSVuv((UV)(c_data))));
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_set_nonblocking(sv_dev, sv_nonblock)
	SV *sv_dev
	SV *sv_nonblock
    PREINIT:
	SDL_hid_device * c_dev;
	int c_nonblock;
	int c_bg_ret;
    PPCODE:
	c_dev = (SDL_hid_device *)bg_in_record_ptr(aTHX_ sv_dev, "SDL3::HidDevice", "SDL_hid_set_nonblocking(dev)");
	c_nonblock = (int)bg_in_iv(aTHX_ sv_nonblock, "SDL_hid_set_nonblocking(nonblock)");
	c_bg_ret = SDL_hid_set_nonblocking(c_dev, c_nonblock);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_send_feature_report(sv_dev, sv_data, sv_length)
	SV *sv_dev
	SV *sv_data
	SV *sv_length
    PREINIT:
	SDL_hid_device * c_dev;
	const unsigned char * c_data;
	size_t c_length;
	int c_bg_ret;
    PPCODE:
	c_dev = (SDL_hid_device *)bg_in_record_ptr(aTHX_ sv_dev, "SDL3::HidDevice", "SDL_hid_send_feature_report(dev)");
	c_data = (const unsigned char *)bg_in_raw_ptr(aTHX_ sv_data, "SDL_hid_send_feature_report(data)");
	c_length = (size_t)bg_in_uv(aTHX_ sv_length, "SDL_hid_send_feature_report(length)");
	c_bg_ret = SDL_hid_send_feature_report(c_dev, c_data, c_length);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_get_feature_report(sv_dev, sv_data, sv_length)
	SV *sv_dev
	SV *sv_data
	SV *sv_length
    PREINIT:
	SDL_hid_device * c_dev;
	unsigned char c_data; unsigned char * p_data; SV *t_data;
	size_t c_length;
	int c_bg_ret;
    PPCODE:
	c_dev = (SDL_hid_device *)bg_in_record_ptr(aTHX_ sv_dev, "SDL3::HidDevice", "SDL_hid_get_feature_report(dev)");
	t_data = bg_outref_target(aTHX_ sv_data);
	c_data = (t_data && SvOK(t_data)) ? (unsigned char)bg_in_uv(aTHX_ t_data, "SDL_hid_get_feature_report(data)") : (unsigned char)0;
	p_data = t_data ? &c_data : (unsigned char *)bg_outref_raw(aTHX_ sv_data, "SDL_hid_get_feature_report(data)");
	c_length = (size_t)bg_in_uv(aTHX_ sv_length, "SDL_hid_get_feature_report(length)");
	c_bg_ret = SDL_hid_get_feature_report(c_dev, p_data, c_length);
	if (t_data) sv_setsv(t_data, sv_2mortal(newSVuv((UV)(c_data))));
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_get_input_report(sv_dev, sv_data, sv_length)
	SV *sv_dev
	SV *sv_data
	SV *sv_length
    PREINIT:
	SDL_hid_device * c_dev;
	unsigned char c_data; unsigned char * p_data; SV *t_data;
	size_t c_length;
	int c_bg_ret;
    PPCODE:
	c_dev = (SDL_hid_device *)bg_in_record_ptr(aTHX_ sv_dev, "SDL3::HidDevice", "SDL_hid_get_input_report(dev)");
	t_data = bg_outref_target(aTHX_ sv_data);
	c_data = (t_data && SvOK(t_data)) ? (unsigned char)bg_in_uv(aTHX_ t_data, "SDL_hid_get_input_report(data)") : (unsigned char)0;
	p_data = t_data ? &c_data : (unsigned char *)bg_outref_raw(aTHX_ sv_data, "SDL_hid_get_input_report(data)");
	c_length = (size_t)bg_in_uv(aTHX_ sv_length, "SDL_hid_get_input_report(length)");
	c_bg_ret = SDL_hid_get_input_report(c_dev, p_data, c_length);
	if (t_data) sv_setsv(t_data, sv_2mortal(newSVuv((UV)(c_data))));
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_close(sv_dev)
	SV *sv_dev
    PREINIT:
	SDL_hid_device * c_dev;
	int c_bg_ret;
    PPCODE:
	c_dev = (SDL_hid_device *)bg_in_record_ptr(aTHX_ sv_dev, "SDL3::HidDevice", "SDL_hid_close(dev)");
	c_bg_ret = SDL_hid_close(c_dev);
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_get_manufacturer_string(sv_dev, sv_string, sv_maxlen)
	SV *sv_dev
	SV *sv_string
	SV *sv_maxlen
    PREINIT:
	SDL_hid_device * c_dev;
	wchar_t c_string; wchar_t * p_string; SV *t_string;
	size_t c_maxlen;
	int c_bg_ret;
    PPCODE:
	c_dev = (SDL_hid_device *)bg_in_record_ptr(aTHX_ sv_dev, "SDL3::HidDevice", "SDL_hid_get_manufacturer_string(dev)");
	t_string = bg_outref_target(aTHX_ sv_string);
	c_string = (t_string && SvOK(t_string)) ? (wchar_t)bg_in_iv(aTHX_ t_string, "SDL_hid_get_manufacturer_string(string)") : (wchar_t)0;
	p_string = t_string ? &c_string : (wchar_t *)bg_outref_raw(aTHX_ sv_string, "SDL_hid_get_manufacturer_string(string)");
	c_maxlen = (size_t)bg_in_uv(aTHX_ sv_maxlen, "SDL_hid_get_manufacturer_string(maxlen)");
	c_bg_ret = SDL_hid_get_manufacturer_string(c_dev, p_string, c_maxlen);
	if (t_string) sv_setsv(t_string, sv_2mortal(newSViv((IV)(c_string))));
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_get_product_string(sv_dev, sv_string, sv_maxlen)
	SV *sv_dev
	SV *sv_string
	SV *sv_maxlen
    PREINIT:
	SDL_hid_device * c_dev;
	wchar_t c_string; wchar_t * p_string; SV *t_string;
	size_t c_maxlen;
	int c_bg_ret;
    PPCODE:
	c_dev = (SDL_hid_device *)bg_in_record_ptr(aTHX_ sv_dev, "SDL3::HidDevice", "SDL_hid_get_product_string(dev)");
	t_string = bg_outref_target(aTHX_ sv_string);
	c_string = (t_string && SvOK(t_string)) ? (wchar_t)bg_in_iv(aTHX_ t_string, "SDL_hid_get_product_string(string)") : (wchar_t)0;
	p_string = t_string ? &c_string : (wchar_t *)bg_outref_raw(aTHX_ sv_string, "SDL_hid_get_product_string(string)");
	c_maxlen = (size_t)bg_in_uv(aTHX_ sv_maxlen, "SDL_hid_get_product_string(maxlen)");
	c_bg_ret = SDL_hid_get_product_string(c_dev, p_string, c_maxlen);
	if (t_string) sv_setsv(t_string, sv_2mortal(newSViv((IV)(c_string))));
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_get_serial_number_string(sv_dev, sv_string, sv_maxlen)
	SV *sv_dev
	SV *sv_string
	SV *sv_maxlen
    PREINIT:
	SDL_hid_device * c_dev;
	wchar_t c_string; wchar_t * p_string; SV *t_string;
	size_t c_maxlen;
	int c_bg_ret;
    PPCODE:
	c_dev = (SDL_hid_device *)bg_in_record_ptr(aTHX_ sv_dev, "SDL3::HidDevice", "SDL_hid_get_serial_number_string(dev)");
	t_string = bg_outref_target(aTHX_ sv_string);
	c_string = (t_string && SvOK(t_string)) ? (wchar_t)bg_in_iv(aTHX_ t_string, "SDL_hid_get_serial_number_string(string)") : (wchar_t)0;
	p_string = t_string ? &c_string : (wchar_t *)bg_outref_raw(aTHX_ sv_string, "SDL_hid_get_serial_number_string(string)");
	c_maxlen = (size_t)bg_in_uv(aTHX_ sv_maxlen, "SDL_hid_get_serial_number_string(maxlen)");
	c_bg_ret = SDL_hid_get_serial_number_string(c_dev, p_string, c_maxlen);
	if (t_string) sv_setsv(t_string, sv_2mortal(newSViv((IV)(c_string))));
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_get_indexed_string(sv_dev, sv_string_index, sv_string, sv_maxlen)
	SV *sv_dev
	SV *sv_string_index
	SV *sv_string
	SV *sv_maxlen
    PREINIT:
	SDL_hid_device * c_dev;
	int c_string_index;
	wchar_t c_string; wchar_t * p_string; SV *t_string;
	size_t c_maxlen;
	int c_bg_ret;
    PPCODE:
	c_dev = (SDL_hid_device *)bg_in_record_ptr(aTHX_ sv_dev, "SDL3::HidDevice", "SDL_hid_get_indexed_string(dev)");
	c_string_index = (int)bg_in_iv(aTHX_ sv_string_index, "SDL_hid_get_indexed_string(string_index)");
	t_string = bg_outref_target(aTHX_ sv_string);
	c_string = (t_string && SvOK(t_string)) ? (wchar_t)bg_in_iv(aTHX_ t_string, "SDL_hid_get_indexed_string(string)") : (wchar_t)0;
	p_string = t_string ? &c_string : (wchar_t *)bg_outref_raw(aTHX_ sv_string, "SDL_hid_get_indexed_string(string)");
	c_maxlen = (size_t)bg_in_uv(aTHX_ sv_maxlen, "SDL_hid_get_indexed_string(maxlen)");
	c_bg_ret = SDL_hid_get_indexed_string(c_dev, c_string_index, p_string, c_maxlen);
	if (t_string) sv_setsv(t_string, sv_2mortal(newSViv((IV)(c_string))));
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_get_device_info(sv_dev)
	SV *sv_dev
    PREINIT:
	SDL_hid_device * c_dev;
	SDL_hid_device_info * c_bg_ret;
    PPCODE:
	c_dev = (SDL_hid_device *)bg_in_record_ptr(aTHX_ sv_dev, "SDL3::HidDevice", "SDL_hid_get_device_info(dev)");
	c_bg_ret = SDL_hid_get_device_info(c_dev);
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(c_bg_ret), "SDL3::HidDeviceInfo"));
	XSRETURN(1);

void
SDL_hid_get_report_descriptor(sv_dev, sv_buf, sv_buf_size)
	SV *sv_dev
	SV *sv_buf
	SV *sv_buf_size
    PREINIT:
	SDL_hid_device * c_dev;
	unsigned char c_buf; unsigned char * p_buf; SV *t_buf;
	size_t c_buf_size;
	int c_bg_ret;
    PPCODE:
	c_dev = (SDL_hid_device *)bg_in_record_ptr(aTHX_ sv_dev, "SDL3::HidDevice", "SDL_hid_get_report_descriptor(dev)");
	t_buf = bg_outref_target(aTHX_ sv_buf);
	c_buf = (t_buf && SvOK(t_buf)) ? (unsigned char)bg_in_uv(aTHX_ t_buf, "SDL_hid_get_report_descriptor(buf)") : (unsigned char)0;
	p_buf = t_buf ? &c_buf : (unsigned char *)bg_outref_raw(aTHX_ sv_buf, "SDL_hid_get_report_descriptor(buf)");
	c_buf_size = (size_t)bg_in_uv(aTHX_ sv_buf_size, "SDL_hid_get_report_descriptor(buf_size)");
	c_bg_ret = SDL_hid_get_report_descriptor(c_dev, p_buf, c_buf_size);
	if (t_buf) sv_setsv(t_buf, sv_2mortal(newSVuv((UV)(c_buf))));
	ST(0) = sv_2mortal(newSViv((IV)(c_bg_ret)));
	XSRETURN(1);

void
SDL_hid_ble_scan(sv_active)
	SV *sv_active
    PREINIT:
	_Bool c_active;
    PPCODE:
	c_active = (_Bool)SvTRUE(sv_active);
	SDL_hid_ble_scan(c_active);
	XSRETURN(0);

BOOT:
	{
	HV *stash = gv_stashpv("SDL3::API::Hidapi", GV_ADD);
	bg_export_constant(aTHX_ stash, "SDL_PROP_HIDAPI_LIBUSB_DEVICE_HANDLE_POINTER", BG_CONST_SV(SDL_PROP_HIDAPI_LIBUSB_DEVICE_HANDLE_POINTER));
	bg_export_constant(aTHX_ stash, "SDL_HID_API_BUS_UNKNOWN", BG_CONST_SV(SDL_HID_API_BUS_UNKNOWN));
	bg_export_constant(aTHX_ stash, "SDL_HID_API_BUS_USB", BG_CONST_SV(SDL_HID_API_BUS_USB));
	bg_export_constant(aTHX_ stash, "SDL_HID_API_BUS_BLUETOOTH", BG_CONST_SV(SDL_HID_API_BUS_BLUETOOTH));
	bg_export_constant(aTHX_ stash, "SDL_HID_API_BUS_I2C", BG_CONST_SV(SDL_HID_API_BUS_I2C));
	bg_export_constant(aTHX_ stash, "SDL_HID_API_BUS_SPI", BG_CONST_SV(SDL_HID_API_BUS_SPI));
	}


MODULE = SDL3  PACKAGE = SDL3::HidDeviceInfo

void
_alloc(sv_class)
	SV *sv_class
    PPCODE:
	ST(0) = sv_2mortal(bg_new_record(aTHX_ sizeof(struct SDL_hid_device_info), SvPV_nolen(sv_class)));
	XSRETURN(1);

void
_sizeof(sv_class)
	SV *sv_class
    PPCODE:
	PERL_UNUSED_VAR(sv_class);
	ST(0) = sv_2mortal(newSVuv(sizeof(struct SDL_hid_device_info)));
	XSRETURN(1);

void
path(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_hid_device_info *self;
    PPCODE:
	self = (struct SDL_hid_device_info *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::path");
	if (items > 1) {
		self->path = (char *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::HidDeviceInfo::path");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->path), "SDL3::Pointer"));
	XSRETURN(1);

void
vendor_id(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_hid_device_info *self;
    PPCODE:
	self = (struct SDL_hid_device_info *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::vendor_id");
	if (items > 1) {
		self->vendor_id = (unsigned short)bg_in_uv(aTHX_ ST(1), "SDL3::HidDeviceInfo::vendor_id");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->vendor_id)));
	XSRETURN(1);

void
product_id(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_hid_device_info *self;
    PPCODE:
	self = (struct SDL_hid_device_info *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::product_id");
	if (items > 1) {
		self->product_id = (unsigned short)bg_in_uv(aTHX_ ST(1), "SDL3::HidDeviceInfo::product_id");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->product_id)));
	XSRETURN(1);

void
serial_number(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_hid_device_info *self;
    PPCODE:
	self = (struct SDL_hid_device_info *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::serial_number");
	if (items > 1) {
		self->serial_number = (wchar_t *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::HidDeviceInfo::serial_number");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->serial_number), "SDL3::Pointer"));
	XSRETURN(1);

void
release_number(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_hid_device_info *self;
    PPCODE:
	self = (struct SDL_hid_device_info *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::release_number");
	if (items > 1) {
		self->release_number = (unsigned short)bg_in_uv(aTHX_ ST(1), "SDL3::HidDeviceInfo::release_number");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->release_number)));
	XSRETURN(1);

void
manufacturer_string(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_hid_device_info *self;
    PPCODE:
	self = (struct SDL_hid_device_info *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::manufacturer_string");
	if (items > 1) {
		self->manufacturer_string = (wchar_t *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::HidDeviceInfo::manufacturer_string");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->manufacturer_string), "SDL3::Pointer"));
	XSRETURN(1);

void
product_string(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_hid_device_info *self;
    PPCODE:
	self = (struct SDL_hid_device_info *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::product_string");
	if (items > 1) {
		self->product_string = (wchar_t *)bg_in_raw_ptr(aTHX_ ST(1), "SDL3::HidDeviceInfo::product_string");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_raw_ptr(aTHX_ (void *)(self->product_string), "SDL3::Pointer"));
	XSRETURN(1);

void
usage_page(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_hid_device_info *self;
    PPCODE:
	self = (struct SDL_hid_device_info *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::usage_page");
	if (items > 1) {
		self->usage_page = (unsigned short)bg_in_uv(aTHX_ ST(1), "SDL3::HidDeviceInfo::usage_page");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->usage_page)));
	XSRETURN(1);

void
usage(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_hid_device_info *self;
    PPCODE:
	self = (struct SDL_hid_device_info *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::usage");
	if (items > 1) {
		self->usage = (unsigned short)bg_in_uv(aTHX_ ST(1), "SDL3::HidDeviceInfo::usage");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSVuv((UV)(self->usage)));
	XSRETURN(1);

void
interface_number(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_hid_device_info *self;
    PPCODE:
	self = (struct SDL_hid_device_info *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::interface_number");
	if (items > 1) {
		self->interface_number = (int)bg_in_iv(aTHX_ ST(1), "SDL3::HidDeviceInfo::interface_number");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->interface_number)));
	XSRETURN(1);

void
interface_class(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_hid_device_info *self;
    PPCODE:
	self = (struct SDL_hid_device_info *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::interface_class");
	if (items > 1) {
		self->interface_class = (int)bg_in_iv(aTHX_ ST(1), "SDL3::HidDeviceInfo::interface_class");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->interface_class)));
	XSRETURN(1);

void
interface_subclass(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_hid_device_info *self;
    PPCODE:
	self = (struct SDL_hid_device_info *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::interface_subclass");
	if (items > 1) {
		self->interface_subclass = (int)bg_in_iv(aTHX_ ST(1), "SDL3::HidDeviceInfo::interface_subclass");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->interface_subclass)));
	XSRETURN(1);

void
interface_protocol(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_hid_device_info *self;
    PPCODE:
	self = (struct SDL_hid_device_info *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::interface_protocol");
	if (items > 1) {
		self->interface_protocol = (int)bg_in_iv(aTHX_ ST(1), "SDL3::HidDeviceInfo::interface_protocol");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->interface_protocol)));
	XSRETURN(1);

void
bus_type(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_hid_device_info *self;
    PPCODE:
	self = (struct SDL_hid_device_info *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::bus_type");
	if (items > 1) {
		self->bus_type = (SDL_hid_bus_type)bg_in_iv(aTHX_ ST(1), "SDL3::HidDeviceInfo::bus_type");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(newSViv((IV)(self->bus_type)));
	XSRETURN(1);

void
next(sv_self, ...)
	SV *sv_self
    PREINIT:
	struct SDL_hid_device_info *self;
    PPCODE:
	self = (struct SDL_hid_device_info *)bg_in_record_value_ptr(aTHX_ sv_self, "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::next");
	if (items > 1) {
		self->next = (struct SDL_hid_device_info *)bg_in_record_ptr(aTHX_ ST(1), "SDL3::HidDeviceInfo", "SDL3::HidDeviceInfo::next");
		XSRETURN(1);
	}
	ST(0) = sv_2mortal(bg_out_record_ptr(aTHX_ (void *)(self->next), "SDL3::HidDeviceInfo"));
	XSRETURN(1);
