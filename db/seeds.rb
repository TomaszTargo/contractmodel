# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create! email: 'marcinsklodowski@gmail.com', password: '12345678',
  password_confirmation: '12345678', name: 'Marcin Skłodowski'

models = [
  Model.create!(name: 'Master Sales Agreement', user: user),
  Model.create!(name: 'Model B', user: user),
  Model.create!(name: 'Model C', user: user),
  Model.create!(name: 'Model D', user: user),
  Model.create!(name: 'Model E', user: user),
  Model.create!(name: 'Model F', user: user),
  Model.create!(name: 'Model G', user: user),
  Model.create!(name: 'Model H', user: user),
  Model.create!(name: 'Model I', user: user),
  Model.create!(name: 'Model J', user: user)
]

customers = [
  Customer.create!(name: 'Acme Inc', models: [models[0], models[1]]),
  Customer.create!(name: 'Customer A', models: [models[0], models[1], models[2]]),
  Customer.create!(name: 'Customer B', models: [models[0], models[4]]),
  Customer.create!(name: 'Customer C', models: [models[0], models[5]]),
  Customer.create!(name: 'Customer D', models: [models[0], models[6]])
]

terms = [
  Term.create!(
    name: 'Term (Yrs)',
    description: 'What is the duration of the term',
    weight: 3,
    responses: [
      Response.create!(response: 'Company', points: 2),
      Response.create!(response: 'Client', points: 0)
    ],
    model: models[0]
  ),
  Term.create!(
    name: 'Contact Form',
    description: 'Which party\'s paper is the Agreement on?',
    weight: 4,
    responses: [
      Response.create!(response: '>3', points: 3),
      Response.create!(response: '3', points: 2),
      Response.create!(response: '2', points: 1),
      Response.create!(response: '1', points: 0)
    ],
    model: models[0]
  ),
  Term.create!(
    name: 'Term of Convenience-OP',
    description: 'Does the OP have a termination of convenience?',
    weight: 4,
    responses: [
      Response.create!(response: 'None', points: 2),
      Response.create!(response: '>=1 Yr', points: 1),
      Response.create!(response: '<1 Yr', points: 0),
      Response.create!(response: '<=30 Days', points: -1)
    ],
    model: models[0]
  ),
  Term.create!(
    name: 'Limitation of Liability-Cap',
    description: 'Is there an LOL for damage amount?',
    weight: 4,
    responses: [
      Response.create!(response: 'Standard', points: 1),
      Response.create!(response: 'Significant Addition', points: -1),
      Response.create!(response: 'None', points: -2)
    ],
    model: models[0]
  ),
  Term.create!(
    name: 'Limitation of Liability-Type',
    description: 'Is there an LOL for damage amount?',
    weight: 3,
    responses: [
      Response.create!(response: 'Standard', points: 1),
      Response.create!(response: 'OP Owns', points: -1)
    ],
    model: models[0]
  )
]

Answer.create! term_id: terms[0].id, response_id: terms[0].responses[0].id,
  customer_id: customers[0].id, stage: 'draft'

Answer.create! term_id: terms[1].id, response_id: terms[1].responses[0].id,
  customer_id: customers[0].id, stage: :draft
