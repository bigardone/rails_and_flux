@PeopleAPI = Marty.createStateSource
  type: 'http'

  findPeople: (pageNumber, searchText) ->
    req =
      url: Routes.people_path(
        page: pageNumber
        search: searchText
      )

    @get(req).then (res) ->
      PeopleSourceActionCreators.receivePeople res.body
