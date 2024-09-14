//
//  UserSessionAuthenticator.swift
//
//
//  Created by Christopher Liudahl-Rackley on 9/14/24.
//

import Vapor
import Fluent

struct UserSessionAuthenticator: AsyncSessionAuthenticator
{
    typealias User = AuthenticatedUser
    
    func authenticate(sessionID: UUID, for req: Request) async throws
    {
        guard let user = try await UserAccountModel
            .find(sessionID, on: req.db) else { return }
        
        req.auth.login(
            AuthenticatedUser(id: user.id!, email: user.email)
        )
    }
}
