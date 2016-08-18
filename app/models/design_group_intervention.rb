class DesignGroupIntervention < StudyRelationship
  extend FastCount
  belongs_to :intervention, inverse_of: :design_group_interventions, autosave: true
  belongs_to :design_group, inverse_of: :design_group_interventions, autosave: true

  def self.create_all_from(opts)
    return [] if opts[:group_titles].empty?
    col=[]
    opts[:group_titles].collect{|group_title|
      group=opts[:design_groups].select{|g|g.title==group_title.text}.first
      col << new({:intervention=>opts[:intervention],:design_group=>group}) if group
    }
   col.compact
  end

end
