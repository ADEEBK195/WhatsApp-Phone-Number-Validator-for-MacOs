#!/bin/bash
set -e
echo "=================================================="
echo " Building OutGrow WhatsApp Validator for macOS..."
echo "=================================================="

# Ensure dependencies are installed
npm install

# Build macOS DMG and ZIP packages
npm run dist:mac

echo ""
echo "=================================================="
echo " Build Complete!"
echo " macOS DMG & ZIP packages are located in: dist/"
echo "=================================================="
