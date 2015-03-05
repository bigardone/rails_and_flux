@PeopleActionCreators = Marty.createActionCreators
  findPeople: PeopleConstants.FIND_PEOPLE (pageNumber, searchText)->
    PeopleAPI.findPeople(pageNumber, searchText)
