module Admix
  class DashboardController < Admix::AdmixController
    def index
      @pending_messages = BoardMessage.pending
    end
  end
end
