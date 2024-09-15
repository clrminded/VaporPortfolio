//
//  UserLoginContext.swift
//
//
//  Context used to build the login form to the user
//  it will return the users credentialis to our application
//  for authentication.

struct UserLoginContext 
{
    let icon: String
    let title: String
    let message: String
    let form: TemplateRepresentable
    
    init(
        icon: String,
        title: String,
        message: String,
        form: TemplateRepresentable
    )
    {
        self.icon = icon
        self.title = title
        self.message = message
        self.form = form
    }
    
}
