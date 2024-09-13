//
//  WebLinkTemplate.swift
//
//
//  The reason we have to create the context before the template
//  is because we use that information in the Template as a
//  variable.
//

import Vapor
import SwiftHtml

struct WebLinkTemplate: TemplateRepresentable {
    
    var context: WebLinkContext
    
    init(_ context: WebLinkContext) {
        self.context = context
    }
    
    @TagBuilder
    func render(
        _ req: Request
    ) -> Tag {
        A(context.label)
            .href(context.url)
    }
}
