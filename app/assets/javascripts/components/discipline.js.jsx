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

  formattedHtypes: function(){
    htypes_list = this.props.discipline.sorted_short_htype
    return htypes_list.map(function(htype, i){
      return (<span className={"mx-1 badge " + "badge-" +
                      window.htype_bages[htype]}
                      data-toggle="tooltip"
                      data-placement="bottom"
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
        <div className="col-6">
          {discipline.name}
        </div>
        <div className="col">
          {discipline.human_label}
        </div>
        <div className="col">
          {this.formattedHtypes()}
        </div>
      </div>
    )
  }
});