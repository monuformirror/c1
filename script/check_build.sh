#!/usr/bin/env bash

msg() {
    echo -e "\e[1;32m$*\e[0m"
}

name_rom=$(grep init $CIRRUS_WORKING_DIR/build.sh -m 1 | cut -d / -f 4)
device=$(grep unch $CIRRUS_WORKING_DIR/build.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)
a=$(grep 'FAILED:' $WORKDIR/rom/$name_rom/build.log -m1 || true)
b=$(grep '#### build completed successfully' $WORKDIR/rom/$name_rom/build.log -m1 || true)
if [[ $a == *'FAILED:'* ]]
then
cd $WORKDIR/rom/$name_rom
echo ━━━━━━━━━━━ஜ۩۞۩ஜ━━━━━━━━━━
msg ⛔ .....Hat Bsdk..... ⛔
echo ━━━━━━━━━━━ஜ۩۞۩ஜ━━━━━━━━━━
curl -F document=@build.log "https://api.telegram.org/bot${TG_TOKEN}/sendDocument" \
    -F chat_id="${TG_CHAT_ID}" \
    -F "disable_web_page_preview=true" \
    -F "parse_mode=html" \
    -F caption="⛔${device} Build $name_rom Error⛔


Lo Chud Gai DT ya Source Ki Maa"
curl -s -X POST "https://api.telegram.org/bot${TG_TOKEN}/sendSticker" -d sticker="CAACAgQAAx0EabRMmQACAvhjEpueqrNRuGJo5vCfzrjjnFH1gAACagoAAtMOGVGNqOvAKmWo-h4E" -d chat_id="${TG_CHAT_ID}"
fi
if [[ $b == *'#### build completed successfully'* ]]
  then
  echo ━━━━━━━━━ஜ۩۞۩ஜ━━━━━━━━
  msg ✅ Chod Di Maa CI Ki Ab Khus Hai ✅
  echo ━━━━━━━━━ஜ۩۞۩ஜ━━━━━━━━
else
  echo ━━━━━━━━━ஜ۩۞۩ஜ━━━━━━━━
  msg ❌ ...Not Done Fuck Off... ❌
  echo ━━━━━━━━━ஜ۩۞۩ஜ━━━━━━━━
  echo Wait lets backup ccache for ur next build 😅
fi
