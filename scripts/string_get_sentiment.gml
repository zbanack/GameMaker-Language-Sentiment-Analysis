///string_get_sentiment(str);

var str = argument0;
var arr = tokenize(str);

var pos_sum = 0;
var neg_sum = 0;
var neu_count = 0;
var sum_s = 0;

var has_negator = false;

for(var i = 0; i < array_length_1d(arr); i++) {
    var negated = false;
    var boosted = 0;
    var word_is_uppercase = string_upper(arr[i]) == arr[i];
    show_debug_message(string(arr[i]) + ', ' + string(word_is_uppercase));
    var sentiment_score = word_get_sentiment(arr[i]);
    var word_classification = classify_word(arr[i], sentiment_score);
    
    if (has_negator) sentiment_score *= (N_SCALAR);
    
    // uppercase amplification
    if (word_is_uppercase) sentiment_score *= C_INCR;
    
    if (word_classification == Type.isNegator) {
        has_negator=!has_negator;
    }
    else if (word_classification == Type.isBoosterPos) {
        sum_s+=B_INCR;
    }
    else if (word_classification == Type.isBoosterNeg) {
        sum_s-=B_DECR;
    }
    else if (word_classification == Type.isLexicon) {
        has_negator = false;
    }

    if (sentiment_score > 0) {
        pos_sum += sentiment_score + 1;
    } else if (sentiment_score < 0) {
        neg_sum += sentiment_score - 1;
    } else {
        neu_count += 1;
    }
    
    sum_s += sentiment_score;
}

var compound = normalize(sum_s, 15);
var total = pos_sum + abs(neg_sum) + neu_count;
var pos = abs(pos_sum / total);
var neg = abs(neg_sum / total);
var neu = abs(neu_count / total);

return compound;
