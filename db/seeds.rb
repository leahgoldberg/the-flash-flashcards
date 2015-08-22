trav = User.create({username: "twa", password: "password", email: "t@t.com"})

george = User.create({username: "gp3", password: "password", email: "g@g.com"})

ernesto = User.create({username: "em", password: "password", email: "e@e.com"})

trav_deck = trav.decks.create({name: "Presidents"})

trav_deck.cards.create({question: "Who was first president?", answer: "George Washington"})
trav_deck.cards.create({question: "Who is current president?", answer: "Barack Obama"})

george_deck = george.decks.create({name: "Country Capitals"})

george_deck.cards.create({question: "What is capital of Canada?", answer: "Ottawa"})
george_deck.cards.create({question: "What is capital of France?", answer: "Paris"})
george_deck.cards.create({question: "What is capital of Afghanistan?", answer: "Kabul"})
george_deck.cards.create({question: "What is capital of Austria?", answer: "Vienna"})
george_deck.cards.create({question: "What is capital of Mexico?", answer: "Mexico City"})
george_deck.cards.create({question: "What is capital of Denmark?", answer: "Copenhagen"})
george_deck.cards.create({question: "What is capital of Egypt?", answer: "Cairo"})
george_deck.cards.create({question: "What is capital of Russia?", answer: "Moscow"})
george_deck.cards.create({question: "What is capital of South Korea?", answer: "Seoul"})
george_deck.cards.create({question: "What is capital of Germany", answer: "Berlin"})
george_deck.cards.create({question: "What is capital of Somalia?", answer: "Mogadishu"})





