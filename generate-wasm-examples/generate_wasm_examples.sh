#!/bin/sh

./clone_bevy.sh

# temporary: fetch tools from main branch
cd ..
git init bevy-tools
git remote add origin https://github.com/bevyengine/bevy
git pull --depth=1 origin main
rm -rf bevy/tools
cp -r bevy-tools/tools bevy
rm -rf bevy-tools
cd bevy

cargo run -p example-showcase -- build-website-list --content-folder content --api webgl2
mv content ../../content/examples

rm -rf content

cargo run -p example-showcase -- build-website-list --content-folder content --api webgpu
mv content ../../content/examples-webgpu
