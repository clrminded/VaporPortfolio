import Vapor
import SwiftHtml

/*
 The MyTemplate struct conforms to the TemplateRepresentable
 protocol. Then we introduce a contextual variable called title.
 We can pass the context to our template when we initialize it,
 and we can access the title in the render method.
 
 since we added the extension to Response we can now call
 req.templates.renderHtml() to return an HTML response.
 */

struct MyTemplate: TemplateRepresentable {
    
    let title: String
    
    func render(_ req: Request) -> Tag 
    {
        Html
        {
            Head
            {
                Title(title)
            }
            
            Body
            {
                H1(title)
            }
        }
    }
}

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.routes.get("hello") { req async -> Response in
        
        req.templates.renderHtml(
            MyTemplate(title: "Hello World!")
        )
        
    }
}
