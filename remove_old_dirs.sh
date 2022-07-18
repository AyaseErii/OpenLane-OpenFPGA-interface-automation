find -type d ! -wholename $(find -type d -printf '%T+ %p\n' | sort -r | head -1 | cut -d" " -f2) ! -wholename "." -exec rm -r {} +
// https://creativecommons.org/licenses/by-sa/3.0/
// Released by Wayne_Yux under the CC BY-SA 3.0 license
