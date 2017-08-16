import React from 'react'
import { formatDate } from './utils'

export const Message = ({message}) =>
  <li>
    {formatDate(message.created_at)} - {message.text}
  </li>
