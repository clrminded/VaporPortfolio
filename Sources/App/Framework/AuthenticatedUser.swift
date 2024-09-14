//
//  AuthenticatedUser.swift
//
//
//  There is a login and logout method defined on the request
//  authentication object. This will help us code the login and
//  logout endpoints.
//
//  The req.session server different purpose than req.auth, session
//  objects are persisted on the client side using a cookie and
// tracked during the session to allow us to keep users signed in.

import Vapor

public struct AuthenticatedUser
{
    public let id: UUID
    public let email: String
    
    public init(id: UUID, email: String) {
        self.id = id
        self.email = email
    }
}

extension AuthenticatedUser: SessionAuthenticatable {
    public var sessionID: UUID { id }
}
