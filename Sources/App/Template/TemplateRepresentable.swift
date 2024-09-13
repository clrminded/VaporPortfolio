//
//  TemplateRespresentable.swift
//
//
//  Since we will be creating out own templates
//  This is the reusable template protocol that we will use
//  so all the templates we create require a render method.
//
//  A TagBuilder is from SwiftHtml which will allow us to use
//  HTML tags like they are statements in Swift

import Vapor
import SwiftHtml

public protocol TemplateRepresentable 
{
    
    @TagBuilder
    func render(_ req: Request) -> Tag
}
