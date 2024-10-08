//
//  SelectFieldContext.swift
//
//
//  Created by Christopher Liudahl-Rackley on 9/16/24.
//

public struct SelectFieldContext
{        
    public let key: String
    public var label: LabelContext
    public var options: [OptionContext]
    public var value: String?
    public var error: String?
    
    public init(
        key: String,
        label: LabelContext? = nil,
        options: [OptionContext] = [],
        value: String? = nil,
        error: String? = nil
    ) {
        self.key = key
        self.label = label ?? .init(key: key)
        self.options = options
        self.value = value
        self.error = error
    }
    
}
