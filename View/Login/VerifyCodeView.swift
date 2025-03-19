//
//  VerifyCodeView.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//
import SwiftUI

struct VerifyCodeView: View {
    @StateObject private var viewModel = VerifyCodeViewModel()

    var body: some View {
        VStack {
            Text("Verify Code")
                .font(.largeTitle)
                .padding()

            TextField("Verification Code", text: $viewModel.verificationCode)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)

            Button(action: {
                viewModel.verifyCode()
            }) {
                Text("Verify")
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

            if viewModel.isVerified {
                Text("Verification successful!")
                    .foregroundColor(.green)
            }

            Spacer()
        }
        .padding()
    }
}

struct VerifyCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyCodeView()
    }
}

