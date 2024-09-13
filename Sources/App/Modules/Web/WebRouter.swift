//
//  WebRouter.swift
//
//
//  This makes the connection between the router and the controller.
//  We dont want to put everything in the routes or config file;
//  If we have alot of routes, we want to split them up into
//  collections.
//  You will register the routes using a routes object using
//  a boot protocol provided by RouteCollection protocol

import Vapor

struct WebRouter: RouteCollection {
    
    let frontEndController = WebFrontendController()
    
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: frontEndController.homeView)
    }
    
}
