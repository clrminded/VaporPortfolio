//
//  AsyncValidatorBuilder.swift
//
//
//  Created by Christopher Liudahl-Rackley on 9/15/24.
//

@resultBuilder
public enum AsyncValidatorBuilder {
    public static func buildBlock(
        _ components: AsyncValidator...
    ) -> [AsyncValidator]
    {
        components
    }
}
