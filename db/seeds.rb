puts "creating cocktails"
cocktail_margarita = Cocktail.new
cocktail_margarita.name = "margarita"
cocktail_margarita.description = "Combine tequila, fresh lime juice, and triple sec in a shaker filled with ice. Shake well until chilled, then strain into a salt-rimmed glass. Garnish with a lime wheel for a refreshing, balanced cocktail perfect for any occasion."
cocktail_margarita.save!

cocktail_pina_colada = Cocktail.new
cocktail_pina_colada.name = "pina colada"
cocktail_pina_colada.description = "Blend white rum, coconut cream, and fresh pineapple juice with ice until smooth and creamy. Pour into a chilled glass and garnish with a pineapple wedge and maraschino cherry for a tropical, sweet treat."
cocktail_pina_colada.save!

cocktail_espresso_martini = Cocktail.new
cocktail_espresso_martini.name = "espresso martini"
cocktail_espresso_martini.description = "Shake vodka, freshly brewed espresso, coffee liqueur, and a touch of simple syrup with ice. Strain into a chilled martini glass and garnish with coffee beans for a rich, energizing cocktail."
cocktail_espresso_martini.save!

cocktail_paloma = Cocktail.new
cocktail_paloma.name = "paloma"
cocktail_paloma.description = "Mix tequila with fresh grapefruit juice, lime juice, and a splash of soda water. Serve over ice in a salt-rimmed glass and garnish with a lime wedge for a bright, refreshing Mexican classic."
cocktail_paloma.save!

puts "creating tags and cocktail associations"
tag_1 = Tag.new
tag_1.name = "tequila"
tag_1.cocktail = cocktail_margarita
tag_1.save!

tag_2 = Tag.new
tag_2.name = "rum"
tag_2.cocktail = cocktail_pina_colada
tag_2.save!

tag_3 = Tag.new
tag_3.name = "vodka"
tag_3.cocktail = cocktail_espresso_martini
tag_3.save!

tag_4 = Tag.new
tag_4.name = "tequila"
tag_4.cocktail = cocktail_paloma
tag_4.save!

tag_4x = Tag.new
tag_4x.name = "lime juice"
tag_4x.cocktail = cocktail_paloma
tag_4x.save!

puts "creating ingredients"
ingredient_1 = Ingredient.new
ingredient_1.name = "tequila"
ingredient_1.save!

ingredient_2 = Ingredient.new
ingredient_2.name = "triple sec"
ingredient_2.save!

ingredient_3 = Ingredient.new
ingredient_3.name = "lime juice"
ingredient_3.save!

ingredient_4 = Ingredient.new
ingredient_4.name = "creamy coconut"
ingredient_4.save!

ingredient_5 = Ingredient.new
ingredient_5.name = "white rum"
ingredient_5.save!

ingredient_6 = Ingredient.new
ingredient_6.name = "pineapple juice"
ingredient_6.save!

ingredient_7 = Ingredient.new
ingredient_7.name = "vodka"
ingredient_7.save!

ingredient_8 = Ingredient.new
ingredient_8.name = "coffee liqueur"
ingredient_8.save!

ingredient_9 = Ingredient.new
ingredient_9.name = "espresso"
ingredient_9.save!

ingredient_10 = Ingredient.new
ingredient_10.name = "grapefruit soda"
ingredient_10.save!

puts "creating doses with corresponding ingredients to make a Margarita"
dose_50 = Dose.new
dose_50.amount = 50.0
dose_50.ingredient = ingredient_1
dose_50.cocktail = cocktail_margarita
dose_50.save!

dose_25 = Dose.new
dose_25.amount = 25.0
dose_25.ingredient = ingredient_2
dose_25.cocktail = cocktail_margarita
dose_25.save!

dose_25i = Dose.new
dose_25i.amount = 25.0
dose_25i.ingredient = ingredient_3
dose_25i.cocktail = cocktail_margarita
dose_25i.save!

puts "creating doses with corresponding ingredients to make a Pina Colada"
dose_50i = Dose.new
dose_50i.amount = 50.0
dose_50i.ingredient = ingredient_5
dose_50i.cocktail = cocktail_pina_colada
dose_50i.save!

dose_30 = Dose.new
dose_30.amount = 30.0
dose_30.ingredient = ingredient_4
dose_30.cocktail = cocktail_pina_colada
dose_30.save!

dose_90 = Dose.new
dose_90.amount = 90.0
dose_90.ingredient = ingredient_6
dose_90.cocktail = cocktail_pina_colada
dose_90.save!

puts "creating doses with corresponding ingredients to make a Espresso Martini"
dose_40 = Dose.new
dose_40.amount = 40.0
dose_40.ingredient = ingredient_7
dose_40.cocktail = cocktail_espresso_martini
dose_40.save!

dose_20 = Dose.new
dose_20.amount = 20.0
dose_20.ingredient = ingredient_8
dose_20.cocktail = cocktail_espresso_martini
dose_20.save!

dose_30i = Dose.new
dose_30i.amount = 30.0
dose_30i.ingredient = ingredient_9
dose_30i.cocktail = cocktail_espresso_martini
dose_30i.save!

puts "creating doses with corresponding ingredients to make a Paloma"
dose_50ii = Dose.new
dose_50ii.amount = 50.0
dose_50ii.ingredient = ingredient_1
dose_50ii.cocktail = cocktail_paloma
dose_50ii.save!

dose_15 = Dose.new
dose_15.amount = 15.0
dose_15.ingredient = ingredient_3
dose_15.cocktail = cocktail_paloma
dose_15.save!

dose_90i = Dose.new
dose_90i.amount = 90.0
dose_90i.ingredient = ingredient_10
dose_90i.cocktail = cocktail_paloma
dose_90i.save!
