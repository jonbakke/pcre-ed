# GNU ed with PCRE2 regular expressions for macOS
This script will:

1. ask `brew` to install `pcre2`
1. use `curl` or `wget` to download the source for GNU `ed` 1.16
1. patch, configure, build that source, and
1. copy the ed binary to a pcre-ed executable in the working directory.

I suspect most folks who are interested in this will learn all they need to know from reading the script.

## Why PCRE?
This project began after I read the manual page for `ed` and wanted to use the word designators \\< and \\>. The mac/BSD `ed` manual page suggests that these might not be available. The GNU `info` manual clearly implies that they are. However, while these work on a GNU platform like my Debian box, it does not work on macOS, even with GNU `ed`, because the regex library does not support that enhanced feature.

Wanting to implement the feature, I found the POSIX-ish wrapper for PCRE2, and the rest of the story is even more boring.

PCRE2 regex forms are better, though, as one would expect. \\s is nicer than [[:blank:]], for instance.

## Why `ed`?
Three reasons, for now, for me:

Some people like `vi` because its command structure helps you move the cursor to the text you want to edit. Yes, it is better than holding down an arrow. However, `ed` doesn't even have a concept of "cursor" or "point," just "current line." I suspect using regular expressions to find the code I want to change will be even faster.

More importantly than speed, however, is mental focus. When I'm moving around in `ed`, I'm always thinking about the structure of the code. When I'm moving around in Xcode, I'm always thinking about the color and shape of the characters that represent the code. Surely, I will continue to use Xcode's autocomplete features when I'm working with Cocoa. But perhaps this experiment with `ed` will help me better grok the bases I'm trying to contribute to.

Finally, because I sometimes like having command-line context. Being able to perform my edits while reviewing my recent commands is quite nice for short notes like personal git commits.

## Not `ed`
Since PCRE expressions are not compatible with POSIX regex, it might cause problems to place a non-POSIX-compatible `ed` executable in $PATH. On my machines, I'm calling this program `ped` (to complement my `led`, which uses `ped` cooperatively with `less`.)
