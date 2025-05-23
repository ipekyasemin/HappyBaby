//
//  LoginView.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//
import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.5), Color.white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 25) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Welcome Momy 🥳")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                            .padding(.bottom, 5)

                        Text("Please sign in to continue.")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        VStack(spacing: 15) {
                            // E-posta ve Şifre Girişi
                            TextField("Enter your email", text: $viewModel.email)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 2))

                            SecureField("Enter your password", text: $viewModel.password)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 2))
                        }
                        .padding(.top, 10)

                        // Şifremi Unuttum
                        HStack {
                            Spacer()
                            NavigationLink(destination: ForgotPasswordView()) {
                               
                                Text("Forgot Password?")
                                    .foregroundColor(.blue)
                                    .font(.footnote)
                            }
                        }
                        .padding(.top, 5)
                    }
                    .padding(.horizontal, 30)

                    // Giriş Butonu
                    Button(action: {
                        viewModel.login()
                    }) {
                        Text("Sign in")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 30)

                    // Hata Mesajı (Dinamik)
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.top, 5)
                    }

                    Text("Or Continue With")
                        .foregroundColor(.gray)
                        .padding(.top, 10)

                    // Google Butonu
                    Button(action: {
                        print("Google Login")
                    }) {
                        HStack {
                            Image(systemName: "globe")
                            Text("Continue with Google")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(12)
                        .shadow(radius: 3)
                    }
                    .padding(.horizontal, 30)

                    Spacer()

                    // Kayıt Ol Kısmı
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.gray)
                        NavigationLink(destination: SignUpView()) {
                            Text("Sign Up")
                                .foregroundColor(.blue)
                                .fontWeight(.bold)
                        }
                    }
                    .padding(.bottom, 20)
                }
                .padding(.top, 50)
            }
        }
    }
}
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


