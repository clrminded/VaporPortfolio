//
//  AbstractForm.swift
//
//  Since swift wont allow us to store an [AbstractForm<Input, Output>]
//  array because its a generic class with unknown Input and Output,
//  for now we will use Any placeholder


import Vapor

open class AbstractForm: FormComponent
{
    open var action: FormAction
    open var fields: [FormComponent]
    open var error: String?
    open var submit: String?
    
    public init(
        action: FormAction = .init(),
        fields: [FormComponent] = [],
        error: String? = nil,
        submit: String? = nil
    ) {
        self.action = action
        self.fields = fields
        self.error = error
        self.submit = submit
        
        self.action.enctype = .multipart
    }
    
    open func load(req: Vapor.Request) async throws {
         for field in fields {
             try await field.load(req: req)
         }
    }
    
    open func process(req: Vapor.Request) async throws {
        for field in fields {
            try await field.process(req: req)
        }
    }
    
    open func validate(req: Vapor.Request) async throws -> Bool {
        var result: [Bool] = []
        for field in fields {
            result.append(try await field.validate(req: req))
        }
        return result.filter { $0 == false }.isEmpty
    }
    
    open func write(req: Vapor.Request) async throws {
        for field in fields {
            try await field.write(req: req)
        }
    }
    
    open func save(req: Vapor.Request) async throws {
        for field in fields {
            try await field.save(req: req)
        }
    }
    
    open func read(req: Vapor.Request) async throws {
        for field in fields {
            try await field.read(req: req)
        }
    }
    
    open func render(req: Vapor.Request) -> TemplateRepresentable {
        FormTemplate(
            .init(
                action: action,
                fields: fields.map { $0.render(req: req) },
                error: error,
                submit: submit
            )
        )
    }
}
