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
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .padding()

            TextField("First Name", text: $viewModel.firstName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Last Name", text: $viewModel.lastName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Email", text: $viewModel.email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $viewModel.password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Confirm Password", text: $viewModel.confirmPassword)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                viewModel.signUp()
            }) {
                Text("Sign Up")
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

            if viewModel.isSignedUp {
                Text("Sign Up successful!")
                    .foregroundColor(.green)
            }

            Spacer()
        }
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
