//
//  AbstractForm.swift
//
//  Since swift wont allow us to store an [AbstractForm<Input, Output>]
//  array because its a generic class with unknown Input and Output,
//  for now we will use Any placeholder


import Vapor

open class AbstractForm
{
    open var action: FormAction
    open var fields: [Any]
    open var error: String?
    open var submit: String?
    
    public init(
        action: FormAction = .init(),
        fields: [Any] = [],
        error: String? = nil,
        submit: String? = nil
    ) {
        self.action = action
        self.fields = fields
        self.error = error
        self.submit = submit
        
        self.action.enctype = .multipart
    }
}
