var MessageForm = React.createClass({
  handleChange: function(e){
    var obj = {}
    obj[e.target.name] = e.target.value;
    this.props.onUserInput(obj);
  },
  handleSubmit: function(e) {
    e.preventDefault();
    this.props.onFormSubmit();
  },
  render: function(){
    return (
      <div>
        <h2>Select a Contact</h2>
        <form className='sio-message-form' onSubmit={this.handleSubmit}>
          <SkipioContacts sio_contacts={this.props.sio_contacts} handleChange={this.handleChange}/>
          <label>Send a message:</label>
          <input type='hidden' value={this.props.user.id} />
          <br />
          <textarea name='text' className='sio-message-text' placeholder='Type here...' defaultValue={this.props.text} onChange={this.handleChange}></textarea>
          <br />
          <input type='submit' value='Send Message' />
        </form>
      </div>
    )
  }
});
