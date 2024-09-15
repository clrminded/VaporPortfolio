//
//  FormContext.swift
//
//
//  We still need a way to render a form, so we will create
//  this context and matching template

public struct FormContext
{
    public var action: FormAction
    public var fields: [TemplateRepresentable]
    public var error: String?
    public var submit: String?
}
