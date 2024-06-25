#include <stdio.h>

void rotate(short int mat[][4])
{ int N=4;
    // Consider all squares one by one
    for (int x = 0; x < N / 2; x++) {
        // Consider elements in group
        // of 4 in current square
        for (int y = x; y < N - x - 1; y++) {
            // Store current cell in
            // temp variable
           short int temp = mat[x][y];
 
            // Move values from right to top
            mat[x][y] = mat[y][N - 1 - x];
 
            // Move values from bottom to right
            mat[y][N - 1 - x]
                = mat[N - 1 - x][N - 1 - y];
 
            // Move values from left to bottom
            mat[N - 1 - x][N - 1 - y]
                = mat[N - 1 - y][x];
 
            // Assign temp to left
            mat[N - 1 - y][x] = temp;
        }
    }
}
 
// Function to print the matrix


int main(){

short int mat[4][4];
for(int i=0;i<4;i++){
    for(int j=0;j<4;j++)
    scanf("%hd",&mat[i][j]);
}

rotate(mat);

for(int i=0;i<4;i++){
    for(int j=0;j<4;j++)
    {printf("%hd ",mat[i][j]);}
    printf("\n");
}

return 0;

}