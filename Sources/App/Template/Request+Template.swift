//
//  Request+Template.swift
//
//
//  Extending the Request object to get an instance of the renderer.

import Vapor

public extension Request {
    var templates: TemplateRenderer { .init(self) }
}
