@echo off
setlocal enabledelayedexpansion

:: Długość hasła (zmień jeśli chcesz)
set /p length=Podaj długość hasła: 

:: Znaki możliwe do użycia w haśle
set "chars=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-=+[]{}"

:: Zmienna do przechowywania hasła
set "password="

:: Losowe wybieranie znaków
for /l %%i in (1,1,%length%) do (
    set /a rand=!random! %% 76
    for %%a in (!rand!) do (
        call set "char=%%chars:~%%a,1%%"
        set "password=!password!!char!"
    )
)

echo.
echo 🔐 Wygenerowane hasło:
echo !password!
echo.
pause
endlocal