var Directions = React.createClass({
  /// render helpers
  directionList: function () {
    return this.props.directions.map(function(direction, i){
      return (
        <Direction direction={direction}
              humanLevel={this.props.humanLevel}
              componentId={"direction" + i}
              key={"direction" + i} />
      )
    }.bind(this));
  },

  render: function() {
    return(
      <div className="container main cursor-pointer">
        <div className="row mt-3 mb-1 font-weight-bold">
          <div className="col-2">
            Код
          </div>
          <div className="col-7">
            Направление
          </div>
          <div className="col-3">
            Институт
          </div>
        </div>
        {this.directionList()}
      </div>
    )
  }
});