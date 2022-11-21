# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/RiceDroid/android -b thirteen -g default,-mips,-darwin,-notdefault
git clone https://github.com/azberto/local_manifest.git --depth 1 -b main .repo/local_manifests
repo sync

# build rom
. build/envsetup.sh
lunch lineage_X00TD-userdebug
export TZ=Asia/Kolkata
brunch X00TD
#end
