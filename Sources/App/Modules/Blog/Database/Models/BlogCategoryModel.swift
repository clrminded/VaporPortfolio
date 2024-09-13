//
//  BlogCategoryModel.swift
//
//
//  Entity of the Blog database that represents the categories for
//  the blog posts.
//  In their most basic form, models describe table rows in
//  the database

import Vapor
import Fluent

final class BlogCategoryModel: Model {
    
    static let schema = "blog_categories"
    
    struct FieldKeys {
        struct v1 {
            static var title: FieldKey { "title" }
        }
    }
    
    @ID() var id: UUID?
    @Field(key: FieldKeys.v1.title) var title: String
    @Children(for: \.$category) var posts: [BlogPostModel]
    
    init() { }
    
    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
