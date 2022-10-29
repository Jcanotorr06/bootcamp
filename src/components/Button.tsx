import { ButtonHTMLAttributes, FC } from "react"

interface Props extends ButtonHTMLAttributes<HTMLButtonElement>{
    size: 'lg' | 'md' | 'sm'
    theme: 'primary' | 'secondary' | 'neutral' | 'success' | 'warning' | 'error'
    variant?: 'accent' | 'outline' | 'link'
    fullWidth?: boolean
    text?: string
    leftIcon?:string,
    rightIcon?:string
}

const Button:FC<Props> = ({theme, variant, size, fullWidth, text, leftIcon, rightIcon, ...rest}) => {
  return (
    <button {...rest} className={`btn btn-${theme} btn-${size} ${variant ? `btn-${variant}` : ''} ${fullWidth ? 'w-full' : ''}`}>
        {leftIcon && 
            <i className={leftIcon}/>
        }
        {text && 
          <span aria-label={text}>{text}</span>
        }
        {rightIcon && 
            <i className={rightIcon}/>
        }
    </button>
  )
}

export default Button