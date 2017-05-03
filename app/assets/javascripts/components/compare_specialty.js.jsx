var CompareSpecialtyApp = React.createClass({
  getInitialState: function() {
    return {  specialties: [],
              disciplines: { similar: [], different: [] },
              loading: true,
              currentTerm: "1й семестр"
    };
  },

  componentDidMount: function() {
    this.getDisciplinesFromApi()
  },

  getDisciplinesFromApi: function(term_id) {
    var self = this;
    if (!this.state.loading) {
      this.setState({ loading: true })
    }
    params =  $.param({
                specialty_ids: this.props.specialty_ids,
                term_number: term_id ? term_id : parseInt(this.state.currentTerm)
              })
    $.ajax({
      url: '/api/disciplines/compare/?' + params,
      success: function(data) {
        self.setState({ disciplines: data })
        setTimeout(function(){ self.setState({ loading: false }) }, 100)
      },
      error: function(xhr, status, error) {
        console.log('Cannot get data from API: ', error);
      }
    });
  },

  changeGroup: function(name) {
    this.setState({ currentTerm: name })
    term_id = parseInt(name)
    this.getDisciplinesFromApi(term_id)
  },

  /// render helpers
  termListComponents: function () {
    tabList = Array.apply(null, { length: this.props.terms_count }).map(function (_, i) {
      return (i + 1) + "й семестр"
    })

    return (
      <TabList tabs={tabList}
        changeTab={this.changeGroup}
        currentTab={this.state.currentTerm} />
    )
  },

  noContent: function () {
    return (
      <div className="col text-muted">
        <h3>{this.state.loading ? "Загрузка..." : "Нет"}</h3>
      </div>
    )
  },

  similarDisciplineList: function() {
    var similar = this.state.disciplines.similar
    var specialtyCodes = this.props.specialties.map(function(specialty) { return specialty.code})
    var specialtyNames = this.props.specialties.map(function (specialty) { return specialty.code + " " + specialty.profile })

    if (similar.length > 0) {
      return (
        Object.keys(similar).map(function(disciplineId) {
          var htypesSet = new Set(
            Object.keys(similar[disciplineId].first).concat(Object.keys(similar[disciplineId].second))
          )
          var htypesArray = Array.from(htypesSet)
          htypesArray = window.htypes_order.filter(function (value) {
            return htypesArray.includes(value);
          })

          return (
            <DisciplineCard discipline={similar[disciplineId]}
                              key={'discipline' + similar[disciplineId]['id']}
                              componentId={'discipline' + similar[disciplineId]['id']}
                              specialtyCodes={specialtyCodes} specialtyNames={specialtyNames}
                              htypesList={htypesArray} isSimilar={true}
                              firstSpHours={similar[disciplineId].first} secondSpHours={similar[disciplineId].second} />
          )
        })
      )
    } else {
      return this.noContent()
    }
  },

  diffDisciplineList: function (number="first") {
    var different, hours
    var specialtyNames = this.props.specialties.map(function (specialty) { return specialty.code + " " + specialty.profile })
    if (number == "first") {
      different = this.state.disciplines.different.filter(function (discipline) { return discipline.first != null })
      specialtyIndex = 0
  }
    else {
      different = this.state.disciplines.different.filter(function (discipline) { return discipline.second != null })
      specialtyIndex = 1
    }

    if (different.length > 0) {
      return (
        Object.keys(different).map(function (disciplineId) {
          var htypesArray = different[disciplineId].first != null ? Object.keys(different[disciplineId].first) : Object.keys(different[disciplineId].second)
          htypesArray = window.htypes_order.filter(function (value) {
            return htypesArray.includes(value);
          })
          var hours = different[disciplineId].first != null ? different[disciplineId].first : different[disciplineId].second

          return (
            <DisciplineCard discipline={different[disciplineId]}
                            key={'discipline' + different[disciplineId]['id']}
                            componentId={'discipline' + different[disciplineId]['id']}
                            htypesList={htypesArray} isSimilar={false}
                            firstSpHours={hours} secondSpHours={null}
                            specialtyIndex={specialtyIndex} specialtyNames={specialtyNames} />
          )
        })
      )
    } else {
      return this.noContent()
    }
  },

  specialtyCols: function() {
    return (this.props.specialties.map(function(specialty, i) {
      return (
        <div className="col" key={specialty.profile + i}>
          <div className="card border-0">
            <div className="card-block p-2">
              <small className="card-text">
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
              </small>
              <p className="card-title mb-1">
                <span className="align-text-bottom rounded-circle badge badge-info mr-1">
                  {i == 0 ? "A" : "B"}
                </span>
                {specialty.profile}
              </p>
            </div>
          </div>
        </div>
      )
    })
    )
  },

  header: function () {
    return (
      <div className="container cursor-default">
        <div className="row">
          {this.specialtyCols()}
        </div>
      </div>
    )
  },

  render: function() {
    firstSpecialty = this.props.specialties[0].code + " " + this.props.specialties[0].profile
    secondSpecialty = this.props.specialties[1].code + " " + this.props.specialties[1].profile
    return (
      <div className="section">
        <div className="container main">
          <div className="container cursor-pointer mt-2">
            <a href="/">
              {"<- К списку специальностей"}
            </a>
          </div>
          <h3 className="container mt-3">Сравнение специальностей</h3>
          {this.header()}

          <div className="container cursor-default">
            {this.termListComponents()}
            <div className="row mt-3 mb-2">
              <div className="col">
                <h4>Общие дисциплины</h4>
              </div>
            </div>
            <div className="card-columns">
              { this.similarDisciplineList() }
            </div>
            <div className="row mt-4">
              <div className="col-6">
                  <h4>
                    Дисциплины
                    <div className="mt-1">
                    {firstSpecialty}
                    </div>
                  </h4>
              </div>
              <div className="col-6">
                  <h4>
                    Дисциплины
                    <br />
                    {secondSpecialty}
                  </h4>
              </div>
            </div>
            <div className="row">
              <div className="col-6">
                {this.diffDisciplineList()}
              </div>
              <div className="col-6">
                {this.diffDisciplineList("second")}
              </div>
            </div>
          </div>
        </div>
      </div>
    )
    }
});