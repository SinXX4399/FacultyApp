import { Box,Typography} from "@mui/material";

export default function Appbar() {
    return (
        <Box
        sx={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          p: 3,
        }}
      >
        <Box>
          <Typography variant="h4">
            Welcome, Professor Sumana 👋
          </Typography>
      
          <Typography color="text.secondary">
            Wednesday, June 3 2026
          </Typography>
        </Box>
      
        <Box sx={{ display: "flex", gap: 2 }}>
          
        </Box>
      </Box>
    );
}