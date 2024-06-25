#include <stdio.h>

 
// Function to calculate hamming distance
short int  hammingDist(short int a, short int b);
    

// Driver code
int main()
{
   short int a,b;
   printf("enter two numbers :");
    scanf("%hi %hi",&a,&b);
    printf("hamming distance is %hi\n",hammingDist(a,b));
 
    return 0;
}