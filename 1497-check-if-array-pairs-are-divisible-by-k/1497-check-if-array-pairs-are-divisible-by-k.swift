class Solution {
  func canArrange(_ arr: [Int], _ k: Int) -> Bool {
      var remainderCounts = [Int](repeating: 0, count: k)
      
      // Step 1: Calculate remainders and count frequencies
      for num in arr {
          // Handle negative numbers to get positive remainders
          let remainder = ((num % k) + k) % k
          remainderCounts[remainder] += 1
      }
      
      // Step 2: Check for pairing possibilities
      // Check for remainder 0
      if remainderCounts[0] % 2 != 0 {
          return false
      }
      
      // If k is even, check for remainder k/2
      if k % 2 == 0 {
          if remainderCounts[k / 2] % 2 != 0 {
              return false
          }
      }
      
      // Check for other remainders
      for r in 1..<(k / 2 + 1) {
          if remainderCounts[r] != remainderCounts[k - r] {
              return false
          }
      }
      
      return true
  }
}