import Vapor
import Fluent
import FluentSQLiteDriver

// configures your application
public func configure(_ app: Application) async throws {
    
    // configure database
    let dbPath = app.directory.resourcesDirectory + "db.sqlite"
    app.databases.use(.sqlite(.file(dbPath)), as: .sqlite)
   
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
