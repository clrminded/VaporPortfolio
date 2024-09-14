//
//  UserCredentialsAuthenticator.swift
//
//
//  When a user has provided a correct email password combo
//  that is called credential-based authentication.
//  We use these values to perform a lookup inside the accounts
//  table to check if its an existing record or not and see if
//  the fields match. The login is then successful. This is a
//  standalone CredentialsAuthenticator.

import Vapor
import Fluent

struct UserCredentialsAuthenticator: AsyncCredentialsAuthenticator
{
    struct Credentials: Content
    {
        let email: String
        let password: String
    }
    
    func authenticate(credentials: Credentials, for req: Request) async throws
    {
        guard let user = try await UserAccountModel
            .query(on: req.db)
            .filter(\.$email == credentials.email)
            .first()
        else { return }
        
        do
        {
            guard 
                try Bcrypt.verify(credentials.password, created: user.password
                ) else { return }
            req.auth.login(
                AuthenticatedUser(id: user.id!, email: user.email)
            )
        }
        catch {
            // do nothing...
        }
    }
}
