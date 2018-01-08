import urllib3
import sys
import json
import nltk
from textblob import TextBlob
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize
from textblob.sentiments import NaiveBayesAnalyzer


def format_input():
    user_input = sys.argv[1]
    formatted_words = []
    return_text = "test"

    porter_algorithm = PorterStemmer()
    stop_words = set(stopwords.words("English"))

    # Tokenize the text by word and remove punctuation.
    words = word_tokenize(user_input)
    tokenized_words = [word.lower() for word in words if word.isalpha()]

    if len(user_input) != 0:
        for in_word in tokenized_words:
            if in_word not in stop_words:
                stemmed_word = porter_algorithm.stem(in_word)
                formatted_words.append(stemmed_word)

    for word in formatted_words:
        return_text += (word + " ")

    return return_text


def get_sentiment(argued_text):
    formatted_argued_text = TextBlob(argued_text, analyzer=NaiveBayesAnalyzer())
    return formatted_argued_text.sentiment


def convert_data_to_json(sentiment_data):
    if sentiment_data.p_pos is sentiment_data.p_neg:
        return_classification = "Neutral"
    elif sentiment_data.classification is "pos":
        return_classification = "Positive"
    else:
        return_classification = "Negative"

    return {
        "argued_text": sys.argv[1],
        "classification": return_classification,
        "P_Pos": sentiment_data.p_pos,
        "P_Neg": sentiment_data.p_neg
    }


def main():

    if len(sys.argv) >= 1:
        entered_text = format_input()
        sentiment_data = get_sentiment(entered_text)
        json_response = convert_data_to_json(sentiment_data)

        json.dump(json_response, sys.stdout, indent=4, sort_keys=True)
    else:
        json.dump({
            "argued_text": None,
            "classification": None,
            "P_Pos": None,
            "P_Neg": None
        }, sys.stdout, indent=4, sort_keys=True)


main()
