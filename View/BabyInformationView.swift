import SwiftUI

struct BabyInformationView: View {
    @State private var babyHeight: String = ""
    @State private var babyAge: String = ""
    @State private var isBoy: Bool = false
    @State private var isGirl: Bool = false
    @State private var birthDate: Date = Date()
    
    var body: some View {
        ZStack {
            // Arka plan rengi
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("BEBEK BİLGİLERİ")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.brown)
                        .padding(.top, 40)
                    
                    Group {
                        // Bebek boyu
                        InputField(title: "Bebeğin Boyu", text: $babyHeight, placeholder: "Bebeğin Boyunu Giriniz...")
                        
                        // Bebek yaşı
                        InputField(title: "Bebeğin Yaşı", text: $babyAge, placeholder: "Bebeğin Yaşını Giriniz...")
                        
                        // Bebek cinsiyeti
                        GenderToggleView(isBoy: $isBoy, isGirl: $isGirl)
                        
                        // Doğum tarihi
                        Text("Doğum Tarihini Giriniz")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.brown)
                        
                        DatePicker("", selection: $birthDate, displayedComponents: .date)
                            .datePickerStyle(WheelDatePickerStyle())
                            .padding(.bottom, 10)
                        
                        // Kaydet butonu
                        SaveButton {
                            // Kaydet butonuna tıklanınca yapılacak işlemler
                        }
                    }
                }
                .padding()
                .padding(.horizontal)
                .background(Image("bilgiler").opacity(0.9))
                .frame(width: 350)
                .cornerRadius(50)
                .shadow(color: .gray, radius: 10, x: 0, y: 5)
                
            }
        }
    }
}

// Giriş alanı bileşeni
struct InputField: View {
    var title: String
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .bold()
                .foregroundColor(.brown)
            
            TextField(placeholder, text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 10)
        }
    }
}

// Cinsiyet seçimi bileşeni
struct GenderToggleView: View {
    @Binding var isBoy: Bool
    @Binding var isGirl: Bool
    
    var body: some View {
        Text("Bebeğin Cinsiyeti")
            .font(.title2)
            .bold()
            .foregroundColor(.brown)
        
        HStack {
            Toggle(isOn: $isBoy) {
                Text("Erkek")
                    .foregroundColor(.blue)
                    .bold()
                    .font(.title3)
            }
            .toggleStyle(SwitchToggleStyle(tint: .blue))
            
            Toggle(isOn: $isGirl) {
                Text("Kız")
                    .foregroundColor(.pink)
                    .bold()
                    .font(.title3)
            }
            .toggleStyle(SwitchToggleStyle(tint: .pink))
        }
        .padding(.bottom, 10)
    }
}

// Kaydet butonu bileşeni
struct SaveButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Kaydet")
                .foregroundColor(.white)
                .bold()
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .cornerRadius(30)
                .font(.title2)
        }
        .padding(.horizontal)
    }
}

#Preview {
    BabyInformationView()
}

