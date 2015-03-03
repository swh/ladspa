#! /bin/sh

([ -x libtoolize ] && libtoolize --force --copy) || glibtoolize --force --copy
touch config.rpath

echo aclocal...
(aclocal --version) < /dev/null > /dev/null 2>&1 || {
    echo aclocal not found
    exit 1
}

aclocal -I m4 || exit 1

echo autoheader...
(autoheader --version) < /dev/null > /dev/null 2>&1 || {
    echo autoheader not found
    exit 1
}    

autoheader || exit 1

echo automake...
(automake --version) < /dev/null > /dev/null 2>&1 || {
    echo automake not found
    exit 1
}

automake --add-missing --copy --gnu || exit 1

echo autoconf...
(autoconf --version) < /dev/null > /dev/null 2>&1 || {
    echo autoconf not found
    exit 1
}

autoconf || exit 1

test -n "$NOCONFIGURE" || ./configure "$@"

exit 0
