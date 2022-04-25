import Foundation
import Apollo

class NetInterceptorProvider: DefaultInterceptorProvider {
    
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        return super.interceptors(for: operation)
    }
}
