#!/bin/bash

##### Log report function #####
report="log_report-$(date '+%Y%m%d_%H%M%S').txt"
log_report() {
    echo "$1" | tee -a "$report"                   
}

##### Files to check for in a React app #####
files=(
    "test-app/package.json"
    "test-app/src/index.js"
    "test-app/src/App.js"
    "test-app/public/index.html"
)

app_files_complete="YES"
for f in "${files[@]}"; do
    if [ ! -e "$f" ]; then
        app_files_complete="NO"
        log_report "Missing required file: $f"
        exit 1
    fi
done

##### Folders to exclude #####
app_folders_to_exclude="test-app/node_modules"

##### Check existence of complete test-app and create the tarball #####
if [ -d "test-app" ] && [ "$app_files_complete" = "YES" ]; then
    tar -czvf test-app.tar.gz --exclude="$app_folders_to_exclude" test-app/
    log_report "test-app has been zipped into test-app.tar.gz"
else
    echo "No test-app to zip or required files incomplete in test-app"
    log_report "No test-app to zip or required files incomplete in test-app"
    exit 1
fi

##### Create a checksum of the tarball #####
sha256sum test-app.tar.gz > test-app.tar.gz.sha256sum   
log_report "Checksum has been created for the tarball"

##### Output the path of the tarball and checksum #####
echo "The path of the packages is $(pwd)"
log_report "The path of the packages is $(pwd)"
