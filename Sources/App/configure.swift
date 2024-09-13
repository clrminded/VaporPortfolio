import Vapor

// configures your application
public func configure(_ app: Application) async throws {
   
    // Serves files from `Public/` directory
    let fileMiddleware = FileMiddleware(
        publicDirectory: app.directory.publicDirectory
    )
    app.middleware.use(fileMiddleware)
    
    app.middleware.use(ExtendPathMiddleware())
    
    let routers: [RouteCollection] = [
        WebRouter(),
        BlogRouter(),
    ]
    
    for router in routers {
        try router.boot(routes: app.routes)
    }
}
