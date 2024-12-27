@echo off
chcp 65001 >nul
title "IT Cmd reis_beta"
:menu
cls
echo ====================================
echo           IT CMD REİS_BETA    
echo ====================================
echo 1. Genel bilgiler
echo 2. Lisans ve Güncelleme
echo 3. Ağ ve Bağlantı
echo 4. Yazıcı ve Donanım
echo 5. Bakım ve Onarım
echo 6. Active Directory Yönetimiif 
echo 7. Çıkış Yap
echo ══════════════════════════════════════════
set /p choice=Bir İşlem numarası seçin (Çıkmak için X girin):

if "%choice%"=="1" goto genelbilgiler_menu
if "%choice%"=="2" goto Lisans_güncelleme
if "%choice%"=="3" goto Ag
if "%choice%"=="4" goto Donanim
if "%choice%"=="5" goto bakim_onarim
if "%choice%"=="6" goto active_directory
if "%choice%"=="7" exit
if /i "%choice%"=="X" (exit)
goto menu

:genelbilgiler_menu

cls
echo ============================================
echo               GENEL BİLGİLER
echo ============================================
echo 1. Bilgisayar ve Aktif Kullanıcı Adını Göster
echo 2. Bilgisayar Seri Numarasını Göster
echo 3. Bilgisayarın Marka ve Modelini Göster
echo 4. Sistem Bilgilerini Görüntüle
echo 5. Windows Sürüm Bilgisi
echo 6. Ana Menüye Dön
echo ============================================
set /p choice=Bir işlem numarası seçin: 

if "%choice%"=="1" (echo Bilgisayar Adı: %COMPUTERNAME% && echo Aktif Kullanıcı: %USERNAME% && pause)
if "%choice%"=="2" (
wmic bios get serialnumber | findstr /v "SerialNumber"
    if errorlevel 1 echo Seri numarası alınamadı.
    pause
)
 if "%choice%"=="3" (
    wmic computersystem get manufacturer,model | findstr /v "Manufacturer"
    if errorlevel 1 echo Bilgi alınamadı.
    pause
)

if "%choice%"=="4" (msinfo32 && pause)
if "%choice%"=="5" (start winver && pause)
if "%choice%"=="6" goto menu
goto genelbilgiler_menu

:Lisans_güncelleme
cls
echo ============================================
echo           LİSANS VE GÜNCELLEME
echo ============================================
echo 1. Windows Lisans Durumunu Göster
echo 2. Etkin Windows Lisansını Göster
echo 3. Windows Güncelleme Durumunu Göster
echo 4. Windows Store Uygulamalarını Güncelle
echo 5. Ana Menüye Dön
echo ============================================
set /p choice=Bir işlem numarası seçin: 

