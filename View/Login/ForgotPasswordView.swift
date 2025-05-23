//
//  ForgotPasswordView.swift
//  HappyBaby
//
//  Created by yasemin ipek on 23.03.2025.
//

import SwiftUI

struct ForgotPasswordView: View {
    @StateObject private var viewModel = ForgotPasswordViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.5), Color.white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 25) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Forgot Password?")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                            .padding(.bottom, 5)
                        
                        Text("Enter your email address to reset your password.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 50)
                    
                    // E-posta girişi
                    VStack(spacing: 15) {
                        TextField("Enter your email", text: $viewModel.email)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 2))
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 30)

                    // Şifre sıfırlama butonu
                    Button(action: {
                        viewModel.sendPasswordResetEmail()
                    }) {
                        Text("Send Reset Code")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 30)

                    // Hata mesajı
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.top, 5)
                            .padding(.horizontal, 30)
                    }
                    
                    Spacer()
                        .padding(.bottom, 20)
                    
                }
            }
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
