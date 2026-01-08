#!/bin/bash

# Renkler
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Spor Denge Takibi - Otomatik Kurulum Sihirbazı${NC}"
echo "------------------------------------------------"

# 1. Flutter Kontrolü
echo "1. Flutter kontrol ediliyor..."
if ! command -v flutter &> /dev/null
then
    echo -e "${RED}HATA: Flutter SDK bulunamadı!${NC}"
    echo "Lütfen önce Flutter'ı kurun ve PATH'e ekleyin."
    exit 1
fi
echo -e "${GREEN}Flutter bulundu.${NC}"

# 2. Önbellek Temizliği
echo "------------------------------------------------"
echo "2. Proje temizleniyor (flutter clean)..."
flutter clean

# 3. Bağımlılıkların Yüklenmesi
echo "------------------------------------------------"
echo "3. Bağımlılıklar yükleniyor (flutter pub get)..."
flutter pub get

echo "------------------------------------------------"
echo -e "${GREEN}KURULUM BAŞARIYLA TAMAMLANDI!${NC}"
echo "------------------------------------------------"

# 4. Çalıştırma İsteği
read -p "Uygulamayı şimdi cihazda/emülatörde başlatmak ister misiniz? (E/h): " choice
choice=${choice:-E} # Varsayılan olarak Evet

if [[ "$choice" == "E" || "$choice" == "e" ]]; then
    echo "Uygulama başlatılıyor..."
    flutter run
else
    echo "Çıkış yapılıyor. Uygulamayı daha sonra terminalden 'flutter run' komutu ile başlatabilirsiniz."
fi
