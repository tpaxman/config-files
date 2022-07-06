# Regex

- Basic vs. Extended Regular Expressions:
    - In basic regular expressions these meta-characters lose their meaning: `? + { | ( )`
    - instead use the backslashed versions: `\? \+ \{ \| \( and \)`
    - [Grep manual](https://www.gnu.org/software/grep/manual/html_node/Basic-vs-Extended.html)
    - [Open Group base specs:](https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html#tag_09_03)
    - [Basic regular expressions (POSIX based) - why Vim has to escape brackets](https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html#tag_09_03)

- [replace uppercase with lowercase](https://stackoverflow.com/questions/20742076/regex-replace-uppercase-with-lowercase-letters/26742430#26742430)
    - find all uppercase: `([A-Z])(.*)`
    - `L$1$2` --> will convert all letters in `$1` and `$2` to lowercase
    - `l$1$2` --> will only convert the first letter of `$1` to lowercase and leave everything else as is
    - The same goes for uppercase with `U` and `u`


