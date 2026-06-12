import { Box } from "@mui/material";

export default function DashboardLayout() {
  return (
    <Box sx={{ display: "flex", height: "100vh" }}>
      
      {/* Sidebar */}
      <Box
        sx={{
          width: 100,
          bgcolor: "#D64535",
        }}
      />

      {/* Main Content */}
      <Box
        sx={{
          flex: 1,
          bgcolor: "#F8F8F8",
        }}
      />
    </Box>
  );
}