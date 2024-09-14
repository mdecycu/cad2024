@echo off
set Disk=y
subst %Local% "data"

REM 請先將 python_2025_lite 下載到 C:\
REM 除了個人作業倉儲與  ssh key 之外, 其他執行都使用 C:\ 中的檔案
set Local=C:\python_2025_lite\data
REM for cadlab
REM set NX_location="C:\Program Files\Siemens\NX2312"
set NX_location="F:\python_2025_lite\data\nx"

REM python 執行將使用 C:\, 但是額外的 Python 模組將存至隨身碟
REM pip install <package> --target  Y:\extra_python_modules, 但必須將此額外模組路徑納入 PYTHONPATH

%Local%

set HomePath=%Local%\home_ipv6
set HomeDrive=%Local%\home_ipv6
set Home=%Local%\home_ipv6
set USERPROFILE=%Local%\home_ipv6

REM 將系統 Python 程式的 io 設為 utf-8
set PYTHONIOENCODING="utf-8"

set PYTHONPATH=%Local%\Python310\DLLs;%Local%\Python310\Lib;%Local%\Python310\Lib\site-packages;%Local%\NX\NXBIN\python;%Disk%:\extra_python_modules;
set PYTHONHOME=%Local%\Python310

REM for putty
set GIT_SSH=%Local%\PuTTY\plink.exe

REM for Java and Android SDK
set java_home=%Local%\java\jdk8u222-b10
set ANDROID_SDK_home=%Local%\home_ipv6
set GRADLE_USER_home=%Local%\home_ipv6
set ANDROID_SDK_ROOT=%Local%\android\sdk
set ANDROID_Home=%Local%\android\sdk
set REPO_OS_OVERRIDE=windows

REM 設定跟 Python 有關的命令搜尋路徑
set path_python=%Local%\Python310;%Local%\Python310\Scripts;
REM 設定跟Git 有關的命令搜尋路徑
set path_git=%Local%\portablegit\bin;
REM 設定 msys2 64 位元的執行路徑
set path_msys2=%Local%\msys64\ucrt64\bin;
REM set for LaTeX
set path_miketex=%Local%\miktex-portable\texmfs\install\miktex\bin\x64;
REM Flutter path
set path_flutter=%Local%\flutter\bin;%java_home%\bin;%Local%\Android\sdk;%Local%\Android\sdk\tools;%Local%\Android\sdk\tools\bin;%Local%\Android\sdk\emulator;%Local%\Android\sdk\platform-tools;%Local%\flutter\bin\cache\dart-sdk\bin;%Local%\vscode;
set path_node=%Local%\node-v14.15.4-win-x64;

set path_postgresql=%Local%\postgresql13\bin;
set path_range=%Local%\Range3_official\bin;
rem set path_range=%Local%\range-3.2.5_kmol\bin;
set path_lua=%Local%\lua-5.3.5\;
set path_core=%Local%\coreutils-5.3.0\bin;
REM for gogs
set path_putty=%Local%\PuTTY;
set path_vscode=%Local%\vscode;

REM for Rust
set MINGW_PATH=%path_msys2%;
set GIT_PATH=%path_git%;
set VSCODE_PATH=%path_vscode%
set RUSTUP_HOME=%Local%\Rust\rust
set CARGO_HOME=%Local%\Rust\cargo
set RUST_PATH=%CARGO_HOME%\bin

REM for Erlang and Elixir
set path_erlang=%Local%\elixir\erl10.7\bin\;%Local%\elixir\erl10.7\erts-10.7\bin;%Local%\elixir\elixir\bin;
set ERTSPATH=%Local%\elixir\erl10.7\erts-10.7\bin
set ERLINI=%Local%\elixir\erl10.7\erts-10.7\bin\erl.ini

REM for Haskell
set path_haskell=%Local%\ghc-9.0.1-x86_64-unknown-mingw32\bin;
REM for node.js
set path_nodejs=%Local%\node-v14.17.2-x64\nodejs;%Local%\node-v14.17.2-x64\nodejs\node_modules\npm;

REM 加入 PostgreSQL 所需的環境變數設定

@SET PGDATA=%Local%\postgresql13\data
@SET PGDATABASE=postgres
@SET PGUSER=postgres
@SET PGPORT=5432
@SET PGLOCALEDIR=%Local%\postgresql13\share\locale

REM for Range3
REM REG IMPORT %Local%\range3.reg

REM proxy needed for heroku login
REM proxy can not use with fossil scm
REM proxy can not use with Rust installation
REM needed for node.js
REM set HTTP_PROXY=http://[2001:288:6004:xx::42]:3128
REM set HTTPS_PROXY=http://[2001:288:6004:xx::42]:3128

REM for PyRep
set VREP_PATH=%Local%\CoppeliaSim

REM BOOST_ROOT for compiling coppeliasim but maybe not for linking
REM set BOOST_ROOT=%Local%\boost_1_76_0\;
set path_copsim=%Local%\boost_1_76_0\;%Local%\Strawberry\perl\bin;%Local%\cmake-3.21.0-windows-x86_64\bin;%Local%\diffutils-2.8.7-1\bin;%Local%\patch-2.5.9-7\bin;%D%:\jom_1_1_2;%Local%\LLVM\bin;%Local%\QtCreator\bin;%Local%\CoppeliaSimEdu;%Local%\Python310\tcl\tcl8.6;

REM for CMake
set CMAKE_C_COMPILER=%Local%\msys64\ucrt64\bin\gcc;
set CMAKE_CXX_COMPILER=%Local%\msys64\ucrt64\bin\g++;

REM set QT_QPA_PLATFORM_PLUGIN_PATH=Y:\msys64_20240507\mingw64\share\qt5\plugins\platforms
REM set QT_PLUGIN_PATH=Y:\msys64_20240507\mingw64\share\qt5\plugins

REM for execute scite directly
set path_scite=%Local%\wscite\;

REM for simExtZMQ
set path_xsltproc=%Local%\xsltproc;

REM for OpenSSL
Set OPENSSL_CONF=%Local%\OpenSSL-Win64\SSL\openssl.cnf
set path_openssl=%Local%\OpenSSL-Win64\bin;

path=%Local%;%path_python%;%path_git%;%path_copsim%;%path_msys2%;%path_miketex%;%path_flutter%;%path_node%;%path_tcc%;%path_postgresql%;%path_range%;%path_lua%;%path_core%;%path_putty%;%path_vscode%;%RUST_PATH%;%path_erlang%;%path_nodejs%;%path_haskell%;%path_scite%;%path_xsltproc%;%path_gnuplot%;%path_openssl%;%path%;

REM for NX2312, must after path setup 
set SPLM_LICENSE_SERVER=29000@140.130.17.37
set UGII_LANG=english
set UGS_LICENSE_BUNDLE=ACD11,ACD10
set UGII_BASE_DIR=%NX_location%
set UGII_TMP_DIR=%Local%\tmp
set UGII_LIB_PATH=%NX_location%\NXBIN\python
set ugii=%NX_location%\ugii;%NX_location%\nxbin;
path = %ugii%;%path%
REM Xcopy %Local%\home_ipv6\AppData\Local\Siemens\NX2312 C:\users\%USERNAME%\AppData\Local\Siemens\NX2312 /E /H /C /I /Y

REM start ugraf -nx

REM python %Local%\tmp\nx_ex\new_part.py

start /MIN cmd.exe
start /MIN cmd.exe
start /MIN cmd.exe
start /MIN cmd.exe

start /MIN %Local%\wscite\SciTE.exe
start /MIN %Local%\wscite\SciTE.exe


Exit
