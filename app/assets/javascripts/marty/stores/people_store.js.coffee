    @PeopleStore = Marty.createStore
      displayName: 'PeopleStore'

      getInitialState: ->
        meta:
          total_pages: 0
          current_page: 0
        pageToFetch: 0

      handlers:
        receivePeople: PeopleConstants.RECEIVE_PEOPLE
        findPeople: PeopleConstants.FIND_PEOPLE

      findPeople: (pageNumber, searchText) ->
        if pageNumber? then @state.pageToFetch = pageNumber

        @.fetch
          id: 'all-people'
          locally: () ->
            @state.people if @state.pageToFetch == @state.meta.current_page
          remotely: () ->
            PeopleAPI.findPeople(pageNumber, searchText)

      paginationMeta: ->
        @state.meta

      receivePeople: (response) ->
        @setState
          people: response.people
          meta: response.meta
          pageToFetch: response.meta.current_page

