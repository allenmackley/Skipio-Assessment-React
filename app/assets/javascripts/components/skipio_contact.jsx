class SkipioContact extends React.Component {
  render() {
    return (
      <label htmlFor={this.props.sio_contact.id}>
        <li className="sio-contact-li">
          <input type="radio" className='sio-contact-id' value={this.props.sio_contact.id} name="skipio_contact_user_id" defaultChecked={this.props.index == 0 ? true : false} onChange={this.props.handleChange}/>
          <div className="sio-contact-info">
            <div className="sio-contact-avatar">
              <img src={this.props.sio_contact.avatar_url} />
            </div>
            <div className="sio-contact-name">
              {this.props.sio_contact.full_name}
            </div>
          </div>
        </li>
      </label>
    )
  }
}
