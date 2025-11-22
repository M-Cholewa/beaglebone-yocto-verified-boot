#!/bin/bash

# Setup script for BeagleBone Black Verified Boot project

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== BeagleBone Black Verified Boot - Setup ==="
echo "Project directory: $PROJECT_DIR"
echo ""

# Sprawdź czy wszystkie warstwy istnieją
check_layer() {
    if [ ! -d "$PROJECT_DIR/$1" ]; then
        echo "ERROR: Layer $1 not found!"
        echo "Please clone it first."
        exit 1
    fi
    echo "✓ $1"
}

echo "Checking layers..."
check_layer "poky"
check_layer "meta-ti"
check_layer "meta-arm"
check_layer "meta-openembedded"
check_layer "meta-custom"

echo ""
echo "Layers OK!"
echo ""

# Sprawdź klucze
if [ ! -f "$PROJECT_DIR/keys/dev.key" ]; then
    echo "WARNING: Development keys not found in keys/"
    echo "Generate them with:"
    echo "  cd keys && openssl genrsa -F4 -out dev.key 4096"
    echo ""
fi

# Inicjalizuj środowisko
echo "Initializing build environment..."
source "$PROJECT_DIR/poky/oe-init-build-env" "$PROJECT_DIR/build"

echo ""
echo "=== Setup Complete ==="
echo ""
echo "You are now in the build directory."
echo "To build an image, run:"
echo "  bitbake core-image-minimal"
echo ""
echo "or your custom image:"
echo "  bitbake secure-image"
echo ""
