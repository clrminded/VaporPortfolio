//
//  ValidationError.swift
//
//
//  This is going to be the structure of the error details if
//  there is a problem with the validation process. Since
//  there can be multiple reasons for a failure that is why
//  we use an array of ValidationErrorDetails.


import Vapor

public struct ValidationError: AbortError
{
    public var abort: Abort
    public var message: String?
    public var details: [ValidationErrorDetail]
    
    public var reason: String { abort.reason }
    public var status: HTTPStatus { abort.status }
    
    public init(
        abort: Abort,
        message: String? = nil,
        details: [ValidationErrorDetail]
    ) {
        self.abort = abort
        self.message = message
        self.details = details
    }
}
