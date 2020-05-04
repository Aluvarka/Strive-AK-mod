extends Node

var traits = {
  "Foul Mouth": {
    "name": "Foul Mouth",
    "description": "All too often, $name uses words more suited for construction workers and sailors. \n\n[color=red]Vocal occupations are less effective. Max Charm -25. [/color]",
    "effect": {
      "code": "foul_mouth",
      "charm_max": -25,
      "charm": 0
    },
    "tags": [
      "mental",
      "detrimental"
    ],
    "conflict": [
      "Mute",
      "Good Natured",
      "Eloquent"
    ]
  },
  "Mute": {
    "name": "Mute",
    "description": "$name can't speak in a normal way and only uses signs and moans to communicate. \n\n[color=aqua]Obedience growth +25%.[/color] [color=red]Can't work at occupations requiring speech. [/color]",
    "effect": {
      "code": "mute",
      "obed_mod": 0.25
    },
    "tags": [
      "mental",
      "detrimental"
    ],
    "conflict": [
      "Foul Mouth",
      "Eloquent",
	  "Pretty voice"
    ]
  },
  "Devoted": {
    "name": "Devoted",
    "description": "$name trusts you to a great degree. $His willingness to follow you caused $him to find new strengths in $his character. \n\n[color=aqua]Courage +25. Wit +25. Min Loyalty: 80.[/color]",
    "effect": {
      "code": "devoted",
      "cour": 25,
      "wit": 25,
      "loyal_min": 80,
      "loyal": 0
    },
    "tags": [
      "mental",
      "secondary",
      "goodthing"
    ],
    "conflict": [
      ""
    ]
  },
  "Passive": {
    "name": "Passive",
    "description": "$name prefers to go with the flow and barely tries to proactively affect $his surroundings. \n\n[color=red]Can't take management related jobs.[/color] [color=aqua]Obedience growth +25%. [/color]",
    "effect": {
      "code": "passive",
      "obed_mod": 0.25
    },
    "tags": [
      "mental"
    ],
    "conflict": [
      ""
    ]
  },
  "Masochist": {
    "name": "Masochist",
    "description": "$name enjoys pain far more than $he should. \n\n[color=aqua]Physical punishments are more effective and cause lust to grow. [/color]",
    "effect": {
      
    },
    "tags": [
      "sexual",
      "mental",
      "perversy"
    ],
    "conflict": [
      ""
    ]
  },
  "Deviant": {
    "name": "Deviant",
    "description": "$name has a fondness for very unusual sexual practices. A cat or dog is fine for $him too. \n\n[color=aqua]Degrading sexual actions have no penalty. [/color]",
    "effect": {
      
    },
    "tags": [
      "sexual",
      "mental",
      "perversy",
	  "secondary",
    ],
    "conflict": [
      "Prude"
    ]
  },
  "Slutty": {
    "name": "Slutty",
    "description": "Your influence over $name caused $him to accept sex in many forms and enjoy $his body to the fullest. \n\n[color=aqua]Confidence +25. Charm +25. Min Loyalty: 80. [/color]",
    "effect": {
      "code": "slutty",
      "charm": 25,
      "conf": 25,
      "loyal_min": 80,
      "loyal": 0
    },
    "tags": [
      "sexual",
      "mental",
      "perversy",
      "secondary",
      "goodthing"
    ],
    "conflict": [
      ""
    ]
  },
  "Bisexual": {
    "name": "Bisexual",
    "description": "$name is open to having affairs with people of the same sex. \n\n[color=aqua]Same-sex encounters are easier to accept. [/color]",
    "effect": {
      
    },
    "tags": [
      "sexual",
      "mental"
    ],
    "conflict": [
      "Homosexual",
    ]
  },
  "Homosexual": {
    "name": "Homosexual",
    "description": "$name is only expecting to have same-sex affairs. \n\n[color=aqua]Same-sex encounters have no penalty, opposite sex actions are unpreferred. [/color]",
    "effect": {
      
    },
    "tags": [
      "sexual",
      "mental",
      "secondary"
    ],
    "conflict": [
      "Bisexual",
    ]
  },
  "Monogamous": {
    "name": "Monogamous",
    "description": "$name does not favor random encounters and believes there is one true partner in life for $him. \n\n[color=aqua]Refuses to work as prostitute. Loyalty builds faster from sex with master. Sleeping with other partners is more stressful. [/color]",
    "effect": {
      
    },
    "tags": [
      "sexual",
      "mental"
    ],
    "conflict": [
      "Fickle"
    ]
  },
  "Pretty voice": {
    "name": "Pretty voice",
    "description": "$name's voice is downright charming, making surrounding people just want to hear more of it.\n\n[color=aqua]Vocal occupations are more effective. Charm +20. [/color]",
    "effect": {
      "code": "pretty_voice",
      "charm": 20
    },
    "tags": [
      "physical",
      "goodthing"
    ],
    "conflict": [
      "Mute"
    ]
  },
  "Clingy": {
    "name": "Clingy",
    "description": "$name gets easily attached to people. However, this behavior is rarely met with acceptance, which in turn annoys $him. \n\n[color=aqua]Loyalty growth +35%. Obedience drops quickly if constantly ignored. [/color]",
    "effect": {
      "code": "clingy",
      "loyal_mod": 0.35
    },
    "tags": [
      "mental"
    ],
    "conflict": [
      ""
    ]
  },
  "Fickle": {
    "name": "Fickle",
    "description": "$name prefers having as many sexual partners as possible, unable to stay confined to only one person for long. \n\n[color=aqua]Prostituion job bonus, multiple partners are unlocked by default. [/color]",
    "effect": {
      
    },
    "tags": [
      "sexual",
      "mental"
    ],
    "conflict": [
      "Monogamous",
      "Prude"
    ]
  },
  "Weak": {
    "name": "Weak",
    "description": "$name is rather weak compared to others. \n\n[color=red]Strength -2[/color]",
    "effect": {
      "code": "weak",
      "str_mod": -2
    },
    "tags": [
      "physical",
      "detrimental"
    ],
    "conflict": [
      "Strong"
    ]
  },
  "Strong": {
    "name": "Strong",
    "description": "$name has been blessed with greater strength than most. $He also appears to be harder to tame. \n\n[color=aqua]Strength +2,[/color] [color=red]Obedience growth -20%[/color]",
    "effect": {
      "code": "strong",
      "str_mod": 2,
	  "obed_mod": -0.2
    },
    "tags": [
      "physical",
      "goodthing"
    ],
    "conflict": [

      "Weak"
    ]
  },
  "Clumsy": {
    "name": "Clumsy",
    "description": "$name's reflexes are somewhat slower, than the others. \n\n[color=red]Agility -2, physical occupations are less effective[/color]",
    "effect": {
      "code": "clumsy",
      "agi_mod": -2
    },
    "tags": [
      "physical",
      "detrimental"
    ],
    "conflict": [
      "Quick"
    ]
  },
  "Quick": {
    "name": "Quick",
    "description": "$name is very active whenever $he does something. However, it also makes $his nervous system less stable. \n\n[color=aqua]Agility +2,[/color] [color=red]Stress change +20%[/color]",
    "effect": {
      "code": "quick",
      "agi_mod": 2,
	  "stress_mod": 0.2
    },
    "tags": [
      "physical",
      "goodthing"
    ],
    "conflict": [
      "Clumsy"
    ]
  },
  "Magic Deaf": {
    "name": "Magic Deaf",
    "description": "$name's senses are very dull when it comes to magic. \n\n[color=red]Magic Affinity -2[/color]",
    "effect": {
      "code": "magicdeaf",
      "maf_mod": -2
    },
    "tags": [
      "physical",
      "detrimental"
    ],
    "conflict": [
      "Responsive"
    ]
  },
  "Responsive": {
    "name": "Responsive",
    "description": "$name is in touch with raw energy, making $him potentially useful in magic area. \n\n[color=aqua]Magic Affinity +2,[/color] [color=red]Toxicity change +20%[/color]",
    "effect": {
      "code": "responsive",
      "maf_mod": 2,
	  "tox_mod": 0.2
    },
    "tags": [
      "physical",
      "goodthing"
    ],
    "conflict": [
      "Magic Deaf"
    ]
  },
  "Frail": {
    "name": "Frail",
    "description": "$name's body is much less durable than most. $His physical potential is severely impaired. \n\n[color=red]Endurance -2[/color]",
    "effect": {
      "code": "frail",
      "end_mod": -2
    },
    "tags": [
      "physical",
      "detrimental"
    ],
    "conflict": [
      "Robust"
    ]
  },
  "Robust": {
    "name": "Robust",
    "description": "$name's physique is way better than most. \n\n[color=aqua]Endurance +2,[/color] [color=red] Fear change -20%[/color]",
    "effect": {
      "code": "robust",
      "end_mod": 2,
	  "fear_mod": -0.2
    },
    "tags": [
      "physical",
      "goodthing"
    ],
    "conflict": [
      "Frail"
    ]
  },
  "Scarred": {
    "name": "Scarred",
    "description": "$name's body is covered in massive burn scars. Besides being terrifying to look at, this also makes $him suffer from low confidence.\n\n[color=red]Charm -30. Beauty -30. [/color]",
    "effect": {
      "code": "scarred",
      "charm": -30,
      "beautybase": -30
    },
    "tags": [
      "physical",
      "detrimental"
    ],
    "conflict": [
      ""
    ]
  },
 "Blemished": {
    "name": "Blemished",
    "description": "$name's skin is covered in a lot of imperfections. Besides being unappealing to look at, this also makes $him suffer from low self esteem.\n\n[color=red]Charm -10. Beauty -10. [/color]",
    "effect": {
      "code": "Blemished",
      "charm": -10,
      "beautybase": -10
    },
    "tags": [
      "physical",
      "detrimental"
    ],
    "conflict": [
      "Natural Beauty"
    ]
  },
  "Natural Beauty": {
    "name": "Natural Beauty",
    "description": "$name is unusually pretty since $his birth and often was an object of envy. \n\n[color=aqua]Beauty +35. [/color]",
    "effect": {
      "code": "beauty",
      "beautybase": 35
    },
    "tags": [
      "physical",
    ],
    "conflict": [
      "Blemished"
    ]
  },
  "Coward": {
    "name": "Coward",
    "description": "$name is of a meek character and has a difficult time handling $himself in physical confrontations. \n\n[color=aqua]Physical punishments build fear quicker,[/color] [color=red] stress in combat grows twice as fast. [/color]",
    "effect": {
    },
    "tags": [
      "detrimental",
      "mental"
    ],
    "conflict": [
      ""
    ]
  },
  "Alcohol Intolerance": {
    "name": "Alcohol Intolerance",
    "description": "$name does not stomach alcoholic beverages too well. \n\n[color=red]Alcohol intake makes slave drunker a lot quicker. [/color]",
    "effect": {
    },
    "tags": [
      "detrimental",
      "physical"
    ],
    "conflict": [
      ""
    ]
  },
  "Prude": {
    "name": "Prude",
    "description": "$name is very intolerant of many sexual practices, believing there are many inappropriate behaviors which shouldn't be practiced.\n\n[color=red]Sexual actions are harder to initiate and are less impactful. Refuses to work on sex-related jobs. [/color]",
    "effect": {
      
    },
    "tags": [
      "sexual",
      "mental"
    ],
    "conflict": [
      "Pervert",
      "Deviant",
      "Fickle"
    ]
  },
  "Pervert": {
    "name": "Pervert",
    "description": "$name has a pretty broad definition of stuff $he finds enjoyable.\n\n[color=aqua]Sexual actions are easier to unlock. Fetishist actions have no penalty. [/color]",
    "effect": {
      
    },
    "tags": [
      "sexual",
      "mental",
      "perversy"
    ],
    "conflict": [
      "Prude"
    ]
  },
  "Clever": {
    "name": "Clever",
    "description": "$name is more prone to creative thinking than an average person, which makes $him learn faster. \n\n[color=aqua]Teach effectiveness increased by 25%. [/color]",
    "effect": {
    },
    "tags": [
      "mental",
      "personality",
      "goodthing",
	  "lvlup"
    ],
    "conflict": [
      ""
    ]
  },
  "Pliable": {
    "name": "Pliable",
    "description": "$name is still naive and can be swayed one way or another... \n\n[color=aqua]Has room for changes and growth. [/color]",
    "effect": {
      
    },
    "tags": [
      "mental",
      "goodthing"
    ],
    "conflict": [
      ""
    ]
  },
  "Dominant": {
    "name": "Dominant",
    "description": "$name really prefers to be in control, instead of being controlled. \n\n[color=red]Obedience growth -20%.[/color] [color=aqua] Confidence +25. Max Confidence +15.  [/color]",
    "effect": {
      "code": "dominant",
      "conf_max": 15,
      "conf": 25,
      "obed_mod": -0.2
    },
    "tags": [
      "mental"
    ],
    "conflict": [
      "Submissive"
    ]
  },
  "Submissive": {
    "name": "Submissive",
    "description": "$name is very comfortable when having someone $he can rely on. \n\n[color=aqua]Obedience growth +40%. No penalty for rape actions as long as loyalty is above average.[/color] [color=red] Confidence -10. Max Confidence -30. [/color]",
    "effect": {
      "code": "submissive",
      "conf_max": -30,
      "conf": -10,
      "obed_mod": 0.4
    },
    "tags": [
      "mental"
    ],
    "conflict": [
      "Dominant",
	  "Strong willed"
    ]
  },
  "Infertile": {
    "name": "Infertile",
    "description": "$name appear to have a rare condition making $him much less likely to have children. \n\n[color=aqua]Imregnation chance greatly reduced. [/color]",
    "effect": {
    },
    "tags": [
      "physical",
	  "detrimental"
    ],
    "conflict": [
	  ""
    ]
  },
  "Infirm": {
    "name": "Infirm",
    "description": "$name's wounds require additional care. \n\n[color=red]Natural regeneration is greatly reduced. [/color]",
    "effect": {
    },
    "tags": [
      "physical",
	  "detrimental"
    ],
    "conflict": [
	  ""
    ]
  },
  "Uncivilized": {
    "name": "Uncivilized",
    "description": "$name has spent most of $his lifetime in the wilds barely interacting with modern society and acting more like an animal. As a result, $he can't realistically fit into common groups and be accepted there. \n\n[color=red]Social jobs disabled. Max Wit -50. Max Obedience -30. Max Loyalty -65. [/color]",
    "effect": {
      "code": "uncivilized",
      "wit_max": -50,
      "wit": 0,
      "obed_max": -30,
      "obed": 0,
      "loyal_max": -65,
      "loyal": 0
    },
    "tags": [
      "secondary"
    ],
    "conflict": [
      ""
    ]
  },
  "Regressed": {
    "name": "Regressed",
    "description": "Due to some circumstances, $name's mind reversed to infantile state. $He's barely capable of normal tasks, but $he's a lot more responsive to social training.\n\n[color=aqua]Social jobs disabled. [/color]",
    "effect": {
      "code": "regressed"
    },
    "tags": [
      "secondary",
      "mental"
    ],
    "conflict": [
      ""
    ]
  },
  "Sex-crazed": {
    "name": "Sex-crazed",
    "description": "$name barely can keep $his mind off dirty stuff. $His perpetual excitement makes $him look and enjoy nearly everything at the cost of $his sanity. \n\n[color=red]Max Wit -80. Max Confidence -60. Min Lust +50.[/color] [color=aqua] No penalty from any sexual activity. Brothel assignments are more effective. [/color]",
    "effect": {
      "code": "sexcrazed",
      "wit_max": -80,
      "wit": 0,
      "conf_max": -60,
      "conf": 0,
      "lust_min": 50,
      "lust": 0
    },
    "tags": [
      "sexual",
      "secondary",
      "mental",
      "perversy",
      "detrimental"
    ],
    "conflict": [
      ""
    ]
  },
  "Likes it rough": {
    "name": "Likes it rough",
    "description": "$name secretly enjoys being treated badly and taken by force. \n\n[color=aqua]Rape actions cause no loyalty and obedience reduction. [/color]",
    "effect": {
      
    },
    "tags": [
      "sexual",
      "mental",
      "perversy"
    ],
    "conflict": [
      ""
    ]
	},
  "Enjoys Anal": {
    "name": "Enjoys Anal",
    "description": "$name is quite comfortable with $his ass being used for pleasure and even favors it. \n\n[color=aqua]Anal actions are more effective and preferred. [/color]",
    "effect": {
      
    },
    "tags": [
      "sexual",
      "mental",
      "perversy",
	  "secondary"
    ],
    "conflict": [
      ""
    ]
  },
  "Ascetic": {
    "name": "Ascetic",
    "description": "$name cares little about luxury around $him. \n\n[color=aqua]Luxury demands are lowered. [/color]",
    "effect": {
      
    },
    "tags": [
      "mental",
      "personality",
      "goodthing",
	  "lvlup"
    ],
    "conflict": [
      "Spoiled"
    ]    
  },
  "Spoiled": {
    "name": "Spoiled",
    "description": "$name cares a great deal about the environment around $him and expects to be treated well. \n\n[color=red]Luxury demands are increased. [/color]",
    "effect": {
    },
    "tags": [
      "mental",
      "detrimental",
    ],
    "conflict": [
      "Ascetic"
    ]    
  },
  "Small Eater": {
    "name": "Small Eater",
    "description": "[color=aqua]Food consumption reduced to 1/3. [/color]",
    "effect": {
      
    },
    "tags": [
      "secondary",
      "personality",
      "goodthing",
	  "lvlup"
    ],
    "conflict": [
      ""
    ]    
  },
  "Hard Worker": {
    "name": "Hard Worker",
    "description": "[color=aqua]+15% gold from non-sexual occupations. [/color]",
    "effect": {
      
    },
    "tags": [
      "secondary",
      "mental",
      "personality",
      "goodthing"
    ],
    "conflict": [
      ""
    ]    
  },
  "Sturdy": {
    "name": "Sturdy",
    "description": "[color=aqua]Takes 15% less damage in combat [/color]",
    "effect": {
      
    },
    "tags": [
      "secondary",
      "goodthing"
    ],
    "conflict": [
      ""
    ]    
  },
  "Influential": {
    "name": "Influential",
    "description": "[color=aqua]Selling slaves worth 20% more gold. [/color]",
    "effect": {
      
    },
    "tags": [
      "secondary",
      "elitething"
    ],
    "conflict": [
      ""
    ]    
  },
  "Gifted": {
    "name": "Gifted",
    "description": "[color=aqua]+20% upgrade points received. [/color]",
    "effect": {
      
    },
    "tags": [
      "secondary",
      "elitething"
    ],
    "conflict": [
      ""
    ]    
  },
  "Scoundrel": {
    "name": "Scoundrel",
    "description": "[color=aqua]+15 gold per day. [/color]",
    "effect": {
      
    },
    "tags": [
      "secondary",
      "personality",
      "goodthing"
    ],
    "conflict": [
      "Kleptomania"
    ]    
  },
  "Nimble": {
    "name": "Nimble",
    "description": "[color=aqua]+25% to hit chances. [/color]",
    "effect": {
      
    },
    "tags": [
      "secondary",
      "goodthing"
    ],
    "conflict": [
      ""
    ]    
  },
  "Authority": {
    "name": "Authority",
    "description": "[color=aqua]If obedience above 95 , all other slaves gain +5 obedience per day. [/color]",
    "effect": {
      
    },
    "tags": [
      "secondary",
      "elitething"
    ],
    "conflict": [
      ""
    ]    
  },
  "Mentor": {
    "name": "Mentor",
    "description": "[color=aqua]Slaves below level 3 gain +5 exp points per day[/color]",
    "effect": {
      
    },
    "tags": [
      "secondary",
      "elitething"
    ],
    "conflict": [
      ""
    ]    
  },
  "Experimenter": {
    "name": "Experimenter",
    "description": "[color=aqua]Produces a random potion once in a while[/color]",
    "effect": {
      
    },
    "tags": [
      "secondary",
    ],
    "conflict": [
      ""
    ]    
  },
  "Grateful": {
    "name": "Grateful",
    "description": "Due to your actions, $name will overlook certain hardships to stick close to you.\n\n [color=aqua]No luxury requirements. [/color]",
    "effect": {
      
    },
    "tags": [
      "secondary",
      "elitething",
	  "lvlup"
    ],
    "conflict": [
      ""
    ]    
  },
  "Strong willed": {
    "name": "Strong willed",
    "description": "$name has iron will. \n\n[color=red]Obedience -30%; Max loyalty -20%; Confidency minimum 55; [/color]",
    "effect": {
      "code": "strong_willed",
      "obed_mod": -0.3,
      "loyal_mod": -0.2,
      "conf_base": 55
    },
    "tags": [
      "third",
      "mental",
	  "detrimental",
      "secondary"
    ],
    "conflict": [
      "Submissive"
    ]    
  },
  "Vigorous": {
    "name": "Vigorous",
    "description": "$name is very energetic, $he less tired from work than others. \n\n[color=aqua]Max energy +25%; $name faster restore energy from rest. [/color]",
    "effect": {
      "code": "vigorous",
      "energy_max": 25
    },
    "tags": [
      "third",
      "physical",
      "secondary",
      "goodthing",
	  "lvlup"
    ],
    "conflict": [
      "Weak"
    ]
  },
  "Tough": {
    "name": "Tough",
    "description": "$name has high physical endurance. \n\n[color=aqua]Health +20%. [/color]",
    "effect": {
      "code": "tough",
      "health_bonus": 0.2
    },
    "tags": [
      "physical",
      "third",
      "secondary",
      "goodthing",
	  "lvlup"
    ],
    "conflict": [
      "Frail",
      "Weak"
    ]
  },
  "Thick skinned": {
    "name": "Thick skinned",
    "description": "$name's hard life hardened $him against any type of stress. \n\n[color=aqua]Recieve stress -10%. Armor +2 [/color]",
    "effect": {
      "code": "thick_skinned",
	  "stress_mod": -0.1
    },
    "tags": [
      "third",
      "mental",
      "secondary",
      "goodthing",
	  "lvlup"
    ],
    "conflict": [
      ""
    ]
  },
  "Strong back": {
    "name": "Strong back",
    "description": "$name can pick up more weight than anyone. \n\n[color=aqua]Carry weight +15. [/color]",
    "effect": {
		
    },
    "tags": [
      "third",
      "physical",
      "secondary",
      "goodthing",
	  "lvlup"
    ],
    "conflict": [
      ""
    ]
  },
  "Broken mind": {
    "name": "Broken mind",
    "description": "$name is emotionless, mindbreaked body, $he has no need and do any command but here is no more than husk. \n\n[color=red]Slaves mind is broken. No stress;No lust;Max confidence -90 Max obedience; Max loyalty;  [/color]",
    "effect": {
      "code": "broken",
      "conf_max": -90,
      "wit_max": -55,
      "loyalty_min": 100,
      "stress_mod": -2.0
    },
    "tags": [
      "mental",
      "detrimental",
	  "secondary"
    ],
    "conflict": [
      "Iron willed"
    ]
  },
  "Melancholia": {
    "name": "Melancholia",
    "description": "$name is heavily depressed. Keep \n\n[color=#ff4949]Stress grew 40% faster; If stress high enough - $he can be mind breaked! [/color]",
    "effect": {
      "code": "melancholia",
      "conf_cur": -10,
      "wit_cur": -5,
      "stress_mod": 0.4
    },
    "tags": [
      "mental",
      "detrimental",
      "secondary"
    ],
    "conflict": [
      "Iron willed"
    ]
  },
  "Elegant": {
    "name": "Elegant",
    "description": "$name's eyes is big, $he has smooth and beautiful skin, almost like baby, everyone charmed by $him. \n\n[color=aqua]Beauty +10; Max charm +15 [/color]",
    "effect": {
      "code": "attractive",
      "charm_max": 15,
      "beautybase": 10
    },
    "tags": [
      "physical",
      "third",
      "secondary",
      "goodthing"
    ],
    "conflict": [
      "Clumsy"
    ]
  },
  "Peaceful mind": {
    "name": "Peaceful mind",
    "description": "Almost no problem can shake $his emotions or thoughts. \n\n[color=aqua]Stress never be high. Stress grew 30% less, Stress max -60 [/color]",
    "effect": {
      "code": "calm_mind",
      "stress_mod": -0.3,
      "stress_max": -60
    },
    "tags": [
      "mental",
      "third",
      "secondary",
      "personality",
      "goodthing",
	  "lvlup"
    ],
    "conflict": [
      "Dominant",
      "Submissive"
    ]
  },
  "Lone wolf": {
    "name": "Lone wolf",
    "description": "$name prefers to be alone. \n\n[color=aqua]Public punishments wont affect slave.[/color] [color=red] Stress grew on public work. Have confident work penalty. [/color]",
    "effect": {
      "code": "loner"
    },
    "tags": [
      "mental",
	  "third"
    ],
    "conflict": [
      "Dominant",
      "Submissive"
    ]
  },
  "Love childs": {
    "name": "Love childs",
    "description": "$name love to spend time with offsprings, also $he does not care if its stranger childs. \n\n[color=aqua]Chance to be pregnant higher. Always lactate. [/color]",
    "effect": {
      "code": "love_childs"
    },
    "tags": [
      "mental",
	  "third",
      "goodthing"
    ],
    "conflict": [
      "Foul Mouth"
    ]
  },
  "Plump": {
    "name": "Plump",
    "description": "$name have delicious plumpness in all right place.  \n\n[color=red]Need more food everyday. $name have problem with physical exercises. [/color]",
    "effect": {
      "code": "plump",
      "charm_cur": 5
    },
    "tags": [
      "physical",
	  "third"
    ],
    "conflict": [
      "Obese"
    ]
  },
  "Obese": {
    "name": "Obese",
    "description": "$name uncontrolable $himself when eat, what progress into lot of fat on $his body. \n\n[color=red]Need lot of food everyday. $name have problem with any physical exercises. Stress grew +10% [/color]",
    "effect": {
      "code": "obese",
      "stress_mod": 0.1,
    },
    "tags": [
      "physical",
	  "third",
      "detrimental",
      "secondary"
    ],
    "conflict": [
      "Plump"
    ]
  },
  "Broken limb": {
    "name": "Broken limb",
    "description": "$name accidentally broke his limb. \n\n[color=red]Agility and strength -1. Heal with time. [/color]",
    "effect": {
      "code": "broken_limb",
      "agi_mod": -1,
      "str_mod": -1
    },
    "tags": [
      "physical",
	  "injury",
      "detrimental",
      "secondary"
    ],
    "conflict": [
      ""
    ]
  },
  "Cracked rib": {
    "name": "Cracked rib",
    "description": "$name accidentally breaked his ribs. \n\n[color=red]Endurance -1. Heal with time. [/color]",
    "effect": {
      "code": "cracked_rib",
      "end_mod": -1
    },
    "tags": [
      "physical",
	  "injury",
      "detrimental",
      "secondary"
    ],
    "conflict": [
      ""
    ]
  },
  "Heavy injured": {
    "name": "Heavy injured",
    "description": "$name is badly injured. $he feels good enough to do some work, but. \n\n[color=red]Strength, Agility and Endurance -1. Heal with time. [/color]",
    "effect": {
      "code": "heavy_injured",
      "end_mod": -1,
      "str_mod": -1,
      "agi_mod": -1,
	  "health_bonus": -0.3
    },
    "tags": [
      "physical",
	  "injury",
      "detrimental",
      "secondary"
    ],
    "conflict": [
      ""
    ]
  },
  "Bruised": {
    "name": "Bruised",
    "description": "$name's body is covered in lot of bruises. Besides being terrifying to look at, this also makes $him suffer. \n\n[color=red]Beauty -15 [/color]",
    "effect": {
      "code": "bruised",
      "beautytemp": -15,
      "charm_cur": -20
    },
    "tags": [
      "physical",
	  "injury",
      "detrimental"
    ],
    "conflict": [
      ""
    ]
  },
  "Baker": {
    "name": "Baker",
    "description": "$name know 'How to bake you enemies for dummies' from start to end. \n\n[color=aqua]Everyday make delicious sweets from supplies. [/color]",
    "effect": {
      "code": "baker",
    },
    "tags": [
      "third",
	  "personality",
      "secondary",
      "goodthing"
    ],
    "conflict": [
      ""
    ]
  },
  "Magician": {
    "name": "Magician",
    "description": "$name know magical art, but because of $his lifestyle grow weaker physically. \n\n[color=aqua]Max Magic Affinity +1. [/color]",
    "effect": {
      "code": "magician",
      "maf_mod": 1,
      "wit_base": 20
    },
    "tags": [
	  "background",
      "secondary",
      "goodthing"
    ],
    "conflict": [
      "Athlete",
      "Hunter",
      "Warrior"
    ]    
  },
  "Warrior": {
    "name": "Warrior",
    "description": "$name preferred to deal with problems by raw strength. \n\n[color=aqua]Max Strenght +1. [/color]",
    "effect": {
      "code": "warrior",
      "str_mod": 1,
      "cour_base": 20
    },
    "tags": [
      "background",
      "secondary",
      "goodthing"
    ],
    "conflict": [
      "Athlete",
      "Hunter",
      "Magician"
    ]
  },
  "Hunter": {
    "name": "Hunter",
    "description": "$name spent amount of $his life by hunting animals. \n\n[color=aqua]Max Agility +1. [/color]",
    "effect": {
      "code": "hunter",
      "agi_mod": 1,
      "cour_base": 10,
      "wit_base": 10
    },
    "tags": [
      "background",
      "secondary",
      "goodthing"
    ],
    "conflict": [
      "Athlete",
      "Warrior",
      "Magician"
    ]
  },
  "Athlete": {
    "name": "Athlete",
    "description": "In healthy body - health spirit. \n\n[color=aqua]Max Endurance +1. [/color]",
    "effect": {
      "code": "athlete",
      "end_mod": 1,
      "energy_max": 10
    },
    "tags": [
      "background",
      "secondary",
      "goodthing"
    ],
    "conflict": [
      "Hunter",
      "Warrior",
      "Magician"
    ]
  },
  "Happy-go-lucky": {
    "name": "Happy-go-lucky",
    "description": "$name seems to be very joyful. \n\n[color=aqua]Stress grew -20%, Fear grew -20% [/color]",
    "effect": {
      "code": "happy-go-lucky",
      "stress_mod": -0.2,
      "fear_mod": -0.2,	  
    },
    "tags": [
	  "gifted",
      "secondary",
      "goodthing"
    ],
    "conflict": [
      ""
    ]
  },
  "Sadness": {
    "name": "Sadness",
    "description": "$name is feeling very sad. \n\n[color=red]Stress grew +20% [/color]",
    "effect": {
      "code": "sadness",
      "stress_mod": 0.2,
    },
    "tags": [
	  "gifted",
      "secondary"
	  ],
    "conflict": [
      ""
    ]
  },
  "Wolf Hide": {
    "name": "Wolf Hide",
    "description": "$name's ancestors gifted to $him thick fur. \n\n[color=aqua]Armor +2.[/color] [color=red] Max charm -15 [/color]",
    "effect": {
      "code": "wolf_hide",
      "charm_max": -15,
    },
    "tags": [
	  "racial",
	  "wolfish",
      "secondary"
    ],
    "conflict": [
	
    ]
  },
  "Claws and Fangs": {
    "name": "Claws and Fangs",
    "description": "When battle is hot, $name doesn't think 'slash or bite' \n\n[color=aqua]Damage +2 [/color]",
    "effect": {
      "code": "claws_fangs",
    },
    "tags": [
	  "racial",
	  "wolfish",
      "secondary",
      "feline",
      "fox",
      "dragon"
    ],
    "conflict": [
      ""
    ]
  },
  "Bestial Instinct": {
    "name": "Bestial Instinct",
    "description": "$name always trust $his inner voice. \n\n[color=aqua]Speed +2, Awareness +3 [/color]",
    "effect": {
      "code": "bestial_instinct",
    },
    "tags": [
	  "racial",
	  "wolfish",
      "secondary",
      "feline",
      "fox",
	  "harpy",
	  "tanuki",
	  "bunny",
	  "seraph",
	  "bovine",
	  "horse",
	  "spider"
    ],
    "conflict": [
      ""
    ]
  },
  "Regeneration": {
    "name": "Regeneration",
    "description": "$name has pretty fast metabolism. \n\n[color=aqua]Higher chance for recover after injure. Bigger hp recover from rest. [/color]",
    "effect": {
      "code": "regenertion",
    },
    "tags": [
      "third",
      "secondary",
      "goodthing",
	  "lvlup",
      "dragon",
	  "demon",
	  "wolfish"
    ],
    "conflict": [
      ""
    ]
  },
  "Dodger": {
    "name": "Dodger",
    "description": "$name silly dodger. \n\n[color=aqua]Speed +3 [/color]",
    "effect": {
      "code": "dodger",
    },
    "tags": [
      "third",
      "secondary",
      "goodthing",
	  "lvlup"
    ],
    "conflict": [
      ""
    ]
  },
  "Glass Bones": {
    "name": "Glass Bones",
    "description": "$name bones is thin and fragile $he also recover after injuring slower. \n\n[color=red]Max health -15%. [/color]",
    "effect": {
      "code": "glass_bones",
      "health_bonus": -0.15
    },
    "tags": [
      "third",
      "secondary",
      "detrimental"
    ],
    "conflict": [
      ""
    ]
  },
  "Eloquent": {
    "name": "Eloquent",
    "description": "You must say that $name has Silver Tongue, but that doesn't describe enough. \n\n[color=aqua]Max Charm +20. [/color]",
    "effect": {
      "code": "eloquent",
      "charm_max": 20,
      "charm_base": 25
    },
    "tags": [
      "third",
      "secondary",
      "goodthing"
    ],
    "conflict": [
      "Foul Mouth",
	  "Mute"
    ]
  },
  "Good Natured": {
    "name": "Good Natured",
    "description": "$name is frendly person who preffered word instead of sword. \n\n[color=aqua]Max Charm +20, Max Wit +20,[/color] [color=red]Max Courage -25, Max Confidence -25. [/color]",
    "effect": {
      "code": "good_natured",
      "charm_max": 20,
      "charm_base": 20,
      "cour_max": -25,
      "conf_max": -25,
      "wit_max": 20,
      "wit_base": 20
    },
    "tags": [
      "third",
	  "personality",
      "secondary",
      "goodthing"
    ],
    "conflict": [
      "Foul Mouth",
    ]
  },
  "Best Flyer Ever": {
    "name": "Best Flyer Ever",
    "description": "$name can fly faster than anyone. \n\n[color=aqua]Speed +5. [/color]",
    "effect": {
      "code": "best_flyer_ever",
    },
    "tags": [
      "racial",
      "secondary",
	  "harpy",
	  "demon",
	  "seraph",
	  "fey",
	  "dragon"
    ],
    "conflict": [
      ""
    ]
  },
  "Heavy Hooves": {
    "name": "Heavy Hooves",
    "description": "$name has big and srong hooves, very dangerous for enemies. \n\n[color=aqua]Damage +2 [/color][color=red]Speed -2. [/color]",
    "effect": {
      "code": "heavy_hooves",
    },
    "tags": [
      "racial",
      "secondary",
	  "demon",
	  "bovine",
	  "horse"
    ],
    "conflict": [
      ""
    ],
  },
  "Brute": {
    "name": "Brute",
    "description": "$name is a brutal, strong and slow. \n\n[color=aqua]Health +20, Damage +3. [/color] [color=red]Speed -3, Max Wit -20. [/color]",
    "effect": {
      "code": "brute",
      "health_base": 20,
      "wit_max": -20
    },
    "tags": [
      "secondary",
	  "background",
	  "goodthing",
    ],
    "conflict": [
      ""
    ]
  },
  "Lucky": {
    "name": "Lucky",
    "description": "Looks like gods smile at $name. \n\n[color=aqua] [/color]",
    "effect": {
      "code": "lucky",
    },
    "tags": [
      "secondary",
	  "third",
      "elitething"
    ],
    "conflict": [
      ""
    ]
  },
  "Sickness": {
    "name": "Sickness",
    "description": "$name got sick and now not feeling well. \n\n[color=red]Max Energy -10. Heal at time. [/color]",
    "effect": {
      "code": "sickness",
      "energy_max": -10,
    },
    "tags": [
      "secondary",
      "injury",
      "physical",
    ],
    "conflict": [
      ""
    ]
  },
  "Curious": {
    "name": "Curious",
    "description": "$name got sick and now not feeling well. \n\n[color=red]Max Energy -10. Heal at time. [/color]",
    "effect": {
      "code": "curious",
      "wit_max": 10,
      "wit_base": 15,
      "wit": 0,
    },
    "tags": [
      "secondary",
	  "goodthing",
	  "mental",
      "third"
    ],
    "conflict": [
      ""
    ]
  },
  "Observant": {
    "name": "Observant",
    "description": "$name was born with bale skin instead of racial coverage on body. \n\n[color=red]Doesn't have fur or scales. [/color]",
    "effect": {
      "code": "observant",
    },
    "tags": [
      "secondary",
	  "third",
	  "mental",
	  "goodthing"
    ],
    "conflict": [
      "Wolf Hide",
    ]
  },
  "Valiant": {
    "name": "Valiant",
    "description": "$name got sick and now not feeling well. \n\n[color=red]Max Energy -10. Heal at time. [/color]",
    "effect": {
      "code": "valiant",
      "cour_min": 55,
      "cour_max": 20,
      "fear_mod": -0.25,
      "cour": 0,
    },
    "tags": [
      "secondary",
	  "mental",
      "third",
	  "goodthing"
    ],
    "conflict": [
      ""
    ]
  },
  "Dimwitted": {
    "name": "Dimwitted",
    "description": "$name got sick and now not feeling well. \n\n[color=red]Max Energy -10. Heal at time. [/color]",
    "effect": {
      "code": "dimwitted",
      "wit_max": -50,
      "wit_base": -35,
      "wit": 0,
    },
    "tags": [
      "secondary",
	  "mental",
      "third",
	  "detrimental"
    ],
    "conflict": [
      ""
    ]
  },
  "Closed": {
    "name": "Closed",
    "description": "$name got sick and now not feeling well. \n\n[color=red]Max Energy -10. Heal at time. [/color]",
    "effect": {
      "code": "closed",
      "wit_max": 10,
      "wit_base": 15,
      "wit": 0,
    },
    "tags": [
      "secondary",
	  "mental",
      "third"
    ],
    "conflict": [
      ""
    ]
  },
  "Proud": {
    "name": "Proud",
    "description": "$name got sick and now not feeling well. \n\n[color=red]Max Energy -10. Heal at time. [/color]",
    "effect": {
      "code": "proud",
      "conf_max": 20,
      "conf_base": 15,
	  "loyal_mod": -0.3,
      "conf": 0,
    },
    "tags": [
      "secondary",
      "third"
    ],
    "conflict": [
      ""
    ]
  },
  "Lazy": {
    "name": "Lazy",
    "description": "$name got sick and now not feeling well. \n\n[color=red]Max Energy -10. Heal at time. [/color]",
    "effect": {
      "code": "lazy",
      "stress_mod": 0.10,
      "cour_max": -20,
      "wit_max": -10,
      "cour": 0,
    },
    "tags": [
      "secondary",
      "third",
	  "detrimental"
    ],
    "conflict": [
      ""
    ]
  },
  "Shy": {
    "name": "Shy",
    "description": "$name easy to manipulate and scare. \n\n[color=aqua]Obedience +20%. [/color] [color=red]Max Courage and Confidence -25, Stress +25%.[/color]",
    "effect": {
      "code": "shyness",
      "cour_max": -25,
      "conf_max": -25,
      "stress_mod": 0.25,
      "obed_mod": 0.2
    },
    "tags": [
      "third",
	  "personality",
      "secondary",
      "goodthing"
    ],
    "conflict": [
      ""
    ]
  },
  "Hidden Trait": {
    "name": "Hidden Trait",
    "description": "$name has hidden trait. \n\n[color=aqua]Can be revealed in daily event. [/color]",
    "effect": {
      "code": "hidden_trait",
    },
    "tags": [
      "third",
      "secondary",
      "mental",
      "physical",
	  "hidden"
    ],
    "conflict": [
      ""
    ]
  },
  "Horns&Hooves": {
    "name": "Horns&Hooves",
    "description": "$name allow to deal more damage in battles. \n\n[color=aqua] Damage +4. [/color]",
    "effect": {
      "code": "horns&hooves",
    },
    "tags": [
      "secondary",
	  "racial",
      "physical",
	  "demon",
	  "bovine",
    ],
    "conflict": [
      ""
    ]
  },
  "Nine Lives": {
    "name": "Nine Lives",
    "description": "$name insert text here. \n\n[color=aqua]Can once survive death blow. [/color]",
    "effect": {
      "code": "nine_lives",
    },
    "tags": [
      "secondary",
	  "racial",
	  "feline",
	  "lvlup"
    ],
    "conflict": [
      ""
    ]    
  },
  "Kleptomania": {
    "name": "Kleptomania",
    "description": "$name has bad habits to steal anything what didn't watched. \n\n[color=red] When on social work has chance to steal. [/color]",
    "effect": {
      "code": "kleptomania",
    },
    "tags": [
      "third",
	  "mental",
	  "detrimental"
    ],
    "conflict": [
      ""
    ]    
  },
  "Mercenary": {
    "name": "Mercenary",
    "description": "$name is sell his abilities for a tidy sum. \n\n[color=aqua]Will go away when contract is expired. [/color]",
    "effect": {
      "code": "mercenary",
      "conf_min": 40,
      "cour_min": 40,
	  "loyal_max": 0,
    },
    "tags": [
      "secondary",
	  "hireling"
    ],
    "conflict": [
      ""
    ]    
  },
  "Good genetics": {
    "name": "Good genetics",
    "description": "$name ancestors grant $him good genes. \n\n[color=aqua] +1 to one of attributes. [/color]",
    "effect": {
      "code": "good_genetics",
    },
    "tags": [
      "third",
      "secondary",
      "goodthing"
    ],
    "conflict": [
      ""
    ]
  }
}