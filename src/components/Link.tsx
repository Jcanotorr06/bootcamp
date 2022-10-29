import React, { FC, LinkHTMLAttributes } from 'react'
import NextLink, { LinkProps } from 'next/link'

interface Props extends LinkProps {
    text: string
    className?: string
}

const Link:FC<Props> = ({text, className, ...rest}) => {
  return (
    <NextLink {...rest}>
        <a {...className ? {className: className} : ''}>
            {text}
        </a>
    </NextLink>
  )
}

export default Link