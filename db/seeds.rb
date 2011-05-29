# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

  scrible = Scrible.create!(:question => "how are you?")
  
  branch1 = Branch.create!(:content => "first branch", 
                           :scrible_id => scrible.id )
  
  branch2 = Branch.create!(:content => "second branch", 
                         :scrible_id => scrible.id )
  
  comment1 = Comment.create!(:content => "first comment", 
                           :scrible_id => scrible.id )
  
  comment2 = Comment.create!(:content => "second comment", 
                           :scrible_id => scrible.id )    
                       