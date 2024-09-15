//
//  FormTemplate.swift
//
//
//  We will use the FormContext to render the form with
//  the associated fields.
//  We have to iterate through the form fields and call
//  the render method on TemplateRepresentable protocol

import Vapor
import SwiftHtml

public struct FormTemplate: TemplateRepresentable
{
    var context: FormContext
    
    public init(_ context: FormContext)
    {
        self.context = context
    }
    
    @TagBuilder
    public func render(_ req: Request) -> Tag 
    {
        Form
        {
            if let error = context.error {
                Section
                {
                    P(error)
                        .class("error")
                }
            }
            
            for field in context.fields
            {
                Section
                {
                    field.render(req)
                }
            }
            
            Section
            {
                Input()
                    .type(.submit)
                    .value(context.submit ?? "Save")
            }
        }
        .method(context.action.method)
        .action(context.action.url)
        .enctype(context.action.enctype)
    }
}
