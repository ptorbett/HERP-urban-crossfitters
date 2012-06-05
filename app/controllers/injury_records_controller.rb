class InjuryRecordsController < ApplicationController
#display list of all injuries
  def index
    @injury_records = current_user.injury_records
    if current_user.profile
      @name = current_user.profile.first_name
    else
      @name = current_user.username
    end
      @title = "Recorded injuries for #{@name}"
  end

  def new
    @title = 'Add an injury'
    @injury = InjuryRecord.new
  end

  #create a new injury record
  def create
    if params[:injury_record][:ongoing]
      params[:injury_record].delete 'end_date(1i)'
      params[:injury_record].delete 'end_date(2i)'
      params[:injury_record].delete 'end_date(3i)'
      params[:injury_record][:end_date] = nil
    end
    @injury = InjuryRecord.new params[:injury_record]
    if @injury.save
      current_user.injury_records << @injury
      current_user.events << @injury.event
      redirect_to :action => 'show', :id => @injury.id
    else
      flash[:error] = 'There was a problem saving your new injury.'
      flash[:errors] = @injury.errors
      redirect_to :action => 'new'
      return
    end
  end

  # display a specific injury
  def show
    @injury = InjuryRecord.find_by_id params[:id]
    @title = "Injury #{@injury.name}"
  end

	def edit
		@injury = InjuryRecord.find_by_id params[:id]
		@title = "Editing injury #{@injury.name}"
	end

  # update a specific injury
  def update
    @injury = InjuryRecord.find_by_id params[:id]
    
    if params[:injury_record][:ongoing]
      params[:injury_record].delete 'end_date(1i)'
      params[:injury_record].delete 'end_date(2i)'
      params[:injury_record].delete 'end_date(3i)'
      if @injury.end_date
        params[:injury_record][:end_date] = nil
      end
    else
      params[:injury_record][:ongoing] = false
    end
    if @injury.update_attributes params[:injury_record]
      redirect_to :action => 'show', :id => @injury.id
    else
      flash[:error] = 'Could not save changes to the injury.'
      redirect_to :action => 'edit', :id => params[:id]
    end
  end

	# delete a specific injury
	def destroy
		@injury = current_user.injury_records.lookup_by_params[:id]
		@record.destroy
	end
end
