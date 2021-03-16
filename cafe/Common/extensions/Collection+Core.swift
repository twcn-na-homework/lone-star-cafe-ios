extension Collection {
    public func mapWithIndex<T>(_ transform: (Self.Element, _ index: Int) throws -> T) rethrows -> [T] {
       var idx = 0
        return self.map{ element -> T in
            let val = try! transform(element, idx)
            idx += 1
            return val
        }
    }
}