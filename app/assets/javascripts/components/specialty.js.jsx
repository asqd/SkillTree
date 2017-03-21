var Specialty = React.createClass({
  propTypes: {
    direction: React.PropTypes.string,
    human_level: React.PropTypes.string,
    human_study_form: React.PropTypes.string,
  },

  getInitialState: function() {
    return { disciplines: [], disciplineList: [], isExpanded: false };
  },

  getDataFromApi: function() {
    var self = this;
    $.ajax({
      url: '/api/specialties/'+ this.props.specialty.id +'/disciplines',
      success: function(data) {
        self.setState({ disciplines: data });
        self.setState({ disciplineList: self.getDisciplineList() })
      },
      error: function(xhr, status, error) {
        console.log('Cannot get data from API: ', error);
      }
    });
  },

  getDisciplineList: function() {
    return this.state.disciplines.map(function(discipline){
      return (<Discipline discipline={discipline}
                      key={'discipline' + discipline.id}
                      componentId={'discipline' + discipline.id} />)
    });

  },

  componentDidMount: function() {
    // console.log(this.props)
  },

  handleExpandDiscipline: function() {
    this.setState({ isExpanded: !this.state.isExpanded })
    if (!this.state.isExpanded) {
      this.getDataFromApi();
    } else {
      this.setState({ disciplineList: [] })
    }
  },

  render: function() {
    var specialty = this.props.specialty;
    return(
      <div className="mt-2">
        <a href={"/specialties/" + specialty.id} target="_blank">
          <div className="row py-2 px-0 hover-highlight">
              <div className="col-8">
                {specialty.profile}
              </div>
              <div className="col">
                {specialty.human_study_form}
              </div>
          </div>
        </a>
      </div>
    )
  }
});