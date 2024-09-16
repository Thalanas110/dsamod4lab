#include <stdio.h>
#include <ctype.h>

int sum_of_digits(char *str) 
{
    int sum = 0;
    int i = 0;

    while (str[i] != '\0') 
    {
        if (isdigit((unsigned char)str[i])) 
        {
            sum += str[i] - '0';
        }
        i++;
    }

    return sum;
}

int main() 
{
    char str[] = "ab5c2d4ef12s";
    printf("The given string is: %s\n", str);
    printf("The sum of the digits in the string is: %d\n", sum_of_digits(str));
    return 0;
}
