//
//  UserModule.swift
//
//  3)
//  The usermodule registers the migrations from the database
//  into the application

import Vapor

struct UserModule: ModuleInterface
{
    let router = UserRouter()
    
    func boot(_ app: Application) throws {
        app.migrations.add(UserMigrations.v1())
        app.migrations.add(UserMigrations.seed())
        
        app.middleware.use(UserSessionAuthenticator())
        
        try router.boot(routes: app.routes)
    }
}
