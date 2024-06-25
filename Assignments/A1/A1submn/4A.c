#include <stdio.h>
#include <string.h> 
void freq(char *a,int *b);

int main()
{
    
    char a[33]={'\0'};
    printf("enter a string of characters of length atmost 32:\n");
    scanf("%s",a);
    int b[26]={0};
    freq(a,b);
    for(int i=0;i<26;i++){
        printf("%c -> %d\n",(char)(i+97),b[i]);
    }
 
    return 0;
}
/*
void freq(char *a,int *b)
{ int i=0;
    
    while(i>=0 && i<32){
        if(97 <= a[i] && a[i]<=122)
        b[a[i]-97]++;
        i++;
    }
}
*/
/*
['z', 'q', 'J', 'x', 'C', 'C', 'S', 'Y', 'x', 'u', 'l', 'F',
 'P', 'U', 'U', 'd', 'f', 'W', 'p', 'W', 'Z', 'Q', 'e', 'b', 
 'u', 'H', 'A', 's', 'K', 'O', 'r', 'i']*/
 // zqJxCCSYxulFPUUdfWpWZQebuHAsKOri
 /* PHCsHkIWiGnSZlPuTCYVLDhwcSoZiuep*/
 /* mkpuwyirkpfmwoxgaqwdbmqwpixnybrj*/
 /* GZWCLFBFEBUIYCPNMAOVEXICHGFFAIAI*/