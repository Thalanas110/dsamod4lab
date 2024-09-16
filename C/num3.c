#include <stdio.h>
#include <string.h>

int main ()
{
    char str1[] = "example.com";
    char str2[] = "Example.com";

    printf("Compare %s and %s = %s\n", str1, str1, strcmp(str1, str1) == 0 ? "true" : "false");
    printf("Compare %s and %s = %s\n", str2, str1, strcmp(str2, str1) == 0 ? "true" : "false");

    return 0;
}