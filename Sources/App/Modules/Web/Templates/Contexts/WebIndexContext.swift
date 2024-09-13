//
//  WebIndexContext.swift
//
//
//  This context struct will hold the information that will be
//  passed through the template. This is supposed to represent the
//  index.html file which is the first file that is loaded.
//
//  Its probably best to first make the template to get the layout
//  then create this context file second so you know what will
//  go where.

public struct WebIndexContext {
    
    public let title: String
    public let message: String
    
    public init(
        title: String,
        message: String
    ) {
        self.title = title
        self.message = message
    }
}
