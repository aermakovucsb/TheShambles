module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_gamer
    
    def connect
      self.current_gamer = find_current_user
    end
    
    def disconnect
      
    end
    
    protected
    def find_current_user
      if current_gamer = Gamer.find_by(id: cookies.signed[:gamer_id])
        current_gamer
      else
        reject_unauthorized_connection
      end
    end
  end
end