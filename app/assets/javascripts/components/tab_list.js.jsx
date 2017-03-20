var TabList = React.createClass({
  handleClick: function(name){
    this.props.changeTab(name);
  },

  render: function() {
    return(
      <ul className="nav nav-tabs">
        {this.props.tabs.map(function(name, i) {
                  return (<Tab name={name}
                                  isCurrent={(this.props.currentTab === name)}
                                  handleClick={this.handleClick.bind(this, name)}
                                  key={'name' + i} />
                          )
                }.bind(this))}
      </ul>
  )}
});

