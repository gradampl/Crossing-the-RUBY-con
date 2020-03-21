#######################################################################################
                                  # Methods #
#######################################################################################

def startProgram
  puts ''
  puts 'Wybierz czynność, jaką mam wykonać: '
  puts ' - wciśnij a, jeśli mam dodać film;'
  puts ' - wciśnij b, jeśli mam pokazać wszystkie filmy;'
  puts ' - wciśnij c, jeśli mam zmienić ocenę filmu;'
  puts ' - wciśnij d, jeśli mam usunąć film;'
  puts ' - wciśnij e, jeśli chcesz zakończyć program.'
  puts ''

  choice = gets.chomp.downcase
  return choice
end


def setTitle
  title = nil?
  loop do
    puts 'Podaj tytuł filmu: '
    title = gets.chomp
    break if title != ''
  end
  return title
end


def setRating
  rating = nil?
  loop do
    puts 'Podaj ocenę, skala: 0 = dno, 1 = słaby, 2 = średni, 3 = dobry, 4 = rewelacja!'
    begin
      rating = gets.chomp
      rating = Integer(rating)
    rescue ArgumentError
      puts 'Podaj ocenę, skala: 0 = dno, 1 = słaby, 2 = średni, 3 = dobry, 4 = rewelacja!'
      retry
    end
    break if (rating <= 4 && rating >= 0)
  end
  return rating
end


def listFilms(param)
  films = param
  if films == {}
    puts'Lista jest pusta.'
  else
    films.each do |k, v|
      puts "#{k}: #{v}"
    end
  end
end


def add(param)
  films = param
  key = setTitle
  if !films[key.to_sym].nil?
    puts 'Ten film jest już na liście.'
  else
    value = setRating
    films[key.to_sym] = value.to_i
    puts "Dodano film #{key} z oceną #{value}."
  end
  return films
end


def update_delete(param1, param2)
  films = param1
  key = setTitle
  if !films[key.to_sym].nil?
    if param2 == 'd'
      films.delete(key.to_sym)
      puts "Usunięto z listy film #{key}."
    else
      value = setRating
      films[key.to_sym] = value.to_i
      puts "Zmieniono ocenę filmu #{key} na #{value}."
    end
  else
    puts 'Nie ma takiego filmu na liście.'
  end
  return films
end

#######################################################################################
                              # Main program #
#######################################################################################

movies = {
    Memento: 3,
    Primer: 4,
    Ishtar: 1
}

shouldContinue = true

until !shouldContinue

  choice = startProgram

  case choice

  when 'a'
    puts 'Dodawanie filmu do listy.'
    movies = add(movies)

  when 'b'
    puts 'Wszystkie tytuły filmów z listy: '
    listFilms(movies)

  when 'c'
    puts 'Zmiana oceny filmu.'
    movies = update_delete(movies,'c')

  when 'd'
    puts 'Usuwanie filmu z listy.'
    movies = update_delete(movies,'d')

  when 'e'
    shouldContinue = false

  else
  puts 'Nie rozumiem, co mam zrobić.'
  end

end

