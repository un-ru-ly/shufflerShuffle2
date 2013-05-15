class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

   def shufflerCallback

      # The user gave use permission
      if params["success"] == 'true'

         # Check if user with this shufflerId already exists.
         @user = User.find_or_create_by_name User.find_by_shufflerId(params[:user])

         resource = Addressable::URI.parse("https://shuffler.fm/authorizations/token")
         resource.query_values = {'app-key' => "63rm78kb8c", "app-secret" => "76zlto5v3ort2vm7drzjqz8foh2fpfnvym56lu9ay", "code" => params["code"] }

         response = RestClient.post(resource)

         if response.code == 200
            data = JSON.parse(response.to_str)

            # Here we simulate a login by saving the token to the session
            session[:access_token] = data['access_token']
            redirect '/users/#{@user.id]}/tracks/'

         else

            flash[:alert] = "Unable to fetch access token from shuffler.fm"

         end
         
      else

           flash[:alert] = "No success parameter was passed"
           flash.keep(:notice)

      end
   
   end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    
    #Creating users manually is not allowed
    format.html { render action: "new" }
    format.json { render json: @user.errors, status: :unprocessable_entity }
  
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
