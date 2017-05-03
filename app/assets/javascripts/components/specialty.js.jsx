var Specialty = React.createClass({
  propTypes: {
    specialty: React.PropTypes.shape({
      direction: React.PropTypes.string,
      human_level: React.PropTypes.string,
      human_study_form: React.PropTypes.string,
    })
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

  handleExpandDiscipline: function() {
    this.setState({ isExpanded: !this.state.isExpanded })
    if (!this.state.isExpanded) {
      this.getDataFromApi();
    } else {
      this.setState({ disciplineList: [] })
    }
  },

  /// render helpers
  regularSpecialty: function() {
    var specialty = this.props.specialty;
    return (
      <div className="row py-2 px-0 hover-highlight">
        <div className="col-7">
          {specialty.profile}
        </div>
        <div className="col-2">
          {specialty.human_study_form}
        </div>
        <div className="col-3">
          {stringUtils.smartString(specialty.sae_short_name)}
        </div>
      </div>
    )
  },

  specialtyForSearch: function() {
    var specialty = this.props.specialty;

    return (
      <div className="row py-2 px-0 hover-highlight">
        <div className="col-1">
          {specialty.code}
        </div>
        <div className="col-7">
          {specialty.profile}
        </div>
        <div className="col-4">
          <span className="badge badge-primary font-weight-normal mr-1">{specialty.direction}
          </span>
          <span className="badge badge-danger font-weight-normal mr-1">{specialty.sae_short_name}</span>
          <span className="badge badge-success font-weight-normal mr-1">{specialty.human_level}
          </span>
          <span className="badge badge-default font-weight-normal">{specialty.human_study_form}
          </span>
        </div>
      </div>
    )
  },

  link: function() {
    if (this.props.compare) {
      return "/specialties/compare/" + location.pathname.replace(/\D/g, '') + "/" + this.props.specialty.id
    }
    else {
      return "/specialties/" + this.props.specialty.id
    }
  },

  renderContent: function() {
    if (this.props.search) {
      return this.specialtyForSearch()
    } else {
      return this.regularSpecialty()
    }
  },

  render: function() {
    var specialty = this.props.specialty;

    return(
      <div className="mt-2">
        <a href={this.link()} target="_blank">
          {this.renderContent()}
        </a>
      </div>
    )
  }
});