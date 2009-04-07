require 'test/unit'
require 'admin_update_team_scores'



class TestUpdateEoM < Test::Unit::TestCase
  
  def setup
    @eom = EomRefresh.new(13)
  end
  
  def test_fullsquad_entrantids
    @eom.fullsquad_entrantids
    @dbh.close if @dbh
  end
  
  def test_fullsquads_grab
    fs_result = @eom.fullsquads_grab(@eom.fullsquad_entrantids)
    # fs_result.each do |record|
    #   puts "#{record.entrantid} #{record.teamselectedid} #{record.lname},#{record.fname}"
    # end
    #puts "#{fs_result[0]} #{fs_result[0]} #{fs_result[0]}"
    @dbh.close if @dbh
  end
  
  def test_sum_handicaps
    mark_hcp = @eom.sum_handicaps(1)
    puts "mark's handicap is: #{mark_hcp}"
    dad_hcp = @eom.sum_handicaps(62)
    puts "dad's handicap is: #{dad_hcp}"
    eye_hcp = @eom.sum_handicaps(23)
    puts "eye's handicap is: #{eye_hcp}"
    @dbh.close if @dbh
  end
  
  def test_team_gross
    mark_gross = @eom.team_gross(1)
    puts "#{mark_gross}"
    @dbh.close if @dbh
  end
  
  def test_team_net
    mark_net = @eom.team_net(1) #gross + handicaps
    puts "Mark's NET is: #{mark_net}"
    @dbh.close if @dbh
  end
  
  def test_update_latest_score
    net = @eom.team_net(1)
    return_code = @eom.update_latest_score(1, net) #(entrantid, latest_score)
    puts "the return_code was: #{return_code}"
  end 
  
end
