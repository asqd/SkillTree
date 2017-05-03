var Discipline = React.createClass({
  propTypes: {
    name: React.PropTypes.string,
    label: React.PropTypes.string,
  },

  componentDidMount: function(){
    $(function () {
      $('[data-toggle="tooltip"]').tooltip()
    })
  },

  /// render helpers
  formattedHtypes: function(){
    htypes_list = this.props.discipline.sorted_short_htype
    return htypes_list.map(function(htype, i){
      badgeColor = (htypes_list.indexOf(htype) != -1) ? "badge-" + window.htype_bages[htype] : "invisible"
      return (
        <span className={"mr-1 badge " + badgeColor}
                      data-toggle="tooltip"
                      data-placement="bottom"
                      data-original-title={window.htypes[htype]}
                      title={window.htypes[htype]}
                      key={"htype" + i}>
          {htype}
        </span>
      )
    })
  },

  render: function() {
    var discipline = this.props.discipline;
    return(
      <div className="row p-2 hover-highlight" data-toggle="collapse" href={'#' + this.props.componentId}>
        <div className="col-5">
          {discipline.name}
        </div>
        <div className="col-3">
          {discipline.human_label}
        </div>
        <div className="col-4">
          {this.formattedHtypes()}
        </div>
      </div>
    )
  }
});