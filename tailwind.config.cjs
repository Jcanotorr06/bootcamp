/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {
      screens: {
        sm: '480px',
        md: '768px',
        lg: '976px',
        xl: '1440px',
      },
      colors: {
        neutral: {
          50: "#F8FAFC",
          100: "#F1F5F9",
          200: "#E2EBF0",
          300: "#C8D5E1",
          400: "#94A3BB",
          500: "#64748B",
          600: "#475569",
          700: "#334155",
          800: "#1E293B",
          900: "#0F172A",
        }
        
      },
      fontFamily: {
        serif: ['Inter', 'sans-serif']
      },
      spacing: {
        "xx-sm": "4px",
        "x-sm": "8px",
        "sm": "12px",
        "md": "16px",
        "big": "20x",
        "x-big": "24px",
        "xx-big": "28px",
        "xxx-big": "32px",
        "lg": "40px",
        "x-lg": "48px",
        "xx-lg": "64px",
        "xxx-lg": "80px",
        "huge": "96px",
        "x-huge": "128px",
        "xx-huge":"160px",
        "xxx-huge":"192px",
      },
      boxShadow: {
        "x-small": "0px 1px 2px rgba(16, 24, 40, 0.05)",
        "small": "0px 1px 2px -1px rgba(16, 24, 40, 0.1), 0px 1px 3px rgba(16, 24, 40, 0.1)",
        "medium": "0px 2px 4px -2px rgba(16, 24, 40, 0.1), 0px 4px 6px -1px rgba(16, 24, 40, 0.1)",
        "large": "0px 10px 15px -3px rgba(16, 24, 40, 0.1), 0px 4px 6px -4px rgba(16, 24, 40, 0.1)",
        "x-large": "0px 20px 25px -5px rgba(16, 24, 40, 0.1), 0px 8px 10px -6px rgba(16, 24, 40, 0.1)",
        "xx-large": "0px 25px 50px -12px rgba(16, 24, 40, 0.25);",
      }
    },
  },
  plugins: [],
};
