# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/CherishOS/android_manifest -b tiramisu -g default,-mips,-darwin,-notdefault
git clone https://github.com/god-goku/local-manifest.git --depth 1 -b cherry .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
. build/envsetup.sh
lunch cherish_veux-userdebug
export TZ=Asia/Kolkata
export BUILD_USER=Monu
export BUILD_HOST=Loda
export BUILD_USERNAME=Monu
export BUILD_HOSTNAME=Loda
brunch veux 
#end13
