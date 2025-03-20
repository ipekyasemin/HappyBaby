//
//  BabyInformationView.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//

import SwiftUI

struct BabyInformationView: View {
    var body: some View {
    
        
        ZStack{
            Image("bilgiler")
                .resizable()
                .cornerRadius(60)
                .frame(width: 350)
                .frame(height: 700)
       
           
            VStack{
                Text("BEBEK BİLGİLERİ")
                    .bold()
                    .font(.title)
                    .foregroundColor(.blue)
                
                Text("Bebeğin Boyu")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.blue)
    

                
            }
     

        }
    
       
    }
    
    
}

#Preview {
    BabyInformationView()
}

