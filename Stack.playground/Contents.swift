import Foundation

struct Stack<T> {
    private var array: [T] = []
    private let maxSize: Int
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    init(maxSize: Int) {
        self.maxSize = maxSize
    }
    
    mutating func push(_ element: T) throws {
        if count == maxSize {
            throw StackError.overflow
        }
        array.append(element)
    }
    
    mutating func pop() throws -> T? {
        if isEmpty {
            throw StackError.underflow
        }
        return array.popLast()
    }
    
    func peek() -> T? {
        return array.last
    }
}

enum StackError: Error {
    case overflow
    case underflow
}

//Visualisation purposes only
extension Stack: CustomStringConvertible{
    var description: String {
        let topDevider = "-------Top-------\n"
        let bottomDevider = "\n-------Bottom-------"
        let stackElements =  array.map{"\($0)"}.reversed().joined(separator: "\n")
        return topDevider + stackElements + bottomDevider
    }
}

var stack = Stack<Int>(maxSize: 5)
try stack.push(1)
try stack.push(2)
try stack.push(3)
print(stack)

try stack.pop()!
try stack.pop()!
stack.peek()!

print(stack)
