#include <stdio.h>
#include <string.h>

int is_present(char ch, char *mask) 
{
    for (int i = 0; mask[i] != '\0'; i++) 
    {
        if (ch == mask[i]) 
        {
            return 1;
        }
    }
    return 0;
}

void remove_duplicates(char *str, char *mask) 
{
    char result[100];
    int k = 0;

    for (int i = 0; str[i] != '\0'; i++) 
    {
        if (!is_present(str[i], mask)) 
        {
            result[k++] = str[i];
        }
    }
    result[k] = '\0';
    printf("The new string is: %s\n", result);
}

int main() 
{
    char str[] = "the quick brown fox";
    char mask[] = "queen";

    printf("The given string is: %s\n", str);
    printf("The given mask string is: %s\n", mask);

    remove_duplicates(str, mask);

    return 0;
}
