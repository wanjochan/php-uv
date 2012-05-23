PHP_ARG_ENABLE(uv, Whether to enable the "uv" extension,
    [ --enable-uv     Enable "uv" extension support])

if test $PHP_UV != "no"; then
    PHP_NEW_EXTENSION(uv, php_uv.c uv.c, $ext_shared)

    PHP_CHECK_LIBRARY(uv, uv_run, [
        AC_MSG_RESULT(found)
        PHP_ADD_LIBRARY_WITH_PATH(uv, libuv, MRUBY_SHARED_LIBADD)
        PHP_ADD_INCLUDE([$ext_srcdir/uv/include])
    ],[
        AC_MSG_RESULT([not found])
        AC_MSG_ERROR([Please make libuv first])
    ],[
        -Llibuv
    ])
    PHP_SUBST(MRUBY_SHARED_LIBADD)


    PHP_SUBST(UV_SHARED_LIBADD)
    CFLAGS=" -Wunused-variable -Wpointer-sign -Wimplicit-function-declaration"
    PHP_SUBST([CFLAGS])
fi