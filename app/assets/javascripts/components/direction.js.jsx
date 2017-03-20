var Direction = React.createClass({
  getInitialState: function() {
    return (
      { specialties: [], isExpanded: false }
    );
  },
  componentWillReceiveProps: function(nextProps){
    $("#" + this.props.componentId).collapse('hide')
    this.setState({ isExpanded: false })
  },

  getSpecialtiesFromApi: function () {
    var self = this
    params =  $.param({
                direction: this.props.direction.direction,
                human_level: this.props.humanLevel
              })
    $.ajax({
      url: '/api/specialties/?' + params,
      success: function(data) {
        self.setState({ specialties: data });
      },
      error: function(xhr, status, error) {
        console.log('Cannot get data from API: ', error);
      }
    });
  },

  handleExpandDirection: function() {
    this.setState({ isExpanded: !this.state.isExpanded })
    if (!this.state.isExpanded) {
      this.getSpecialtiesFromApi();
    } else {
      this.setState({ specialties: [] })
    }
  },

  render: function() {
    return(
      <div className="mt-2">
        <div className="row py-2 px-0 hover-highlight" data-toggle="collapse" href={'#' + this.props.componentId} onClick={this.handleExpandDirection}>
          <div className="col-2">
            {this.props.direction.code}
          </div>
          <div className="col">
            {this.props.direction.direction}
            <span className="mx-2 badge badge-default">{this.props.direction.specialty_count}</span>
          </div>
        </div>
        <div className="collapse mt-2" id={this.props.componentId}>
          <div className="card card-block">
            <Specialties specialties={this.state.specialties} />
          </div>
        </div>
      </div>)
  }
});