//
//  main.swift
//  ProblemSovingArchive
//
//  Created by kakao on 2023/08/29.
//

import Foundation

class MyStack {
    var q1: [Int] = []
    var q2: [Int] = []
    var idx = false
    init() {
        q1 = []
        q2 = []
    }
    
    func push(_ x: Int) {
        if !idx {
            if let top = q2.last {
                q1.append(top)
                q2.removeLast()
            }
            q2.append(x)
        } else {
            if let top = q1.last {
                q2.append(top)
                q1.removeLast()
            }
            q1.append(x)
        }
    }
    
    func pop() -> Int {
        var last = 0
        if !idx {
            // q2에 마지막이 있음
            last = q2.removeLast()
            while q1.count > 1 {
                let v = q1.removeFirst()
                q2.append(v)
            }
        } else {
            // q1에 마지막이 있음
            last = q1.removeLast()
            while q2.count > 1 {
                let v = q2.removeFirst()
                q1.append(v)
            }
        }
        idx.toggle()
        return last
    }
    
    func top() -> Int {
        if !idx {
            return q2.last!
        } else {
            return q1.last!
        }
    }
    
    func empty() -> Bool {
        return q1.isEmpty && q2.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
