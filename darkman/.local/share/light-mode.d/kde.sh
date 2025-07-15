#!/bin/bash
sed -i 's/ColorScheme=.*/ColorScheme=BreezeDark/' ~/.config/qt5ct/qt5ct.conf
sed -i 's/Style=.*/Style=Fusion/' ~/.config/qt5ct/qt5ct.conf # Or whatever style you prefer for dark

sed -i 's/ColorScheme=.*/ColorScheme=BreezeDark/' ~/.config/qt6ct/qt6ct.conf
sed -i 's/Style=.*/Style=Fusion/' ~/.config/qt6ct/qt6ct.conf # Or whatever style you prefer for dark
