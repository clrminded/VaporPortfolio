import Vapor
import SwiftHtml

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.routes.get("hello") { req async -> Response in
        let doc = Document(.html) {
            Html
            {
                Head
                {
                    Title("Hello World!")
                }
                Body
                {
                    H1("Hello, World!")
                }
            }
        }
        
        let body = DocumentRenderer(minify: false, indent: 4).render(doc)
        
        return Response(
            status: .ok,
            headers: [
                "Content-Type": "text/html; charset=utf-8"
            ],
            body: .init(string: body)
        )
    }
}
