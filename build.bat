@echo off
title Build - GamaGov
color 0A

echo ============================================
echo    Gerando nova versao do executavel
echo ============================================

:: Apaga pastas antigas do PyInstaller (opcional, mas recomendado)
echo Limpando pastas antigas...
rmdir /s /q build 2>nul
rmdir /s /q dist 2>nul
del /q main.spec 2>nul

:: Cria o novo executável
echo Iniciando compilacao com PyInstaller...
"C:\Users\ggmro\AppData\Roaming\Python\Python314\Scripts\pyinstaller.exe" --onefile --windowed --name="GamaGov" main.py


echo Limpando arquivos desnecessarios...
rmdir /s /q build 2>nul
del /q GamaGov.spec 2>nul

echo ============================================
echo    Build concluido com sucesso!
echo    O executavel esta em: dist\GamaGov.exe
echo ============================================

pause
