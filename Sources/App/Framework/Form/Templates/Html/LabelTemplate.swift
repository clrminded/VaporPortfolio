//
//  LabelTemplate.swift
//
//
//  We need a template to render a context object.
//  The key property will be used for the input field identification
//  The title property will be used to print out the actual label
//  The required flag will mark a required input feild with an *
//  The more value will display addition into.

import Vapor
import SwiftHtml

public struct LabelTemplate: TemplateRepresentable
{
    var context: LabelContext
    
    public init(_ context: LabelContext) {
        self.context = context
    }
    
    @TagBuilder
    public func render(_ req: Request) -> Tag 
    {
        Label
        {
            Text(context.title ?? context.key.capitalized)
            
            if let more = context.more {
                Span(more)
                    .class("more")
            }
            if context.required {
                Span("*")
                    .class("required")
            }
        }
        .for(context.key)
    }
}
