require 'spec_helper'


RSpec.describe ProfilesController do
  describe "GET index" do
    it "displays a list of profiles" do
      profile = create(:profile)

      get :index

      expect(assigns(:profiles)).to eq([profile])
    end

    it "renders the index template" do
      get :index

      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "displays a profile" do
      profile = create(:profile)

      get :show, id: profile

      expect(assigns(:profile)).to eq(profile)
    end

    it "renders the show template" do
      get :show, id: create(:profile)

      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    it "assigns a new profile to @profile" do
      sign_in_user

      get :new

      expect(assigns(:profile)).to be_a_new(Profile)
    end

    it "renders the index template" do
      sign_in_user

      get :new

      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new profile" do
        sign_in_user

        expect{
          post :create, profile: attributes_for(:profile)
        }.to change(Profile, :count).by(1)
      end

      it "sets the flash message" do
        sign_in_user

        post :create, profile: attributes_for(:profile)

        expect(flash[:notice]).to eq "Profile Saved"
      end

      it "redirects to the profiles path" do
        sign_in_user

        post :create, profile: attributes_for(:profile)

        expect(response).to redirect_to profiles_path
      end
    end

    context "with invalid attributes" do
      it "sets the flash message" do
        sign_in_user

        post :create, profile: attributes_for(:profile, first_name: "")

        expect(flash[:error]).to eq "Error Saving Profile"
      end

      it "renders the new action" do
        sign_in_user

        post :create, profile: attributes_for(:profile, first_name: "")

        expect(response).to render_template :new
      end
    end

    describe "GET edit" do
      it "gets the current user's profile" do
        sign_in_user_with_profile

        get :edit, id: @profile

        expect(assigns(:profile)).to eq(@profile)
      end
    end

    describe "PUT update" do
      context "with valid attributes" do
        it "gets the current users's profile" do
          sign_in_user_with_profile

          put :update, id: @profile, profile: attributes_for(:profile)

          expect(assigns(:profile)).to eq(@profile)
        end

        it "updates the profile record" do
          sign_in_user_with_profile

          put :update, id: @profile, profile: attributes_for(:profile, first_name: "New Name")

          @profile.reload
          expect(@profile.first_name).to eq "New Name"
        end

        it "redirects to the profiles path" do
          sign_in_user_with_profile

          put :update, id: @profile, profile: attributes_for(:profile, first_name: "New Name")

          expect(response).to redirect_to profiles_path
        end
      end

      context "with invalid attributes" do
        it "sets the flash message" do
          sign_in_user_with_profile

          put :update, id: @profile, profile: attributes_for(:profile, first_name: "")

          expect(flash[:error]).to eq "Error Saving Profile"
        end

        it "renders the edit action" do
          sign_in_user_with_profile

          put :update, id: @profile, profile: attributes_for(:profile, first_name: "")

          expect(response).to render_template :edit
        end
      end
    end

    describe "DELETE destroy" do
      it "deletes the profile" do
        sign_in_user_with_profile

        expect{
          delete :destroy, id: @profile
        }.to change(Profile, :count).by(-1)
      end

      it "sets the flash message" do
        sign_in_user_with_profile

        delete :destroy, id: @profile

        expect(flash[:notice]).to eq "Profile Removed"
      end

      it "sets the flash message" do
        sign_in_user_with_profile

        delete :destroy, id: @profile

        expect(response).to redirect_to profiles_path
      end
    end
  end

  private

  def sign_in_user
    @user = create(:user)
    sign_in :user, @user
  end

  def sign_in_user_with_profile
    @profile = create(:profile)
    @user = @profile.user
    sign_in :user, @user
  end
end
