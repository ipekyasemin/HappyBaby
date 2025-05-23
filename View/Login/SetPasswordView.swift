//
//  SetPasswordView.swift
//  HappyBaby
//
//  Created by yasemin ipek on 23.03.2025.
//

import SwiftUI

struct SetPasswordView: View {
    @StateObject private var viewModel = SetNewPasswordViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
               
                LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.5), Color.white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 25) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Set New Password")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                            .padding(.bottom, 5)
                        
                        Text("Please enter your new password and confirm it below.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        VStack(spacing: 15) {
                         
                            SecureField("New Password", text: $viewModel.newPassword)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 2))
                 
                            SecureField("Confirm Password", text: $viewModel.confirmPassword)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 2))
                        }
                        .padding(.top, 10)
                    }
                    .padding(.horizontal, 30)
                    
                    // Şifreyi Kaydet Butonu
                    Button(action: {
                        viewModel.setPassword()
                    }) {
                        Text("Set Password")
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
                    }
                    
                    Spacer()
                }
                .padding(.top, 50)
            }
            
        }
    }
}

struct SetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SetPasswordView()
    }
}

