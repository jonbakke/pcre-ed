#!/bin/sh
brew_failed() {
	echo "Homebrew unexpectedly failed. See https://brew.sh" >&2
	return
}
fetch_failed() {
	echo "Could not fetch ed source with curl or wget." >&2
	return
}
brew install pcre2 || brew_failed
url=http://mirrors.kernel.org/gnu/ed/ed-1.16.tar.lz
curl -O  $url || wget $url || fetch_failed
wait
tar xzf ed-1.16.tar.lz
cd ed-1.16
printf %s\n "/CFLAGS/s=O2=O2 -I/usr/local/include" "/LDFLAGS/s=\$=\-L/usr/local/lib -lpcre2-posix -lpcre2-8" w q | ed configure
printf %s\n /regex.h/s//pcre2posix.h/ w q | ed regex.c
./configure && make && cp ed ../pcre-ed && echo "Success!"
