#!/bin/bash

##### Project variables #####
PROJECT_NAME="test-app"
SRC_DIR="$PROJECT_NAME/src"
PUBLIC_DIR="$PROJECT_NAME/public"
TARBALL="$PROJECT_NAME-$(date '+%Y%m%d_%H%M%S').tar.gz"
CHECKSUM_FILE="$TARBALL.sha256sum"
LOG_FILE="log_report-$PROJECT_NAME-$(date '+%Y%m%d_%H%M%S').txt"

##### Log report function #####
log_report() {
    echo "$1" | tee -a "$LOG_FILE"
}

##### Files to check for in the project #####
files=(
    "$PROJECT_NAME/package.json"
    "$SRC_DIR/index.js"
    "$SRC_DIR/App.js"
    "$PUBLIC_DIR/index.html"
)

##### Check all required files #####
app_files_complete="YES"
for f in "${files[@]}"; do
    if [ ! -e "$f" ]; then
        app_files_complete="NO"
        log_report "Missing required file: $f"
    fi
done

if [ "$app_files_complete" = "NO" ]; then
    log_report "One or more required files are missing. Exiting."
    exit 1
fi

##### Folders to exclude from tarball #####
app_folders_to_exclude="$PROJECT_NAME/node_modules"

##### Create tarball if project directory exists #####
if [ -d "$PROJECT_NAME" ]; then
    tar -czvf "$TARBALL" --exclude="$app_folders_to_exclude" "$PROJECT_NAME"/
    log_report "$PROJECT_NAME has been zipped into $TARBALL"
else
    log_report "Directory '$PROJECT_NAME' does not exist. Exiting."
    exit 1
fi

##### Create a checksum of the tarball #####
sha256sum "$TARBALL" > "$CHECKSUM_FILE"
log_report "Checksum file created at $(pwd)/$CHECKSUM_FILE"

##### Output the path of the tarball and checksum #####
echo "The path of the packages is $(pwd)"
log_report "The path of the packages is $(pwd)"

