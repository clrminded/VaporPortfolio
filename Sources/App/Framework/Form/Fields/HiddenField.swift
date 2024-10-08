//
//  HiddenField.swift
//
//
// The actual hidden field class

import Vapor

public final class HiddenField: AbstractFormField<String, HiddenFieldTemplate>
{
    public convenience init(_ key: String)
    {
        self.init(
            key: key,
            input: "",
            output: .init(
                .init(key: key)
            )
        )
    }
    
    public override func process(req: Request) async throws 
    {
        try await super.process(req: req)
        output.context.value = input
    }
}
