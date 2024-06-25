// C program for insertion sort
#include <math.h>
#include <stdio.h>
 
/* Function to sort an array using insertion sort*/
void insertionSort(short int arr[], int n)
{
    int i, j;
    short int  key;
    i = 1;
    while ( i < n ) {
        key = arr[i];
        j = i - 1;
 
        /* Move elements of arr[0..i-1], that are
          greater than key, to one position ahead
          of their current position */
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = key;
        i++;
    }
}
 
// A utility function to print an array of size n
void printArray(short int arr[], int n)
{
    int i;
    for (i = 0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n");
}
 
/* Driver program to test insertion sort */
int main()
{
    short int arr[] = { 12, 11, 13, 5, 6 };
    int n = sizeof(arr) / sizeof(arr[0]);
 
    insertionSort(arr, n);
    printArray(arr, n);
 
    return 0;
}