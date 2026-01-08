# Proje Kurulum Talimatları

Bu proje Flutter ile geliştirilmiştir. Kurulumu kolaylaştırmak için otomatik kurulum dosyaları hazırlanmıştır.

## Gereksinimler
- Bilgisayarınızda **Flutter SDK** yüklü olmalıdır.

## Nasıl Kurulur?

### Windows Kullanıcıları İçin
1. Proje klasörünü açın.
2. `setup_windows.bat` dosyasına çift tıklayın.
3. Açılan siyah pencerede işlemlerin bitmesini bekleyin.
4. Son olarak uygulama başlatılsın mı sorusuna "E" diyerek enter'a basabilirsiniz.

### Mac / Linux Kullanıcıları İçin
1. Terminali açın ve proje klasörüne gidin.
2. Şu komutu çalıştırın:
   ```bash
   ./setup.sh
   ```
3. Kurulum tamamlandığında uygulama otomatik olarak başlatılabilir.

---
**Manuel Kurulum (Script çalışmazsa):**
Eğer scriptlerde sorun yaşarsanız şu komutları sırasıyla terminalde çalıştırın:
1. `flutter clean`
2. `flutter pub get`
3. `flutter run`
