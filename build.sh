# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/RiceDroid/android -b thirteen -g default,-mips,-darwin,-notdefault
git clone https://github.com/god-goku/local-manifest.git --depth 1 -b sharma .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j24

# build rom
. build/envsetup.sh
lunch lineage_veux-userdebug
export TZ=Asia/Kolkata
export BUILD_USER=SharmaG
export BUILD_HOST=Loda
export BUILD_USERNAME=SharmaG
export BUILD_HOSTNAME=Loda
make bacon -j31
#end13
