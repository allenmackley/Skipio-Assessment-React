var MessagesList = React.createClass({
  render: function() {
    return (
      <ul>
        {this.props.messages.map(function(message, i) {
          return (
            <Message message={message} key={message.id}/>
          )
        })}
      </ul>
    )
  }
});
