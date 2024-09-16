#include <stdio.h>
#include <string.h>

int main() 
{
    char str1[] = "This is Exercise 1";
    char str2[] = "This is Exercise 2";
    
    printf("String 1: %s\n", str1);
    printf("String 2: %s\n", str2);
    
    if (strcmp(str1, str2) < 0)
        printf("\"%s\" is less than \"%s\"\n", str1, str2);
    else if (strcmp(str1, str2) == 0)
        printf("\"%s\" is equal to \"%s\"\n", str1, str2);
    else
        printf("\"%s\" is greater than \"%s\"\n", str1, str2);
    
    return 0;
}
