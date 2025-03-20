//
//  SetPasswordView.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//

import SwiftUI

struct SetPasswordView: View {
    @StateObject private var viewModel = SetPasswordViewModel()

    var body: some View {
        VStack {
            Text("Set New Password")
                .font(.largeTitle)
                .padding()

            SecureField("New Password", text: $viewModel.password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Confirm Password", text: $viewModel.confirmPassword)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                viewModel.setPassword()
            }) {
                Text("Set Password")
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

            if viewModel.isPasswordSet {
                Text("Password successfully set!")
                    .foregroundColor(.green)
            }

            Spacer()
        }
        .padding()
    }
}

struct SetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SetPasswordView()
    }
}

