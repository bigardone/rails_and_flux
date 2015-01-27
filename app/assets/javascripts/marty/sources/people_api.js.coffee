@PeopleAPI = Marty.createStateSource
  type: 'http'

  findPeople: (pageNumber, searchText) ->
    req =
      url: Routes.people_path(
        page: pageNumber
        search: searchText
      )

    NProgress.start()

    @get(req).then (res) ->
      NProgress.done()
      PeopleSourceActionCreators.receivePeople res.body
