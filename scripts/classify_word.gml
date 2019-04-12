///classify_word(str, score);

var str = argument0;
var scr = argument1;

if (scr != 0) return Type.isLexicon;

if (word_is_negator(str)) return Type.isNegator;
if (word_is_booster_pos(str)) return Type.isBoosterPos;
if (word_is_booster_neg(str)) return Type.isBoosterNeg;

return Type.isNeutral;
