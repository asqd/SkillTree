var DisciplineCard = React.createClass({
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
  htypesTable: function(htypes, specialtyIndex=null){
    htypesList = this.props.htypesList

    htypesHeaders = htypesList.map(function (htype, i) {
      return (
        <th className={"px-1 " + "table-" +
          window.htype_bages[htype]}
          data-toggle="tooltip"
          data-placement="top"
          title={window.htypes[htype]}
          key={"htype" + i} >
          {htype}
        </th>
      )
    })

    htypesCols = htypesList.map(function (htype, i) {
      return (
        <td className={"px-1 " + "table-" +
          window.htype_bages[htype]}
          data-toggle="tooltip"
          data-placement="top"
          title={window.htypes[htype]}
          key={"htype" + i}>
          {htypes[htype] != undefined ? htypes[htype] + " ч" : "—"}
        </td>
      )
    })
    if (specialtyIndex != null) {
      specialtyName = this.props.specialtyNames[specialtyIndex]
      specialtyTitle = <div className="text-truncate small mb-1"
                            title={specialtyName}
                            data-toggle="tooltip"
                            data-placement="top"
                            colSpan="9">
      <span className="align-text-bottom rounded-circle badge badge-info mr-1">
        {specialtyIndex == 0 ? "A" : "B"}
      </span>
        {specialtyName}
      </div>
    }

    return (
      <div>
        {specialtyIndex == null ? "" : specialtyTitle}
        <table className="table-sm small table-responsive">
          <thead>
            <tr>
              {htypesHeaders}
            </tr>
          </thead>
          <tbody>
            <tr>
              {htypesCols}
            </tr>
          </tbody>
        </table>
      </div>
    )
  },

  similarDiscipline: function() {
    var discipline = this.props.discipline
    return (
      <div className={"card " + "card-outline-" + window.human_label_bages[discipline.human_label]}>
        <div className="card-block pl-3 pr-1 py-3">
          <h5 className="card-title text-truncate"
              data-toggle="tooltip"
              data-placement="top"
              title={discipline.name}>
            {discipline.name}
          </h5>
          <div className="card-subtitle mb-2">
            {discipline.human_label}
          </div>
          <div className="card-text">
            {this.htypesTable(this.props.firstSpHours, 0)}
          </div>
          <div className="card-text mt-1">
            {this.htypesTable(this.props.secondSpHours, 1)}
          </div>
        </div>
      </div>
    )
  },

  differentDiscipline: function (specialtyIndex) {
    var discipline = this.props.discipline
    return (
      <div className={"card my-3 col-10 " + "card-outline-" + window.human_label_bages[discipline.human_label]}>
        <div className="card-block pl-0 pr-1 py-3">
          <h5 className="card-title text-truncate"
              data-toggle="tooltip"
              data-placement="top"
              title={discipline.name}>
            {discipline.name}
          </h5>
          <div className="card-subtitle mb-2">
            {discipline.human_label}
          </div>
          <div className="card-text">
            {this.htypesTable(this.props.firstSpHours, specialtyIndex)}
          </div>
        </div>
      </div>
    )
  },

  render: function() {
    var discipline = this.props.discipline;
    if (this.props.isSimilar) {
      return this.similarDiscipline()
    } else {
      return this.differentDiscipline(this.props.specialtyIndex)
    }
  }
});