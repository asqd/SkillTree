var SpecialtiesApp = React.createClass({
  getInitialState: function() {
    return {  specialties: [],
              specialtiesGroupList: [],
              directions: [],
              searchResults: [],
              query: "",
              currentGroup: "Бакалавриат"
    };
  },

  componentDidMount: function() {
    this.getSpecliatyGroupListFromApi();
  },

  getSpecliatyGroupListFromApi: function() {
    var self = this;
    $.ajax({
      url: '/api/specialties/group_list',
      success: function(data) {
        self.setState({ specialtiesGroupList: data });
        self.setDirections()

      },
      error: function(xhr, status, error) {
        console.log('Cannot get data from API: ', error);
      }
    });
  },

  changeGroup: function(name) {
    this.setState({ currentGroup: name })
    this.setState({ directions: this.state.specialtiesGroupList[name] })
  },

  setDirections: function() {
    this.setState({directions: this.state.specialtiesGroupList[this.state.currentGroup]});
  },

  handleSearch: function(results, query) {
    this.setState({ query: query });
    this.setState({ searchResults: results });
  },

  /// render helpers
  groupListComponents: function () {
    return (
            <TabList tabs={Object.keys(this.state.specialtiesGroupList)}
                      changeTab={this.changeGroup}
                      currentTab={this.state.currentGroup} />
          )
  },

  searchResults: function() {
    return (
      <span>
        <Specialties specialties={this.state.searchResults} search={true}/>
      </span>
    )
  },

  directions: function() {
    return (
      <span>
        {this.groupListComponents()}
        <Directions directions={this.state.directions} humanLevel={this.state.currentGroup} />
      </span>
    )
  },

  renderContent: function() {
    if (this.state.searchResults.length == 0 && this.state.query.length == 0) {
      return this.directions()
    } else {
      return this.searchResults()
    }
  },

  render: function() {
    return (
      <div className="section">
        <div className="container main">
          <div className="container">
            <div className="card border-0 cursor-default">
              <div className="card-block">
                <h1 className="card-title">
                  Список специальностей НИЯУ МИФИ
                </h1>
                <SearchForm handleSearch={this.handleSearch} query={this.state.query} />
              </div>
            </div>
            <div className="container">
              {this.renderContent()}
            </div>
          </div>
        </div>
      </div>
    )
  }
});