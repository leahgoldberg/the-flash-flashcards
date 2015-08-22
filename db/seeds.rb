
decks_1 = Deck.create(name: "Miscellaneous")
decks_2 = Deck.create(name: "Movies")
decks_3 = Deck.create(name: "Tech")



card_1 = Card.create({question: "What is the color of the sky?", answer: "Blue"})
card_2 = Card.create({question: "What is the opposite of being sad?", answer: "Happy"})
card_3 = Card.create({question: "What is the fastest animal in the world?", answer: "Cheetah"})
card_4 = Card.create({question: "What planet is closest to Earth?", answer: "Mars"})
card_5 = Card.create({question: "What fruit is usually red and has a company named after it?", answer: "Apple"})


card_6 = Card.create({question: "What's the name of animation studio that made ToyStory?", answer: "Pixar"})
card_7 = Card.create({question: "What movie series had a villian named Tom Riddle?", answer: "Harry Potter"})
card_8 = Card.create({question: "What movie created the concept a dream inside of a dream", answer: "Inception"})
card_9 = Card.create({question: "What movie grossed the most money worldwide of all time?", answer: "Avatar"})
card_10 = Card.create({question: "What movie included the cast of Robert De Niro, Ray Liota, and Joe Pesci?", answer: "Goodfellas"})


card_11 = Card.create({question: "What tech company holds a hackaton called Disrupt SF?", answer: "TechCrunch"})
card_12 = Card.create({question: "What tech company has bought out Oculas and WhatsApp", answer: "Facebook"})
card_13 = Card.create({question: "What app allows you to send photos to your friends for at least 10 seconds before a picture deletes?", answer: "Snapchat"})
card_14 = Card.create({question: "What year was google founded?", answer: "1998"})
card_15 = Card.create({question: "What venture capitlist had companies like Reddit, Airbnb, and Heroku go through its program?", answer: "Ycombinator"})


decks_1.cards << card_1
decks_1.cards << card_2
decks_1.cards << card_3
decks_1.cards << card_4
decks_1.cards << card_5

decks_2.cards << card_6
decks_2.cards << card_7
decks_2.cards << card_8
decks_2.cards << card_9
decks_2.cards << card_10

decks_3.cards << card_11
decks_3.cards << card_12
decks_3.cards << card_13
decks_3.cards << card_14
decks_3.cards << card_15




