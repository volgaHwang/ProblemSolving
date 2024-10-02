class Solution {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        // Step 1: Get unique elements
        let uniqueElements = Set(arr)
        
        // Step 2: Sort the unique elements
        let sortedUniqueElements = uniqueElements.sorted()
        
        // Step 3: Assign ranks to the elements
        var rankDict = [Int: Int]()
        for (index, element) in sortedUniqueElements.enumerated() {
            rankDict[element] = index + 1
        }
        
        // Step 4: Transform the original array with ranks
        let rankedArray = arr.map { rankDict[$0]! }
        return rankedArray
    }
}
