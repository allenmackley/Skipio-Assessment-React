var SkipioContacts = React.createClass({
  render: function() {
    return (
      <ul className="sio-contact-list">
        {this.props.sio_contacts.map(function(sio_contact, i) {
          return (
            <SkipioContact key={sio_contact.id} index={i} sio_contact={sio_contact} handleChange={this.props.handleChange}/>
          )
        }, this)}
      </ul>
    )
  }
});
