//
//  LoginView2.swift
//  MV_Sample
//
//  Created by Virendra Gupta on 14/09/25.
//

import SwiftUI

struct LoginFromError{
    var email: String = ""
    var password: String = ""
}

struct LoginView2: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginFormError: LoginFromError()
    
    private func clearForm(){
        loginFormError = LoginFromError()
        
    }
    
    var isFormValid: Bool {
        
        clearForm()
        
        if email.isEmpty {
            loginFormError.email = "Email is required"
        }else if !email.isValid {
            loginFormError.email = "Email is not in correct format"
        }
        
        if password.isEmpty {
            
        }
        
        return !email.isEmpty && !password.isEmpty && email.isValidEmail
    }
    
    var body: some View {
        Form{
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            
            if LoginFromError.email.isEmpty{
                Text(loginFormError.email)
                    .font(.caption)
            }
            SecureField("Password", text: $password)
            Button("Login"){
                
            }.disabled(!isFormValid)
            
        }
    }
}

#Preview {
    LoginView2()
}
