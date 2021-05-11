const colors = require('tailwindcss/colors')

module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    colors: {
      primary: colors.green,
      secondary: colors.yellow,
      neutral: colors.gray,
    },
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
