@echo off
title Spor Denge Takibi - Kurulum Sihirbazi
cls
echo ================================================
echo Spor Denge Takibi - Otomatik Kurulum Sihirbazi
echo ================================================
echo.

:: 1. Flutter Kontrolü
echo 1. Flutter kontrol ediliyor...
where flutter >nul 2>nul
if %errorlevel% neq 0 (
    echo HATA: Flutter SDK bulunamadi!
    echo Lutfen once Flutter'i kurun ve PATH'e ekleyin.
    pause
    exit /b
)
echo Flutter bulundu.
echo.

:: 2. Önbellek Temizliği
echo 2. Proje temizleniyor (flutter clean)...
call flutter clean
echo.

:: 3. Bağımlılıkların Yüklenmesi
echo 3. Bagimliliklar yukleniyor (flutter pub get)...
call flutter pub get
echo.

echo ================================================
echo KURULUM BASARIYLA TAMAMLANDI!
echo ================================================
echo.

:: 4. Çalıştırma İsteği
set /p choice=Uygulamayi simdi baslatmak ister misiniz? (E/H) [Varsayilan: E]: 
if "%choice%"=="" set choice=E
if /i "%choice%"=="E" (
    echo Uygulama baslatiliyor...
    call flutter run
) else (
    echo Cikis yapiliyor. Uygulamayi 'flutter run' yazarak baslatabilirsiniz.
    pause
)
