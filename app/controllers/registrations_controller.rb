class RegistrationsController < Devise::RegistrationsController

 protected

 def create
   set_flash_message :notice, :"message here" if is_flashing_format?
   session[:user_return_to] = root_path
   super
 end

 def update
   set_flash_message :notice, :"message here" if is_flashing_format?
   session[:user_return_to] = root_path
   super
 end
end
