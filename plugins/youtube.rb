# this plug-in has been modified to use the lazy-link technique:
#   - the 

require 'json'

class YouTube < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Syntax then
      @id = $1

      if $2.nil? then
          @width = 560
          @height = 315 
      else
          @width = $2.to_i
          @height = $3.to_i
      end
    else
      raise "No YouTube ID provided in the \"youtube\" tag"
    end
  end

  def render(context)
    # "<iframe width=\"#{@width}\" height=\"#{@height}\" src=\"http://www.youtube.com/embed/#{@id}\" frameborder=\"0\"allowfullscreen></iframe>"
    # "<iframe width=\"#{@width}\" height=\"#{@height}\" src=\"http://www.youtube.com/embed/#{@id}?color=white&theme=light\"></iframe>"
    # using lazy-you-tube 
    response = Net::HTTP.get_response("gdata.youtube.com","/feeds/api/videos/#{@id}?v=2&alt=jsonc")
    data = response.body
    result = JSON.parse(data)
    # if the hash has 'Error' as a key, we raise an error
    if result.has_key? 'Error'
        puts "web service error or invalid video id"
    end
    @title = result["data"]["title"]
    @description = result["data"]["description"]
    # puts " title #{@title}"
    # extract the title from the json string
    "<a class=\"youtube-lazy-link\" style=\"width:#{@width}px;height:#{@height}px;\" href=\"http://www.youtube.com/watch?v=#{@id}\">#{@title}</a>"+
    "<p>#{@description}</p>"
  end

  Liquid::Template.register_tag "youtube", self
end
