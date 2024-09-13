//
//  WebLinkContext.swift
//
//
//  First we create the context
//  Then we create the template
//  Finally we add it to the controller


public struct WebLinkContext {
    
    public let label: String
    public let url: String
    
    public init(label: String, url: String) {
        self.label = label
        self.url = url
    }
}
