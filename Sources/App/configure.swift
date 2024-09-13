import Vapor

// configures your application
public func configure(_ app: Application) async throws {
   
    // Serves files from `Public/` directory
    let fileMiddleware = FileMiddleware(
        publicDirectory: app.directory.publicDirectory
    )
    app.middleware.use(fileMiddleware)
    
    // register routes
    try routes(app)
}
