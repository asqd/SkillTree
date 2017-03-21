var SpecialtyApp = React.createClass({
  getInitialState: function() {
    return {  specialties: [],
              disciplines: [],
              currentTerm: "1й семестр"
    };
  },

  componentDidMount: function() {
    this.getDisciplinesFromApi()
  },

  getDisciplinesFromApi: function(term_id) {
    var self = this;
    params =  $.param({
                specialty_id: this.props.specialty.id,
                term_number: term_id ? term_id : parseInt(this.state.currentTerm)
              })
    $.ajax({
      url: '/api/disciplines/?' + params,
      success: function(data) {
        self.setState({ disciplines: data });
      },
      error: function(xhr, status, error) {
        console.log('Cannot get data from API: ', error);
      }
    });
  },

  termListComponents: function () {
    tabList = Array.apply(null, {length: this.props.specialty.terms_count}).map(function(_, i) {
        return (i+1) + "й семестр"
    })

    return (
            <TabList tabs={tabList}
                      changeTab={this.changeGroup}
                      currentTab={this.state.currentTerm} />
          )
  },

  disciplineList: function() {
    return this.state.disciplines.map(function(discipline){
      return (<Discipline discipline={discipline}
                      key={'discipline' + discipline.id}
                      componentId={'discipline' + discipline.id} />)
    });

  },

  changeGroup: function(name) {
    this.setState({ currentTerm: name })
    term_id = parseInt(name)
    this.getDisciplinesFromApi(term_id)
  },

  render: function() {
    specialty = this.props.specialty
    return(
      <div className="section">
        <div className="container main">
          <div className="container">
            <div className="card border-0">
              <div className="card-block py-3">
                <p className="card-text mb-2">
                  <span className="badge badge-default text-uppercase font-weight-normal mr-1">
                    {specialty.human_level}
                  </span>
                  <span className="badge badge-default text-uppercase font-weight-normal">
                    {specialty.human_study_form} форма обучения
                  </span>
                </p>
                <h3 className="card-title">
                  {specialty.profile}
                </h3>
              </div>
            </div>
          </div>
          <div className="container">
            <ul className="nav nav-tabs">
              {this.termListComponents()}
            </ul>
            <div className="row p-2">
              <div className="col-6">
                Дисциплина
              </div>
              <div className="col">
                Модуль
              </div>
              <div className="col">

              </div>
            </div>
            {this.disciplineList()}
          </div>
        </div>
      </div>
    )
  }
});