const MessagesList = ({messages}) =>
  <ul>
    {messages.map((message, i) => {
      return (
        <Message message={message} key={message.id}/>
      )
    })}
  </ul>
