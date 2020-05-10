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
  ovo = Provimento.create!(
    nome: "Ovo"
  )
  oleo = Provimento.create!(
    nome: "Óleo"
  )
  pera = Provimento.create!(
    nome: "Pêra"
  )
  cebola = Provimento.create!(
    nome: "Cebola"
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

  omelete = Receitum.create!(
    nome: "Omelete",
    descricao: "Receita simples de uma deliciosa omelete",
    user: john
  )

  Ingrediente.create!(
    [
      {
        quantidade:2,
        provimento: ovo,
        receitum: omelete,
      },
      {
        quantidade:1,
        provimento: oleo,
        receitum: omelete,
      }
    ]
  )
   
  Passo.create!(
    [
      {
        
        receitum: omelete,
        posicao:0,
        descricao: "Ponha o óleo na frigideira"
      },
      {
        receitum: omelete,
        posicao:1,
        descricao: "Esquente a frigideira"
      },
      {
        receitum: omelete,
        posicao:2,
        descricao: "Adicione cebola picada"
      },
      {
        receitum: omelete,
        posicao:3,
        descricao: "Ponha os ovos e mexa bem para deixar uniforme"
      },
      {
        receitum: omelete,
        posicao:4,
        descricao: "Apague o fogo quando estiuver comum consistencia sólida, antes que queime, claro"
      }
    ]
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