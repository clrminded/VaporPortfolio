//
//  FormAction.swift
//
//  This is to configure the form action
//  After creating this we can now define an AbstractForm class
//  that can store all the available form plus form action.


import SwiftHtml

public struct FormAction
{
    public var method: SwiftHtml.Method
    public var url: String?
    public var enctype: SwiftHtml.Enctype?
    
    public init(
        method: SwiftHtml.Method = .post,
        url: String? = nil,
        enctype: SwiftHtml.Enctype? = nil
    ) {
        self.method = method
        self.url = url
        self.enctype = enctype
    }
}
