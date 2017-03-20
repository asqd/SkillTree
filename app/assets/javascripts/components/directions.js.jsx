var Directions = React.createClass({

  directionList: function () {
    return this.props.directions.map(function(direction, i){
      return (<Direction direction={direction}
              humanLevel={this.props.humanLevel}
              componentId={"direction" + i}
              key={"direction" + i}/>)
    }.bind(this));
  },

  render: function() {
    return(
      <div className="container main">
        <div className="row my-2">
          <div className="col-2">
            Код
          </div>
          <div className="col">
            Направление
          </div>
        </div>
        {this.directionList()}
      </div>
    )
  }
});