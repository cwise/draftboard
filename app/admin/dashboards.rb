ActiveAdmin::Dashboards.build do
  section "Draft Control" do
    div do
      para link_to('Reset Draft', reset_draft_picks_path, :method => :delete, :confirm => 'Are you sure you want to clear the entire draft?', :class => 'button')
      para link_to('Delete Last Pick', delete_last_draft_picks_path, :method => :delete, :confirm => 'Are you sure you want to delete the last pick?', :class => 'button')
      para link_to('Make Picks', new_draft_pick_path, :class => 'button')
      para link_to('Open Draftboard', draft_picks_path, :target => '_blank', :class => 'button')
    end    
  end

  section "Poolies" do
    table do
      tr do
        th 'Name'
        th 'Team Name'
      end
      Poolie.draft_order.collect do |poolie|
        tr do
          td poolie.name
          td poolie.team_name
        end
      end
    end
  end
  
  section "This Round" do
    table do
      tr do
        th 'Team Name'
        th 'Player'
      end
      DraftPick.round(DraftPick.current_round).collect do |dp|
        tr do
          td dp.poolie.name
          td dp.player.full_name
        end
      end
    end
  end  
end
