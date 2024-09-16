#include <stdio.h>
#include <time.h>

int main() 
{
    time_t t;
    struct tm *tmp;
    char time_str[100], date_str[100];

    time(&t);
    tmp = localtime(&t);

    strftime(date_str, sizeof(date_str), "%B %d, %Y", tmp);
    strftime(time_str, sizeof(time_str), "%I:%M %p", tmp);

    printf("Current Date and Time:\n");
    printf("%s\n%s\n", date_str, time_str);

    return 0;
}
