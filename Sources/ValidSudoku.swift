
public class ValidSudokuSolution {
    public init() {}
    public func validSudoku(board: [[String]]) -> Bool {
        var rows: [Int: [String]] = [:]
        var columns: [Int: [String]] = [:]
        var squares: [String: [String]] = [:] // Key is "\(rowIndex/3)\(columnIndex/3)"
        /// 00, 01, 02, 03, 10, 11, 12, 20, 21, 22
        
        /// Iterate through 2D sudoku board
        for (rowIndex, row) in board.enumerated() {
            for (columnIndex, element) in row.enumerated() {
                /// ignore unfilled values represented as "."
                if element == "." {
                    continue
                }
                
                let squareIndex = "\(rowIndex/3)\(columnIndex/3)"
                let rowDuplicateFound = rows[rowIndex]?.contains(element) ?? false
                let columnDuplicateFound = columns[columnIndex]?.contains(element) ?? false
                let squareDuplicateFound = squares[squareIndex]?.contains(element) ?? false
                
                /// If the element is already in any of the dictionaries ( rows or columns or squares )
                ///  it means duplicates are present and the board is not valid
                ///  else continue to iterate
                if rowDuplicateFound || columnDuplicateFound || squareDuplicateFound {
                    return false
                }
                
                /// 1. Rows
                if let _ = rows[rowIndex] {
                    rows[rowIndex]?.append(element)
                } else {
                    rows[rowIndex] = [element]
                }
                /// 2. Columns
                if let _ = columns[columnIndex] {
                    columns[columnIndex]?.append(element)
                } else {
                    columns[columnIndex] = [element]
                }
                /// 3. Squares
                if let _ = squares[squareIndex] {
                    squares[squareIndex]?.append(element)
                } else {
                    squares[squareIndex] = [element]
                }
            }
        }
        return true
    }
}

