# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  i = 0 
  new_data_array = []
  while i < movies_collection.size do
    movie_data = movies_collection[i]
    new_data_array[i] = movie_with_director_name(name, movie_data)
    i += 1 
  end
  return new_data_array
end


def gross_per_studio(collection)
  
  result = {}
  i = 0
 
  while i < collection.length do
    
    studio_name = collection[i][:studio]
    gross_per_movie = collection[i][:worldwide_gross]
    
    if !result[studio_name]
      result[studio_name] = gross_per_movie
    else
      result[studio_name] += gross_per_movie
    end
    i += 1
  end
 
  result
end

def movies_with_directors_set(source)
  i = 0 
  
  new_array = Array.new
  while i < source.size do
    name = source[i][:name]
    movies = source[i][:movies]
    y = 0 
    inner_array = Array.new
    while y < movies.length do
      
      new_hash_element = movie_with_director_name(name, movies[y])
      inner_array << new_hash_element
      y += 1
    end
    new_array << inner_array
    i += 1 
  end
  new_array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
