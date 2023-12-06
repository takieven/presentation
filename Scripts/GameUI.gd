extends Control

# ---------- VARIABLES ---------- #

@onready var coinsLabel = $CoinsLabel
@onready var button = $Button
@onready var close = $Close
@onready var text = $Part1

var page = 0
var prev_topic=0
var topic = GameManager.score

var show = false

var shit = [[""],
[
	"Artificial Intelligence (AI) is a wide-ranging branch of computer science concerned with building smart machines capable of performing tasks that typically require human intelligence. AI techniques enable computers to learn from data, identify patterns, make decisions, and solve problems.",
	"Integrated Library Systems (ILS) are software applications that manage the core functions of libraries, including cataloging, circulation, acquisitions, and user management. ILS provide a centralized platform for managing library resources and services, enabling efficient workflow and enhanced patron experience."
],
[
	"AI and ILS are increasingly converging, with AI applications being integrated into ILS to provide more intelligent and personalized library services. Here are some examples of AI and ILS integration:",
	"AI-powered chatbots: Chatbots can answer patron questions, provide assistance with library resources, and offer personalized recommendations.",
	"AI-based book recommendation systems: These systems analyze patron reading history and preferences to suggest relevant books, articles, and other resources.",
	"AI-driven collection management: AI algorithms can analyze usage data to identify popular and underutilized resources, optimizing collection development and resource allocation.",
	"AI-powered resource discovery: AI tools can help patrons discover relevant resources from vast collections, using natural language processing and machine learning techniques.",
],
[
	"Enhanced user experience: AI can personalize services, provide 24/7 support, and simplify resource discovery, improving patron satisfaction.",
	"Streamlined workflows: AI can automate routine tasks, reduce manual labor, and optimize resource allocation, freeing up staff time for more value-added services.",
	"Data-driven decision-making: AI can analyze library data to identify trends, patterns, and insights, enabling informed decisions about resource allocation, marketing strategies, and service development.",
	"Improved accessibility: AI tools can assist patrons with disabilities, providing personalized guidance and support."
],
[
	"Cost and implementation: Implementing AI-powered ILS requires significant investment in technology, training, and infrastructure.",
	"Data privacy and security: AI systems rely on vast amounts of data, raising concerns about data privacy, security, and potential misuse.",
	"Ethical considerations: AI algorithms must be developed and implemented with ethical considerations in mind, ensuring fairness, unbiasedness, and transparency.",
],
[
	"The future of AI and ILS holds immense potential for transforming library services and enhancing patron experiences. Here are some key directions and opportunities to explore:",
	"Personalized and adaptive services: AI will further personalize library services, tailoring recommendations, search results, and interactions to individual preferences and needs.",
	"Predictive analytics: AI will analyze patron behavior and usage patterns to predict future needs and proactively provide relevant resources and services.",
	"Augmented reality (AR) and virtual reality (VR) integration: AI-powered AR and VR experiences will enhance resource discovery, virtual tours, and immersive learning opportunities.",
	"Natural language processing (NLP) advancements: AI-powered NLP tools will enable more natural and intuitive interactions between patrons and library systems.",
	"Open-source AI and ILS development: Open-source initiatives will foster collaboration and innovation in AI and ILS development, making these technologies more accessible to libraries of all sizes."
]
]

# ---------- FUNCTIONS ---------- #

func _process(_delta):
	topic = GameManager.score
	
	coinsLabel.text = "x %d" % GameManager.score # Set the coin label text to the score variable

	text.text = shit[topic][page]
	
	if prev_topic!=topic:
		prev_topic=topic
		show = true
		page=0
	
	if show:
		text.show()
		button.show()
		close.show()
	else:
		button.hide()
		close.hide()
		text.hide()


func _on_button_pressed():
	if prev_topic!=topic:
		prev_topic=topic
		page=0

	if page< (shit[topic].size()-1) :
		page += 1

func _on_close_pressed():
	show = false
