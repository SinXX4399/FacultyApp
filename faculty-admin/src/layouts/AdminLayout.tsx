import { Outlet } from "react-router-dom";
import { Box } from "@mui/material";
import Sidebar from "../components/Sidebar";
import Appbar from "./../components/Appbar";

export default function AdminLayout() {
  return (
    <>
      <Appbar />

      <Box sx={{ display: "flex", minHeight: "100vh" }}>
        <Sidebar />

        <Box
          sx={{
            flex: 1,
            p: 3,
          }}
        >
          <Outlet />
        </Box>
      </Box>
    </>
  );
}