var Specialties = React.createClass({
  specialtyList: function() {
    return this.props.specialties.map(function(specialty){
      return (<Specialty specialty={specialty}
                      search={this.props.search}
                      key={'specialty' + specialty.id}
                      componentId={'specialty' + specialty.id} />)
    }.bind(this));
  },

  searchHeaderCols: function() {
    return (
      <div className="row">
        <div className="col-1">
          Код
        </div>
        <div className="col-7">
          Профиль
        </div>
        <div className="col">
        </div>
      </div>
    )
  },

  regularHeaderCols: function(){
    return (
      <div className="row">
        <div className="col-7">
          Профиль
        </div>
        <div className="col">
          Форма обучения
        </div>
      </div>
    )
  },

  nothingFound: function() {
    return (
      <div className="row py-2 px-0">
        <div className="col text-muted">
          <h3>Мы ничего не нашли :(</h3>
          <h3>Попробуйте изменить запрос</h3>
        </div>
      </div>
    )
  },

  render: function() {
    return(
      <div className="container main">
        { this.props.search ?
            this.searchHeaderCols()
          :
            this.regularHeaderCols()
        }
        { this.specialtyList().length > 0  ?
            this.specialtyList()
          :
            this.nothingFound()
        }
      </div>
    )
  }
});