var Discipline = React.createClass({
  propTypes: {
    name: React.PropTypes.string,
    label: React.PropTypes.string,
  },

  render: function() {
    var discipline = this.props.discipline;
    return(
      <div className="row p-2 hover-highlight" data-toggle="collapse" href={'#' + this.props.componentId}>
        <div className="col">
          {discipline.name}
        </div>
        <div className="col">
          {discipline.label}
        </div>
      </div>
    )
  }
});