//
//  UserFrontendController.swift
//
//
//  The controllers are for the dummy information that will be
//  passed on through the controller that doesnt involve the
//  context.

import Vapor

struct UserFrontendController
{
    func signInView(_ req: Request) async throws -> Response
    {
        let template = UserLoginTemplate(
            .init(
                icon: "⬇️",
                title: "Sign in",
                message: "Please log in with your existing account"
            )
        )
        return req.templates.renderHtml(template)
    }
    
    func signInAction(_ req: Request) async throws -> Response
    {
        // @TODO: handle sign in action
        try await signInView(req)
    }
}
