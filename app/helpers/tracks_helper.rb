module TracksHelper

  def ugly_lyrics(lyrics)
    lines = lyrics.chomp.split("\n")
    ugly_lines = lines.map{ |line| ("&#9835; " + line) }
    lyrics = ugly_lines.join("\n")
    lyrics = "<pre>#{(lyrics)}</pre>"
    lyrics.html_safe
  end


end