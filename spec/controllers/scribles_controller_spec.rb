require 'spec_helper'

describe ScriblesController do
  render_views
  
  describe "GET show" do
    
    let(:scrible) {Factory :scrible}
    
    before do
      branch = Factory.build(:branch, :scrible => nil)
      comment = Factory.build(:comment, :scrible => nil)
      poll = Factory.build(:poll, :scrible  => nil)
      scrible.branches << branch << branch.clone
      scrible.comments << comment << comment.clone
      scrible.polls << poll << poll.clone
      scrible.tag_list = "how, cool, is, this"
      scrible.save
      get :show, :id => scrible.id
    end
    
    
    it "should display the show page for the scrible" do
      response.status.should == 200
    end
    
    it "should display the question" do
      question = scrible.question
      assigns(:scrible).should == scrible
      response.status.should == 200
      response.body.should match(/#{question}/)   
    end
    
    it "should display the graph" do
      
    end
    
    it "should display the comments and branches" do
      assigns(:branches).should == 2
      assigns(:comments).should == 2
      response.body.should match(/comments : 2/)
      response.body.should match(/branches : 2/)  
    end
    
    it "should display the poll" do
      polls = scrible.polls
      assigns(:polls).should == polls
      response.body.should match(/polls : 2/)
      response.should be_success
    end
    
    it "should display the tags" do
      scrible.tags.count.should == 4
      puts response.body
      response.body.should match(/#{scrible.tags}/)
    end
    
    it "should display the summary" do
      
    end
    
    it "should display similar scribles" do
      
    end
    
  end

end
