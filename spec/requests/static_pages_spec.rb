require 'rails_helper'

describe "Static pages" do

  # describe "Home page" do

  #   it "should have the content 'Mini Twitter'" do
  #     visit root_path
  #     expect(page).to have_content('Mini Twitter')
  #   end 
    
  #   it "should have the base title" do
  #     visit root_path
  #     expect(page).to have_title("Ruby on Rails Mini Twitter App")
  #   end

  #   it "should not have a custom page title" do
  #     visit root_path
  #     expect(page).not_to have_title('| Home')
  #   end

  # end

  subject {page}

  describe "Home page" do

    before { visit root_path}

    it { should have_content('Mini Twitter') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end
      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end 
      
    end
  end

  # describe "Help page" do

  #   it "should have the content 'Help'" do
  #     visit help_path
  #     expect(page).to have_content('Help')
	 #  end

  #   it "should have the right title" do
  #     visit help_path
  #     expect(page).to have_title("Help")
  #   end

  # end

  describe "Help page" do

    before { visit help_path}

    it { should have_content('Help') }
    it { should have_title(full_title('Help'))}
  end

  # describe "About page" do

  #   it "should have the content 'About'" do
  #     visit about_path
  #     expect(page).to have_content('About Us')
  #   end

  #   it "should have the right title" do
  #     visit about_path
  #     expect(page).to have_title("About Us")
  #   end

  # end

  describe "About page" do

    before { visit about_path}

    it { should have_content('About Us') }
    it { should have_title(full_title('About Us')) }
  end



  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title("Ruby on Rails Mini Twitter App | Contact")
    end

  end

end
