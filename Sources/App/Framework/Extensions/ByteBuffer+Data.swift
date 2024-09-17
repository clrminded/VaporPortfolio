//
//  ByteBuffer+File.swift
//
//
//  Some prep work for Vapor

import Vapor

public extension ByteBuffer
{
    var data: Data?
    {
        getData(at: 0, length: readableBytes)
    }
}
