public struct BotContext {
    public init(bot: FabulaBot, input: String) {
        self.bot = bot
        self.input = input
    }
        
    /// The user input
    public var input: String
    
    public var bot: FabulaBot
    
    /// Injects the `bot.userInput` inside all matching tags `${some}`
    public func fill(_ text: String) -> String {
        Template(text).build(bot.userInput)
    }
}
