import Vapor
import SwiftHtml


func routes(_ app: Application) throws {

    app.routes.get { req async -> Response in
        
        req.templates.renderHtml(
            WebIndexTemplate(
                WebIndexContext(
                    title: "Home",
                    message: "Hi there, welcome to my page!"
                )
            )
        )
        
    }
}
