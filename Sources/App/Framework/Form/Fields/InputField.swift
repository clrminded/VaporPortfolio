//
//  InputField.swift
//
//  The key is going to be used to decode the input and set the key
//  of output template. The input and output are generic values, so they will
//  be in a subclass.


public final class InputField: AbstractFormField<String, InputFieldTemplate>
{
    public convenience init(_ key: String)
    {
        self.init(
            key: key,
            input: "",
            output: .init(
                .init(
                    key: key
                )
            )
        )
    }
}
