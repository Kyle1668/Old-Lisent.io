# Lisent :: Sentiment Analysis API

Sentiment Analysis: The process of computationally identifying and categorizing opinions expressed in a piece of text, especially in order to determine whether the writer's attitude towards a particular topic, product, etc., is positive, negative, or neutral.

### How to use
- Enter the desired text into the "input" argument of the below path
  - `http://lisent.herokuapp.com/get?input="TEXT"`
 
### Example
`  http://lisent.herokuapp.com/get?input="The Last Jedi was the best Star Wars movie ever!"`

```javascript
{
    id: null , 
    classification: "Positive", 
    ppos: 0.7275216854729308, 
    pneg: 0.2724783145270687, 
    argued_text: "The Last Jedi was the best Star Wars movie ever!", 
    user_key: null,
}
```

### Developed With!
  - Ruby on Rails
  - Deployed on Heroku
  - Python
    - Natural Lanuage Toolkit
    - Textblob

### Links
  - [Kyle O'Brien Linkedin](www.linkedin.com/in/kyle1668)
  - [TextBlob Documentation](http://textblob.readthedocs.io/en/dev/)
  - [Python NLTK Documentation](http://www.nltk.org/)
  - [Sentiment Analysis Wikipedia](https://en.wikipedia.org/wiki/Sentiment_analysis)
