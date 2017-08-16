import React from 'react'
import SkipioContacts from './skipio_contacts'

export default class MessageForm extends React.Component {
  handleChange(e) {
    const obj = {}
    obj[e.target.name] = e.target.value;
    this.props.onUserInput(obj);
  }
  handleSubmit(e) {
    e.preventDefault();
    this.props.onFormSubmit();
  }
  render() {
    return (
      <div>
        <h2>Select a Contact</h2>
        <form className='sio-message-form' onSubmit={(e) => this.handleSubmit(e)}>
          <SkipioContacts sio_contacts={this.props.sio_contacts} handleChange={(e) => this.handleChange(e)}/>
          <label>Send a message:</label>
          <input type='hidden' value={this.props.user.id} />
          <br />
          <textarea name='text' className='sio-message-text' placeholder='Type here...' defaultValue={this.props.text} onChange={(e) => this.handleChange(e)}></textarea>
          <br />
          <input type='submit' value='Send Message' />
        </form>
      </div>
    )
  }
}
