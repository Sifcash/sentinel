#!/bin/bash
set -evx

mkdir ~/.sifcashcore

# safety check
if [ ! -f ~/.sifcashcore/.sifcash.conf ]; then
  cp share/sifcash.conf.example ~/.sifcashcore/sifcash.conf
fi
