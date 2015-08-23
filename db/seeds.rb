trav = User.create({username: "twa", password: "password", email: "t@t.com"})

george = User.create({username: "gp3", password: "password", email: "g@g.com"})

ernesto = User.create({username: "em", password: "password", email: "e@e.com"})

trav_deck = trav.decks.create({name: "Presidential Trivia"})

george_deck = george.decks.create({name: "Country Capitals"})

e_deck = ernesto.decks.create({name: "Star Wars Trivia"})

trav_deck.cards.create({question: "Who was first President?", answer: "George Washington"})
trav_deck.cards.create({question: "Who is current President?", answer: "Barack Obama"})
trav_deck.cards.create({question: "How many Presidents have been assassinated?", answer: "4"})
trav_deck.cards.create({question: "What is the most common religious affiliation among Presidents?", answer: "Episcopalian"})
trav_deck.cards.create({question: "Who was the shortest President?", answer: "James Madison"})
trav_deck.cards.create({question: "Who was the only President to never marry?", answer: "James Buchanan"})
trav_deck.cards.create({question: "How many Presidents have died on the 4th of July?", answer: "3"})
trav_deck.cards.create({question: "Which President began calling his residence the White House?", answer: "Theodore Roosevelt"})
trav_deck.cards.create({question: "Which President was sworn in by a woman?", answer: "Lyndon B. Johnson"})
trav_deck.cards.create({question: "Who was the heaviest President?", answer: "William Howard Taft"})
trav_deck.cards.create({question: "Which President established the first National Park?", answer: "Ulysses S. Grant"})

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

e_deck.cards.create({question: "What class of droid was C-3P0?" , answer: "Protocol Droid"})
e_deck.cards.create({question: "On what planet was Boba Fett born?", answer: "Mandalore"})
e_deck.cards.create({question: "What do the initials TIE stand for?", answer: "Twin Ion Engine"})
e_deck.cards.create({question: "Where do Wookies come from?" , answer: "Kashyyyk"})
e_deck.cards.create({question: "What was the name of Darth Vader's flagship?", answer: "Executor"})
e_deck.cards.create({question: "In what planetary system was the first Death Star destroyed?", answer: "Yavin"})
e_deck.cards.create({question: "Who was Obi-Wan Kenobi's master?", answer: "Qui-Gon Jinn"})
e_deck.cards.create({question: "What was the capital planet of the Empire?", answer: "Coruscant"})
e_deck.cards.create({question: "The Grand Army of the Republic was made up of clones of whom?", answer: "Jango Fett"})
e_deck.cards.create({question: "What was Luke Skywalker's homeworld?", answer: "Tatooine"})



