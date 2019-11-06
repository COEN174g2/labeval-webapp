# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

questions = [
 { 
 	description: 'The labs helped me understand the lecture material.',
 	questionnaire_id: 1,
 	q_type: 1
 },
 { 
 	description: 'The labs taught me new skills.',
 	questionnaire_id: 1,
 	q_type: 1
 },
 { 
 	description: 'The labs taught me to think creatively.',
 	questionnaire_id: 1,
 	q_type: 1
 },
 { 
 	description: 'I would be able to repeat the labs without help.',
 	questionnaire_id: 1,
 	q_type: 1
 },
 { 
 	description: 'What was your favorite aspect of the lab?',
 	questionnaire_id: 1,
 	q_type: 3
 },
 { 
 	description: 'What about the lab would you like to see improved?',
 	questionnaire_id: 1,
 	q_type: 3
 },
 { 
 	description: 'The lab instructor was supportive.',
 	questionnaire_id: 1,
 	q_type: 1
 },
 { 
 	description: 'The lab instructor was approachable.',
 	questionnaire_id: 1,
 	q_type: 1
 },
 { 
 	description: 'The lab instructor was able to answer my questions.',
 	questionnaire_id: 1,
 	q_type: 1
 },
 { 
 	description: 'The lab instructor helped me reach a clear understanding of key concepts.',
 	questionnaire_id: 1,
 	q_type: 1
 },
 { 
 	description: 'The lab instructor fostered a mutually respectful learning environment.',
 	questionnaire_id: 1,
 	q_type: 1
 },
 { 
 	description: 'What, if anything, could the lab instructor do to improve the experience?',
 	questionnaire_id: 1,
 	q_type: 3
 },
 { 
 	description: 'The amount of lab equipment was sufficient.',
 	questionnaire_id: 1,
 	q_type: 1
 },
 { 
 	description: 'The available space was sufficient for the lab activities.',
 	questionnaire_id: 1,
 	q_type: 1
 },
 { 
 	description: 'If lab equipment or setups were not functioning properly, adequate support was available to rectify the situation.',
 	questionnaire_id: 1,
 	q_type: 1
 },
 { 
 	description: 'What, if anything, could improve lab space and equipment?',
 	questionnaire_id: 1,
 	q_type: 3
 },
 { 
 	description: 'On average, the approximate number of hours completing a lab was',
 	questionnaire_id: 1,
 	q_type: 2
 },
 { 
 	description: 'How many hours did you spend preparing for the lab? ',
 	questionnaire_id: 1,
 	q_type: 2
 },
 { 
 	description: 'How many hours did you spend writing lab reports outside the designated lab period?',
 	questionnaire_id: 1,
 	q_type: 2
 },
 { 
 	description: 'What feedback would you give the lecture section instructor (not the lab TA) about the labs?',
 	questionnaire_id: 1,
 	q_type: 3
 }
]

Question.create(questions)