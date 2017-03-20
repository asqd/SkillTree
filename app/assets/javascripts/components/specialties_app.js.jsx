var SpecialtiesApp = React.createClass({
  getInitialState: function() {
    return {  specialties: [],
              specialtiesGroupList: [],
              directions: [],
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

  groupListComponents: function () {
    return (
            <TabList tabs={Object.keys(this.state.specialtiesGroupList)}
                      changeTab={this.changeGroup}
                      currentTab={this.state.currentGroup} />
          )
  },

  changeGroup: function(name) {
    this.setState({ currentGroup: name })
    this.setState({ directions: this.state.specialtiesGroupList[name] })
  },

  setDirections: function() {
    this.setState({directions: this.state.specialtiesGroupList[this.state.currentGroup]});
  },

  render: function() {
    return(
      <div className="section">
        <div className="jumbotron">
          <h1>Список специальностей</h1>
        </div>
        <div className="container">
          <ul className="nav nav-tabs">
            {this.groupListComponents()}
          </ul>
          <Directions directions={this.state.directions} humanLevel={this.state.currentGroup} />
        </div>
      </div>
    )
  }
});