$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Survey'

  app.files.unshift(Dir.glob("./lib/**/*.rb"))

  app.info_plist['UIMainStoryboardFile'] = 'MainStoryboard'

  app.icons << "Survey_Icon_WEB.png"
end
