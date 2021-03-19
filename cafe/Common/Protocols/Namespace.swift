struct Namespace<T> {
    let value: T
    init(val: T) {
        value = val
    }
}

protocol NamespaceConvertible {
    associatedtype Value
    var ext: Value { get }
}

extension NamespaceConvertible {
    var ext: Namespace<Self> {
        Namespace(val: self)
    }
}