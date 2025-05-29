import SwiftUI

struct SettingsView: View {
    @AppStorage("userName") var userName: String = "Kullanıcı Adı"
    @AppStorage("email") var email: String = "email@example.com"
    @AppStorage("password") var password: String = "********"
    
    @AppStorage("babyName") var babyName: String = "Bebek Adı"
    @AppStorage("babyBirthday") var babyBirthday: String = "01.01.2024"
    @AppStorage("babyHeight") var babyHeight: String = "50 cm"
    @AppStorage("babyAge") var babyAge: String = "1"
    @AppStorage("babyGender") var babyGender: String = "Kız" // veya "Erkek"

    @State private var showingLogoutAlert = false

    var body: some View {
        NavigationView {
            Form {
                // Kullanıcı Bilgileri
                Section(header: Text("👤 Kullanıcı Bilgileri")) {
                    HStack {
                        Text("Ad Soyad:")
                        Spacer()
                        Text(userName)
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Text("Email:")
                        Spacer()
                        Text(email)
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Text("Şifre:")
                        Spacer()
                        Text(password)
                            .foregroundColor(.secondary)
                    }
                }

                // Bebek Bilgileri
                Section(header: Text("🍼 Bebek Bilgileri")) {
                    HStack {
                        Text("Bebek Adı:")
                        Spacer()
                        Text(babyName)
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Text("Doğum Tarihi:")
                        Spacer()
                        Text(babyBirthday)
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Text("Bebek Boyu:")
                        Spacer()
                        Text(babyHeight)
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Text("Bebek Yaşı:")
                        Spacer()
                        Text(babyAge)
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Text("Cinsiyet:")
                        Spacer()
                        Text(babyGender)
                            .foregroundColor(.secondary)
                    }
                }

                // Çıkış Butonu
                Section {
                    Button(action: {
                        showingLogoutAlert = true
                    }) {
                        Text("Çıkış Yap")
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .alert(isPresented: $showingLogoutAlert) {
                        Alert(
                            title: Text("Çıkış Yap"),
                            message: Text("Emin misiniz?"),
                            primaryButton: .destructive(Text("Çıkış Yap"), action: {
                                logout()
                            }),
                            secondaryButton: .cancel()
                        )
                    }
                }
            }
            .navigationTitle("Ayarlar")
        }
    }

    // Çıkış işlemi
    func logout() {
        userName = ""
        email = ""
        password = ""
        babyName = ""
        babyBirthday = ""
        babyHeight = ""
        babyAge = ""
        babyGender = ""
        // Burada kullanıcıyı giriş ekranına yönlendirme işlemleri yapılabilir
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

