var SearchForm = React.createClass({
  getInitialState: function() {
    return {  humanLevels: [
                "Аспирантура",
                "Бакалавриат",
                "Магистратура",
                "Специалитет"
              ],
              isChecked: false,
              selectedCheckboxes: []
    };
  },

  componentWillMount: function() {
    this.selectedCheckboxes = new Set();
  },

  handleSearch: function() {
    var query = ReactDOM.findDOMNode(this.refs.query).value
    var self = this;
    checkboxes = Array.from(this.selectedCheckboxes)
    $.ajax({
      url: '/api/specialties/search',
      data: {
        query: query,
        human_levels: checkboxes.length > 0 ? checkboxes : void 0
      },
      success: function(data) {
        self.props.handleSearch(data, query);
      },
      error: function(xhr, status, error) {
        console.log('Search error: ', status, xhr, error);
      }
    });
  },

  toggleCheckbox: function(event) {
    label = event.target.value
    if (this.selectedCheckboxes.has(label)) {
      this.selectedCheckboxes.delete(label)
    } else {
      this.selectedCheckboxes.add(label)
    }

    this.handleSearch()
  },

  checkboxList: function() {
    return this.state.humanLevels.map(function(label, i){
      return (
        <div className="form-check form-check-inline" key={label + i}>
          <label className="form-check-label">
            <input className="form-check-input mr-1"
            type="checkbox" id={label + i} value={label}
            onChange={this.toggleCheckbox} />
              {label}
          </label>
        </div>
    )
    }.bind(this));
  },

  render: function() {
    return(
      <span>
        <div>
          <input onChange={$.debounce(500, this.handleSearch)}
                 type="text"
                 className="form-control"
                 placeholder="Поиск по профилю или направлению"
                 ref="query" />
            {this.checkboxList()}
        </div>
      </span>
    )
  }
});