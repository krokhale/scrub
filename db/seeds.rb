# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

  def generate_tags
    @tags = []
    4.times { @tags << Faker::Name.name }
    @tags.join(",")
  end
  
  def tags(n)
    if (n%2).zero?
      return "hey, how, are, you"
    else
      return generate_tags
    end
  end
  
  10.times do |n|
    scrible = Scrible.create!(:question => Faker::Lorem.words(3).join(' ') + "?",
                               :tag_list => tags(n))
    
    3.times do
      Branch.create!(:content => "first branch", 
                               :scrible_id => scrible.id )
      Comment.create!(:content => "first comment", 
                                 :scrible_id => scrible.id )
      Poll.create!(:question => "first poll", 
                                 :scrible_id => scrible.id )
      end
  end
  
  
 