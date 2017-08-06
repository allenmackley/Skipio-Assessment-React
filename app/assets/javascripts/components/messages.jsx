var Messages = React.createClass({
  getInitialState: function() {
    return {
      user: this.props.user,
      sio_contacts: this.props.sio_contacts,
      messages: this.props.messages,
      skipio_contact_user_id: this.props.sio_contacts[0].id,
      text: "Initial text."
    }
  },
  handleUserInput: function(obj) {
    this.setState(obj);
  },
  handleFormSubmit: function() {
    var message = {
      user_id: this.state.user.id,
      skipio_contact_user_id: this.state.skipio_contact_user_id,
      text: this.state.text
    }
    $.post('/messages', {message: message}).done(function(data){
      this.addNewMessage(data);
    }.bind(this));
  },
  addNewMessage: function(message) {
    //pushes the message onto the messages without mutating the data
    var messages = React.addons.update(this.state.messages, {$push: [message]});
    this.setState({
      messages: messages.sort(function(a, b){
        return new Date(b.created_at) - new Date(a.created_at)
      })
    });
  },
  render: function() {
    return (
      <div>
        <MessageForm user={this.state.user} sio_contacts={this.state.sio_contacts} text={this.state.text} onUserInput={this.handleUserInput} onFormSubmit={this.handleFormSubmit}  />
        <MessagesList messages={this.state.messages} />
      </div>
    )
  }
});
