import 'package:flutter/material.dart';
import 'package:topeka/constants.dart';
import 'package:topeka/models/quiz.dart';

class Category {
  Category({
    required this.name,
    required this.id,
    required this.theme,
    required this.quizzes,
    required this.backgroundColor,
    required this.primaryColor,
    required this.primaryDarkColor,
    required this.accentColor,
    required this.textColor,
  });

  final String name;
  final String id;
  final String theme;
  final List<Quiz> quizzes;
  final Color backgroundColor;
  final Color primaryColor;
  final Color primaryDarkColor;
  final Color accentColor;
  final Color textColor;

  static List<Category> sampleData() {
    final foodData = [
      Quiz(
        type: 'four-quarter',
        question: 'Name the Italian, semi-soft, rich cheese with blue veins through it.',
        options: ['Ricotta', 'Blue Cheese', 'Gorgonzola', 'Parmesan'],
        answer: [2],
      ),
      Quiz(
        type: 'true-false',
        question: 'Coffee beans contain more caffeine than tea leaves.',
        answer: false,
      ),
      Quiz(
        type: 'multi-select',
        question: 'What are the three ingredients in mead (spices excluded)?',
        options: ['Sugar', 'Honey', 'Cinnamon', 'Water', 'Brown Sugar', 'Yeast', 'Salt'],
        answer: [1, 3, 5],
      ),
      Quiz(
        type: 'four-quarter',
        question: 'What crop does the Colorado Beetle attack?',
        options: ['Corn', 'Garlic', 'Potato', 'Wheat'],
        answer: [2],
      ),
      Quiz(
        type: 'single-select-item',
        question: 'What vegetable did Mark Twain describe as “cabbage with a college education”?',
        options: ['Spinach', 'Broccoli', 'Cauliflower', 'Kale'],
        answer: [2],
      ),
      Quiz(
        type: 'fill-blank',
        question: 'What name is given to a sugar syrup which is gently heated until it browns?',
        answer: 'Caramel',
      ),
      Quiz(
        type: 'single-select',
        question: 'In Which city was chop suey invented?',
        options: ['Hong Kong', 'Taipei', 'New York', 'San Francisco'],
        answer: [3],
      ),
      Quiz(
        type: 'picker',
        question: 'One of the fattiest fishes is salmon. 4 ounces contains how many grams of fat?',
        min: 1,
        max: 10,
        answer: 9,
      ),
      Quiz(
        type: 'fill-blank',
        question: 'In which American State did chili con carne originate?',
        answer: 'Texas',
      ),
      Quiz(
        type: 'four-quarter',
        question: 'What is the correct name for a cluster or bunch of bananas?',
        options: ['Foot', 'Hand', 'Flock', 'Pod'],
        answer: [1],
      ),
    ];

    final knowledgeData = [
      Quiz(
        type: 'fill-blank',
        question:
            'Mole is a popular paste in Mexico. Mole is a mixture of chili’s and what other tasty ingredient?',
        answer: 'Chocolate',
      ),
      Quiz(
        type: 'four-quarter',
        question: 'What is the name of the famous art deco skyscraper in New York City?',
        options: [
          'Trump Tower',
          'Chrysler building',
          'Empire State Building',
          'The New York Times Building'
        ],
        answer: [1],
      ),
      Quiz(
        type: 'multi-select',
        question: 'Select the names of “The Three Musketeers”.',
        options: ['Chevy', 'Topeka', 'Athos', 'Duke', 'Porthos', 'John Felton', 'Aramis'],
        answer: [2, 4, 6],
      ),
      Quiz(
        type: 'toggle-translate',
        question: 'Which is the correct translation of Zorro?',
        options: [
          ['Zorro', 'Dog'],
          ['Zorro', 'Sword'],
          ['Zorro', 'Fox'],
          ['Zorro', 'Coyote']
        ],
        answer: [2],
      ),
      Quiz(
        type: 'single-select-item',
        question: 'Which 1971 film, known for its violence, was the first to use Dolby sound?',
        options: ['Straw Dogs', 'Dirty Harry', 'A Clockwork Orange', 'Play Misty for me'],
        answer: [2],
      ),
      Quiz(
        type: 'picker',
        question: 'How many counters does a backgammon player have?',
        min: 0,
        max: 30,
        answer: 15,
      ),
      Quiz(
        type: 'true-false',
        question: 'There is a patron saint of The Internet.',
        answer: true,
      ),
      Quiz(
        type: 'alpha-picker',
        question: 'Which letter other than X scores 8 in Scrabble?',
        answer: 'J',
      ),
      Quiz(
        type: 'four-quarter',
        question:
            'Four of the worst ten maritime disasters all took place in 1945. In which sea were all four ships sunk?',
        options: ['Mediterranean sea', 'Baltic Sea', 'The Bermuda Triangle', 'Black Sea'],
        answer: [1],
      ),
      Quiz(
        type: 'single-select',
        question: 'What nut is used to flavor marzipan?',
        options: ['Walnut', 'Almond', 'Cashew', 'Pistachio'],
        answer: [1],
      ),
    ];

    final historyData = [
      Quiz(
        type: 'fill-blank',
        question: 'The first words spoken on the moon by Buzz Aldrin were these:',
        start: 'Contact ',
        answer: 'Light',
      ),
      Quiz(
        type: 'single-select-item',
        question:
            'What U.S. President committed an unpardonable sin by kissing the Queen Mother on the lips?',
        options: [
          'George W. Bush',
          'Jimmy Carter',
          'Barack Obama',
          'Lyndon B. Johnson',
          'Ronald Reagan'
        ],
        answer: [1],
      ),
      Quiz(
        type: 'true-false',
        question: 'Cleopatra was Egyptian.',
        answer: false,
      ),
      Quiz(
        type: 'true-false',
        question:
            'The Rosetta Stone is the name of the limestone slab that became the key for deciphering ancient Egyptian hieroglyphics.',
        answer: false,
      ),
      Quiz(
        type: 'fill-blank',
        question: 'Prior to 1664 New York was called:',
        start: 'New ',
        answer: 'Amsterdam',
      ),
      Quiz(
        type: 'multi-select',
        question: 'What are the surnames of Bonnie and Clyde?',
        options: ['Parson', 'Parker', 'Patterson', 'Barlow', 'Barret', 'Barrow'],
        answer: [1, 5],
      ),
      Quiz(
        type: 'four-quarter',
        question:
            'Joan of Arc, in the 15th century, was the first female promoted to this rank in the French army:',
        options: ['Lieutenant', 'Sergeant', 'General', 'Captain'],
        answer: [2],
      ),
      Quiz(
        type: 'picker',
        question: 'In which year did William Shakespeare die?',
        min: 1615,
        max: 1635,
        answer: 1616,
      ),
      Quiz(
        type: 'single-select',
        question: 'On which island was Napoleon born?',
        options: ['Sardinia', 'Corsica', 'Tahiti', 'Réunion', 'New Caledonia'],
        answer: [1],
      ),
      Quiz(
        type: 'multi-select',
        question: 'Which states did the United States gain after the Mexican War?',
        options: ['Arizona', 'New Mexico', 'Louisiana', 'California', 'Nevada', 'Utah', 'Texas'],
        answer: [1, 3, 6],
      ),
    ];

    final geographyData = [
      Quiz(
        type: 'fill-blank',
        question: 'Name the other state in the USA that starts with the letter A:',
        start: 'Alabama, Alaska, Arizona, and ',
        answer: 'Arkansas',
      ),
      Quiz(
        type: 'toggle-translate',
        question: 'Select which landmark to American state pairings are correct:',
        options: [
          ['Las Vegas', 'Arizona'],
          ['Death Valley', 'California'],
          ['Mount Rushmore', 'North Dakota'],
          ['Fort Knox', 'Kentucky'],
          ['Kennedy Space Center', 'Florida']
        ],
        answer: [1, 3, 4],
      ),
      Quiz(
        type: 'true-false',
        question: 'A person born in Lombardy is Italian.',
        answer: true,
      ),
      Quiz(
        type: 'picker',
        question: 'Approximately how many kilometers of coastline does the United Kingdom have?',
        min: 2000,
        max: 5000,
        step: 500,
        answer: 2500,
      ),
      Quiz(
        type: 'multi-select',
        question: 'Which three countries have fifty or more nuclear reactors?',
        options: ['USA', 'Russia', 'Canada', 'Brazil', 'France', 'Japan', 'China'],
        answer: [0, 4, 5],
      ),
      Quiz(
        type: 'fill-blank',
        question: 'What country would you visit to see Casablanca?',
        answer: 'Morocco',
      ),
      Quiz(
        type: 'single-select-item',
        question: 'In which city was the 1992 Olympics?',
        options: ['Atlanta', 'Barcelona', 'Seoul', 'Sydney'],
        answer: [1],
      ),
      Quiz(
        type: 'fill-blank',
        question: 'What food is named after a northern German city on the river Elbe?',
        answer: 'Hamburger',
      ),
      Quiz(
        type: 'multi-select',
        question: 'Select two countries that are linked by the Brenner Pass:',
        options: [
          'Germany',
          'Croatia',
          'Austria',
          'Switzerland',
          'France',
          'Italy',
          'Czech Republic'
        ],
        answer: [2, 5],
      ),
      Quiz(
        type: 'single-select',
        question: 'Where can you find the Pensacola Mountains?',
        options: ['Florida', 'Switzerland', 'Antarctica', 'Argentina'],
        answer: [2],
      ),
    ];

    final scienceData = [
      Quiz(
        type: 'fill-blank',
        question: 'What is the layer of the earth underneath the crust called?',
        answer: 'Mantle',
      ),
      Quiz(
        type: 'single-select-item',
        question: 'What is the only bird that can fly backwards?',
        options: ['Crow', 'Hummingbird', 'Pelican', 'Seagull', 'Albatross', 'Falcon', 'Sparrow'],
        answer: [1],
      ),
      Quiz(
        type: 'four-quarter',
        question: 'What is the only cat in the world that can’t retract its claws?',
        options: ['Meerkat', 'Bobcat', 'Cheetah', 'Siamese'],
        answer: [2],
      ),
      Quiz(
        type: 'toggle-translate',
        question: 'Which chemical symbols are incorrect?',
        options: [
          ['Helium', 'He'],
          ['Tungsten', 'W'],
          ['Lithium', 'Lt'],
          ['Nickel', 'Ni'],
          ['Copper', 'C'],
          ['Zinc', 'Zn'],
          ['Cadmium', 'Cd'],
          ['Potassium', 'K'],
          ['Silicon', 'Sn']
        ],
        answer: [2, 4, 8],
      ),
      Quiz(
        type: 'true-false',
        question: 'The vitreous humour is found in the human eye.',
        answer: true,
      ),
      Quiz(
        type: 'fill-blank',
        question: 'What’s the third color of the rainbow?',
        answer: 'Yellow',
      ),
      Quiz(
        type: 'picker',
        question: 'How many toes do most birds have?',
        min: 2,
        max: 12,
        answer: 8,
      ),
      Quiz(
        type: 'picker',
        question:
            'If the temperature in Centigrade is minus 40 degrees what is the temperature in Fahrenheit?',
        min: -100,
        max: 0,
        step: 5,
        answer: -40,
      ),
      Quiz(
        type: 'four-quarter',
        question: 'What sort of creature is a fluke?',
        options: ['Bird', 'Insect', 'Worm', 'Bear'],
        answer: [2],
      ),
      Quiz(
        type: 'fill-two-blanks',
        question: 'What two metals together make brass?',
        answer: ['Copper', 'Zinc'],
      ),
    ];

    final tvmoviesData = [
      Quiz(
        type: 'multi-select',
        question: 'Select the actors who played James Bond:',
        options: [
          'Sean Connery',
          'Clive Owen',
          'Timothy Dalton',
          'David Niven',
          'Clint Eastwood',
          'Toby Stephens'
        ],
        answer: [0, 2, 3, 5],
      ),
      Quiz(
        type: 'fill-blank',
        question: 'In which movie were Kevin Bacon, Bill Paxton, and Tom hanks on an aircraft?',
        answer: 'Apollo 13',
      ),
      Quiz(
        type: 'four-quarter',
        question: 'In which famous sci-fi film did Robert Patrick play an assassin?',
        options: ['Blade Runner', 'Terminator 2', 'Watchmen', 'Forbidden Planet'],
        answer: [1],
      ),
      Quiz(
        type: 'single-select',
        question: 'What was the name of Mork and Mindy’s child?',
        options: ['Micah', 'Morty', 'Mearth', 'Magnus'],
        answer: [2],
      ),
      Quiz(
        type: 'picker',
        question: 'How old is Bart Simpson?',
        min: 6,
        max: 13,
        answer: 10,
      ),
      Quiz(
        type: 'fill-blank',
        question:
            'Where had King Kong lived before coming to New York in the 1933 film \"King Kong\"?',
        end: 'island',
        answer: 'skull',
      ),
      Quiz(
        type: 'true-false',
        question: 'Stanley Kubrick directed the 1971 film \"THX 1138.\"',
        answer: false,
      ),
      Quiz(
        type: 'picker',
        question:
            'The film \"Ben Hur\" holds the record for winning more Oscars than any other movie. How many?',
        min: 4,
        max: 15,
        answer: 11,
      ),
      Quiz(
        type: 'four-quarter',
        question: 'Which Spielberg film gives an unflattering account of Carcharodon Carcharias?',
        options: ['Saving Private Ryan', 'E.T.', 'Jaws', 'The Color Purple'],
        answer: [2],
      ),
      Quiz(
        type: 'fill-blank',
        question: 'In which film did Robert De Niro ask “Are you talkin’ to me?”',
        answer: 'Taxi Driver',
      ),
    ];

    final musicData = [
      Quiz(
        type: 'four-quarter',
        question: 'Who was the youngest Beatle?',
        options: ['John', 'Paul', 'George', 'Ringo'],
        answer: [2],
      ),
      Quiz(
        type: 'multi-select',
        question: 'Best known for playing the trumpet:',
        options: [
          'Miles Davis',
          'Chet Baker',
          'Art Farmer',
          'John Coltrane',
          'Dizzy Gillespie',
          'Freddie Hubbard'
        ],
        answer: [0, 1, 2, 4, 5],
      ),
      Quiz(
        type: 'toggle-translate',
        question: 'Which nationality of the following composers is incorrect?',
        options: [
          ['Johann Sebastian Bach', 'German'],
          ['Sergei Rachmaninov', 'Czechoslovakian'],
          ['Frederic Chopin', 'Polish'],
          ['Giacoma Puccini', 'Italian'],
          ['George Gershwin', 'Austrian']
        ],
        answer: [1, 4],
      ),
      Quiz(
        type: 'fill-blank',
        question: 'Prior to forming BAD which group did Mick Jones Belong to?',
        answer: 'The Clash',
      ),
      Quiz(
        type: 'single-select-item',
        question: 'Frank Sinatra covered this song made famous by a popular Jim Henson character.',
        options: [
          'Welcome to Sesame Street',
          'It’s not Easy Bein’ Green',
          'Hugga Wugga',
          'Wild Thing'
        ],
        answer: [1],
      ),
      Quiz(
        type: 'true-false',
        question: 'Queen’s Bohemian Rhapsody was a Christmas number one hit in the UK, twice.',
        answer: true,
      ),
      Quiz(
        type: 'picker',
        question: 'How many symphonies did Beethoven write?',
        min: 1,
        max: 16,
        answer: 9,
      ),
      Quiz(
        type: 'single-select',
        question: 'Which was the first Beach Boys number one song in the US?',
        options: ['Kokomo', 'Help Me', 'Rhonda', 'I Get Around', 'Good Vibrations'],
        answer: [3],
      ),
      Quiz(
        type: 'four-quarter',
        question: 'Noah Benjamin Lenox is an experimental musician better known as which animal?',
        options: ['Grizzly Bear', 'Panda Bear', 'Gorrilla', 'Pitbull'],
        answer: [1],
      ),
      Quiz(
        type: 'single-select-item',
        question:
            'After Simeon Oliver Coxe III incorporated a 1940s audio oscillator his band was renamed this, after a William Butler Yeats poem:',
        options: ['Silver Apples', 'Golden Oranges', 'White Rose', 'Black Moth'],
        answer: [0],
      ),
    ];

    final entertainmentData = [
      Quiz(
        type: 'fill-blank',
        question: 'Where was superman born?',
        answer: 'Krypton',
      ),
      Quiz(
        type: 'four-quarter',
        question: 'What catchphrase is associated with the Daleks from Doctor Who?',
        options: ['Eradicate', 'Exterminate', 'Eliminate', 'Execute'],
        answer: [1],
      ),
      Quiz(
        type: 'picker',
        question:
            'In the film Cool Hand Luke, how many hard boiled eggs did Paul Newman eat to win a bet?',
        min: 20,
        max: 80,
        answer: 50,
      ),
      Quiz(
        type: 'true-false',
        question: 'Frank Sinatra paid a \$240,000 ransom to free his kidnapped son.',
        answer: true,
      ),
      Quiz(
        type: 'multi-select',
        question: 'Which two British actors have played Obi Wan Kenobi in the Star Wars films?',
        options: [
          'Sir Alec Guinness',
          'David Prowse',
          'James Earl Jones',
          'Harrison Ford',
          'Ewan McGregor',
          'Anthony Daniels'
        ],
        answer: [0, 4],
      ),
      Quiz(
        type: 'picker',
        question:
            'How many Oscars were won by the film Matrix at the 2000 Academy Awards ceremony?',
        min: 0,
        max: 11,
        answer: 4,
      ),
      Quiz(
        type: 'fill-blank',
        question: 'Late American artist Andy Warhol observed:',
        start: '“Two people kissing always looks like ',
        end: '.”',
        answer: 'Fish',
      ),
      Quiz(
        type: 'single-select',
        question: 'Who played Dr. John Hammond in Jurassic Park?',
        options: ['Anthony Hopkins', 'Jeff Goldblum', 'Richard Attenborough', 'Emmet Brown'],
        answer: [2],
      ),
      Quiz(
        type: 'picker',
        question: 'What year did the Live Aid concerts take place?',
        min: 1965,
        max: 1990,
        answer: 1985,
      ),
      Quiz(
        type: 'fill-blank',
        question: 'What is Mr. Burns’ first name?',
        answer: 'Charles',
      ),
    ];

    final sportsData = [
      Quiz(
        type: 'fill-blank',
        question: 'What is the national sport of Canada?',
        answer: 'Lacrosse',
      ),
      Quiz(
        type: 'four-quarter',
        question: 'Which country won every Olympic Men’s hockey gold medal from 1928 to 1956?',
        options: ['Canada', 'Russia', 'India', 'USA'],
        answer: [2],
      ),
      Quiz(
        type: 'true-false',
        question: 'A biathlon event consists of running a half marathon and biking 56 miles.',
        answer: false,
      ),
      Quiz(
        type: 'picker',
        question: 'How many players are in a game of water polo?',
        min: 10,
        max: 25,
        answer: 14,
      ),
      Quiz(
        type: 'toggle-translate',
        question: 'Which sports and team names are incorrectly associated?',
        options: [
          ['Cleveland Indians', 'Baseball'],
          ['Leicester Tigers', 'Rugby Union'],
          ['Bradford Bulls', 'Hockey'],
          ['Belle Vue Aces', 'Poker'],
          ['Wigan Wasps', 'Lacrosse'],
          ['Kent Spitfires', 'Cricket']
        ],
        answer: [2, 3, 4],
      ),
      Quiz(
        type: 'multi-select',
        question: 'Which cities have hosted the Olympic games?',
        options: ['Athens', 'Lake Placid', 'Innsbruck', 'New York', 'Capetown', 'St. Mortiz'],
        answer: [0, 1, 2, 4, 5],
      ),
      Quiz(
        type: 'four-quarter',
        question: 'Which American was the best paid sportsman in 1920?',
        options: ['Jack Dempsey', 'Babe Ruth', 'Big Bill Tilden', 'Bobby Jones'],
        answer: [1],
      ),
      Quiz(
        type: 'single-select-item',
        question: 'What do you call a stadium used for cycling events?',
        options: ['Cycleplex', 'Velodrome', 'Pumptrack', 'Speedway'],
        answer: [1],
      ),
      Quiz(
        type: 'fill-blank',
        question: 'In 1954, Joe Di Maggio married Norma Jean Baker who was also known as?',
        answer: 'Marilyn Monroe',
      ),
      Quiz(
        type: 'picker',
        question: 'About how many kilometers are in a marathon?',
        min: 10,
        max: 65,
        answer: 42,
      ),
    ];

    return [
      Category(
        name: 'Food & Drink',
        id: 'food',
        theme: 'green',
        quizzes: foodData,
        backgroundColor: kGreenBackgroundColor,
        primaryColor: kGreenPrimaryColor,
        primaryDarkColor: kGreenPrimaryDarkColor,
        accentColor: kGreenAccentColor,
        textColor: kGreenTextColor,
      ),
      Category(
        name: 'General Knowledge',
        id: 'knowledge',
        theme: 'yellow',
        quizzes: knowledgeData,
        backgroundColor: kYellowBackgroundColor,
        primaryColor: kYellowPrimaryColor,
        primaryDarkColor: kYellowPrimaryDarkColor,
        accentColor: kYellowAccentColor,
        textColor: kYellowTextColor,
      ),
      Category(
        name: 'History',
        id: 'history',
        theme: 'blue',
        quizzes: historyData,
        backgroundColor: kBlueBackgroundColor,
        primaryColor: kBluePrimaryColor,
        primaryDarkColor: kBluePrimaryDarkColor,
        accentColor: kBlueAccentColor,
        textColor: kBlueTextColor,
      ),
      Category(
        name: 'Geography',
        id: 'geography',
        theme: 'red',
        quizzes: geographyData,
        backgroundColor: kRedBackgroundColor,
        primaryColor: kRedPrimaryColor,
        primaryDarkColor: kRedPrimaryDarkColor,
        accentColor: kRedAccentColor,
        textColor: kRedTextColor,
      ),
      Category(
        name: 'Science and Nature',
        id: 'science',
        theme: 'green',
        quizzes: scienceData,
        backgroundColor: kGreenBackgroundColor,
        primaryColor: kGreenPrimaryColor,
        primaryDarkColor: kGreenPrimaryDarkColor,
        accentColor: kGreenAccentColor,
        textColor: kGreenTextColor,
      ),
      Category(
        name: 'TV & Movies',
        id: 'tvmovies',
        theme: 'purple',
        quizzes: tvmoviesData,
        backgroundColor: kPurpleBackgroundColor,
        primaryColor: kPurplePrimaryColor,
        primaryDarkColor: kPurplePrimaryDarkColor,
        accentColor: kPurpleAccentColor,
        textColor: kPurpleTextColor,
      ),
      Category(
        name: 'Music',
        id: 'music',
        theme: 'blue',
        quizzes: musicData,
        backgroundColor: kBlueBackgroundColor,
        primaryColor: kBluePrimaryColor,
        primaryDarkColor: kBluePrimaryDarkColor,
        accentColor: kBlueAccentColor,
        textColor: kBlueTextColor,
      ),
      Category(
        name: 'Entertainment',
        id: 'entertainment',
        theme: 'red',
        quizzes: entertainmentData,
        backgroundColor: kRedBackgroundColor,
        primaryColor: kRedPrimaryColor,
        primaryDarkColor: kRedPrimaryDarkColor,
        accentColor: kRedAccentColor,
        textColor: kRedTextColor,
      ),
      Category(
        name: 'Sports',
        id: 'sports',
        theme: 'purple',
        quizzes: sportsData,
        backgroundColor: kPurpleBackgroundColor,
        primaryColor: kPurplePrimaryColor,
        primaryDarkColor: kPurplePrimaryDarkColor,
        accentColor: kPurpleAccentColor,
        textColor: kPurpleTextColor,
      ),
    ];
  }
}
