//
//  VerifyCodeView.swift
//  HappyBaby
//
//  Created by yasemin ipek on 23.03.2025.
//
import SwiftUI

struct VerifyCodeView: View {
    @StateObject private var viewModel = VerifyCodeViewModel()  // ViewModel'i bağla
    
    var body: some View {
        NavigationView {
            ZStack {
                // Arka plan degrade (turuncu)
                LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.5), Color.white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 25) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Verify Code")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                            .padding(.bottom, 5)

                        Text("Enter the 6-digit code sent to your email.")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        VStack(spacing: 15) {
                            // Doğrulama kodu girişi
                            TextField("Enter verification code", text: $viewModel.verificationCode)
                                .keyboardType(.numberPad)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 2))
                                
                        }
                        .padding(.top, 10)
                    }
                    .padding(.horizontal, 30)

                    // Doğrulama butonu
                    NavigationLink(destination: SetPasswordView(), isActive: $viewModel.isCodeVerified) {
                        Button(action: {
                            viewModel.verifyCode()
                        }) {
                            Text("Verify Code")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(radius: 5)
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    // Kod tekrar gönder butonu
                    Button(action: {
                        viewModel.resendCode()
                    }) {
                        Text("Resend Code")
                            .foregroundColor(.orange)
                            .underline()
                            .padding(.top, 5)
                    }

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

struct VerifyCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyCodeView()
    }
}

