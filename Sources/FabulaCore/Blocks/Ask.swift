import Foundation

public struct Ask: Fabula, Suspendable, Presentable {
    public typealias Body = Never
    
    public init(_ text: String, key: String) {
        self.text = text
        self.key = key
    }
    
    public var id: String { key }
    public let text: String
    
    /// The key associated to the user input
    public let key: String
}

extension Ask {
    public func run(in context: inout BotContext) async throws {
        context.bot.userProps.add(input: key, value: "")
        try await context.bot.present(self)
        try await context.bot.suspend(at: self)
    }
}

extension Ask: Composable {
    public func accept(_ composer: Composer, parent: Node?) -> Node? {
        composer.compose(self, parent: parent)
    }
}

