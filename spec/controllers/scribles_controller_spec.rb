require 'spec_helper'

describe ScriblesController do
  render_views

  describe "GET show" do

    let(:tags) { @tags = []
      4.times { @tags << Faker::Name.name}
      @tags.join(",")
    }
    5.times { |n| let("scrible#{n+1}".to_sym) {Factory :scrible} }

    before do
      branch = Factory.build(:branch, :scrible => nil)
      comment = Factory.build(:comment, :scrible => nil)
      poll = Factory.build(:poll, :scrible  => nil)
      poll_option = Factory.build(:poll_option, :poll => nil)
      poll.poll_options << poll_option << poll_option.clone
      scrible1.branches << branch << branch.clone
      scrible1.comments << comment << comment.clone
      scrible1.polls << poll << poll.clone
      scrible1.tag_list = tags
      scrible1.save

      scrible2.tag_list = tags;scrible2.save
      scrible3.tag_list = tags;scrible3.save

      get :show, :id => scrible1.id
    end


    it "should display the show page for the scrible" do
      response.status.should == 200
    end

    it "should display the question" do
      question = scrible1.question
      assigns(:scrible).should == scrible1
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



    context "poll functionality" do

      it "should display the poll question" do
        polls = scrible1.polls
        assigns(:polls).should == polls
        response.body.should match(/polls : 2/)
        response.should be_success
      end

      it "should display the poll options" do
        assigns(:poll_options).count.should == 2
      end

    end



    it "should display the tags" do
      scrible1.tags.count.should == 4
      puts response.body
      response.body.should match(/#{scrible1.tags}/)
    end

    it "should display the summary" do

    end

    it "should display similar scribles" do
      related_scribles = scrible1.find_related_tags
      related_scribles.should include(scrible2,scrible3)
      response.body.should match(/#{scrible2.question}/)
      response.body.should match(/#{scrible3.question}/)
    end

  end

end
