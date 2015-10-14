require 'httparty'

class Siskel
  attr_reader :title, :rating, :year, :plot

  def initialize(title, opts = {})
    year = opts[:year]
    plot_type = opts[:plot]

    movie = HTTParty.get(
      "http://www.omdbapi.com/?t=#{title}&y=#{year}&plot=#{plot_type}&tomatoes=true").parsed_response

    @tomato_meter = movie["tomatoMeter"].to_f

    #{"Title"=>"The Hangover", "Year"=>"2009", "Rated"=>"R", "Released"=>"05 Jun 2009", "Runtime"=>"100 min", "Genre"=>"Comedy", "Director"=>"Todd Phillips", "Writer"=>"Jon Lucas, Scott Moore", "Actors"=>"Bradley Cooper, Ed Helms, Zach Galifianakis, Justin Bartha", "Plot"=>"Three buddies wake up from a bachelor party in Las Vegas, with no memory of the previous night and the bachelor missing. They make their way around the city in order to find their friend before his wedding.", "Language"=>"English", "Country"=>"USA, Germany", "Awards"=>"Won 1 Golden Globe. Another 10 wins & 25 nominations.", "Poster"=>"http://ia.media-imdb.com/images/M/MV5BMTU1MDA1MTYwMF5BMl5BanBnXkFtZTcwMDcxMzA1Mg@@._V1_SX300.jpg", "Metascore"=>"73", "imdbRating"=>"7.8", "imdbVotes"=>"541,254", "imdbID"=>"tt1119646", "Type"=>"movie", "Response"=>"True"}
    @rating = movie["Rated"]
    @year = movie["Year"]
    @plot = movie["Plot"]

    # {"Response"=>"False", "Error"=>"Movie not found!"}
    @title = movie['Title'] || movie['Error']

    #{"Title"=>"Daredevil", "Year"=>"2003", "Rated"=>"PG-13", "Released"=>"14 Feb 2003", "Runtime"=>"103 min", "Genre"=>"Action, Crime, Fantasy", "Director"=>"Mark Steven Johnson", "Writer"=>"Mark Steven Johnson (screenplay)", "Actors"=>"Ben Affleck, Jennifer Garner, Colin Farrell, Michael Clarke Duncan", "Plot"=>"A man blinded by toxic waste which also enhanced his remaining senses fights crime as an acrobatic martial arts superhero.", "Language"=>"English, Greek, Italian", "Country"=>"USA", "Awards"=>"4 wins & 16 nominations.", "Poster"=>"http://ia.media-imdb.com/images/M/MV5BMzU3MDUxNjYwNl5BMl5BanBnXkFtZTYwNzQ3Nzc2._V1_SX300.jpg", "Metascore"=>"42", "imdbRating"=>"5.3", "imdbVotes"=>"163,824", "imdbID"=>"tt0287978", "Type"=>"movie", "tomatoMeter"=>"44", "tomatoImage"=>"rotten", "tomatoRating"=>"5.2", "tomatoReviews"=>"221", "tomatoFresh"=>"98", "tomatoRotten"=>"123", "tomatoConsensus"=>"While Ben Affleck fits the role and the story is sporadically interesting, Daredevil is ultimately a dull, brooding origin story that fails to bring anything new to the genre.", "tomatoUserMeter"=>"35", "tomatoUserRating"=>"2.8", "tomatoUserReviews"=>"467245", "DVD"=>"29 Jul 2003", "BoxOffice"=>"$102.5M", "Production"=>"20th Century Fox", "Website"=>"http://www.daredevilmovie.com", "Response"=>"True"}
    #{"Title"=>"The Fifth Element", "Year"=>"1997", "Rated"=>"PG-13", "Released"=>"09 May 1997", "Runtime"=>"126 min", "Genre"=>"Action, Adventure, Romance", "Director"=>"Luc Besson", "Writer"=>"Luc Besson (story), Luc Besson (screenplay), Robert Mark Kamen (screenplay)", "Actors"=>"Bruce Willis, Gary Oldman, Ian Holm, Milla Jovovich", "Plot"=>"In the colorful future, a cab driver unwittingly becomes the central figure in the search for a legendary cosmic weapon to keep Evil and Mr Zorg at bay.", "Language"=>"English, Swedish, German", "Country"=>"France", "Awards"=>"Nominated for 1 Oscar. Another 9 wins & 32 nominations.", "Poster"=>"http://ia.media-imdb.com/images/M/MV5BMTkzOTkwNTI4N15BMl5BanBnXkFtZTYwMDIzNzI5._V1_SX300.jpg", "Metascore"=>"52", "imdbRating"=>"7.6", "imdbVotes"=>"314,964", "imdbID"=>"tt0119116", "Type"=>"movie", "tomatoMeter"=>"71", "tomatoImage"=>"fresh", "tomatoRating"=>"6.3", "tomatoReviews"=>"58", "tomatoFresh"=>"41", "tomatoRotten"=>"17", "tomatoConsensus"=>"Visually inventive and gleefully over the top, Luc Besson's The Fifth Element is a fantastic piece of pop sci-fi that never takes itself too seriously.", "tomatoUserMeter"=>"87", "tomatoUserRating"=>"3.7", "tomatoUserReviews"=>"584929", "DVD"=>"09 Dec 1997", "BoxOffice"=>"N/A", "Production"=>"Sony Pictures Home Entertainment", "Website"=>"N/A", "Response"=>"True"}
  end

  def consensus
    if @tomato_meter >= 0 and @tomato_meter <= 50
      "Thumbs Down"
    else
      "Thumbs Up"
    end
  end
end