if "%choice%"=="1" (slmgr /xpr && pause)
if "%choice%"=="2" (slmgr /dlv && pause)
if "%choice%"=="3" (wmic qfe get HotfixID,InstalledOn || echo Güncelleme bilgisi alınamadı. && pause)
if "%choice%"=="4" (start ms-windows-store://update && pause)
if "%choice%"=="5" goto menu
goto Lisans_güncelleme

:Ag
cls
echo ============================================
echo             AĞ VE BAĞLANTI
echo ============================================
echo 1. IP Adresini Görüntüle
echo 2. IP Yapılandırmasını Tümünü Görüntüle
echo 3. IP Yapılandırmasını Serbest Bırak (release)
echo 4. IP Yapılandırmasını Yenile (renew)
echo 5. Ağ DNS Önbelleğini Temizle (flushdns)
echo 6. Ping Testi Yap
echo 7. Ana Menüye Dön
echo ============================================
set /p choice=Bir işlem numarası seçin: 

if "%choice%"=="1" (ipconfig && pause)
if "%choice%"=="2" (ipconfig /all && pause)
if "%choice%"=="3" (ipconfig /release && pause)
if "%choice%"=="4" (ipconfig /renew && pause)
if "%choice%"=="5" (ipconfig /flushdns && pause)
if "%choice%"=="6" (set /p ip=Pinglemek istediğiniz IP veya adresi girin: && ping %ip% && pause)
if "%choice%"=="7" goto menu
goto Ag

:Donanim
cls
echo ============================================
echo           YAZICI VE DONANIM
echo ============================================
echo 1. Yüklü Yazıcıları Listele
echo 2. Yazıcı Durumunu Göster
echo 3. Yazıcıyı Yeniden Başlat
echo 4. Disk Durumunu Kontrol Et
echo 5. CPU Bilgilerini Göster
echo 6. Bellek (RAM) Kullanımını Göster
echo 7. Ana Menüye Dön
echo ============================================
set /p choice=Bir işlem numarası seçin: 

if "%choice%"=="1" (wmic printer list brief && pause)
if "%choice%"=="2" (wmic printer get name,status && pause)
if "%choice%"=="3" (net stop spooler && net start spooler && pause)
if "%choice%"=="4" (wmic diskdrive get status && pause)
if "%choice%"=="5" (wmic cpu get name,CurrentClockSpeed && pause)
if "%choice%"=="6" (wmic OS get FreePhysicalMemory && pause)
if "%choice%"=="7" goto menu
goto Donanim

:bakim_onarim
cls
echo ========================================
echo           BAKIM VE ONARIM
echo ========================================
echo 1. Windows Sistem Dosyalarını Onar
echo 2. Windows Disk Temizliği Yap
echo 3. Gereksiz Dosyaları Temizle
echo 4. Sabit Diski Tara (chkdsk)
echo 5. Güvenlik Duvarını Aç
echo 6. Güvenlik Duvarını Kapat
echo 7. Ana Menüye Dön
echo ============================================
set /p choice=Bir işlem numarası seçin: 

if "%choice%"=="1" (sfc /scannow && pause)
if "%choice%"=="2" (cleanmgr && pause)
if "%choice%"=="3" (del /q/f/s %temp%\* && pause)
if "%choice%"=="4" (chkdsk && pause)
if "%choice%"=="5" (netsh advfirewall set allprofiles state on && pause)
if "%choice%"=="6" (netsh advfirewall set allprofiles state off && pause)
if "%choice%"=="7" goto menu
goto bakim_onarim


:active_directory
cls
echo ============================================
echo           ACTIVE DIRECTORY YÖNETİMİ
echo ============================================
echo 1. Kullanıcı Hesaplarını Listele
echo 2. Yeni Kullanıcı Hesabı Oluştur
echo 3. Kullanıcı Şifresini Sıfırla
echo 4. Kullanıcıyı Devre Dışı Bırak
echo 5. Kullanıcıyı Aktif Et
echo 6. Grup Politikalarını Güncelle (gpupdate)
echo 7. Grup Üyeliklerini Listele
echo 8. Ana Menüye Dön
echo ============================================
set /p choice=Bir işlem numarası seçin: 

if "%choice%"=="1" (net user && pause)
if "%choice%"=="2" (
    set /p username=Yeni kullanıcı adı girin: 
    set /p password=Yeni kullanıcı şifresi girin: 
    net user %username% %password% /add && echo Kullanıcı başarıyla oluşturuldu. || echo Kullanıcı oluşturulamadı. && pause
)
if "%choice%"=="3" (
    set /p username=Şifresi sıfırlanacak kullanıcı adı: 
    net user %username% * && echo Şifre başarıyla sıfırlandı. || echo Şifre sıfırlanamadı. && pause
)
if "%choice%"=="4" (
    set /p username=Devre dışı bırakılacak kullanıcı adı: 
    net user %username% /active:no && echo Kullanıcı devre dışı bırakıldı. || echo Kullanıcı devre dışı bırakılamadı. && pause
)
if "%choice%"=="5" (
    set /p username=Aktif edilecek kullanıcı adı: 
    net user %username% /active:yes && echo Kullanıcı aktif hale getirildi. || echo Kullanıcı aktif edilemedi. && pause
)
if "%choice%"=="6" (gpupdate /force && echo Grup politikaları başarıyla güncellendi. && pause)
if "%choice%"=="7" (
    set /p groupname=Grup adını girin: 
    net localgroup %groupname% && pause
)
if "%choice%"=="8" goto menu
goto active_directory
