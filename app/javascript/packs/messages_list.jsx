import React from 'react'
import { Message } from './message'

export const MessagesList = ({messages}) =>
  <ul>
    {messages.map((message, i) => {
      return (
        <Message message={message} key={message.id}/>
      )
    })}
  </ul>
