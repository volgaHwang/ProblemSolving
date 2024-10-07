class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        
        // Ensure nums1 is the smaller array
        if m > n {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        var imin = 0
        var imax = m
        let halfLen = (m + n + 1) / 2
        
        while imin <= imax {
            let i = (imin + imax) / 2
            let j = halfLen - i
            
            if i < m && nums2[j - 1] > nums1[i] {
                // i is too small, must increase it
                imin = i + 1
            } else if i > 0 && nums1[i - 1] > nums2[j] {
                // i is too big, must decrease it
                imax = i - 1
            } else {
                // i is perfect
                var maxLeft = 0
                if i == 0 {
                    maxLeft = nums2[j - 1]
                } else if j == 0 {
                    maxLeft = nums1[i - 1]
                } else {
                    maxLeft = max(nums1[i - 1], nums2[j - 1])
                }
                
                if (m + n) % 2 == 1 {
                    return Double(maxLeft)
                }
                
                var minRight = 0
                if i == m {
                    minRight = nums2[j]
                } else if j == n {
                    minRight = nums1[i]
                } else {
                    minRight = min(nums1[i], nums2[j])
                }
                
                return Double(maxLeft + minRight) / 2.0
            }
        }
        return 0.0
    }
}