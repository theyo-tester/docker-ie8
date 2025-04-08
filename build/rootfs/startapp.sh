#!/bin/sh

# Function to search for a string in a file
search_app() {
    local app="$1"

    # Use grep to search for the pattern and count the occurrences
    local count=$(wine uninstaller --list 2>&1 | grep -wc "$app")
    [ $count -gt 0 ] && echo "Found ${app} !"
    # Return the count
    return $count
}


export HOME=/config
export WINEARCH=win32
export DXVK_LOG_LEVEL=none
export VKD3D_LOG_LEVEL=none

silverlight_Name="Microsoft Silverlight"


wine --version
wineboot -i
#winecfg
#winetricks --version
#vulkaninfo
#vulkan-smoketest 
#wine regedit $HOME/disableBluetooth.reg
echo "updating winetricks..."
winetricks --self-update
echo "done updating winetricks"
#wine regedit

#winetricks graphics=x11
echo "=== install wininet ==="
winetricks wininet

echo "=== install msxml6 ==="
winetricks msxml6

echo "========= wine installed packages: ==============="
wine uninstaller --list
echo "=================="
wine uninstaller
search_app "Microsoft .NET Framework 4.8"
result=$?

if [ "$result" -eq 0 ]; then
  echo "Installing corefonts, dkvk & dotnet48 !!!"
  # use --force if needed
  winetricks --force corefonts dxvk dotnet48
fi

echo "=========== winetricks d3dx9 ==============="
winetricks d3dx9

search_app "Microsoft Visual C++ 2015-2022 Redistributable"
result=$?
if [ "$result" -eq 0 ]; then
  echo "Installing vc runtime 2022 !!!"
  winetricks --force vcrun2022 vcrun2019 vcrun2012 vcrun2010
fi

search_app "$silverlight_Name"
result=$?
if [ "$result" -eq 0 ]; then
  echo "Install $silverlight_Name !!!"
  exec wine /Silverlight.exe >> /config/log/app.log 2>>/config/log/app_error.log
fi
echo " ==================================== SILENTLY INSTAL ====================================="
exec wine /Silverlight.exe /q /doNotRequireDRMPrompt /noupdate
search_app "Internet Explorer 8"

result=$?
if [ "$result" -eq 0 ]; then
  echo "installing ie8 over winetricks"
  winetricks --force ie8
  winetricks --force ie8_kb2936068
#ie8_kb2936068            Cumulative Security Update for Internet Explorer 8 (Microsoft, 2014) [downloadable]
#ie8_tls12                TLS 1.1 and 1.2 for Internet Explorer 8 (Microsoft, 2017) [downloadable]
  echo "ie8 over winetricks installed"
fi

echo " ================== START IE8 =================="
cd $HOME/.wine/drive_c/Program\ Files/Internet\ Explorer/
wine iexplore.exe

#while true; do
#    sleep 10
#done

