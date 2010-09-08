module ApplicationHelper
  def position_menu
    positions=['QB', 'RB', 'WR', 'TE', 'K', 'DEF']
    pos_menu=""
    positions.each do |position| 
      pos_menu+=" | " unless pos_menu.blank?
      pos_menu+=link_to position, players_path(:position => position)
    end
    pos_menu=link_to("Draftboard", root_path) + " | " + raw(pos_menu)
    raw(pos_menu)
  end
end
