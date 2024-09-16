#include <stdio.h>
#include <string.h>
#include <ctype.h>

int str_case_cmp(const char *s1, const char *s2) 
{
    while (*s1 && *s2) 
    {
        if (tolower(*s1) != tolower(*s2))
            return 0;
        s1++;
        s2++;
    }
    return *s1 == *s2;
}

int main() 
{
    char str1[] = "Stephen Edwin King";
    char str2[] = "Walter Winchell";
    char str3[] = "stephen edwin king";
    
    printf("\"%s\" equals \"%s\"? %s\n", str1, str2, str_case_cmp(str1, str2) ? "true" : "false");
    printf("\"%s\" equals \"%s\"? %s\n", str1, str3, str_case_cmp(str1, str3) ? "true" : "false");
    return 0;
}
