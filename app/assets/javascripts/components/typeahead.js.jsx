var Typeahead = React.createClass({
  getInitialState: function () {
    return {
      searchResults: [],
      query: ""
    };
  },

  componentWillMount: function () {
  },

  handleSearch: function () {
    var query = ReactDOM.findDOMNode(this.refs.query).value
    var self = this;
    $.ajax({
      url: '/api/specialties/search',
      data: {
        query: query,
      },
      success: function (data) {
        if (self.props.handleSearch) {
          self.props.handleSearch(data, query)
          self.setState({ query: query })
        } else {
          self.setState({ query: query })
          self.setState({ searchResults: data })
        }
      },
      error: function (xhr, status, error) {
        console.log('Search error: ', status, xhr, error)
      }
    });
  },

  clearQuery: function() {
    this.setState({ query: "" })
    this.refs.query.value = ""
    this.props.handleSearch([], "")
  },

  /// render helpers
  searchResults: function () {
    return (
      <div>
        <Specialties specialties={this.state.searchResults} search={true} compare={true} />
      </div>
    )
  },

  renderResults: function () {
    if (this.state.searchResults.length == 0 && this.state.query.length == 0) {
      return ""
    } else {
      return this.searchResults()
    }
  },

  render: function () {
    return (
      <div className="row">
        <div className="col-11 pr-0">
          <input onChange={$.debounce(500, this.handleSearch)}
            type="text"
            className="form-control search"
            placeholder={this.props.placeholder || "Поиск по профилю или направлению"}
            ref="query" />
        </div>
        <div className={"pl-2 pt-1 pl-2 " + (this.state.query.length == 0 ? "invisible" : "")}>
          <button type="button" className="close" aria-label="Close" onClick={this.clearQuery}>
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
      </div>
    )
  }
});