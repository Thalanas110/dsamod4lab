#include <stdio.h>
#include <string.h>

int main() 
{
    char str[] = "The quick brown fox jumps over the lazy dog.";
    char new_str[100];

    printf("Original string: %s\n", str);

    strcpy(new_str, str);
    char *p = strstr(new_str, "fox");
    if (p != NULL) 
    {
        strncpy(p, "cat", 3);
    }

    printf("New string: %s\n", new_str);

    return 0;
}
