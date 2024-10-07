class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums1 = nums1
        var nums2 = nums2
        var m = nums1.count
        var n = nums2.count
        
        // nums1이 항상 작은 배열이 되도록 조정
        if m > n {
            swap(&nums1, &nums2)
            swap(&m, &n)
        }
        
        var imin = 0
        var imax = m
        let halfLen = (m + n + 1) / 2
        
        while imin <= imax {
            let i = (imin + imax) / 2
            let j = halfLen - i
            
            if i < m && nums2[j - 1] > nums1[i] {
                // i가 너무 작으므로 증가시킵니다.
                imin = i + 1
            } else if i > 0 && nums1[i - 1] > nums2[j] {
                // i가 너무 크므로 감소시킵니다.
                imax = i - 1
            } else {
                // i가 적절한 경우
                var maxLeft: Int
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
                
                var minRight: Int
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