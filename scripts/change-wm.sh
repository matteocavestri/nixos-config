#!/bin/sh

echo ""
echo "Building System Configuration ..."
echo ""
if sudo nixos-rebuild build --flake .#nixos-t2; then
    echo ""
    echo "Preparing Configuration to Boot ..."
    echo ""
    if sudo nixos-rebuild boot --flake .#nixos-t2; then
        echo ""
        echo "Setting User configuration ..."
        echo ""
        if home-manager switch --flake .#matteocavestri; then
            echo ""
            echo "Reboot your System"
            echo ""
        else
            echo "Setting User configuration failed."
            exit 1
        fi
    else
        echo "Preparing Configuration to Boot failed."
        exit 1
    fi
else
    echo "Building System Configuration failed."
    exit 1
fi

