# Install all base packages
mapfile -t packages < <(grep -v '^#' "$FRAMEWORK13_INSTALL/base.packages" | grep -v '^$')
pkg-add "${packages[@]}"
