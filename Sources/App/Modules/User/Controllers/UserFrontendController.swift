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

    private func renderSignInView(
        _ req: Request,
        _ form: UserLoginForm
    ) -> Response
    {
        let template = UserLoginTemplate(
            .init(
                icon: "⬇️",
                title: "Sign in",
                message: "Please log in with your existing account",
                form: form.render(req: req)
            )
        )
        return req.templates.renderHtml(template)
    }
    
    
    func signInView(_ req: Request) async throws -> Response
    {
        renderSignInView(req, .init())
    }
    
    func signInAction(_ req: Request) async throws -> Response
    {
        /// if the user is authenticated, we can store the user data inside the session too
        if let user = req.auth.get(AuthenticatedUser.self)
        {
            req.session.authenticate(user)
            return req.redirect(to: "/")
        }
        let form = UserLoginForm()
        try await form.process(req: req)
        let isValid = try await form.validate(req: req)
        if !isValid {
            form.error = "Invalid email or password."
        }
        return renderSignInView(req,form)
    }
    
    func signOut(req: Request) throws -> Response
    {
        req.auth.logout(AuthenticatedUser.self)
        req.session.unauthenticate(AuthenticatedUser.self)
        // req.session.destroy()
        return req.redirect(to: "/")
    }
}
