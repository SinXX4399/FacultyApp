import {
    Box,
    Button,
    Paper,
    TextField,
    Typography,
} from "@mui/material";

export default function LoginPage() {
    return (
        <Box
            sx={{
                height: "100vh",
                display: "flex",
            }}
        >
            {/* Left Side */}
            <Box
                sx={{
                    flex: 1,
                    background:
                        "linear-gradient(135deg, #1976d2 0%, #1565c0 100%)",
                    color: "white",
                    display: "flex",
                    flexDirection: "column",
                    justifyContent: "center",
                    px: 8,
                }}
            >
                <Typography variant="h3">

                    DIT 
                </Typography>

                <Typography
                    variant="h6"
                    sx={{ mt: 2, maxWidth: 500 }}
                >
                    Manage announcements, events, faculty
                    information, and student communications.
                </Typography>
            </Box>

            {/* Right Side */}
            <Box
                sx={{
                    flex: 1,
                    display: "flex",
                    justifyContent: "center",
                    alignItems: "center",
                    bgcolor: "#f5f5f5",
                }}
            >
                <Paper
                    elevation={3}
                    sx={{
                        width: 450,
                        p: 5,
                        borderRadius: 3,
                    }}
                >
                    <Typography
                        variant="h4"
                        sx={{
                            fontWeight: 700,
                            mb: 2,
                        }}
                    >
                        Sign In
                    </Typography>
                    <Typography
                        color="text.secondary"
                        sx={{ mb: 4 }}
                    >
                        Welcome back
                    </Typography>

                    <TextField
                        label="Email"
                        fullWidth
                        margin="normal"
                    />

                    <TextField
                        label="Password"
                        type="password"
                        fullWidth
                        margin="normal"
                    />

                    <Button
                        variant="contained"
                        size="large"
                        fullWidth
                        sx={{ mt: 3 }}
                    >
                        Login
                    </Button>
                </Paper>
            </Box>
        </Box>
    );
}