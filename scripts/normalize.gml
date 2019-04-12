///normalize(score, alpha);

var scr = argument0;
var alp = argument1;

var norm_score = scr / sqrt(scr * scr + alp);
if (norm_score < -1.0) {
    return -1.0;
} else if (norm_score > 1.0) {
    return 1.0;
} else {
    return norm_score;
}
