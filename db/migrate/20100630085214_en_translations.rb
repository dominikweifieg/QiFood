class EnTranslations < ActiveRecord::Migration
  def self.up
    sql = <<-eos
    INSERT INTO aliment_translations(locale, aliment_id, name, created_at, updated_at) values("en", 1, "Amaranth", NOW(), NOW()),("en", 2, "Basmati Rice", NOW(), NOW()),("en", 3, "Buckwheat", NOW(), NOW()),("en", 4, "Spelt", NOW(), NOW()),("en", 5, "Aromatic Rice", NOW(), NOW()),("en", 6, "Barley", NOW(), NOW()),("en", 7, "Unripe Spelt", NOW(), NOW()),("en", 8, "Oats", NOW(), NOW()),("en", 9, "Millet", NOW(), NOW()),("en", 10, "Kasha", NOW(), NOW()),("en", 11, "Glutinous Rice", NOW(), NOW()),("en", 12, "Black Sticky Rice", NOW(), NOW()),("en", 13, "Long Grain Rice", NOW(), NOW()),("en", 14, "Polenta", NOW(), NOW()),("en", 15, "Red Rice", NOW(), NOW()),("en", 16, "Sweet Rice", NOW(), NOW()),("en", 17, "Wild Rice", NOW(), NOW()),("en", 18, "Rye", NOW(), NOW()),("en", 19, "Round Grain Rice", NOW(), NOW()),("en", 20, "Wheat", NOW(), NOW()),("en", 21, "Maize", NOW(), NOW()),("en", 22, "Quinoa", NOW(), NOW()),("en", 23, "Adzuki Beans", NOW(), NOW()),("en", 24, "Peas", NOW(), NOW()),("en", 25, "Lenses", NOW(), NOW()),("en", 26, "Chickpea", NOW(), NOW()),("en", 27, "Mung Beans", NOW(), NOW()),("en", 28, "Kidney Beans", NOW(), NOW()),("en", 29, "Soybean, Yellow", NOW(), NOW()),("en", 30, "Black Soybean", NOW(), NOW()),("en", 31, "Artichoke", NOW(), NOW()),("en", 32, "Eggplant", NOW(), NOW()),("en", 33, "Oyster Mushroom", NOW(), NOW()),("en", 34, "Avocado", NOW(), NOW()),("en", 35, "Cauliflower", NOW(), NOW()),("en", 36, "Green Bean", NOW(), NOW()),("en", 37, "Broccoli", NOW(), NOW()),("en", 38, "Mushroom", NOW(), NOW()),("en", 39, "Chinese Cabbage", NOW(), NOW()),("en", 40, "Iceberg Lettuce", NOW(), NOW()),("en", 41, "Fennel", NOW(), NOW()),("en", 42, "Spring Onion", NOW(), NOW()),("en", 43, "Cucumber", NOW(), NOW()),("en", 44, "Carrot", NOW(), NOW()),("en", 45, "Potato", NOW(), NOW()),("en", 46, "Kohlrabi", NOW(), NOW()),("en", 47, "Cress", NOW(), NOW()),("en", 48, "Pumpkin", NOW(), NOW()),("en", 49, "Leeks", NOW(), NOW()),("en", 50, "Peppers", NOW(), NOW()),("en", 51, "Parsnip", NOW(), NOW()),("en", 52, "Parsley Root", NOW(), NOW()),("en", 53, "Radishes", NOW(), NOW()),("en", 54, "Radish", NOW(), NOW()),("en", 55, "Brussels Sprouts", NOW(), NOW()),("en", 56, "Beetroot", NOW(), NOW()),("en", 57, "Salsify", NOW(), NOW()),("en", 58, "Celeriac", NOW(), NOW()),("en", 59, "Celery", NOW(), NOW()),("en", 60, "Shiitake", NOW(), NOW()),("en", 61, "Asparagus", NOW(), NOW()),("en", 62, "Spinach", NOW(), NOW()),("en", 63, "Shoots", NOW(), NOW()),("en", 64, "Porcini Mushroom", NOW(), NOW()),("en", 65, "Sweet Potatoes", NOW(), NOW()),("en", 66, "Tomato", NOW(), NOW()),("en", 67, "White Cabbage", NOW(), NOW()),("en", 68, "Savoy Cabbage", NOW(), NOW()),("en", 69, "Courgettes", NOW(), NOW()),("en", 70, "Onion", NOW(), NOW()),("en", 71, "Cashew", NOW(), NOW()),("en", 72, "Peanut", NOW(), NOW()),("en", 73, "Hazelnut", NOW(), NOW()),("en", 74, "Chestnut", NOW(), NOW()),("en", 75, "Coconut", NOW(), NOW()),("en", 76, "Pumpkin Seeds", NOW(), NOW()),("en", 77, "Almond", NOW(), NOW()),("en", 78, "Pistachio", NOW(), NOW()),("en", 79, "Brazil Nut", NOW(), NOW()),("en", 80, "Sesame", NOW(), NOW()),("en", 81, "Black Sesame", NOW(), NOW()),("en", 82, "Sunflower Seeds", NOW(), NOW()),("en", 83, "Walnut", NOW(), NOW()),("en", 84, "Duck", NOW(), NOW()),("en", 85, "Goose", NOW(), NOW()),("en", 86, "Mutton", NOW(), NOW()),("en", 87, "Hare", NOW(), NOW()),("en", 88, "Venison", NOW(), NOW()),("en", 89, "Chicken", NOW(), NOW()),("en", 90, "Egg", NOW(), NOW()),("en", 91, "Veal", NOW(), NOW()),("en", 92, "Rabbit", NOW(), NOW()),("en", 93, "Lamb", NOW(), NOW()),("en", 94, "Beef", NOW(), NOW()),("en", 95, "Beef Liver", NOW(), NOW()),("en", 96, "Beef Kidney", NOW(), NOW()),("en", 97, "Pig", NOW(), NOW()),("en", 98, "Pig Liver", NOW(), NOW()),("en", 99, "Pig Kidney", NOW(), NOW()),("en", 100, "Turkey", NOW(), NOW()),("en", 101, "Wild Boar", NOW(), NOW()),("en", 102, "Goat", NOW(), NOW()),("en", 103, "Eel", NOW(), NOW()),("en", 104, "Oysters", NOW(), NOW()),("en", 105, "Perch", NOW(), NOW()),("en", 106, "Trout", NOW(), NOW()),("en", 107, "Shrimp", NOW(), NOW()),("en", 108, "Herring", NOW(), NOW()),("en", 109, "Cod", NOW(), NOW()),("en", 110, "Carp", NOW(), NOW()),("en", 111, "Caviar", NOW(), NOW()),("en", 112, "Crab", NOW(), NOW()),("en", 113, "Salmon", NOW(), NOW()),("en", 114, "Mussel", NOW(), NOW()),("en", 115, "Sardine", NOW(), NOW()),("en", 116, "Plaice", NOW(), NOW()),("en", 117, "Squid", NOW(), NOW()),("en", 118, "Tuna", NOW(), NOW()),("en", 119, "Pineapple", NOW(), NOW()),("en", 120, "Apple", NOW(), NOW()),("en", 121, "Apricot", NOW(), NOW()),("en", 122, "Banana", NOW(), NOW()),("en", 123, "Pear", NOW(), NOW()),("en", 124, "Blackberry", NOW(), NOW()),("en", 125, "Date", NOW(), NOW()),("en", 126, "Strawberry", NOW(), NOW()),("en", 127, "Fig", NOW(), NOW()),("en", 128, "Pomegranate", NOW(), NOW()),("en", 129, "Grapefruit", NOW(), NOW()),("en", 130, "Blueberry", NOW(), NOW()),("en", 131, "Raspberry", NOW(), NOW()),("en", 132, "Elder", NOW(), NOW()),("en", 133, "Honeydew Melon", NOW(), NOW()),("en", 134, "Currant", NOW(), NOW()),("en", 135, "Kaki", NOW(), NOW()),("en", 136, "Cherry", NOW(), NOW()),("en", 137, "Kiwi", NOW(), NOW()),("en", 138, "Litchi", NOW(), NOW()),("en", 139, "Mandarin", NOW(), NOW()),("en", 140, "Mango", NOW(), NOW()),("en", 141, "Mirabelle", NOW(), NOW()),("en", 142, "Orange", NOW(), NOW()),("en", 143, "Papaya", NOW(), NOW()),("en", 144, "Peach", NOW(), NOW()),("en", 145, "Plum", NOW(), NOW()),("en", 146, "Quince", NOW(), NOW()),("en", 147, "Rhubarb", NOW(), NOW()),("en", 148, "Gooseberry", NOW(), NOW()),("en", 149, "Grape", NOW(), NOW()),("en", 150, "Watermelon", NOW(), NOW()),("en", 151, "Lime", NOW(), NOW()),("en", 152, "Lemon", NOW(), NOW()),("en", 153, "Butter", NOW(), NOW()),("en", 154, "Safflower Oil", NOW(), NOW()),("en", 155, "Peanut Oil", NOW(), NOW()),("en", 156, "Bone Marrow", NOW(), NOW()),("en", 157, "Pumpkin Seed Oil", NOW(), NOW()),("en", 158, "Olive Oil", NOW(), NOW()),("en", 159, "Rapeseed Oil", NOW(), NOW()),("en", 160, "Sesame Oil", NOW(), NOW()),("en", 161, "Soybean Oil", NOW(), NOW()),("en", 162, "Sunflower Oil", NOW(), NOW()),("en", 163, "Walnut Oil", NOW(), NOW()),("en", 164, "Wheat Germ", NOW(), NOW()),("en", 165, "Anise", NOW(), NOW()),("en", 166, "Cayenne Pepper", NOW(), NOW()),("en", 167, "Cumin", NOW(), NOW()),("en", 168, "Turmeric", NOW(), NOW()),("en", 169, "Curry", NOW(), NOW()),("en", 170, "Fennel Seeds", NOW(), NOW()),("en", 171, "Ginger Powder", NOW(), NOW()),("en", 172, "Cocoa", NOW(), NOW()),("en", 173, "Cardamom", NOW(), NOW()),("en", 174, "Cilantro", NOW(), NOW()),("en", 175, "Cumin", NOW(), NOW()),("en", 176, "Nutmeg", NOW(), NOW()),("en", 177, "Carnation", NOW(), NOW()),("en", 178, "Paprika", NOW(), NOW()),("en", 179, "Pepper", NOW(), NOW()),("en", 180, "Allspice", NOW(), NOW()),("en", 181, "Saffron", NOW(), NOW()),("en", 182, "Salt", NOW(), NOW()),("en", 183, "Mustard Seeds", NOW(), NOW()),("en", 184, "Star Anise", NOW(), NOW()),("en", 185, "Vanilla", NOW(), NOW()),("en", 186, "Juniper Berry", NOW(), NOW()),("en", 187, "Cinnamon", NOW(), NOW()),("en", 188, "Sichuan Pepper", NOW(), NOW()),("en", 189, "Basil", NOW(), NOW()),("en", 190, "Savory", NOW(), NOW()),("en", 191, "Borage", NOW(), NOW()),("en", 192, "Stinging Nettle", NOW(), NOW()),("en", 193, "Chilli", NOW(), NOW()),("en", 194, "Dill", NOW(), NOW()),("en", 195, "Tarragon", NOW(), NOW()),("en", 196, "Ginger", NOW(), NOW()),("en", 197, "Chervil", NOW(), NOW()),("en", 198, "Garlic", NOW(), NOW()),("en", 199, "Cilantro", NOW(), NOW()),("en", 200, "Cress", NOW(), NOW()),("en", 201, "Lovage", NOW(), NOW()),("en", 202, "Laurel", NOW(), NOW()),("en", 203, "Dandelion", NOW(), NOW()),("en", 204, "Marjoram", NOW(), NOW()),("en", 205, "Horseradish", NOW(), NOW()),("en", 206, "Oregano", NOW(), NOW()),("en", 207, "Parsley", NOW(), NOW()),("en", 208, "Peppermint", NOW(), NOW()),("en", 209, "Rosemary", NOW(), NOW()),("en", 210, "Sage", NOW(), NOW()),("en", 211, "Chives", NOW(), NOW()),("en", 212, "Thyme", NOW(), NOW()),("en", 213, "Hyssop", NOW(), NOW()),("en", 214, "Maple Syrup", NOW(), NOW()),("en", 215, "Egg Yolk", NOW(), NOW()),("en", 216, "Egg White", NOW(), NOW()),("en", 217, "Vinegar", NOW(), NOW()),("en", 218, "Barley Malt", NOW(), NOW()),("en", 219, "Honey", NOW(), NOW()),("en", 220, "Yogurt", NOW(), NOW()),("en", 221, "Coconut Milk", NOW(), NOW()),("en", 222, "Lotus Seeds", NOW(), NOW()),("en", 223, "Molasses", NOW(), NOW()),("en", 224, "Milk", NOW(), NOW()),("en", 225, "Miso", NOW(), NOW()),("en", 226, "Palm Sugar", NOW(), NOW()),("en", 227, "Rice Malt", NOW(), NOW()),("en", 228, "Jujube", NOW(), NOW()),("en", 229, "Sweet Cream", NOW(), NOW()),("en", 230, "Sour Cream", NOW(), NOW()),("en", 231, "Soy Milk", NOW(), NOW()),("en", 232, "Soy Sauce", NOW(), NOW()),("en", 233, "Tofu", NOW(), NOW()),("en", 234, "Demerara", NOW(), NOW()),("en", 235, "Fenugreek", NOW(), NOW()),("en", 236, "Salami", NOW(), NOW()),("en", 237, "Raw Ham", NOW(), NOW()),("en", 238, "Black Beans", NOW(), NOW()),("en", 239, "Tangerine Peel", NOW(), NOW());
    eos
    insert sql
    
    sql=<<-eos
    INSERT INTO element_translations(locale, element_id, name, created_at, updated_at) values("en", 1, "Wood", NOW(), NOW()),("en", 2, "Fire", NOW(), NOW()),("en", 3, "Earth", NOW(), NOW()),("en", 4, "Metal", NOW(), NOW()),("en", 5, "Water", NOW(), NOW());
    eos
    insert sql
    
    sql=<<-eos
    INSERT INTO organ_translations(organ_id, locale, name, created_at, updated_at) values (1,"en","Liver",NOW(), NOW()),(2,"en","Gallbladder",NOW(), NOW()),(3,"en","Heart",NOW(), NOW()),(4,"en","Small Intestine",NOW(), NOW()),(5,"en","Sanjiao",NOW(), NOW()),(6,"en","Pericardium",NOW(), NOW()),(7,"en","Spleen",NOW(), NOW()),(8,"en","Stomach",NOW(), NOW()),(9,"en","Lung",NOW(), NOW()),(10,"en","Large Intestine",NOW(), NOW()),(11,"en","Kidney",NOW(), NOW()),(12,"en","Bladder",NOW(), NOW());
    eos
    insert sql
    
    sql=<<-eos
    INSERT INTO category_translations(category_id, locale, name, created_at, updated_at) values(1, "en", "Grain", NOW(), NOW()),(2, "en", "Pluses", NOW(), NOW()),(3, "en", "Nuts & Seeds", NOW(), NOW()),(4, "en", "Vegetables", NOW(), NOW()),(5, "en", "Salads", NOW(), NOW()),(6, "en", "Meat", NOW(), NOW()),(7, "en", "Fish & Seafood", NOW(), NOW()),(8, "en", "Fruits & Berries", NOW(), NOW()),(9, "en", "Oils & Fats", NOW(), NOW()),(10, "en", "Dried Spices", NOW(), NOW()),(11, "en", "Fresh Herbs", NOW(), NOW()),(12, "en", "Sweeteners", NOW(), NOW()),(13, "en", "Dairy Products", NOW(), NOW()),(14, "en", "Other", NOW(), NOW());
    eos
    insert sql
    
    sql=<<-eos
    INSERT INTO effect_translations(locale, effect_id, description, updated_at, created_at) VALUES("en", 1, "transforms mucus", NOW(), NOW()),("en", 2, "strengthens spleen and stomach", NOW(), NOW()),("en", 3, "promotes digestion", NOW(), NOW()),("en", 4, "detoxifies", NOW(), NOW()),("en", 5, "converts moisture", NOW(), NOW()),("en", 6, "strengthens the middle", NOW(), NOW()),("en", 7, "nourishes liver blood", NOW(), NOW()),("en", 8, "strengthens the spleen", NOW(), NOW()),("en", 9, "cools bladder", NOW(), NOW()),("en", 10, "dehydrating", NOW(), NOW()),("en", 11, "mild laxative", NOW(), NOW()),("en", 12, "eliminates digestive blockages", NOW(), NOW()),("en", 13, "strengthens qi", NOW(), NOW()),("en", 14, "strengthens immune system", NOW(), NOW()),("en", 15, "strengthens spleen and kidney", NOW(), NOW()),("en", 16, "dispenses with stomach heat", NOW(), NOW()),("en", 17, "removes stomach cold", NOW(), NOW()),("en", 18, "strengthens blood", NOW(), NOW()),("en", 19, "removes moisture", NOW(), NOW()),("en", 20, "stops diarrhea", NOW(), NOW()),("en", 21, "strengthens stomach-qi", NOW(), NOW()),("en", 22, "nourishes blood", NOW(), NOW()),("en", 23, "moisturizes", NOW(), NOW()),("en", 24, "strengthens the kidney", NOW(), NOW()),("en", 25, "strengthens the bladder", NOW(), NOW()),("en", 26, "relaxes qi", NOW(), NOW()),("en", 27, "nourishes yin of the heart, stomach and kidney", NOW(), NOW()),("en", 29, "strengthens the heart", NOW(), NOW()),("en", 30, "nourishes liver-yin", NOW(), NOW()),("en", 31, "nourishes heart-yin", NOW(), NOW()),("en", 32, "nourishes kidney-yin", NOW(), NOW()),("en", 33, "strengthens kidney-yin", NOW(), NOW()),("en", 34, "cools liver heat", NOW(), NOW()),("en", 35, "nourishes lung-yin", NOW(), NOW()),("en", 36, "cools the blood", NOW(), NOW()),("en", 37, "moves blood", NOW(), NOW()),("en", 38, "nourishes qi", NOW(), NOW()),("en", 39, "feeds colon yin", NOW(), NOW()),("en", 40, "nourishes stomach yin", NOW(), NOW()),("en", 41, "feeds juices", NOW(), NOW()),("en", 42, "regulates qi", NOW(), NOW()),("en", 43, "warms the interior", NOW(), NOW()),("en", 44, "warms the spleen", NOW(), NOW()),("en", 45, "warms the kidney", NOW(), NOW()),("en", 46, "cools", NOW(), NOW()),("en", 47, "strengthens the liver", NOW(), NOW()),("en", 48, "anti-inflammatory", NOW(), NOW()),("en", 49, "moves qi", NOW(), NOW()),("en", 50, "strengthens the lungs", NOW(), NOW()),("en", 51, "promotes sweating", NOW(), NOW()),("en", 52, "nourishes yin", NOW(), NOW()),("en", 53, "nourishes the lungs", NOW(), NOW()),("en", 54, "nourishes spleen", NOW(), NOW()),("en", 55, "expels mucus", NOW(), NOW()),("en", 56, "lowers qi", NOW(), NOW()),("en", 57, "moves yang", NOW(), NOW()),("en", 58, "moisturizes lungs", NOW(), NOW()),("en", 59, "moisturizes colon", NOW(), NOW()),("en", 60, "strengthens the stomach", NOW(), NOW()),("en", 61, "strengthens the brain", NOW(), NOW()),("en", 62, "strengthens jing", NOW(), NOW()),("en", 63, "strengthens the heart-qi", NOW(), NOW()),("en", 64, "strengthens the lung-qi", NOW(), NOW()),("en", 65, "strengthens the intestine", NOW(), NOW()),("en", 66, "moisturizes intestines", NOW(), NOW()),("en", 67, "strengthens kidney-qi", NOW(), NOW()),("en", 68, "strengthens juices", NOW(), NOW()),("en", 69, "strengthens kidney yang", NOW(), NOW()),("en", 70, "builds substance", NOW(), NOW()),("en", 71, "strengthens yin", NOW(), NOW()),("en", 72, "strengthens spleen-qi", NOW(), NOW()),("en", 73, "strengthens spleen-yang", NOW(), NOW()),("en", 75, "strengthens yang", NOW(), NOW()),("en", 76, "promotes milk flow", NOW(), NOW()),("en", 77, "stops cough", NOW(), NOW()),("en", 78, "moisturizes the stomach", NOW(), NOW()),("en", 79, "cools heat", NOW(), NOW()),("en", 80, "keeps juices", NOW(), NOW()),("en", 81, "holds juice (astringent)", NOW(), NOW()),("en", 82, "stops cold diarrhea", NOW(), NOW()),("en", 83, "holds essences", NOW(), NOW()),("en", 84, "dissipates", NOW(), NOW()),("en", 85, "stimulates the intestine", NOW(), NOW()),("en", 86, "builds juices", NOW(), NOW()),("en", 87, "moisturizes the heart", NOW(), NOW()),("en", 88, "moisturizes kidney", NOW(), NOW()),("en", 89, "moisturizes liver", NOW(), NOW()),("en", 90, "stimulates bile", NOW(), NOW()),("en", 91, "strengthens kidney jing", NOW(), NOW()),("en", 92, "strengthens liver-yin", NOW(), NOW()),("en", 93, "warms the middle", NOW(), NOW()),("en", 94, "dispels cold", NOW(), NOW()),("en", 95, "dries dampness", NOW(), NOW()),("en", 96, "warms yang of the kidney", NOW(), NOW()),("en", 97, "stops pain", NOW(), NOW()),("en", 98, "harmonizes liver-qi", NOW(), NOW()),("en", 99, "dissolves mucus", NOW(), NOW()),("en", 100, "lowers", NOW(), NOW()),("en", 101, "softens", NOW(), NOW()),("en", 102, "expels cold mucus", NOW(), NOW()),("en", 104, "resolves stagnation", NOW(), NOW()),("en", 105, "stimulates digestion", NOW(), NOW()),("en", 106, "stops bleeding", NOW(), NOW()),("en", 107, "moisturizes dryness", NOW(), NOW()),("en", 108, "strengthens the middle", NOW(), NOW()),("en", 109, "nourishes jing", NOW(), NOW()),("en", 110, "harmonizes", NOW(), NOW());
    eos
    insert sql
  end

  def self.down
    delete 'DELETE FROM effect_translations WHERE locale = "en";'
    delete 'DELETE FROM category_translations WHERE locale = "en";'
    delete 'DELETE FROM organ_translations WHERE locale = "en";'
    delete 'DELETE FROM element_translations WHERE locale = "en";'
    delete 'DELETE FROM aliment_translations WHERE locale = "en";'
    
  end
end
