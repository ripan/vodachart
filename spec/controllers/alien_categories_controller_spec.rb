require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AlienCategoriesController do

  # This should return the minimal set of attributes required to create a valid
  # AlienCategory. As you add validations to AlienCategory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AlienCategoriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all alien_categories as @alien_categories" do
      alien_category = AlienCategory.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:alien_categories)).to eq([alien_category])
    end
  end

  describe "GET show" do
    it "assigns the requested alien_category as @alien_category" do
      alien_category = AlienCategory.create! valid_attributes
      get :show, {:id => alien_category.to_param}, valid_session
      expect(assigns(:alien_category)).to eq(alien_category)
    end
  end

  describe "GET new" do
    it "assigns a new alien_category as @alien_category" do
      get :new, {}, valid_session
      expect(assigns(:alien_category)).to be_a_new(AlienCategory)
    end
  end

  describe "GET edit" do
    it "assigns the requested alien_category as @alien_category" do
      alien_category = AlienCategory.create! valid_attributes
      get :edit, {:id => alien_category.to_param}, valid_session
      expect(assigns(:alien_category)).to eq(alien_category)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AlienCategory" do
        expect {
          post :create, {:alien_category => valid_attributes}, valid_session
        }.to change(AlienCategory, :count).by(1)
      end

      it "assigns a newly created alien_category as @alien_category" do
        post :create, {:alien_category => valid_attributes}, valid_session
        expect(assigns(:alien_category)).to be_a(AlienCategory)
        expect(assigns(:alien_category)).to be_persisted
      end

      it "redirects to the created alien_category" do
        post :create, {:alien_category => valid_attributes}, valid_session
        expect(response).to redirect_to(AlienCategory.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved alien_category as @alien_category" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(AlienCategory).to receive(:save).and_return(false)
        post :create, {:alien_category => { "name" => "invalid value" }}, valid_session
        expect(assigns(:alien_category)).to be_a_new(AlienCategory)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(AlienCategory).to receive(:save).and_return(false)
        post :create, {:alien_category => { "name" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested alien_category" do
        alien_category = AlienCategory.create! valid_attributes
        # Assuming there are no other alien_categories in the database, this
        # specifies that the AlienCategory created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(AlienCategory).to receive(:update).with({ "name" => "MyString" })
        put :update, {:id => alien_category.to_param, :alien_category => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested alien_category as @alien_category" do
        alien_category = AlienCategory.create! valid_attributes
        put :update, {:id => alien_category.to_param, :alien_category => valid_attributes}, valid_session
        expect(assigns(:alien_category)).to eq(alien_category)
      end

      it "redirects to the alien_category" do
        alien_category = AlienCategory.create! valid_attributes
        put :update, {:id => alien_category.to_param, :alien_category => valid_attributes}, valid_session
        expect(response).to redirect_to(alien_category)
      end
    end

    describe "with invalid params" do
      it "assigns the alien_category as @alien_category" do
        alien_category = AlienCategory.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(AlienCategory).to receive(:save).and_return(false)
        put :update, {:id => alien_category.to_param, :alien_category => { "name" => "invalid value" }}, valid_session
        expect(assigns(:alien_category)).to eq(alien_category)
      end

      it "re-renders the 'edit' template" do
        alien_category = AlienCategory.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(AlienCategory).to receive(:save).and_return(false)
        put :update, {:id => alien_category.to_param, :alien_category => { "name" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested alien_category" do
      alien_category = AlienCategory.create! valid_attributes
      expect {
        delete :destroy, {:id => alien_category.to_param}, valid_session
      }.to change(AlienCategory, :count).by(-1)
    end

    it "redirects to the alien_categories list" do
      alien_category = AlienCategory.create! valid_attributes
      delete :destroy, {:id => alien_category.to_param}, valid_session
      expect(response).to redirect_to(alien_categories_url)
    end
  end

end