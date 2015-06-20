module.exports = Marty.createStateSource
  id: 'PeopleAPI'
  type: 'http'

  findPeople: (pageNumber, searchText) ->
    url = Routes.api_v1_people_path
      page: pageNumber
      search: searchText

    @get(url).then (res) ->
      if res.ok then return res.json()

      throw new Error('Error while finding people', res)
