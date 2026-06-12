import { Paper, Stack, TextField, Typography } from "@mui/material";

export default function Deadline() {

    return(

        <Paper
        sx={{
          p: 3,
          borderRadius: 1,
          mb: 3,
        }}
      >
        <Typography sx={{ fontWeight: 600, mb: 2 }}>
          Deadline
        </Typography>

        <Stack direction="row" spacing={2}>
          <TextField
            type="date"
            fullWidth
          />

          <TextField
            type="time"
            fullWidth
          />
        </Stack>
      </Paper>
    );


}

