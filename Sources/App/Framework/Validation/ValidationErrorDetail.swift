//
//  ValidationErrorDetail.swift
//
//  This is to help validate form and API validation processes.
//  Since there is an order to have things have to execute, we
//  need something to check if there will return and error or not.


import Vapor

public struct ValidationErrorDetail: Codable
{
    public var key: String
    public var message: String
    
    public init(key: String, message: String) {
        self.key = key
        self.message = message
    }
}

extension ValidationErrorDetail: Content {}
