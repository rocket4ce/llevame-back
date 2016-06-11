class Api::V1::SessionsController < Api::V1::ApplicationController
  # login
  def create
    # :id, :nombre, :apellido, :apodo, :token
    @user = User.find_by_apodo(params[:apodo])
    if @user && @user.authenticate(params[:password])
      render json: {
          id: @user.id,
          nombre: @user.name,
          token: @user.token
        }
    else
      render json: {menssage: "Tu mail o contraseña no coinciden"}
    end
  end

end
