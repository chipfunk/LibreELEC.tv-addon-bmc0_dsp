# LibreELEC.tv addon bcm0/dsp

Provide [bmc0/dsp](https://github.com/bmc0/dsp) as addon for [LibreELEC](https://librelec.tv).

Supports only

- Alsa
- PulseAudio
- libsndfile
- fftw3

Support for zita-convolver is planned later on.


## Installing

No add-repository ATM, so please install via zip-file.

After installation a system-service `service.system.dsp` should be running.

To setup PulseAudio-integration on startup one can use service `kodi-autostart` to run `addon:///usr/share/pulseaudio.sh` automatically.


## Compiling

Fetch LibreELEC

    git clone https://github.com/LibreELEC/LibreELEC.tv/
    cd LibreELEC.tv/

Change to appropriate package-subfolder

    cd packages/audio/

Fetch prerequisites

    git clone https://github.com/chipfunk/LibreELEC.tv-addon-fftw3.git fftw3
    git clone https://github.com/chipfunk/LibreELEC.tv-addon-fftw3f.git fftw3f

Fetch source

    git clone https://github.com/chipfunk/LibreELEC.tv-addon-bmc0_dsp.git dsp

Build addon

    DISTRO=LibreELEC PROJECT=Amlogic DEVICE=AMLGX ARCH=arm scripts/create_addon dsp
