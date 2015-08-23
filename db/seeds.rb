
decks_1 = Deck.create(name: "Miscellaneous")
decks_2 = Deck.create(name: "Movies")
decks_3 = Deck.create(name: "Tech")
decks_4 = Deck.create(name: "History")
decks_5 = Deck.create(name: "Sports")
decks_6 = Deck.create(name: "Pop Cultural")
decks_7 = Deck.create(name: "Art")
decks_8 = Deck.create(name: "Literature")



misc_cards = [
card_1 = Card.create({question: "What is the color of the sky?", answer: "Blue"}),
card_2 = Card.create({question: "What is the opposite of being sad?", answer: "Happy"}),
card_3 = Card.create({question: "What is the fastest animal in the world?", answer: "Cheetah"}),
card_4 = Card.create({question: "What planet is closest to Earth?", answer: "Mars"}),
card_5 = Card.create({question: "What fruit is usually red and has a company named after it?", answer: "Apple"})]


movie_cards = [
card_6 = Card.create({question: "What's the name of animation studio that made ToyStory?", answer: "Pixar"}),
card_7 = Card.create({question: "What movie series had a villian named Tom Riddle?", answer: "Harry Potter"}),
card_8 = Card.create({question: "What movie created the concept a dream inside of a dream", answer: "Inception"}),
card_9 = Card.create({question: "What movie grossed the most money worldwide of all time?", answer: "Avatar"}),
card_10 = Card.create({question: "What movie included the cast of Robert De Niro, Ray Liota, and Joe Pesci?", answer: "Goodfellas"})]

tech_cards = [
card_11 = Card.create({question: "What tech company holds a hackaton called Disrupt SF?", answer: "TechCrunch"}),
card_12 = Card.create({question: "What tech company has bought out Oculas and WhatsApp?", answer: "Facebook"}),
card_13 = Card.create({question: "What app allows you to send photos to your friends for at least 10 seconds before a picture deletes?", answer: "Snapchat"}),
card_14 = Card.create({question: "What year was google founded?", answer: "1998"}),
card_15 = Card.create({question: "What venture capitlist had companies like Reddit, Airbnb, and Heroku go through its program?", answer: "Ycombinator"})]


history_cards = [
card_16 = Card.create({question: "When is America's independence day?", answer: "1776"}),
card_17 = Card.create({question: "Who was the second president of the United States?", answer: "John Adams"}),
card_18 = Card.create({question: "What is the 48th state that was added to America?", answer: "Arizona"}),
card_19 = Card.create({question: "What is the current Secretary of State?", answer: "Hilary Clinton"}),
card_20 = Card.create({question: "How much money did the Dutch colonists pay for America?", answer: "24"})
]

sport_cards = [
card_21 = Card.create({question: "What sport is known as the past time of America?", answer: "Baseball"}),
card_22 = Card.create({question: "What is the most watched sport in the whole world?", answer: "Soccer"}),
card_23 = Card.create({question: "What sport uses the ball called a pigskin?", answer: "Football"}),
card_24 = Card.create({question: "What sport did Michael Jordan play?", answer: "Basketball"}),
card_25 = Card.create({question: "What sport did Wayne Gretzky?", answer: "Hockey"})]

pop_cultural_cards = [
card_26 = Card.create({question: "What did Bruce Jenner changed his first name to?", answer: "Caitlyn"}),
card_27 = Card.create({question: "Which prominent celebrity is running for President of the United States of America?", answer: "Donald Trump"}),
card_28 = Card.create({question: "What show on television takes place in an zombie apocalyptic world in the state of Georgia?(Must include full title)", answer: "The Walking Dead"}),
card_29 = Card.create({question: "What station air's The Tonight Show Starring Jimmy Fallon?", answer: "NBC"}),
card_30 = Card.create({question: "Which famous athlete is married to Gisele Bundchen", answer: "Tom Brady"})]


painting_cards = [
card_31 = Card.create({question: "Who painted the Mona Lisa?", answer: "Leonardo da Vinci"}),
card_32 = Card.create({question: "Who painted  The Sistine Chapel ceiling?", answer: "Michelangelo"}),
card_33 = Card.create({question: "Who painted the Scream?", answer: "Edvard Munch"}),
card_34 = Card.create({question: "Who painted the Starry Night?", answer: "Vincent Van Gogh"}),
card_35 = Card.create({question: "Who painted the American Gothic?", answer: "Grant Wood"})
]

book_cards = [
card_36 = Card.create({question: "Who wrote The Catcher in the Rye?(Last name only)", answer: "Salinger"}),
card_37 = Card.create({question: "Who wrote to Kill a Mockingbird?", answer: "Harper Lee"}),
card_38 = Card.create({question: "Who wrote The Great Gatsby?(Last name only)", answer: "Fitzgerald"}),
card_39 = Card.create({question: "Who wrote the Hardy Boys series?", answer: "Edward Stratemeyer"}),
card_40 = Card.create({question: "Who wrote the Harry Potter series?(Last name only?)", answer: "Rowling"})]






misc_cards.each do |card|
  decks_1.cards << card
end

movie_cards.each do |card|
  decks_2.cards << card
end

tech_cards.each do |card|
  decks_3.cards << card
end

history_cards.each do |card|
  decks_4.cards << card
end

sport_cards.each do |card|
  decks_5.cards << card
end

pop_cultural_cards.each do |card|
  decks_6.cards << card
end

painting_cards.each do |card|
  decks_7.cards << card
end

book_cards.each do |card|
  decks_8.cards << card
end







