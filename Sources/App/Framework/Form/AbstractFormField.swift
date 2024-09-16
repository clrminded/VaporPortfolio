//
//  AbstractFormField.swift
//
//  This is just a generic template to display the actual form field.


import Vapor

open class AbstractFormField<
    Input: Decodable,
    Output: TemplateRepresentable>: FormComponent
{
    public var key: String
    public var input: Input
    public var output: Output
    public var error: String?
    
    // MARK: - event blocks
    // By using this alias we can simplify other function signatures alot
    public typealias FormFieldBlock =
    (Request, AbstractFormField<Input, Output>) async throws -> Void
    public typealias FormFieldValidatorsBlock =
    ((Request, AbstractFormField<Input, Output>) -> [AsyncValidator])
    
    private var readBlock: FormFieldBlock?
    private var writeBlock: FormFieldBlock?
    private var loadBlock: FormFieldBlock?
    private var saveBlock: FormFieldBlock?
    private var validatorBlock: FormFieldValidatorsBlock?
    
    // MARK: - init & config
    
    public init(
        key: String,
        input: Input,
        output: Output,
        error: String? = nil
    ) {
        self.key = key
        self.input = input
        self.output = output
        self.error = error
    }
    
    open func config(
        _ block: (AbstractFormField<Input, Output>) -> Void
    ) -> Self
    {
        block(self)
        return self
    }
    
    // MARK: - Block setters
    
    open func read(_ block: @escaping FormFieldBlock) -> Self {
        readBlock = block
        return self
    }
    
    open func write(_ block: @escaping FormFieldBlock) -> Self {
        writeBlock = block
        return self
    }
    
    open func load(_ block: @escaping FormFieldBlock) -> Self {
        loadBlock = block
        return self
    }
    
    open func save(_ block: @escaping FormFieldBlock) -> Self {
        saveBlock = block
        return self
    }
    
    open func validators(
        @AsyncValidatorBuilder _ block: @escaping FormFieldValidatorsBlock
    ) -> Self {
        validatorBlock = block
        return self
    }
    
    // MARK: - FormComponent
    
    open func process(req: Vapor.Request) async throws {
        if let value = try? req.content.get(Input.self, at: key) {
            input = value
        }
    }
    
    open func validate(req: Vapor.Request) async throws -> Bool {
        guard let validators = validatorBlock else {
            return true
        }
        return await RequestValidator(validators(req, self)).isValid(req)
    }
    
    open func read(req: Vapor.Request) async throws {
        try await readBlock?(req, self)
    }
    
    open func write(req: Vapor.Request) async throws {
        try await writeBlock?(req, self)
    }
    
    open func load(req: Vapor.Request) async throws {
        try await loadBlock?(req, self)
    }
    
    open func save(req: Vapor.Request) async throws {
        try await saveBlock?(req, self)
    }
    
    open func render(req: Vapor.Request) -> TemplateRepresentable {
        output
    }
}
