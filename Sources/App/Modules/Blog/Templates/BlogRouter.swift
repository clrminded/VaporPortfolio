//
//  BlogRouter.swift
//
//
//  Created by Christopher Liudahl-Rackley on 9/13/24.
//

import Vapor

struct BlogRouter: RouteCollection {
    
    let controller = BlogFrontendController()
    
    func boot(routes: RoutesBuilder) throws {
        routes.get("blog", use: controller.blogView)
        routes.get(.anything, use: controller.postView)
    }
}
