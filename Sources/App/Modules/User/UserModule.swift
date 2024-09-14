//
//  UserModule.swift
//
//  3)
//  The usermodule registers the migrations from the database
//  into the application

import Vapor

struct UserModule: ModuleInterface
{
    func boot(_ app: Application) throws {
        app.migrations.add(UserMigrations.v1())
        app.migrations.add(UserMigrations.seed())
    }
}
