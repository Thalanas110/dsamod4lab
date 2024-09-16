#include <stdio.h>

void count_duplicates(char *str) 
{
    int freq[256] = {0};
    int i = 0;

    while (str[i] != '\0') 
    {
        freq[(unsigned char)str[i]]++;
        i++;
    }

    printf("The duplicate characters and counts are:\n");
    for (i = 0; i < 256; i++) 
    {
        if (freq[i] > 1) 
        {
            printf("%c appears %d times\n", i, freq[i]);
        }
    }
}

int main() 
{
    char str[] = "resourceful";
    printf("The given string is: %s\n", str);
    count_duplicates(str);
    return 0;
}
