#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(){
    char *word=malloc(sizeof(char)*20);
    scanf("%s",word);
    if(strcmp(word,"secretPASSWORD"))
        printf("%s\n","Login failed");
    else
        printf("%s\n","Login successfull");
}
