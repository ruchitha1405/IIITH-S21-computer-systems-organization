#include <stdio.h>
void rotate(short int  mat[][8]);
/*void rotate(short int  mat[][8])
{ 
    // Consider all squares one by one
    int x = 0;int y=0;
    while ( x < 4) {
        // Consider elements in group
        // of 4 in current square
         y = x;
        while( y < 7 - x ) {
            // Store current cell in
            // temp variable
           short int temp = mat[x][y];
 
            // Move values from right to top
            mat[x][y] = mat[y][7 - x];
 
            // Move values from bottom to right
            mat[y][7 - x]
                = mat[7 - x][7 - y];
 
            // Move values from left to bottom
            mat[7 - x][7 - y]
                = mat[7 - y][x];
 
            // Assign temp to left
            mat[7- y][x] = temp;

            y++;
        }
        x++;
    }
}
 */
// Function to print the matrix


int main(){

short int mat[8][8];
printf("\nenter a 8*8 matrix:\n\n");
for(int i=0;i<8;i++){
    for(int j=0;j<8;j++)
    scanf("%hd",&mat[i][j]);
}

rotate(mat);
printf("\nMatrix after 90degree anti clockwise rotation:\n\n");
for(int i=0;i<8;i++){
    for(int j=0;j<8;j++)
    {printf("%hd ",mat[i][j]);}
    printf("\n");
}

return 0;

}


/*for (int i = 0; i < 4; i++)
    {
        for (int j = i; j < N - i - 1; j++)
        {

            // Swap elements of each cycle
            // in clockwise direction
            // int temp = a[i][j];
            // a[i][j] = a[N - 1 - j][i];
            // a[N - 1 - j][i] = a[N - 1 - i][N - 1 - j];
            // a[N - 1 - i][N - 1 - j] = a[j][N - 1 - i];
            // a[j][N - 1 - i] = temp;
            int temp = a[j][N - 1 - i];
            a[j][N - 1 - i] = a[N - 1 - i][N - 1 - j];
            a[N - 1 - i][N - 1 - j] = a[N - 1 - j][i];
            a[N - 1 - j][i] = a[i][j];
            a[i][j] = temp;
        }
    }
}*/
/*1 1 1 1 1 1 1 1

 1 1 1 1 1 1 1 1

 1 1 1 1 1 1 1 1

 1 1 1 1 1 1 1 1

 1 1 1 1 1 1 1 1

 1 1 1 1 1 1 1 1

 1 1 1 1 1 1 1 1

 1 1 1 1 1 1 1 1*/