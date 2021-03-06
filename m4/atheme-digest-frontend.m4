AC_DEFUN([ATHEME_DECIDE_DIGEST_FRONTEND], [

	DIGEST_FRONTEND="Internal"

	DIGEST_API_LIBS=""

	DIGEST_FRONTEND_COND_H="digest_fe_internal.h"
	DIGEST_FRONTEND_COND_C="digest_fe_internal.c"
	DIGEST_FRONTEND_COND_C="${DIGEST_FRONTEND_COND_C} digest_be_md5.c"
	DIGEST_FRONTEND_COND_C="${DIGEST_FRONTEND_COND_C} digest_be_sha1.c"
	DIGEST_FRONTEND_COND_C="${DIGEST_FRONTEND_COND_C} digest_be_sha2_256.c"
	DIGEST_FRONTEND_COND_C="${DIGEST_FRONTEND_COND_C} digest_be_sha2_512.c"

	AS_IF([test "x${DIGEST_FRONTEND}x${LIBMBEDCRYPTO}" = "xInternalxYes"], [
		DIGEST_API_LIBS="${LIBMBEDCRYPTO_LIBS}"
		DIGEST_FRONTEND_COND_H="digest_fe_mbedtls.h"
		DIGEST_FRONTEND_COND_C="digest_fe_mbedtls.c"
		DIGEST_FRONTEND="ARM mbedTLS"
	])

	AS_IF([test "x${DIGEST_FRONTEND}x${LIBNETTLE}" = "xInternalxYes"], [
		DIGEST_API_LIBS="${LIBNETTLE_LIBS}"
		DIGEST_FRONTEND_COND_H="digest_fe_nettle.h"
		DIGEST_FRONTEND_COND_C="digest_fe_nettle.c"
		DIGEST_FRONTEND="Nettle"
	])

	AS_IF([test "x${DIGEST_FRONTEND}x${LIBCRYPTO}" = "xInternalxYes"], [
		DIGEST_API_LIBS="${LIBCRYPTO_LIBS}"
		DIGEST_FRONTEND_COND_H="digest_fe_openssl.h"
		DIGEST_FRONTEND_COND_C="digest_fe_openssl.c"
		DIGEST_FRONTEND="OpenSSL"
	])

	AC_DEFINE_UNQUOTED([DIGEST_FE_HEADER], ["${DIGEST_FRONTEND_COND_H}"], [Front-end header for digest interface])
	AC_SUBST([DIGEST_FRONTEND_COND_C])
	AC_SUBST([DIGEST_API_LIBS])
])
