
//Question: rotate a 2D array (a matrix) of integers 90 degrees like the one below
//matrix will always be NxN
var matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

//function that rotates matrix
func rotateMatrix(matrix: [[Int]]) -> [[Int]] {
    //reverse matrix (make sure you add declaration)
    var reversedMatrix: [[Int]] = matrix.reversed()
    //iterate each array in matrix
    for i in 0...reversedMatrix.count - 1 {
        //iterate through each position at specific index
        for j in 0...i {
            let temp = reversedMatrix[i][j]
            reversedMatrix[i][j] = reversedMatrix[j][i]
            reversedMatrix[j][i] = temp
        }
    }
    return reversedMatrix
}

//helper to print matrix (provided)
func printMatrix(matrix: [[Int]]){
    for arr in matrix {
        print(arr)
    }
}

//Output
print("Original Matrix:")
printMatrix(matrix: matrix)
matrix = rotateMatrix(matrix: matrix)
print("Rotated Matrix:")
printMatrix(matrix: matrix)

