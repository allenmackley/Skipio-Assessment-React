const Message = ({message}) =>
  <li>
    {formatDate(message.created_at)} - {message.text}
  </li>
