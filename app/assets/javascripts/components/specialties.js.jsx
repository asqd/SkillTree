var Specialties = React.createClass({
  specialtyList: function() {
    return this.props.specialties.map(function(specialty){
      return (<Specialty specialty={specialty}
                      key={'specialty' + specialty.id}
                      componentId={'specialty' + specialty.id} />)
    }.bind(this));
  },

  render: function() {
    return(
      <div className="container main">
        <div className="row">
          <div className="col-8">
            Профиль
          </div>
          <div className="col">
            Форма обучения
          </div>
        </div>
        {this.specialtyList()}
      </div>
    )
  }
});