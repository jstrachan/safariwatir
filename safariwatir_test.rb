require 'rubygems'
require 'safariwatir'

#browser = Watir::Safari.new
browser = Watir::WebKit.new

def browser.div_test
  dir = FileUtils.pwd
  goto("file://#{dir}/tests/nested_frame.html")

  d = div(:id, "topDiv")
  text = d.text
  puts "Found div text #{text}"
  
  d.text = "New DIV TEXT!"
  text = d.text
  puts "Updated div text #{text}"
end

def browser.nested_iframe_test
  f = text_field(:id, "outerTextArea")
  puts "============= outer textarea text: #{f.getContents}"
  #f.set("this is some new text!")


  i = nested_iframe("myIFrame")

  f = i.text_field(:id, "nestedTextArea")
  puts "============= inner textarea text: #{f.getContents}"
  f.set("this is some new text!")


  b = i.body(:id, "nestedBody")
  
  puts "Found body: #{b}"
  puts "body text: #{b.text}"
  puts "body html: #{b.html}"  

end

begin
  browser.div_test
  browser.nested_iframe_test
end
