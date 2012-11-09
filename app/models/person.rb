class Person < ActiveRecord::Base
  has_many :role_assignments, :dependent => :destroy
	has_many :roles, :through => :role_assignments
  has_many :section_assignments, :dependent => :destroy
  has_many :sections, :through => :section_assignments
  has_many :admin_assignments, :dependent => :destroy
  has_many :schools, :through => :admin_assignments
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :validatable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :authentication_keys => [:id_number]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :id_number, :first_name, :roles_assignments, :roles, :role_ids
  accepts_nested_attributes_for :roles

  belongs_to :suspected_person, :class_name => "Person"

  validates :first_name, :presence => true
  validates :id_number, :presence => true

  has_paper_trail


  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
	end

  def school?(school)
    return !!self.schools.find_by_name(school)
  end

  def email_required?
    false
  end

  def sections
    if self.role? :super_admin
      Section.all
    elsif self.role? :school_admin
      Section.where(:school_id => current_person.schools)
    elsif self.role? :teacher
      Section.where(:teacher_id => self.id)
    else
      []
    end
  end

  def self.all_by_role(role)
    people = []
    Person.all.each { |person| people << person if person.role? role}
    return people
  end

  def ratings (query)
    lists = SearchList.where(:person_id=>self.id)
    list_ids = lists.collect{|x| x.id}
    items = SearchItem.where(:search_list_id => list_ids, :query=>query)
    item_ids = items.collect{|x| x.id}
    ratings = Rating.where(:search_item_id => item_ids)
    return ratings
  end

  def ratingsHash(query)
    ratingsHash = Hash.new
    return Person.toRatingsHash(self.ratings(query))
  end

  def vennRatings (query)
    ups = []
    downs = []
    self.ratings(query).each do |rating|
      if rating.rating_value.name == "up"
        ups.push rating
      else
        downs.push rating
      end
    end
    return Hash["up"=>ups, "down"=>downs]
  end

  def audienceRatings (query="")
    searches = SearchList.where(:person_id=>self.classmates)
    search_ids = searches.collect{|x| x.id}
    if query.length > 0
      items = SearchItem.where(:search_list_id => search_ids, :query=>query)
    else
      items = SearchItem.where(:search_list_id => search_ids)
    end
    item_ids = items.collect{|x| x.id}
    ratings = Rating.where(:search_item_id=>item_ids)
    return Person.audienceHash(ratings)
    
  end

  def audienceForAllQueries
    audienceRatings = Hash.new

    # searches = SearchList.where(:person_id=>self.classmates)
    # search_ids = searches.collect{|x| x.id}
    # items = SearchItem.where(:search_list_id => search_ids)
    # item_ids = items.collect{|x| x.id}

    sql = "
      select search_items.query as query, rating_values.name as rv
      from search_lists
      join search_items on search_items.search_list_id = search_lists.id
      join ratings on search_items.id = ratings.search_item_id
      join rating_values on ratings.rating_value_id = rating_values.id
      where search_lists.person_id in #{self.classmates}
    ".gsub(/\[/,"(").gsub(/\]/,")")

    results = ActiveRecord::Base.connection.execute(sql).to_a

    results.each do |result|
      if not audienceRatings[result["query"]]
        audienceRatings[result["query"]] = Hash.new
        audienceRatings[result["query"]]["up"] = 0
        audienceRatings[result["query"]]["down"] = 0
      end
      audienceRatings[result["query"]][result["rv"]] += 1
    end
    
    # ratings = Rating.where(:search_item_id=>item_ids)
    return audienceRatings
  end

  def self.toRatingsHash (ratings)
    ratingsHash = Hash.new
    ratings.each do |rating|
      ratingsHash [rating.url] = rating.rating_value.name
    end
    return ratingsHash
  end

  def self.audienceHash (ratings)
    audienceHash = Hash.new
    ratings.each do |rating|
      if audienceHash [rating.url]
        if audienceHash [rating.url][rating.rating_value.name]
          audienceHash [rating.url][rating.rating_value.name] += 1
        else
          audienceHash [rating.url][rating.rating_value.name] = 1
        end

      else
        audienceHash [rating.url] = Hash.new
        audienceHash [rating.url]["up"] = 0
        audienceHash [rating.url]["down"] = 0
        audienceHash [rating.url][rating.rating_value.name] = 1
      end
      audienceHash [rating.url]["content"] = rating.result_content
    end
    logger.debug(audienceHash)
    return audienceHash
  end

  def classmates 
    s = SectionAssignment.where(:person_id=>self.id).first
    assignments = SectionAssignment.where(:section_id => s.section_id)
    classmates = assignments.collect{|x| x.id != self.id ? x.person_id : nil}.compact
    return classmates
  end

end
