import {
    Drawer,
    List,
    ListItemButton,
    ListItemIcon,
    ListItemText,
    Toolbar,
  } from "@mui/material";
  
  import DashboardIcon from "@mui/icons-material/Dashboard";
  import ArticleIcon from "@mui/icons-material/Article";
  import PeopleIcon from "@mui/icons-material/People";
  import SettingsIcon from "@mui/icons-material/Settings";
  
  import { useNavigate, useLocation } from "react-router-dom";
  
  const drawerWidth = 260;
  
  const menuItems = [
    {
      label: "Dashboard",
      path: "/admin",
      icon: <DashboardIcon />,
    },
    {
      label: "Posts",
      path: "/createPosts",
      icon: <ArticleIcon />,
    },
    {
      label: "Students",
      path: "/students",
      icon: <PeopleIcon />,
    },
    {
      label: "Settings",
      path: "/settings",
      icon: <SettingsIcon />,
    },
  ];
  
  export default function Sidebar() {
    const navigate = useNavigate();
    const location = useLocation();
  
    return (
      <Drawer
        variant="permanent"
        sx={{
          width: drawerWidth,
          flexShrink: 0,
          "& .MuiDrawer-paper": {
            width: drawerWidth,
            boxSizing: "border-box",
          },
        }}
      >
        <Toolbar />
  
        <List>
          {menuItems.map((item) => (
            <ListItemButton
              key={item.path}
              selected={location.pathname === item.path}
              onClick={() => navigate(item.path)}
            >
              <ListItemIcon>{item.icon}</ListItemIcon>
  
              <ListItemText primary={item.label} />
            </ListItemButton>
          ))}
        </List>
      </Drawer>
    );
  }