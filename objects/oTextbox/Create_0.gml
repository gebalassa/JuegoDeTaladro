/// @desc Initial variables

// Initial Variables
textIndex = 0;
margin = 24;
stringHeightReduction = 8; // To reduce space between lines

textSequence = array_create(8);
#region //Diálogo jefe
textSequenceBoss = 
[
"Hello there! Welcome to Ant Corp.! Use SPACE to advance dialogue.",
"You'll be working some deliveries here, in this underground society!",
"You shall take missions from the bulletin board to our right and fulfill them.",
"First of all, to open and close the bulletin board, press Enter.",
"Then, you can choose or abandon an order by pressing the associated number.",
"You can view the order details by pressing M.",
"Now, to meet your deliveries, you will have to traverse the ground itself! " +
"For that you shall use your mighty drill, avoiding magma and such.",
"So, remember: Press the arrow keys to move.",
"Press SPACE to use your drill! Use the arrow keys to direct it.",
"Your drill is powered by the excavated minerals! Therefore:",
"1) You can move upwards while drilling.",
"2) You can excavate ground horizontally while having empty " +
"space below you.",
"BUT... You need to keep moving! Or else gravity will do its bidding.",
"If you feel trapped, pressing R will return you to the last checkpoint!",
"Ok, then. Now go! Send out those packages and show what you're made for!"
];
#endregion

#region //Diálogo NPC1
textSequenceNPC1 =
[
"Who are you? What do you want?",
"Huh? Ant Corp.?",
"Oh, wait! So you bring what I asked for?",
"Phew! Finally! I've waited a long time! With this at last I will become...!",
"Huh, are you still here?",
"W-What? Do you want to know what is inside the package?",
"Well...",
"YOU DON'T CARE!! GOODBYE, MR. ANT CORP.!!!!"
];
#endregion

#region //Diálogo NPC2a
textSequenceNPC2First =
[
"Oh, hello. May I help you?",
"Huh? A letter for me?",
"Now I'm a little busy. Would you do me the favor of reading the message?",
"Oh, I see. My boss asks me to fill the boiler.",
"What a hassle. With just this peak, it will take too long.",
"Hmm? Hey, you bring a good machine with you.",
"Maybe you could help me with this little job? Please.",
"You just have to open a hole up there for the magma to fall and fill the bottom.",
"But be careful not to burn yourself! Also don't forget to leave a return route.",
"Thanks."
];
#endregion

#region //Diálogo NPC2b
textSequenceNPC2Last =
[
"Nice job! Thanks for saving my day!"
];
#endregion

#region //Diálogo NPC3
textSequenceNPC3 =
[
"Oh, my God! Did you bring it? Do you have the manga I ordered?",
"Oh, yes! Is it! I can't believe it's finally in my hands!",
"The previous volume was unfinished! I can't wait to read this one!",
"Huh? What is the manga about?",
"Are you kidding? It's Eternal Regret! The most successful supernatural manga of the last decade! It became a best seller two years in a row!",
"You really never heard of it? If you ever get a chance, you should read it."
];
#endregion

#region //Diálogo NPC4a
textSequenceNPC4First =
[
"Hi. How are you?",
"You ask who am I? Just a florist hired to decorate this statue.",
"Unfortunately, to finish my work, I found myself in the need to hire the services of this company.",
"Yes, the same that hired me. Can you believe it? Does it make sense to you?",
"Anyway. Thank you for bringing these plants, they are the last ones that need to be placed.",
"But before you go, can I ask you a favor?",
"I'm very tired of going up and down this huge statue, placing flower pots.",
"Could you place the last four for me? I have marked the places where they should be placed.",
"Thank you, friend."
];
#endregion

#region //Diálogo NPC4b
textSequenceNPC4Middle =
[
"I have marked the places where the last plants should go. Check well.",
"Thanks."
];
#endregion

#region //Diálogo NPC4c
textSequenceNPC4Last =
[
"Since I saw this statue, I thought it was outrageously large.",
"I mean, it's bigger than the office itself.",
"I believe that such a colossal monument only represents the ego of whoever buys it.",
"Ah sorry, I was rambling.",
"Thanks for your help. Hope we meet again, buddy."
];
#endregion

textSequence[0] = textSequenceBoss;
textSequence[1] = textSequenceNPC1;
textSequence[2] = textSequenceNPC2First;
textSequence[3] = textSequenceNPC2Last;
textSequence[4] = textSequenceNPC3;
textSequence[5] = textSequenceNPC4First;
textSequence[6] = textSequenceNPC4Middle;
textSequence[7] = textSequenceNPC4Last;

if(instance_exists(oNPC1))
{
	sequenceIndex = 1;
}
else if(instance_exists(oNPC2))
{
	if(oMissions.currentMainMission == 2)
	{
		sequenceIndex = 2;
	}
	else
	{
		sequenceIndex = 3;
	}
}
else if(instance_exists(oNPC3))
{
	sequenceIndex = 4;
}
else if(instance_exists(oNPC4))
{
	if(oMissions.currentMainMission == 4)
	{
		if(oMissions.currentMainMissionPhase <= 2)
		{
			sequenceIndex = 5;
		}
		else if(!oMissions.mainMission[4].completed  and  oMissions.currentMainMissionPhase != 6)
		{
			sequenceIndex = 6;
		}
		else
		{
			sequenceIndex = 7;
		}
	}
	else if(oMissions.mainMission[4].completed)
	{
		sequenceIndex = 7;
	}
}
else
{
	sequenceIndex = 0;
}
