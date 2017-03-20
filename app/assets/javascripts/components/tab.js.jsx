var Tab = React.createClass({
  handleClick: function(e){
    e.preventDefault();
    this.props.handleClick();
  },

  render: function() {
    return(
      <li className="nav-item">
        <a className={"nav-link " + (this.props.isCurrent ? 'active' : '')}
          onClick={this.handleClick} href="#">
          {this.props.name}
        </a>
      </li>)
  }
});