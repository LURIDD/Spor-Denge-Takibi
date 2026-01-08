# Spor ve Denge Takibi (Spor-Denge-Takibi)

**Spor-Denge-Takibi**, kullanıcıların günlük spor aktivitelerini, su içme hedeflerini ve genel sağlık durumlarını takip etmelerini sağlayan, **Flutter** ve **Firebase** altyapısıyla geliştirilmiş modern bir mobil uygulamadır.

## 📱 Özellikler

### Kullanıcı Deneyimi (Client)
- **Kişiselleştirilmiş Profil:**
  - Boy, kilo, yaş ve cinsiyet bazlı profil oluşturma.
  - Cinsiyete duyarlı varsayılan avatar ataması ve geniş avatar havuzundan seçim imkanı.
  - Vücut Kitle İndeksi (VKİ / BMI) hesaplaması.
- **Günlük Hedef Takibi:**
  - **Su İçme:** Günlük su tüketimini takip edin ve hatırlatıcılar alın.
  - **Adım Takibi:** Ana sayfada dinamik ilerleme çubuğu ile günlük adım hedefinizi (örn. 10.000 adım) takip edin.
- **Motivasyon ve Gamification:**
  - **Rozetler:** Su içme, meditasyon ve spor hedeflerini tamamladıkça rozetler kazanın (WaterSensei, FitnessHero, vb.).
  - **Konfeti Kutlaması:** Günlük hedefler tamamlandığında görsel şölen.
  - **Seri (Streak) Takibi:** Uygulamayı her gün kullanarak serinizi bozmayın.
- **Akıllı Bildirimler:**
  - Sabah motivasyonu ve gün içi su hatırlatıcıları.
  - Ayarlar sayfasından bildirimleri açıp kapatma imkanı.
- **İstatistikler:**
  - Haftalık ve aylık performans grafikleri.
  - Geçmiş aktivite verileri.

### Yönetim Paneli (Admin)
- **KPI ve Metrikler:**
  - Anlık çevrimiçi kullanıcı sayısı.
  - Toplam kazanılan rozetler ve tamamlanan seriler.
  - Günlük Aktif Kullanıcı (DAU) ve Yeni Üye grafikleri.
- **Rozet Yönetimi:**
  - Yeni rozet ekleme, mevcutları düzenleme veya silme.
- **Kullanıcı Yönetimi:**
  - Kayıtlı tüm kullanıcıları listeleme ve detaylarını görüntüleme.

## 🛠️ Teknolojiler

- **Frontend:** Flutter (Dart)
- **Backend & Database:** Firebase (Firestore, Auth, Cloud Storage)
- **State Management:** Provider / FlutterFlow Locals
- **UI/UX:** Google Fonts (Inter, Outfit), Flutter Animate, Confetti

## 🚀 Kurulum ve Çalıştırma

Bu projeyi en kolay şekilde kurmak ve çalıştırmak için hazırladığımız otomatik kurulum scriptlerini kullanabilirsiniz.

### ⚡ Hızlı Kurulum (Otomatik)

**Windows Kullanıcıları İçin:**
1. Proje klasörünü açın.
2. `setup_windows.bat` dosyasına çift tıklayın.
3. Script gerekli temizlikleri yapacak, paketleri yükleyecek ve uygulamayı başlatmak isteyip istemediğinizi soracaktır.

**Mac ve Linux Kullanıcıları İçin:**
1. Terminali açın ve proje klasörüne gidin.
2. Aşağıdaki komutu çalıştırın:
   ```bash
   ./setup.sh
   ```

### 🛠️ Manuel Kurulum

Script kullanmadan manuel kurulum yapmak isterseniz:

1.  **Depoyu Klonlayın:**
    ```bash
    git clone https://github.com/LURIDD/Spor-Denge-Takibi.git
    cd Spor-Denge-Takibi
    ```

2.  **Bağımlılıkları Yükleyin:**
    ```bash
    flutter clean
    flutter pub get
    ```

3.  **Uygulamayı Çalıştırın:**
    ```bash
    flutter run
    ```

## 📂 Proje Yapısı

- `lib/pages/`: Uygulama sayfaları (Ana Sayfa, Ayarlar, Profil, Admin Paneli).
- `lib/components/`: Tekrar kullanılabilir UI bileşenleri (İlerleme çubukları, Kartlar, Avatar seçici).
- `lib/backend/`: Firebase şemaları (`UsersRecord`, `UserGoalsRecord`) ve yardımcı fonksiyonlar.

## ✨ Katkıda Bulunma

Hataları bildirmek veya yeni özellikler önermek için lütfen "Issues" sekmesini kullanın veya bir "Pull Request" gönderin.

---
*Geliştirme Süreci Devam Etmektedir.*
