//
//  TemplateRenderer.swift
//
//
//  This template renderer will be initialized using a
//  Request Type, but when we call the renderHtml we will be
//  requiring the TemplateRepresentable that returns a Tag.
//
//  This is what we will be using to turn the SwiftHtml code
//  into the actual html that the browser will see.

import Vapor
import SwiftHtml


public struct TemplateRenderer {
    
    var req: Request
    
    init(_ req: Request)
    {
        self.req = req
    }
    
    public func renderHtml(
        _ template: TemplateRepresentable,
        minify: Bool = false,
        indent: Int = 4
    ) -> Response
    {
        let doc = Document(.html) {
            template.render(req)
        }
        
        let body = DocumentRenderer(
            minify: minify,
            indent: indent
        ).render(doc)
        
        return Response(
            status: .ok,
            headers: [
                "Content-Type": "text/html; charset=utf-8"
            ],
            body: .init(string: body)
        )
        
    }
    
}
