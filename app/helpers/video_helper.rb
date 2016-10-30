module VideoHelper
	def parse_video_url(url)
    @url = url

    youtube_formats = [
        %r(https?://youtu\.be/(.+)),
        %r(https?://www\.youtube\.com/watch\?v=(.*?)(&|#|$)),
        %r(https?://www\.youtube\.com/embed/(.*?)(\?|$)),
        %r(https?://www\.youtube\.com/v/(.*?)(#|\?|$)),
        %r(https?://www\.youtube\.com/user/.*?#\w/\w/\w/\w/(.+)\b)
      ]

    vimeo_formats = [%r(https?://vimeo.com\/(\d+)), %r(https?:\/\/(www\.)?vimeo.com\/(\d+))]  

    @url.strip!

    if @url.include? "youtu"
      youtube_formats.find { |format| @url =~ format } and $1
      @results = {provider: "youtube", id: $1, url: "https://www.youtube.com/embed/#{$1}?rel=0"}
      @results
    elsif @url.include? "vimeo"  
      vimeo_formats.find { |format| @url =~ format } and $1
      @results = {provider: "vimeo", id: $1, url: "https://player.vimeo.com/video/#{$1}?color=f1592a&badge=0"}
      @results
    else
      return nil # There should probably be some error message here
    end  
  end
end
