//
//  LoginView.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//

import SwiftUI
import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .padding()

                TextField("Email", text: $viewModel.email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    viewModel.login()
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                if viewModel.isLoggedIn {
                    Text("Login successful!")
                        .foregroundColor(.green)
                }

                Spacer()

                // SignUp için NavigationLink
                NavigationLink(destination: SignUpView()) {
                    Text("Don't have an account? Sign Up")
                        .foregroundColor(.blue)
                }
                .padding()
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


//$ işareti: Bu, data binding'i ifade eder. @State veya @ObservedObject ile işaretlenmiş bir değişkenin referansını alır.
//viewModel.email: Burada, viewModel bir ObservableObject'tir ve email bir @Published özelliği ile işaretlenmiştir. viewModel.email ile, view model'deki email değişkenine erişirsiniz.
