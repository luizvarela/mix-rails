class Admix::BoardMessagesController < Admix::InheritedController

  def approve
    resource.approved = :approved
    resource.save!
    flash[:notice] = t('boardmessages.flashes.approved')
    redirect_to collection_url
  end

  def disapprove
    resource.approved = :disapproved
    resource.save!
    flash[:notice] = t('boardmessages.flashes.disapproved')
    redirect_to collection_url
  end

end