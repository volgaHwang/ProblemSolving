//
//  132 Pattern.swift
//  ProblemSolving
//
//

import Foundation

class Solution {
    let INF = 98765432110
    func find132pattern(_ nums: [Int]) -> Bool {
        var last = -INF
        var stack: [Int] = []
        for i in (0..<nums.count).reversed() {
            if nums[i] < last { return true }
            else {
                while !stack.isEmpty, nums[i] > stack.last! {
                    last = stack.last!
                    stack.popLast()
                }
            }
            stack.append(nums[i])
        }
        return false
    }
}
