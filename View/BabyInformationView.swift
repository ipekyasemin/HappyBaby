import SwiftUI

struct BabyInformationView: View {
    @State private var babyHeight: String = ""
    @State private var babyAge: String = ""
    @State private var isBoy: Bool = false
    @State private var isGirl: Bool = false
    @State private var birthDate: Date = Date()

    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: height * 0.02) {
                        VStack(alignment: .leading, spacing: height * 0.03) {
                            Text("BEBEK BİLGİLERİ")
                                .font(.system(size: width * 0.08, weight: .bold))
                                .foregroundColor(.brown)
                                .padding(.top, height * 0.04)
                            
                            Group {
                                InputField(title: "Bebeğin Boyu", text: $babyHeight, placeholder: "Bebeğin Boyunu Giriniz...", fontSize: width * 0.045)
                                
                                InputField(title: "Bebeğin Yaşı", text: $babyAge, placeholder: "Bebeğin Yaşını Giriniz...", fontSize: width * 0.045)
                                
                                GenderToggleView(isBoy: $isBoy, isGirl: $isGirl, width: width, height: height)
                                
                                Text("Doğum Tarihini Giriniz")
                                    .font(.system(size: width * 0.05, weight: .bold))
                                    .foregroundColor(.brown)
                                
                                DatePicker("", selection: $birthDate, displayedComponents: .date)
                                    .datePickerStyle(WheelDatePickerStyle())
                                    .frame(height: height * 0.2) // Yüksekliği oranladık
                                    .padding(.bottom, height * 0.02)
                                
                                SaveButton(fontSize: width * 0.05, height: height * 0.07) {
                                    // Kaydet işlemi
                           
                                }
                                .padding()
                            }
                        }
                        .padding()
                        .background(
                            Image("bilgiler")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.9)
                                .frame(width: width*0.95)
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                        
                        )
                        .padding(.horizontal, width * 0.04) // Yan boşluklar
                        .shadow(color: .gray, radius: 10, x: 0, y: 5)
                      
                    }
                    .padding(.bottom, height * 0.1)
                    .padding(.top, height * 0.03)
                }
            }
            

        }
    }
}

// Giriş alanı bileşeni
struct InputField: View {
    var title: String
    @Binding var text: String
    var placeholder: String
    var fontSize: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: fontSize * 0.3) {
            Text(title)
                .font(.system(size: fontSize, weight: .bold))
                .foregroundColor(.brown)
            
            TextField(placeholder, text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.bottom, fontSize * 0.5)
    }
}

// Cinsiyet seçimi bileşeni
struct GenderToggleView: View {
    @Binding var isBoy: Bool
    @Binding var isGirl: Bool
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: height * 0.015) {
            Text("Bebeğin Cinsiyeti")
                .font(.system(size: width * 0.05, weight: .bold))
                .foregroundColor(.brown)
            
            HStack(spacing: width * 0.05) {
                Toggle(isOn: $isBoy) {
                    Text("Erkek")
                        .foregroundColor(.blue)
                        .bold()
                        .font(.system(size: width * 0.04))
                }
                .toggleStyle(SwitchToggleStyle(tint: .blue))
                
                Toggle(isOn: $isGirl) {
                    Text("Kız")
                        .foregroundColor(.pink)
                        .bold()
                        .font(.system(size: width * 0.04))
                }
                .toggleStyle(SwitchToggleStyle(tint: .pink))
            }
        }
        .padding(.bottom, height * 0.015)
    }
}

// Kaydet butonu bileşeni
struct SaveButton: View {
    var fontSize: CGFloat
    var height: CGFloat
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Kaydet")
                .foregroundColor(.white)
                .bold()
                .font(.system(size: fontSize))
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .background(Color.orange)
                .cornerRadius(30)
        }
        .padding(.horizontal)
    }
}
  

#Preview {
    BabyInformationView()
}

