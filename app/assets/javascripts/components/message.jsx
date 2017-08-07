var Message = React.createClass({
  render: function() {
    return (
      <li>
        {formatDate(this.props.message.created_at)} - {this.props.message.text}
      </li>
    )
  }
});
