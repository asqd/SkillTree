var SpecialtyApp = React.createClass({
  getInitialState: function() {
    return {  specialties: [],
              disciplines: [],
              searchResults: [],
              query: "",
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

  handleSearch: function (results, query) {
    this.setState({ query: query });
    this.setState({ searchResults: results });
  },

  changeGroup: function(name) {
    this.setState({ currentTerm: name })
    term_id = parseInt(name)
    this.getDisciplinesFromApi(term_id)
  },

  /// render helpers
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

  header: function() {
    return (
      <div className="container cursor-default">
        <div className="card border-0">
          <div className="card-text py-3">
            <p className="card-text mb-2">
              <span className="badge badge-default text-uppercase font-weight-normal mr-1">
                {stringUtils.smartString(specialty.sae_short_name, "")}
              </span>
              <span className="badge badge-default text-uppercase font-weight-normal mr-1">
                {specialty.human_level}
              </span>
              <span className="badge badge-default text-uppercase font-weight-normal mr-1">
                {specialty.human_study_form} форма обучения
              </span>
              <span className="badge badge-default text-uppercase font-weight-normal">
                {specialty.code}
              </span>
            </p>
            <h3 className="card-title">
              {specialty.profile}
            </h3>
          </div>
        </div>
      </div>
    )
  },

  searchResults: function () {
    return (
      <span>
        <Specialties specialties={this.state.searchResults} search={true} compare={true} />
      </span>
    )
  },

  renderResults: function () {
    if (this.state.searchResults.length == 0 && this.state.query.length == 0) {
      return ""
    } else {
      return this.searchResults()
    }
  },

  render: function() {
    specialty = this.props.specialty
    return(
      <div className="section">
        <div className="container main cursor-pointer">
          <div className="container cursor-pointer mt-2">
            <div className="d-flex justify-content-end">
              <div className="mr-auto mt-1">
                <a href="/">
                  { "<- К списку специальностей" }
                </a>
              </div>
              <div className="pt-1 cursor-default">
                Сравнить с
              </div>
              <div className="col-6 pr-0">
                <Typeahead handleSearch={this.handleSearch} />
              </div>
            </div>
            {this.renderResults()}
          </div>
          {this.header()}
          <div className="container">
            {this.termListComponents()}
            <div className="row p-2 mt-3 mb-0 font-weight-bold cursor-default">
              <div className="col-5">
                Дисциплина
              </div>
              <div className="col-3">
                Модуль
              </div>
              <div className="col-4">
                Тип занятий
              </div>
            </div>
            {this.disciplineList()}
          </div>
        </div>
      </div>
    )
  }
});