
#!/usr/bin/env ruby -w
#
#  Created by Mark Holton (holtonma@gmail.com) on 4/6/2008
#  Copyright (c) 2007. All rights reserved.
# Mark Holton
# to be run as a daemon when updating EoM scores 
# refreshes EoM Scoreboard

require 'mysql'
require 'ostruct'

class EomRefresh 
  
  def initialize(eventid)
    @eventid = eventid
  end
  
  def connect
    @dbh = Mysql.real_connect("65.36.177.230", "eyeon2", "pgachamp", "eyeon2")
  end
  
  def disconnect
    dbh.close if dbh #disconnect
  end
  
  def fullsquad_entrantids
    connect
    #output as a list
    #dbh = Mysql.real_connect("65.36.177.230", "eyeon2", "pgachamp", "eyeon2")
    squads = @dbh.query("
      SELECT DISTINCT tTS.entrantid from tteamselected tTS where tTS.golferid > 0
    ")
    list = ""
    squads.each do |row|
       list += " #{row[0]},"
    end
    list.chomp(',')
  end
  
  def fullsquads_grab(fullsquad_list)
    connect
    teams = @dbh.query("
      SELECT 
        tE.entrantid, tE.lname as entrantLastName, tE.fname as entrantFirstName,
        tEG.teamselectedid, tEG.finaltiebreakerscore as tiebreaker, tEG.latestteamnetscore as latest_teamnetscore
      FROM 
        tentrant tE 
        INNER JOIN tentrantgroup tEG ON tE.entrantid = tEG.entrantID
      WHERE 
        tEG.eventid = #{@eventid}
        AND
        tEG.teamselectedid > 0
        AND
        tEG.entrantid IN (#{fullsquad_list})  
    ")
    
    squads = []
    teams.each do |record|
      #puts "#{record[0]} #{record[1]} #{record[2]} #{record[3]} #{record[4]} #{record[5]} #{record[6]}"
      squad = OpenStruct.new #{}
      squad.entrantid = record[0]
      squad.teamselectedid = record[1]
      squad.fname = record[2]
      squad.lname = record[3]
      squads << squad
      squad = ""
    end
    squads
  end
  
  def sum_handicaps(entrantid)
    connect
    total_hcp_strokes = @dbh.query("
    SELECT SUM(tH.numstrokes) as totalhandicapstrokes
    FROM thandicaps tH INNER JOIN tteamselected tTS ON tH.golferid = tTS.golferid 
    WHERE 
      tTS.entrantID = #{entrantid}
      AND 
      tTS.eventid = #{@eventid}
      AND
      tH.eventid = #{@eventid}
    ")
    hcp = 0
    total_hcp_strokes.each do |rec|
      hcp = rec[0]
    end
    hcp
  end
  
  def team_gross(entrantid)
    connect
    # output gross score
    gross_strokes = @dbh.query("
    SELECT SUM(CurrentScoreRelPar) as TeamTotal
    FROM tgolfer tG, tteamselected tTS
    WHERE 
      tTS.golferid = tG.GolferID
      AND
      tTS.entrantID = #{entrantid}
      AND
      tTS.eventid = #{@eventid}
    ")
    gross = 0
    gross_strokes.each do |rec|
      hcp = rec[0]
    end
    gross
  end
  
  def team_net(entrantid)
    total = team_gross(entrantid).to_i + sum_handicaps(entrantid).to_i
    @dbh.close if @dbh
    total
  end
  
  def update_latest_score(entrantid, latest_score)
    connect
    update_score = @dbh.query("
      UPDATE tentrantgroup tEG
      SET latestteamnetscore = #{latest_score}
      WHERE entrantid = #{entrantid}
      AND eventid = #{@eventid}
    ")
    # should check for whether or not it got updated here:
    # check_score = @dbh.query("
    #   SELECT latestteamnetscore
    #   FROM tentrantgroup tEG
    #   WHERE entrantid = #{entrantid}
    #   AND eventid = #{@eventid}
    # ")
    # cs = 0
    # check_score.each do |rec|
    #   cs = rec[0]
    # end
    # @dbh.close if @dbh
    # if cs = latest_score
    #   return 1 
    # else
    #   return 0
    # end
    
  end
  
  def update_all_team_scores
  end
  
end


