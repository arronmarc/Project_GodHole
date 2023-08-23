function Screenshake() {
    with (oCamera) {
        if (argument0 > shakeRemain) {
            shakeMagnitude = argument0;
            shakeRemain = shakeMagnitude;
            shakeLength = argument1;
        }

        shakeRemain = max(0, shakeRemain - ((1 / shakeLength) * shakeMagnitude));
    }
}
