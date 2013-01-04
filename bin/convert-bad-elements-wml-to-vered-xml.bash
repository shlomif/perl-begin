#!/bin/bash
output_file="src/tutorials/bad-elements/perl-elements-to-avoid.xml-grammar-vered.xml"
wml --passoption=3,-Ilib -Ilib -DLATEMP_THEME=better-scm -DLATEMP_SERVER=berlios --passoption=2,-X3074 --passoption=3,-I../lib/ --passoption=3,-w -I/home/shlomif/apps/latemp//lib/wml/include/ --passoption=2,-I/home/shlomif/apps/latemp//lib/wml/include/ -I/home/shlomif/.latemp/lib/ --passoption=2,-I/home/shlomif/.latemp/lib/ -I. -DROOT~. -I../lib/ --passoption=7,"-S imgsize" -I ${HOME}/apps/wml -I $HOME/conf/wml/Latemp/lib -DLATEMP_SERVER=berlios -DLATEMP_FILENAME=tutorials/bad-elements/index.html -o "$output_file" lib/XML-Grammar-Vered/bad-elements-to-xml.wml
jing lib/XML-Grammar-Vered/vered-xml.rng "$output_file" 2>&1
