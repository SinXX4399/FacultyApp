import { createTheme } from "@mui/material/styles";
import { colors } from "./colors";

export const theme = createTheme({
  palette: {
    primary: {
      main: colors.primary.main,
      dark: colors.primary.dark,
    },

    background: {
      default: colors.background.page,
      paper: colors.background.surface,
    },

    text: {
      primary: colors.text.primary,
      secondary: colors.text.secondary,
    },
  },

  typography: {
    fontFamily: [
      "Inter",
      "system-ui",
      "sans-serif",
    ].join(","),

    h1: {
      fontWeight: 600,
    },

    h2: {
      fontWeight: 600,
    },

    h3: {
      fontWeight: 600,
    },

    h4: {
      fontWeight: 600,
    },

    h5: {
      fontWeight: 600,
    },

    h6: {
      fontWeight: 600,
    },

    body1: {
      fontWeight: 400,
    },

    body2: {
      fontWeight: 400,
    },

    button: {
      fontWeight: 500,
      textTransform: "none",
    },
  },

  shape: {
    borderRadius: 20,
  },
 

  spacing: 8,
  components: {
    MuiCssBaseline: {
      styleOverrides: {
        body: {
          backgroundColor: "#F7F0EF",
        },
      },
    },
  },
});