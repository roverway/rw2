# Load the rails application
require File.expand_path('../application', __FILE__)

CATEGORIES=["Linux", "ROR", "Archlinux", "life", "other"]
Tag.destroy_unused = true

# Initialize the rails application
Rw::Application.initialize!
