del b.list /q/f
FOR /F "tokens=2,3,* delims=:= " %%i IN ('adb shell pm list package -f') DO ( echo %%i|find /I "/data/" >>a1.list || echo %%i >>b.list)
adb push ./list.sh /data/local/tmp/
adb shell chmod 777 /data/local/tmp/list.sh
adb shell /data/local/tmp/list.sh
adb pull /data/local/tmp/a2.list