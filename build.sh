# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/CherishOS/android_manifest -b 20/11 -g default,-mips,-darwin,-notdefault
git clone https://github.com/god-goku/local-manifest.git --depth 1 -b cherry .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
. build/envsetup.sh
lunch cherish_veux-userdebug
export TZ=Asia/Kolkata
brunch veux 
#end13
