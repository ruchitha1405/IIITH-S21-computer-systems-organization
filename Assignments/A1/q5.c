#include <stdio.h>

 
// Function to calculate hamming distance
 int  hammingDist(int a, int b);

// Driver code
int main()
{
    int a,b;
    scanf("%d %d",&a,&b);
    printf("%d\n",hammingDist(a,b));
 
    return 0;
}