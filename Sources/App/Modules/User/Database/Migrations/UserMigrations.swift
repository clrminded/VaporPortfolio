//
//  UserMigrations.swift
//
//  2)
//  Before we can use the model, we need a matching migration to
//  create the table in the database for the users.
//  We will make the email unique because every person should have
//  one login.
//  The passwords will be stored as encrypted strings.
//  We will also set up a seed to create a root user account.

import Vapor
import Fluent
enum UserMigrations
{        
    struct v1: AsyncMigration
    {                
        func prepare(on db: Database) async throws 
        {
            try await db.schema(UserAccountModel.schema)
                .id()
                .field(UserAccountModel.FieldKeys.v1.email, .string, .required)
                .field(UserAccountModel.FieldKeys.v1.password, .string, .required)
                .unique(on: UserAccountModel.FieldKeys.v1.email)
                .create()
        }
        
        func revert(on db: Database) async throws  
        {
            try await db.schema(UserAccountModel.schema).delete()
        }
    }
    
    struct seed: AsyncMigration
    {                
        func prepare(on db: Database) async throws
        {
            let email = "root@localhost.com"
            let password = "ChangeMe1"
            let user = UserAccountModel(
                email: email,
                password: try Bcrypt.hash(password)
            )
            
            try await user.create(on: db)
        }
        
        func revert(on db: Database) async throws
        {
            try await UserAccountModel.query(on: db).delete()
        }
    }
}



