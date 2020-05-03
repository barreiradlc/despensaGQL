# db/seeds.rb
john = User.create(
    email: "john.doe@example.com",
    first_name: "John",
    username: "John",
    last_name: "Doe",
    password: "Doe123123"
  )
  
  jane = User.create(
    email: "jane.doe@example.com",
    first_name: "Jane",
    username: "Jane",
    last_name: "Doe",
    password: "Doe123123"
  )

  maca = Provimento.create!(
    nome: "Maçã"
  )
  pera = Provimento.create!(
    nome: "Pêra"
  )

  armario = Despensa.create!(
    users:[ john ],
    nome: "Armario",
    descricao: "Armario da cozinha",
  )
  
  geladeira = Despensa.create!(
    users: [ john, jane ],
    nome: "Geladeira",
    descricao: "Geladeira da cozinha",
  )

  Item.create!(
    [
      {
        user: john,
        provimento: maca,
        despensa: geladeira,
        validade: Time.now + 300.hours.to_i,
        quantidade: 34,
        created_at: Time.now,
        updated_at: Time.now
      },
      { 
        user: john,
        provimento: maca,
        despensa: armario,
        validade: Time.now + 300.hours.to_i,
        quantidade: 34,
        created_at: Time.now,
        updated_at: Time.now
      },
      { 
        user: jane,
        provimento: pera,
        despensa: armario,
        validade: Time.now + 300.hours.to_i,
        quantidade: 34,
        created_at: Time.now,
        updated_at: Time.now
      },
      {
        user: jane,
        provimento: pera,
        despensa: armario,
        validade: Time.now + 300.hours.to_i,
        quantidade: 34,
        created_at: Time.now,
        updated_at: Time.now
      }
    ]
  )