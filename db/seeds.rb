puts 'Gerando foods...'

5.times do |i|
  Food.create(
    name: ["lasanha", "macarronada", "pizza"].sample ,
    description: "pratos italianos"
    )
end

puts 'foods gerados com sucesso!'