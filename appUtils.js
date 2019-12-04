function dp(pixelDensity, x) {
	return (pixelDensity * 25.4 < 120) ? x : x*(pixelDensity * 25.4/160);
}

function baseColor() {
    return "#303030"
}

function primaryColor() {
    return "#acacac"
}

function textColor() {
    return "#a6aaa2"
}

function textAltColor() {
    return "#434f4d"
}

function backgroundColor() {
    return "#eeeeee"
}

function backgroundAltColor() {
    return "#aaaaaa"
}

function baseFontSize(pixelDensity){
    return Number(dp(pixelDensity, 14));
}

function headerFontSize(pixelDensity){
    return Number(dp(pixelDensity, 28));
}

