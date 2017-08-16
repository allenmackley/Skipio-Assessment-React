import React from 'react'
import SkipioContact from './skipio_contact'

export default class SkipioContacts extends React.Component {
  render() {
    return (
      <ul className="sio-contact-list">
        {this.props.sio_contacts.map((sio_contact, i) => {
          return (
            <SkipioContact key={sio_contact.id} index={i} sio_contact={sio_contact} handleChange={this.props.handleChange}/>
          )
        }, this)}
      </ul>
    )
  }
}
