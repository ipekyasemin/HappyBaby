//
//  SignUpView.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.5), Color.white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Join Momy Family 🍼")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                            .padding(.bottom, 5)
                        
                        Text("Create an account to get started.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 30)
                    
                    VStack(spacing: 15) {
                        TextField("First Name", text: $viewModel.firstName)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 2))
                        
                        TextField("Last Name", text: $viewModel.lastName)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 2))
                        
                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 2))
                        
                        SecureField("Password", text: $viewModel.password)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 2))
                        
                        SecureField("Confirm Password", text: $viewModel.confirmPassword)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 2))
                    }
                    .padding(.horizontal, 30)
                    
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.top, 5)
                    }
                    
                    // Kayıt Ol Butonu
                    Button(action: {
                        viewModel.signUp()
                    }) {
                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 30)
                    
                    
                    Spacer()
                    
                    .padding(.bottom, 20)
                    .padding(.horizontal, 30)
                }
                .padding(.top, 50)
            }
           
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
