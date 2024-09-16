#include <stdio.h>
#include <string.h>

void print_permutations(char *str, int n, int len) 
{
    if (n == len) 
    {
        str[len] = '\0';  // Null-terminate the string
        printf("%s\n", str);
        return;
    }

    for (char ch = 'P'; ch <= 'R'; ++ch) 
    {
        str[n] = ch;
        print_permutations(str, n + 1, len);
    }
}

int main() 
{
    char str[4];
    printf("The given string is: PQR\n");
    printf("The permuted strings are:\n");
    print_permutations(str, 0, 3);
    return 0;
}
