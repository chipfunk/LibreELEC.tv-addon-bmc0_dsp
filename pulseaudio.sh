# Load NULL as default sink, dsp will pick-up sound from its null.monitor
pactl load-module module-null-sink \
    sink_name=DSP \
    format=s16le \
    rate=44100 \
    channels=2

# Load ALSA card for actual sound-ouptput
pactl load-module module-alsa-sink \
    device=default \
    format=s16le \
    rate=44100 \
    channels=2

pactl set-default-sink DSP

pactl move-source-output 0 DSP.monitor
