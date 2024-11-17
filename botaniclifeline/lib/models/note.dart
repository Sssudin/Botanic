class Note {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });
}


List<Note> sampleNotes = [
  Note(
    id: 0,
    title: 'Very sad times',
    content:
        'Today I killed one of my rafflesia plants. This is a very sad day.I think it died because I forgot to water it for 2 months in a row. This is so unfair man. I am so emo I want to listen to Joji. \nTommorow I will go buy a new rafflesia plant. I feel better now.',
    modifiedTime: DateTime(2023,1,1,34,5), //(year,month,day,hour,min)
  ),
  Note(
    id: 1,
    title: 'Plumbago plumbago',
    content:
        'Lets go!!!!!\nToday my beloved plumbago plant finally sprouted its first leaves.\nI am very proud sniff sniff',
    modifiedTime: DateTime(2022,1,1,34,5),
  ),
  Note(
    id: 2,
    title: 'Among Us is bad for plants',
    content:
        'Today I accidently destroyed my beach daisy plant because I ragequit when playing Among Us. This journal entry serves as a reminder to not play Among Us when near your plants. I am sorry my beautiful beach daisy that did nothing wrong.',
    modifiedTime: DateTime(2023,3,1,19,5),
  ),
  Note(
    id: 3,
    title: 'Meadow Sage Flowering',
    content: 'My beautiful meadow sage started blooming today. \n Im so proud!',
   modifiedTime: DateTime(2023,1,4,16,53),
  ),
  Note(
    id: 4,
    title: 'New Plant',
    content:
        'Today I just planted the majestic Sansievera plant! This has been a dream plant that I been trying to get for years and today I finally got my hands on the seeds. I will make sure it lives a long and fulfilling life!',
    modifiedTime: DateTime(2023,5,1,11,6),
  ),
  Note(
    id: 5,
    title: 'Sorry Philodendron',
    content:
        'Today whilst trimming the leaves of my baby philodendron I got distracted because I was watching an Among Us video and I accidently snipped 3 cm more than what was needed. Now my baby philodendron looks ruined. Im sorry :(',
   modifiedTime: DateTime(2023,1,6,13,9),
  ),
    Note(
    id: 6,
    title: 'Dragon Tree soon!',
    content: "I got in contact with an overseas friend that had supplies of a rare breed of dragon tree! He promised to give me a few seeds for it so im really excited.",
   modifiedTime: DateTime(2023,3,7,11,12),
  ),
  Note(
    id: 7,
    title: 'I hate viruses',
    content:
        'An unknown virus killed off all my plants except for my sansievera. I WILL GET REVENGE!  ',
    modifiedTime: DateTime(2023,6,3,15,14),
  ),
  Note(
    id: 8,
    title: 'My dream plants',
    content:
        'I do really want a Guiana Chestnut. I also really want a lucky bamboo tree, those are really cool too. Ill try to get in touch with some of my contacts to see if they can get a hold of those seeds.',
    modifiedTime: DateTime(2023,2,1,12,34),
  ),
];