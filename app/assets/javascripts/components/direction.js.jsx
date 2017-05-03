var Direction = React.createClass({
  getInitialState: function() {
    return (
      { specialties: [], isExpanded: false, loading: true }
    );
  },

  componentWillReceiveProps: function(nextProps){
    $("#" + this.props.componentId).collapse('hide')
    this.setState({ isExpanded: false })
  },

  getSpecialtiesFromApi: function () {
    var self = this
    if (!this.state.loading) {
      this.setState({ loading: true })
    }
    params =  $.param({
                direction: this.props.direction.direction,
                human_level: this.props.humanLevel
              })
    $.ajax({
      url: '/api/specialties/?' + params,
      success: function(data) {
        self.setState({ specialties: data, isExpanded: !self.state.isExpanded });
        setTimeout(function () { self.setState({ loading: false }) }, 100)
      },
      error: function(xhr, status, error) {
        console.log('Cannot get data from API: ', error);
      }
    });
  },

  handleExpandDirection: function() {
    if (!this.state.isExpanded) {
      this.getSpecialtiesFromApi();
    } else {
      this.setState({ isExpanded: !this.state.isExpanded })
      // this.setState({ specialties: [] })
    }
  },

  render: function() {
    return(
      <div className="mt-2">
        <div className="row py-2 px-0 hover-highlight" data-toggle="collapse" href={'#' + this.props.componentId} onClick={this.handleExpandDirection}>
          <div className="col-2">
            {this.props.direction.code}
          </div>
          <div className="col-7">
            {this.props.direction.direction}
            <span className="mx-2 badge badge-default">{this.props.direction.specialty_count}</span>
          </div>
          <div className="col-3">
            {stringUtils.smartString(this.props.direction.saes)}
          </div>
        </div>
        <div className="collapse mt-2" id={this.props.componentId}>
          <div className="card card-block">
            <Specialties specialties={this.state.specialties} loading={this.state.loading} />
          </div>
        </div>
      </div>)
  }
});