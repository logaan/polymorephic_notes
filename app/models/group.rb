require "rubygems"
require "httparty"
require "ostruct"

class Group < OpenStruct

  # Class setup
  include HTTParty 
  base_uri 'http://group-tree.local'

  # Class methods
  def self.find( id )
    find_one( "/groups/#{id}.json" )
  end

  def self.find_roots
    find_many( "/groups.json" )
  end

  def self.find_child_groups( id )
    find_many( "/groups/#{id}/groups.json" )
  end

  # Instance methods
  def []( key )
    @table[key]
  end

  def child_groups
    self.class.find_child_groups( self[:id] )
  end

 protected
  
  def self.find_one( url )
    self.new( get( url )["group"] )
  end

  def self.find_many( url )
    get( url )["groups"].map{ |group| self.new( group ) }
  end

end

# puts Group.find( 17 ).inspect
#   # => #<Group id=17, parent_id=nil, membership_ids=[6], name="Production">
# 
# puts Group.find_roots.inspect
#   # => [#<Group id=17, parent_id=nil, membership_ids=[6], name="Production">]
# 
# puts Group.find_child_groups( 17 ).inspect
#   # => [#<Group name="child", membership_ids=[], parent_id=17, id=18>]
# 
# puts Group.find( 17 ).child_groups.inspect
#   # => [#<Group membership_ids=[], parent_id=17, name="child", id=18>]

