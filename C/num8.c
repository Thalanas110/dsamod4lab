#include <stdio.h>
#include <string.h>

void print_palindrome(char *str, int low, int high) 
{
    for (int i = low; i <= high; ++i) 
    {
        putchar(str[i]);
    }
}

int longest_palindrome(char *str) 
{
    int maxLength = 1, start = 0;
    int len = strlen(str);

    for (int i = 0; i < len; ++i) 
    {
        for (int j = i; j < len; ++j) 
        {
            int flag = 1;

            for (int k = 0; k < (j - i + 1) / 2; ++k)
                if (str[i + k] != str[j - k])
                    flag = 0;

            if (flag && (j - i + 1) > maxLength) 
            {
                start = i;
                maxLength = j - i + 1;
            }
        }
    }

    printf("The longest palindrome substring in the given string is: ");
    print_palindrome(str, start, start + maxLength - 1);
    printf("\nThe length of the palindromic substring is: %d\n", maxLength);
    return maxLength;
}

int main() 
{
    char str[] = "thequickbrownfoxxofnworbquickthe";
    printf("The given string is: %s\n", str);
    longest_palindrome(str);
    return 0;
}
