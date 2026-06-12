import {
    AppBar,
    Toolbar,
    Typography,
    Box,
    Avatar,
  } from "@mui/material";
  
  export default function Topbar() {
    return (
      <AppBar
        position="fixed"
        color="inherit"
        elevation={1}
      >
        <Toolbar>
          <Typography variant="h6">
            Faculty Admin
          </Typography>
  
          <Box sx={{ flexGrow: 1 }} />
  
          <Avatar />
        </Toolbar>
      </AppBar>
    );
  }